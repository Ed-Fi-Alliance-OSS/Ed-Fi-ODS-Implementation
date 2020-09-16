CREATE TABLE tracked_deletes_identification.StudentIdentifier
(
       Identifier VARCHAR(50) NOT NULL,
       Namespace VARCHAR(255) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentIdentifier_PK PRIMARY KEY (ChangeVersion)
);

