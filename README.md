# Terraform Module: PostgreSQL Database and User

This Terraform module provisions a PostgreSQL database and a user (role) with a randomly generated password. It also configures default privileges for tables and sequences in the database's public schema. The module is designed to be reusable and configurable through variables.

## Provisioned Resources
- **PostgreSQL Database**: A database with customizable encoding, collation, and tablespace settings.
- **PostgreSQL Role**: A user with login privileges and a secure, randomly generated password.
- **Default Privileges**: Full privileges (`ALL`) assigned to the user for tables and sequences in the `public` schema.
- **Random Password**: A 14-character password with special characters for the PostgreSQL user.

## Prerequisites
- Terraform `>= 1.0.0`.
- Providers:
  - `cyrilgdn/postgresql` `>= 1.25.0`
  - `hashicorp/random` `>= 3.7.1`
- A running PostgreSQL server with Terraform provider access configured (e.g., via a superuser account).

## Usage
1. **Clone the repository** or copy the code into a directory.
2. **Configure variables**: Create a `terraform.tfvars` file or pass variables via CLI.
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
4. **Plan the execution**:
   ```bash
   terraform plan
   ```
5. **Apply the changes**:
   ```bash
   terraform apply
   ```

### Example Configuration
Create a `main.tf` file in the root directory to call the module:

```hcl
provider "postgresql" {
  host            = "postgres.example.com"
  port            = 5432
  username        = "admin"
  password        = "admin_password"
  superuser       = true
}

module "postgresql_db" {
  source      = "./"
  db_username = "myapp_user"
  db_name     = "myapp_db"
  encoding    = "UTF8"
  lc_collate  = "en_US.utf8"
  lc_ctype    = "en_US.utf8"
  template    = "template0"
  tablespace_name = "DEFAULT"
}
```

### Input Variables
| Name             | Type   | Description                                   | Default         |
|------------------|--------|-----------------------------------------------|-----------------|
| `db_username`    | string | The PostgreSQL username (role) to create     | -               |
| `db_name`        | string | The name of the database to create           | -               |
| `encoding`       | string | Database encoding                            | `"UTF8"`        |
| `lc_collate`     | string | Locale for collation                         | `"en_US.utf8"`  |
| `lc_ctype`       | string | Locale for character classification          | `"en_US.utf8"`  |
| `template`       | string | Template database to use                     | `"template0"`   |
| `tablespace_name`| string | Tablespace for the database                  | `"DEFAULT"`     |

### Outputs
- `password`: The generated password for the Postgres user (marked as sensitive).

## Notes
- **Privileges**: The module assigns full privileges (`ALL`) to the user for tables and sequences in the `public` schema. Modify the `postgresql_default_privileges` resources if more restrictive privileges are required.
- **Password Security**: The password is randomly generated with a length of 14 characters and includes special characters. Adjust `random_password.sql` to change length or character set.
- **Dependencies**: There is a `depends_on` reference to `random_password.mq`, which seems to be a typo (should be `random_password.sql`). Ensure this is corrected in the code.
- **Superuser Access**: The PostgreSQL provider requires a superuser account to create databases and roles. Ensure the provider is configured accordingly.

## Development
This module was developed by [A9 Tecnologia](https://www.a9tech.com.br), a company specializing in innovative technology solutions.

## License
This project is licensed under the MIT License. See the [LICENSE](#license) section below for details.