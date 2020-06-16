## Terraform AWS Modules

Criando uma instancias AWS EC2


The `root_block_device` block supports:
`volume_type`
`volume_size`


## Variable Inputs
| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| instance_count | The name of your instance that it will be created | `number` | 1 | NO |
| name | The name of your instance that it will be created | `string` | "NO" | "YES" |
| user_data | The user data to provide when launching the instance | `string` | "NO" | "YES" |

## Variable Outputs

| Name | Descrição | 
| ---- | --------- |
