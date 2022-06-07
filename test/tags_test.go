package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestTfModuleTags This is Terratest code to test the Terraform Module using ../example/.
func TestTfModuleTags(t *testing.T) {
	t.Parallel()

	expectedOutputTags := "map[business_owner:Digital cost_center: country:BR customer_facing:true customer_impacting:false description: environment:snd iac_source:terraform-module-tags iac_type:TF iac_workspace:terratest-br-snd market:BR pillar:platform runtime:snd]"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../example",

		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"terratest.br.tfvars"},

		// Disable colors in Terraform commands, so it's easier to parse stdout/stderr
		NoColor: false,
	})

	// Clean up resources with "terraform destroy". Using "defer" runs the command at the end of the test, whether the test succeeds or fails.
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply".
	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualOutputTags := terraform.Output(t, terraformOptions, "tags")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedOutputTags, actualOutputTags)
}
