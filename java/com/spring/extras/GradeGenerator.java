package com.spring.extras;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

public class GradeGenerator {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	private void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	public String grade(double fullmarks, double fullmarks_pr, double obtained_pr, double obtainedmarks) {
		double obtained_full = obtainedmarks + obtained_pr;
		double full = fullmarks + fullmarks_pr;
		String grade = null;
		// code to determine grade goes here
		double mark = (obtained_full / full) * 100;
		System.out.println(mark + "marks is");

		if (mark <= 100 && mark >= 90) {
			grade = "A+";
		} else if (mark >= 80 && mark <= 89) {
			grade = "A";
		} else if (mark >= 70 && mark <= 79) {
			grade = "B+";
		} else if (mark >= 60 && mark <= 69) {
			grade = "B";
		} else if (mark >= 50 && mark <= 59) {
			grade = "C+";
		} else if (mark >= 40 && mark <= 49) {
			grade = "C";
		} else if (mark >= 30 && mark <= 39) {
			grade = "D+";
		} else if (mark >= 20 && mark <= 29) {
			grade = "D";
		} else if (mark >= 0 && mark <= 19) {
			grade = "E";
		} else {
			grade = "Not found";
		}
		return grade;
	}
	
	

	public String singleGrade(double mark) {
		String grade = null;
		if (mark <= 100 && mark >= 90) {
			grade = "A+";
		} else if (mark >= 80 && mark <= 89) {
			grade = "A";
		} else if (mark >= 70 && mark <= 79) {
			grade = "B+";
		} else if (mark >= 60 && mark <= 69) {
			grade = "B";
		} else if (mark >= 50 && mark <= 59) {
			grade = "C+";
		} else if (mark >= 40 && mark <= 49) {
			grade = "C";
		} else if (mark >= 30 && mark <= 39) {
			grade = "D+";
		} else if (mark >= 20 && mark <= 29) {
			grade = "D";
		} else if (mark >= 0 && mark <= 19) {
			grade = "E";
		} else {
			grade = "Not found";
		}
		return grade;

	}

	public String isPassed(double passmarks, double thmarks, double passmarks_pr, double prmarks) {
		if (passmarks <= thmarks && prmarks >= passmarks_pr) {
			return "passed";
		}
		return "failed";
	}

	public double calculateGPA(String grade) {
		double gpa = 0.0;
		switch (grade) {
		case "A+":
			gpa = 4.0;
			break;
			
		case "A":
			gpa = 3.6;
			break;
		case "B+":
			gpa = 3.2;
			break;
		case "B":
			gpa = 2.8;
			break;
		case "C+":
			gpa = 2.4;
			break;
		case "C":
			gpa = 2.0;
			break;
		case "D+":
			gpa = 1.6;
			break;
		case "D":
			gpa = 1.2;
			break;
		case "E":
			gpa = 0.8;
			break;

			default:
				gpa=0;
				break;
		}

		
		return gpa;
	}
}
