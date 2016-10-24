package com.edu.service;

import java.util.List;

import com.edu.model.BaseEntity;
import com.edu.model.Level;
import com.edu.model.Question;
import com.edu.model.Student;
import com.edu.model.Subject;
import com.edu.model.Test;
import com.edu.model.TestQuestion;
import com.edu.model.UserTest;

public interface TestService extends BaseService {

	public List<Question> getQuestions(Long testId);

	public List<BaseEntity> fetchQuestions(Level level, Subject subject, boolean showMyQuestionsOnly, Long userId);

	public TestQuestion fetchTestQuestion(Question question2, Test test2);

	public UserTest fetchUserTest(Student student, Test test2);
}
