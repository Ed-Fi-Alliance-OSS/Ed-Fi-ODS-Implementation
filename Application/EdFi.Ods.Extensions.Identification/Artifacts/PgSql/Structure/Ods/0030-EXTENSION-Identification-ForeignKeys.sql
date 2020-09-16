ALTER TABLE identification.StudentIdentifier ADD CONSTRAINT FK_86b17d_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_86b17d_Student
ON identification.StudentIdentifier (StudentUSI ASC);

