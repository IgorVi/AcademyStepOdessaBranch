--����� ���������� �� ������������ ������� ���������� ������������ ������.

USE AcademyStepOdessaBranch
GO

DECLARE @nameFlow nvarchar(50)
SET @nameFlow = '����� 2014'

SELECT	[�����], avg([���������� ���������]), [����� �������]
FROM	numberOfLessonsForGroups2
WHERE	[�����] = @nameFlow
GROUP BY [�����], [����� �������]