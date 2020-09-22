# terraform-skeleton
A GitHub template used to generate Terraform projects.

# Structure
The Terraform project follows a simple directory structure:

    .
    ├── LICENSE
    ├── Makefile
    ├── README.md
    ├── main.tf
    ├── outputs.tf
    ├── projects
    │   ├── globals
    │   │   └── inputs.tfvars
    │   ├── aat-production
    │   │   └── inputs.tfvars
    │   └── aat-staging
    │       └── inputs.tfvars
    ├── variables.tf

## Projects
The `projects` directory stores the terraform tfvars file for several environments and constant variables that will be used accros the different environments. The directory `globals` directory is responsible for storing the constant variables while the directories, `staging` and `production`, are responsible for the variables which belong to the appropriate directory. 

## Terraform Files
### main.tf
Calls modules, locals, data sources and creates resources. The main file will also declare the Terraform version, configure the providers and [backend](https://www.terraform.io/docs/backends/types/index.html).
### variables.tf
Contains all variables used in the main.tf or are initialized in the inputs.tf file in the project files.
### outputs.tf
Contains outputs from the resources generated from the Terraform project and will be stored in the statefile.
## Makefile
The Makefile is used to invoke Terraform locally. The Makefile requires the user to set several environmental variables and variables:
```
export PROJECT='production'
export AWS_REGION='us-east-2'

cat Makefile
s3_bucket="${PROJECT}-tf"
key="terraform-skeleton" # Set the `key` variable
dynamodb_table="terraform-${PROJECT}-lock"
region=${AWS_REGION}
```
Before using the Makefile you must set the `PROJECT` and `AWS_REGION` env variable and in the Makefile you must set the variable `key`.

If at anytime you need to reference the Makefile:
```
$ make help
apply                          Applies a new state.
destroy                        Destroys targets
graph                          Runs the terraform grapher
init                           Initializes the terraform remote state backend and pulls the correct projects state.
output                         Show outputs of a module or the entire state.
plan-destroy                   Shows what a destroy would do.
plan-out                       Runs a plan. Note that in Terraform < 0.7.0 this can create state entries.
plan                           Runs a plan. Note that in Terraform < 0.7.0 this can create state entries.
show                           Shows a module
update                         Gets any module updates
```

# Credit
This Terraform template was inpsired ('stolen') from the great Mark Honomichl. If you wish to view Mark's template, please visit his [Terraform template repository](https://github.com/AustinCloudGuru/terraform-skeleton). Also check out his extremely informative [blog](https://austincloud.guru/).