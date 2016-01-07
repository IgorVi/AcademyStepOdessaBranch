
USE AcademyStepOdessaBranch
GO

CREATE VIEW numberOfLessonsForGroups2
AS

SELECT	flow AS [Поток], [group] AS [Група], name AS [Студент],
		[count] AS [Количество посищений],
		(
		SELECT	[count]
		FROM	numberOfLessonsForGroups
		WHERE	name = attendanceStudents.[group]
		) AS [Всего занятий]
FROM	attendanceStudents