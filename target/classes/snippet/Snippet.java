package snippet;

public class Snippet {
	SELECT studentdetail.studentid, studentdetail.studentname,studentdetail.rollno from studentdetail  join optcoursetbl on studentdetail.studentid=optcoursetbl.studentid  join subjectlist on optcoursetbl.subjectid=subjectlist.subjectid where subjectlist.subjectid='105' and studentdetail.admissionclass='Class 11 HUM' and studentdetail.section='Section B'
}

