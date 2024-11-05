CREATE VIEW  vw_Users as
SELECT
u.userid,
u.firstname,
u.lastname,
u.date_of_birth,
g.gender,
d.dept



FROM Users u
left join Departments d
ON d.deptid = u.deptid
left join Genders g
ON g.gid = u.gender_id

 