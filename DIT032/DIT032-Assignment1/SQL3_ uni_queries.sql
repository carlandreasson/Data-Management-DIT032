3.1.
SELECT L.Name as LecturerName, S.Name as StudentName, A.AptID, A.AptDate, A.StudentID, A.LectureID 
FROM Lecturer as L, Student as S, Appointment as A
WHERE S.StudentID = A.StudentID AND L.LecturerID = A.LecturerID AND A.AptDate BETWEEN 2014/03/31 AND 2014/05/01 
ORDER BY AptID; 

3.2.
SELECT PositionID, L.LecturerID, L.Name as LecturerName, A.StudentID, AptID
FROM Lecturer as L, Appointment as A
WHERE L.LecturerID = A.LecturerID AND L.PositionID='DS52' 
ORDER BY L.Name, A.AptID;

3.3.
SELECT S.Name, S.BirthPlace, S.Gender 
FROM Student as S, Appointment as A  
WHERE A.LecturerID='LC35' AND S.StudentID = A.StudentID;

3.4.
SELECT S.Name, S.BirthPlace, S.Gender 
FROM Lecturer as L, Student as S, Appointment as A
WHERE S.Studentid = A.studentid AND L.Lectureid = A.Lectureid AND L.Name='Ahmad';
