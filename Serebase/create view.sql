-- Insert into table Genders
INSERT INTO Genders (gender) VALUES ('Male'), ('Female');

--Insert into table Departments
INSERT INTO Departments (dept) 
VALUES 
    ('Human Resources'),
    ('Finance'),
    ('Information Technology'),
    ('Operations'),
    ('Marketing'),
	('Quality');

	select * from Departments

	select * from Genders

	select * from Users

CREATE VIEW vw_users_details as 
SELECT
	u.userid, 
	u.firstname,
	u.lastname,
	u.date_of_birth, 
	g.gender,
	d.dept
FROM Users u
LEFT JOIN Genders g on g.gid = u.gender_id
LEFT JOIN Departments d on d.deptid = u.deptid
