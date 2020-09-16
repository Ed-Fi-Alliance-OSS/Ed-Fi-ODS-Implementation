-- Table identification.StudentIdentifier --
CREATE TABLE identification.StudentIdentifier (
    Identifier VARCHAR(50) NOT NULL,
    Namespace VARCHAR(255) NOT NULL,
    StudentUSI INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentIdentifier_PK PRIMARY KEY (Identifier, Namespace)
); 
ALTER TABLE identification.StudentIdentifier ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE identification.StudentIdentifier ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE identification.StudentIdentifier ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

