#!/usr/bin/env python3

import boto3
import sys
import json

client = boto3.client('ecs')


def debugger_is_active() -> bool:
    """Return if the debugger is currently active"""
    gettrace = getattr(sys, 'gettrace', lambda : None)
    return gettrace() is not None


def list_containers(cluster_name):
    # list all container instances id
    response = client.list_container_instances(
        cluster=cluster_name
    )
    return response['containerInstanceArns']


def describe_container():
    # get terraform query json and assign it to a dict
    if debugger_is_active:
        print('In Debug...')
        query = '[{"cluster_name":"br-digihub-ecs-dev"}]'
        terraform_response_dic = json.loads(query)[0]
    else:
        query = sys.stdin.readlines()
        terraform_response_dic = json.loads(query[0])

    cluster_name = terraform_response_dic['cluster_name']

    # get the container instances
    response = client.describe_container_instances(
        cluster=cluster_name,
        containerInstances=list_containers(cluster_name)
    )

    # get the instance id's and assign to a variable
    instances = list(
        map(lambda x: x['ec2InstanceId'], response['containerInstances']))

    # assign them to our original query json (dict)
    ec2 = boto3.resource('ec2')
    vpc_info = {'id': '', 'subnets': {}}
    for instance in instances:
        instance_info = ec2.Instance(instance)
        if vpc_info.get('id') is None or vpc_info.get('id') == '':
            vpc_info.update({'id': instance_info.vpc.id})

        if vpc_info['subnets'] == {} or not vpc_info['subnets'].get(instance_info.subnet_id):
            vpc_info['subnets'].update({instance_info.subnet_id: [
                instance
            ]})
        else:
            vpc_info['subnets'][instance_info.subnet_id].append(instance)

    terraform_response_dic.update({'vpc_info': vpc_info})
    # return as stdout
    output = json.dumps(
        {
            str(key): value
            for key, value in terraform_response_dic.items()
        }, indent=2, sort_keys=True)
    sys.stdout.write(output)


if __name__ == '__main__':
    describe_container()
