
USE AcademyStepOdessaBranch
GO

CREATE PROCEDURE percentageOfAttendance
@numberOfLessons int, @numberOfVisits int
AS

IF @numberOfLessons = 0
	RETURN 0
ELSE
	RETURN @numberOfVisits / (convert (float, @numberOfLessons) / 100)