
--показ экзаменационных оценок студентов определённой группы (по всем предметам, с указанием названий предметов).

DECLARE @groupName nvarchar(50) = 'БПВ-1411'

SELECT	S.firstName + ' ' + S.lastName + ' ' + S.middleName AS [Студент], O.name AS [Предмет], A.assessment AS [Оценка]
FROM	Student S JOIN AssessmentExaminationTasks A
		ON S.studentID = A.studentID
		JOIN [Objects] O
		ON A.objectID = O.objectID
		JOIN Groups G
		ON G.groupID = S.grupID
WHERE	g.name = @groupName
