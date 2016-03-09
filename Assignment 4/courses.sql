-- courses.sql
-- CSC 106 - Spring 2016
--
-- Construct a database containing Spring 2016 course scheduling
-- data.
--
-- B. Bird - 03/02/2016

-- If the tables already exist, delete them --
drop table course_names;
drop table course_sections;
drop table prerequisites;

-----------------------
-- Create the tables --
-----------------------
create table course_names( subject_code text, course_number int, course_name text);
create table course_sections( subject_code text, course_number int, section_name text, instructor_firstname text, instructor_lastname text);
create table prerequisites( subject_code text, course_number int, prereq_subject text, prereq_number int);

---------------------------------
-- Insert data into each table --
---------------------------------

-- Course names --
insert into course_names values ('CSC',106,'The Practice of Computer Science');
insert into course_names values ('CSC',110,'Fundamentals of Programming I');
insert into course_names values ('CSC',115,'Fundamentals of Programming II');
insert into course_names values ('CSC',205,'2d Graphics and Image Processing');
insert into course_names values ('CSC',225,'Algorithms & Data Structures I');
insert into course_names values ('CSC',226,'Algorithms & Data Structures II');
insert into course_names values ('CSC',230,'Intro. to Computer Architecture');
insert into course_names values ('SENG',265,'Software Development Methods');
insert into course_names values ('CSC',370,'Database Systems');
insert into course_names values ('SENG',310,'Human Computer Interaction');

-- Sections --
insert into course_sections values ('CSC',106,'A01','Bill', 'Bird');
insert into course_sections values ('CSC',106,'A02','Bill', 'Bird');
insert into course_sections values ('CSC',110,'A01','Tibor', 'van Rooij');
insert into course_sections values ('CSC',110,'A02','Tibor', 'van Rooij');
insert into course_sections values ('CSC',115,'A01','LillAnne', 'Jackson');
insert into course_sections values ('CSC',115,'A02','LillAnne', 'Jackson');
insert into course_sections values ('CSC',115,'A03','Tibor', 'van Rooij');
insert into course_sections values ('CSC',115,'A04','Tibor', 'van Rooij');
insert into course_sections values ('CSC',205,'A01','Bill', 'Bird');
insert into course_sections values ('CSC',225,'A01','Venkatesh', 'Srinivasan');
insert into course_sections values ('CSC',226,'A01','Frank', 'Ruskey');
insert into course_sections values ('CSC',226,'A02','Frank', 'Ruskey');
insert into course_sections values ('CSC',230,'A01','Sudhakar', 'Ganti');
insert into course_sections values ('SENG',265,'A01','Daniel', 'Hoffman');
insert into course_sections values ('SENG',265,'A02','Daniel', 'Hoffman');
insert into course_sections values ('CSC',370,'A01','Alex', 'Thomo');
insert into course_sections values ('SENG',310,'A01','Peggy', 'Storey');


-- Prerequisites --

insert into prerequisites values ('CSC', 115, 'CSC', 110);
insert into prerequisites values ('CSC', 225, 'CSC', 115);
insert into prerequisites values ('CSC', 226, 'CSC', 225);
insert into prerequisites values ('CSC', 230, 'CSC', 115);
insert into prerequisites values ('SENG', 265, 'CSC', 115);
insert into prerequisites values ('CSC', 370, 'CSC', 226);
insert into prerequisites values ('CSC', 370, 'SENG', 265);
insert into prerequisites values ('SENG', 310, 'SENG', 265);



.mode column
.header on

-------------------------------------------
-- Put your answers for Question 2 below --
-------------------------------------------

-- Question 2 a --
select * from course_names order by course_number;


-- Question 2 b --
select * from course_sections where course_number = 115;


-- Question 2 c --
select * from course_names where course_number > 200 and course_number < 300;


-- Question 2 d --
.width 15 15 30 15
select subject_code, course_number, course_name, section_name from course_names natural join course_sections where instructor_firstname = "Tibor";

-- Question 2 e --
.width 15 15 30 15
select instructor_firstname, instructor_lastname, course_name, section_name from course_names natural join course_sections where subject_code = "SENG";

-- Question 2 f --
.width 15 15 30 15
select subject_code, course_number, course_name, count(section_name) as num_sections from course_names natural join course_sections group by course_name order by course_number;

-- Question 2 g --
.width 15 15 32
select subject_code, course_number, course_name from course_names natural join prerequisites where prereq_number = 115;

-- Question 2 h --
.width 20 20
select instructor_firstname, instructor_lastname from course_sections group by instructor_lastname having count(section_name) > 1;

