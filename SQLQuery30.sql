--отчёт по проведенным парам для указанного препода за указанный месяц

DECLARE	@teacherFirstName nvarchar(50) = 'Вадим',
		@teacherLastName nvarchar(50) = 'Ткаченко',
		@teacherMiddleName nvarchar(50) = 'В.',
		@date int = 06

SELECT	O.name AS [Предмет], G.name AS [Група], COUNT(*) AS [Количество]
FROM	Teacher T
		JOIN EmploymentAuditorium E
		ON T.teacherID = E.teacherID
		JOIN [Objects] O
		ON E.objectID = O.objectID
		JOIN Groups G
		ON E.groupID = G.groupID
WHERE	T.firstName = @teacherFirstName
		AND T.lastName = @teacherLastName
		AND T.middleName = @teacherMiddleName
		and MONTH(E.[date]) = @date
GROUP BY O.name, G.name