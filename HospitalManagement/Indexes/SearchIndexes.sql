-- Using Hospital database.
USE hospital;

-- Creating index in AMKA (which is a unique series of numbers owning by people after being 1? year old)
CREATE UNIQUE INDEX Patients_AMKA_idx
ON patients(AMKA);

-- Creating index in patient's phone so that searching will be faster than before.
CREATE UNIQUE INDEX Patients_Phone_idx
ON patients(Phone);

-- Creating index in employee's  Last Name.
CREATE UNIQUE INDEX Employee_LastName_idx
ON employees(LastName);

-- Creating index in Departments.
CREATE UNIQUE INDEX Departments_ID_idx
ON departments(DepartmentID);
