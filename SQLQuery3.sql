
USE AcademyStepOdessaBranch
GO

CREATE VIEW numberOfLessonsForGroups2
AS

SELECT	flow AS [�����], [group] AS [�����], name AS [�������],
		[count] AS [���������� ���������],
		(
		SELECT	[count]
		FROM	numberOfLessonsForGroups
		WHERE	name = attendanceStudents.[group]
		) AS [����� �������]
FROM	attendanceStudents