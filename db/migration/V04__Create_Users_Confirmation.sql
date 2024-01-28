CREATE TABLE users_confirmation (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    confirmation_token VARCHAR(100) NOT NULL,
    confirmation_type_id UUID REFERENCES users_confirmation_type(id),
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp,
    confirmed BOOLEAN DEFAULT false
);