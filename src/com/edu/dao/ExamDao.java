package com.edu.dao;

import java.util.List;

import com.edu.model.Course;
import com.edu.model.Teacher;

public interface ExamDao {

	public  List<Teacher> getTeacher(String className, String subjectName);
	public List<Course> getCourses(String className, String subjectName);
}
