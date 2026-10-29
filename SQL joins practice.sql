create database clg;

use clg;

-- ---------- Student ----------
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    city       VARCHAR(50)
);
 
INSERT INTO Student (student_id, name, city) VALUES
(1, 'Asha',  'Pune'),
(2, 'Ravi',  'Mumbai'),
(3, 'Meera', 'Pune'),
(4, 'Kiran', 'Nagpur'),
(5, 'Sana',  'Mumbai'),
(6, 'Dev',   'Pune');
 
-- ---------- Course ----------
CREATE TABLE Course (
    course_id       VARCHAR(5) PRIMARY KEY,
    course_name     VARCHAR(50) NOT NULL,
    duration_months INT,
    total_fee       INT
);
 
INSERT INTO Course (course_id, course_name, duration_months, total_fee) VALUES
('C1', 'SQL',      2, 15000),
('C2', 'Excel',    1,  8000),
('C3', 'Python',   3, 25000),
('C4', 'Power BI', 2, 18000);
 
-- ---------- Enrollment ----------
CREATE TABLE Enrollment (
    enroll_id   VARCHAR(5) PRIMARY KEY,
    student_id  INT        NOT NULL,
    course_id   VARCHAR(5) NOT NULL,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);
 
INSERT INTO Enrollment (enroll_id, student_id, course_id, enroll_date) VALUES
('E1', 1, 'C1', '2026-01-10'),
('E2', 1, 'C2', '2026-02-05'),
('E3', 2, 'C1', '2026-01-15'),
('E4', 3, 'C3', '2026-02-01'),
('E5', 3, 'C1', '2026-02-10'),
('E6', 4, 'C2', '2026-03-01'),
('E7', 5, 'C3', '2026-03-05'),
('E8', 2, 'C3', '2026-03-12');
 
-- ---------- Fee ----------
CREATE TABLE Fee (
    fee_id       VARCHAR(5) PRIMARY KEY,
    enroll_id    VARCHAR(5) NOT NULL,
    amount_paid  INT,
    payment_date DATE,
    mode         VARCHAR(10),
    FOREIGN KEY (enroll_id) REFERENCES Enrollment(enroll_id)
);
 
INSERT INTO Fee (fee_id, enroll_id, amount_paid, payment_date, mode) VALUES
('F1', 'E1', 15000, '2026-01-10', 'UPI'),
('F2', 'E2',  4000, '2026-02-05', 'Cash'),
('F3', 'E2',  4000, '2026-02-20', 'UPI'),
('F4', 'E3', 10000, '2026-01-15', 'Card'),
('F5', 'E4', 25000, '2026-02-01', 'UPI'),
('F6', 'E5', 15000, '2026-02-10', 'Cash'),
('F7', 'E6',  8000, '2026-03-01', 'Card'),
('F8', 'E7', 12000, '2026-03-05', 'UPI');
 
-- ---------- Quick check ----------
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Fee;

Select s.name, c.course_name from student s
Inner join enrollment e
on S. student_id = e.Student_id
Inner join course c
on c.course_id = e.course_id;

Select s.name, e.enroll_date from student s
Inner Join enrollment e
on s.student_id = e. student_id;

-- course name and enroll_date
Select c.course_name, e.enroll_date from course C
Inner join enrollment e
on c.course_id = e.course_id;

-- Q3 
select s.name, c.course_name from student s
inner join enrollment e
on s.student_id= e.student_id
Inner join course c
on e.course_id = c.course_id;

-- Q4
select e. enroll_id, f.amount_paid  from enrollment e
inner join fee f
On e.enroll_id =f.enroll_id;

-- Q5
Select s.name, F.amount_paid from Enrollment e
inner join student s
on E.student_id = S.student_id
inner Join Fee f
on e.enroll_id = f.enroll_id;

-- Q6
Select C.course_name, Sum(amount_paid)  from course c
Inner join enrollment e
on C.course_id = e.course_id
inner join fee f
on e.enroll_id =f.enroll_id
Group by course_name;


-- Q7 student name course name amount paid
Select s.name, C.course_name, F.amount_paid  from course c
Inner join enrollment e
on C.course_id = e.course_id
inner join fee f
on e.enroll_id =f.enroll_id
Inner join student s
on s.student_id = e.student_id;

-- Q8  Show all students with the courses they enrolled in, including students who have not enrolled anywhere.
Select * from student s
left Join enrollment e
on s.student_id = e.student_id;

-- Q9. Show all courses with the names of students enrolled, including courses that have no students.
Select s.name, c.course_name from course C
left join enrollment e
on c.course_id = e.course_id
left join student s
on e.student_id = s.student_id;

-- Q10 Show every enrollment with its payments, including enrollments that have no payment yet.
select e.enroll_id, f.amount_paid from enrollment e 
left join fee f
on e.enroll_id = f.enroll_id;
