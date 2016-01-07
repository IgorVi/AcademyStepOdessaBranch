
--����� ��������������� ������ ��������� ����������� ������ (�� ���� ���������, � ��������� �������� ���������).

DECLARE @groupName nvarchar(50) = '���-1411'

SELECT	S.firstName + ' ' + S.lastName + ' ' + S.middleName AS [�������], O.name AS [�������], A.assessment AS [������]
FROM	Student S JOIN AssessmentExaminationTasks A
		ON S.studentID = A.studentID
		JOIN [Objects] O
		ON A.objectID = O.objectID
		JOIN Groups G
		ON G.groupID = S.grupID
WHERE	g.name = @groupName
