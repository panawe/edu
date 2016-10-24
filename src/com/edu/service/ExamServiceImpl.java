package com.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.edu.dao.ExamDaoImpl;
import com.edu.model.Course;
import com.edu.model.Exam;
import com.edu.model.Grade;
import com.edu.model.Mark;
import com.edu.model.School;
import com.edu.model.Student;
import com.edu.model.StudentEnrollment;
import com.edu.model.Teacher;
import com.edu.security.model.User;
import com.edu.vo.ExamSearchVO;
import com.edu.vo.ExamVO;
import com.edu.vo.MarkSearchVO;
import com.edu.vo.MarkVO;

@Service("examService")
@Scope("session")
public class ExamServiceImpl extends BaseServiceImpl implements ExamService {

	@Autowired
	@Qualifier("examDao")
	private ExamDaoImpl examDao;

	public List<Teacher> getTeacher(String className, String subjectName) {
		return examDao.getTeacher(className, subjectName);
	}

	public Course getCourse(String className, String subjectName) {
		List <Course> courses = examDao.getCourses(className, subjectName);
		
		if (courses != null && courses.size() > 0)
			return courses.get(0);
		
		return null;
	}

	public List<Student> getStudents(Exam exam) {
		// TODO Auto-generated method stub
		return examDao.getStudents(exam);
	}

	public Mark getMark(Exam exam, StudentEnrollment studentEnrollment) {
		// TODO Auto-generated method stub
		return examDao.getMark(exam, studentEnrollment);
	}
	public StudentEnrollment getStudentEnrollment(long studentId,
			long levelClassId, long schoolYearId){
		return examDao.getStudentEnrollment(studentId,levelClassId, schoolYearId);
	}

	public List<ExamVO> getAllExamVOs(School school) {
		// TODO Auto-generated method stub
		return examDao.getAllExamVOs(school);
	}
	
	public void recalculateAllNoteForExam(Exam exam) {
		List<Student> students = getStudents(exam);
		for (Student student : students) {
			Mark mark = getMark(exam, getStudentEnrollment(student.getId(),
					exam.getCourse().getLevelClass().getId(), exam.getSchoolYear().getId()));
			if (mark != null) {
				mark.setExam(exam);
				mark.setMark(student.getMark());
				normalize(mark, exam.getMaxMark(), exam.getCourse());
				Grade grade = findGrade(student.getUser().getSchool(), mark.getMark(),
								exam.getCourse().getMaxMark().intValue());
				if (grade != null)
					student.setGrade(grade.getName());
				mark.setGrade(grade);
				mark.setApprovedBy(null);
				update(mark, student.getUser());
			}
		}
	}
	
	private void normalize(Mark mark, Double examMaxMark, Course course) {
		// TODO Auto-generated method stub
		mark.setMark(mark.getMark()*course.getMaxMark()/examMaxMark);
	}
	
	public List<ExamVO> getExamNotes(Class cl, ExamSearchVO examSearch, User user) {
		return examDao.getAllExamVOs(examSearch, user.getSchool());
	}
	
	public List<MarkVO> getMarkVOs(Class cl, MarkSearchVO markSearch, User user) {
		return examDao.getMarkVOs(markSearch, user.getSchool());
	}

}
