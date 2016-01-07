USE AcademyStepOdessaBranch
GO

CREATE VIEW numberOfLessonsForGroups
AS
SELECT	G.name AS name, (SELECT	Count(*)
				FROM	EmploymentAuditorium
				WHERE	groupID = G.groupID
				) AS [count]
FROM	Groups G
