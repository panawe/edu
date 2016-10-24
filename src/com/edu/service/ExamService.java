package com.edu.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.edu.model.Course;
import com.edu.model.Exam;
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

public interface ExamService extends BaseService {
	@Transactional(readOnly = true)
	public  List<Teacher> getTeacher(String className, String subjectName);
	@Transactional(readOnly = true)
	public Course getCourse(String className, String subjectName);
	public List<Student> getStudents(Exam exam);
	public Mark getMark(Exam exam, StudentEnrollment studentEnrollment);
	public StudentEnrollment getStudentEnrollment(long studentId,
			long levelClassId, long schoolYearId);
	public List<ExamVO> getAllExamVOs(School school);
	public void recalculateAllNoteForExam(Exam exam);
	public List<ExamVO> getExamNotes(Class cl, ExamSearchVO examSearch, User user);
	public List<MarkVO> getMarkVOs(Class cl, MarkSearchVO markSearch, User user);
}
