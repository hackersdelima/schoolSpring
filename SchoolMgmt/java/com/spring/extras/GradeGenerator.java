package com.spring.extras;

public class GradeGenerator {

	
	 public String grade(double fullmarks,double fullmarks_pr,double obtained_pr,double obtainedmarks) {
	       double obtained_full = obtainedmarks + obtained_pr;
	       double full = fullmarks + fullmarks_pr;
		 String grade = null;
	        // code to determine grade goes here
		 double mark=(obtained_full/full)*100;
		 System.out.println(mark+ "marks is");
		 
	        if (mark <= 100 && mark >= 90) {
	            grade = "A+";
	        } else if (mark >=80 && mark <= 89) {
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
}
