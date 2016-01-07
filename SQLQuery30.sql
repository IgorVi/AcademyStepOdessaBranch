--����� �� ����������� ����� ��� ���������� ������� �� ��������� �����

DECLARE	@teacherFirstName nvarchar(50) = '�����',
		@teacherLastName nvarchar(50) = '��������',
		@teacherMiddleName nvarchar(50) = '�.',
		@date int = 06

SELECT	O.name AS [�������], G.name AS [�����], COUNT(*) AS [����������]
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