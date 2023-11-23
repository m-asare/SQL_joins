/*
Generate SQL code to make a report which will do the following: 
Generate a concatenated class name/number string, such as "FIN 200" from something in the Finance Department where the course number is 200
Print that class name/number string in the first column of your report
Print the class description (such as "Introduction to Finance")
List the student's first name and then last name
List the offering term and the format (online or in person)
List the professor's first name and last name
Sort your output ascending by class name
*/

SELECT CONCAT(CourseDept,' ', CourseNumber) AS 'Class Name', [CourseDesc], stdFirstName, stdLastName,
OffTerm, [Format], FacFirstName, FacLastName
FROM [dbo].[Student] AS A
JOIN [dbo].[Enrollment] AS B
ON A.idStudent = B.Student_idStudent
JOIN [dbo].[Offering] AS C
ON B.Offering_idOffering = C.idOffering
JOIN [dbo].[Course] AS D
ON C.Course_idCourse = D.idCourse
LEFT JOIN [dbo].[Faculty] AS E
ON E.idFaculty = C.Faculty_idFaculty
ORDER BY 'Class Name' ASC, stdFirstName ASC, stdLastName ASC

