USE AcademyStepOdessaBranch
GO

CREATE VIEW attendanceStudents
AS
SELECT	F.name AS [flow], G.name AS [group], S.firstName + ' ' + S.lastName + ' ' + S.middleName AS [name],
		(SELECT	Count(*)
		FROM	EmploymentAuditorium E
				JOIN Attendance A
				ON E.employmentAuditoriumID = A.employmentAuditoriumID
		WHERE	A.present = 1 AND A.studentID = S.studentID
		) AS [count]
FROM	Student S JOIN Groups G
		ON S.grupID = G.groupID
		JOIN Flow F
		ON F.flowID = G.flowID