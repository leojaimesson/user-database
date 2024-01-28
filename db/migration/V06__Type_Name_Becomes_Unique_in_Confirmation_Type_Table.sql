ALTER TABLE users_confirmation_type
ADD CONSTRAINT uk_type_name UNIQUE (type_name);