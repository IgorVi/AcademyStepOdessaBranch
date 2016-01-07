--показ статистики по посещаемости занятий студентами определённого потока.

USE AcademyStepOdessaBranch
GO

DECLARE @nameFlow nvarchar(50)
SET @nameFlow = 'весна 2014'

SELECT	[Група], avg([Количество посищений]), [Всего занятий]
FROM	numberOfLessonsForGroups2
WHERE	[Поток] = @nameFlow
GROUP BY [Група], [Всего занятий]