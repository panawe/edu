package com.edu.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.edu.dao.TestDaoImpl;
import com.edu.model.BaseEntity;
import com.edu.model.Level;
import com.edu.model.Question;
import com.edu.model.Student;
import com.edu.model.Subject;
import com.edu.model.Test;
import com.edu.model.TestQuestion;
import com.edu.model.UserTest;


@Service("testService")
@Scope("session")
public class TestServiceImpl extends BaseServiceImpl implements TestService {

	@Autowired
	@Qualifier("testDao")
	private TestDaoImpl testDao;

	public List<Question> getQuestions(Long testId){
		
		return testDao.getQuestions(testId);
	}

	public List<BaseEntity> fetchQuestions(Level level, Subject subject,
			boolean showMyQuestionsOnly,Long userId) {
		// TODO Auto-generated method stub
		return testDao.fetchQuestions(level,subject,showMyQuestionsOnly, userId);
	}

	public TestQuestion fetchTestQuestion(Question question2, Test test2) {
		// TODO Auto-generated method stub
		return testDao.fetchTestQuestion(question2, test2);
	}

	public UserTest fetchUserTest(Student student, Test test2) {
		// TODO Auto-generated method stub
		return testDao.fetchUserTest(student,test2);
	}
}
