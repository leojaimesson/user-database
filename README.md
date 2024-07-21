# User Database

## When should I use this database?

- I want to create new users and verify their email
- I want to register users' personal data
- I want to manage my users' data
- I want to allow users to change email and password, confirming the change

## How to start up the database?

Open your terminal and run this command in the root of the project and be happy :smile:

```console
docker-compose up
```

## How to shut down the database?

Open your terminal and run this command in the root of the project and go get a coffee :coffee:

```console
docker-compose down
```
## How to change the database structure?

Write a new migration in the `db/migration` folder

## Diagram

```mermaid
erDiagram
    USERS {
        UUID id PK "DEFAULT gen_random_uuid()"
        VARCHAR email "NOT NULL"
        VARCHAR password "NOT NULL"
        BOOLEAN enabled "DEFAULT false"
        TIMESTAMP created_at "DEFAULT current_timestamp"
        TIMESTAMP updated_at "DEFAULT current_timestamp"
    }

    USERS_CONFIRMATION_TYPE {
        UUID id PK "DEFAULT gen_random_uuid()"
        VARCHAR type_name "NOT NULL"
    }

    USERS_CONFIRMATION {
        UUID id PK "DEFAULT gen_random_uuid()"
        UUID user_id FK "REFERENCES users(id)"
        VARCHAR confirmation_token "NOT NULL"
        UUID confirmation_type_id FK "REFERENCES users_confirmation_type(id)"
        TIMESTAMP created_at "DEFAULT current_timestamp"
        TIMESTAMP updated_at "DEFAULT current_timestamp"
        BOOLEAN confirmed "DEFAULT false"
    }

    USERS_PERSONAL_DATA {
        UUID id PK "DEFAULT gen_random_uuid()"
        UUID user_id FK "REFERENCES users(id)"
        VARCHAR first_name "NOT NULL"
        VARCHAR last_name "NOT NULL"
        VARCHAR street 
        VARCHAR city 
        VARCHAR state 
        VARCHAR zip_code 
        VARCHAR phone_number 
        TIMESTAMP created_at "DEFAULT current_timestamp"
        TIMESTAMP updated_at "DEFAULT current_timestamp"
    }

    USERS ||--o{ USERS_CONFIRMATION : "has"
    USERS_CONFIRMATION_TYPE ||--o{ USERS_CONFIRMATION : "has"
    USERS ||--o{ USERS_PERSONAL_DATA : "has"
```
