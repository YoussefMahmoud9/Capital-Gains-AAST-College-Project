# Capital Gains AAST College Project

Capital Gains is a banking website built as an AAST college project. It demonstrates a web interface for account registration, login, account information, loan requests and transfers. It is an educational prototype and should not be used for real financial activity.

## Project phases

| Folder | Contents |
| --- | --- |
| `Projectphase1` | Static HTML mockup and images. |
| `Projectphase2` | HTML form rules and a draft JavaScript validation function. The function is not wired to the form; `LoginScript.js` is empty. |
| `Projectphase3` | PHP pages, MySQL/MariaDB schema, sessions, registration, loans and transfers. |

## Main pages in phase 3

- `Welcome.php`: home page with carousel and an external exchange rate widget.
- `About.php`: project information.
- `Register.php`: creates customer, phone and account rows.
- `Login.php` and `Logout.php`: start and end a PHP login session.
- `Account.php`: displays account details and loan history.
- `Transfer.php`: moves a balance between two accounts.
- `Loan.php`: inserts a loan request.
- `conn.php`: reads local database settings from environment variables.
- `bank.sql`: creates the database tables and two nonpersonal branch choices.

## Run locally

1. Install PHP with MySQLi and a local MySQL or MariaDB server.
2. Import `Projectphase3/bank.sql` using phpMyAdmin or another SQL client. It creates the `bank` database and tables.
3. Give the PHP process `DB_USER` and `DB_PASSWORD` environment variables. `DB_HOST` defaults to `localhost`; `DB_NAME` defaults to `bank`.
4. Serve the `Projectphase3` folder with a local PHP web server or Apache and open `Welcome.php`.
5. Register an account. The public SQL file has no seeded customer accounts.

## Documentation

The [project report](documentation/Capital_Gains_Project_Documentation.pdf) explains the architecture, each file, user flow, database relationships, setup and implementation limits. It describes the original college source; this public copy has sanitized data and a revised connection file. The [Word version](documentation/Capital_Gains_Project_Documentation.docx), [database schema](documentation/database_schema.png) and [flowchart](documentation/customer_flowchart.png) are also included.

## Public release notes

This copy excludes the original SQL sample people, account credentials, student portraits and personal contact details. It also excludes the RAR archives. The college source remains unchanged locally.

The PHP logic is a learning prototype. It uses plaintext password comparison and string-built SQL, lacks server-side access checks on private pages, and does not make transfers atomic. Review and fix these issues before using it beyond a local demonstration.
