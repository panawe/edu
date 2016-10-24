package com.edu.dao;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.edu.model.Alert;
import com.edu.model.AlertReceiver;
import com.edu.model.AssignmentFile;
import com.edu.model.Averages;
import com.edu.model.BaseEntity;
import com.edu.model.Bulletin;
import com.edu.model.Configuration;
import com.edu.model.Course;
import com.edu.model.Exam;
import com.edu.model.ExamType;
import com.edu.model.Files;
import com.edu.model.LevelClass;
import com.edu.model.Mark;
import com.edu.model.News;
import com.edu.model.Parent;
import com.edu.model.Payment;
import com.edu.model.Receiver;
import com.edu.model.School;
import com.edu.model.SchoolYear;
import com.edu.model.Student;
import com.edu.model.StudentEnrollment;
import com.edu.model.Teacher;
import com.edu.model.TeacherEnrollment;
import com.edu.model.Term;
import com.edu.model.TermGroup;
import com.edu.model.TermGroupSummary;
import com.edu.model.TermResult;
import com.edu.model.Tuition;
import com.edu.model.TuitionEnrollment;
import com.edu.model.YearSummary;
import com.edu.security.model.Menu;
import com.edu.security.model.User;
import com.edu.vo.CourseVO;
import com.edu.vo.FileSearchVO;
import com.edu.vo.MarkVO;
import com.edu.vo.StudentSearchVO;
import com.edu.vo.StudentVO;
import com.edu.vo.TeacherVO;

public interface BaseDao {
	
	public void delete(BaseEntity entity);
	public void delete(School entity);
	public School getDefaultSChool();
	public Teacher getTeacher(User user);
	public Student getStudent(User user);
	public BaseEntity getById(Class cl, Long id);
	public void update(BaseEntity entity, User user);
	public void save(BaseEntity entity, User user);
	public void save(BaseEntity entity, School school, User user);
	public BaseEntity load(BaseEntity entity);
	public List<BaseEntity> loadAll(Class<?extends BaseEntity> cl);
	public void deleteByParentIds(String cl, Map<String, Long> parentNameIds);
	public BaseEntity findByColumn(Class cl, String columnName,
			Long columnValue,School school);
	public List<BaseEntity> getStudentTop10Marks(Student student);
	public BaseEntity findByName(Class cl, String name, School school);
	public BaseEntity findByColumn(Class cl, String columnName, Integer columnValue, School school);
	public BaseEntity findByColumn(Class cl, String columnName, String columnValue, School school);
	public BaseEntity findByName(Class cl, String name, String parentName,
			String parentProperty, String parentPropertyValue);
	public List<BaseEntity> findByColumnsLike(Class cl, List<String> columnNames,
			List<String> columnValues);
	public School getSChool(final Long id);
	public List<BaseEntity> loadAllByParentId(Class<?extends BaseEntity> c, 
			String parentName, String parentProperty, Long parentPropertyValue);
	public List<BaseEntity> findByParentsIds(Class<?extends BaseEntity> c, 
			String firstParentName, Long firstParentId, String secondParentName, Long secondParentId);
	public List<BaseEntity> findByParentsIds(Class<?extends BaseEntity> c, String firstParentName, Long firstParentId, 
			String secondParentName, Long secondParentId, String thirdParentName, Long thirdParentId);
	
	public List<Student> searchStudents(boolean selectAllStudents,
			String className, String year, School school);
	public List<Student> searchStudents(boolean selectAllStudents,
			String className, String year, String lastName, School school);
	public List<Teacher> searchTeachers(boolean selectAllStudents,
			String className, String year, School school);
	public Receiver getTeacherCorrespondance(long teacherId, long correspondanceId);
	public Receiver getStudentCorrespondance(long studentId, long correspondanceId) ;
	public StudentEnrollment getStudentEnrollment(long studentId, long levelClassId, long schoolYearId);
	public TeacherEnrollment getTeacherEnrollment(long teacherId, long levelClassId, long schoolYearId) ;
	public List<Tuition> getStudentPayments(Student student, School school);
	public Payment getStudentPayment(Student student, Tuition tuition, School school);
	public List<StudentVO> getStudents(Class cl, StudentSearchVO studentSearch, User user);
	public List<TeacherVO> getTeachers(Class cl, String matricule,  String nom, String prenom,User user);
	public List<TeacherVO> getTeachersOrderByPosition(Class cl, String matricule, String lastName, String firstName, User user, boolean orderByPosition, School school);
	public BaseEntity findByParents(Class cl, String firstParent, String firstParentName, 
			String secondParent, String secondParentName);
	public BaseEntity findByParents(Class cl, String firstParent, Long firstParentId, 
			String secondParent, Long secondParentId);
	public TermResult fetchTermResults(SchoolYear schoolYear,
			LevelClass lclass, Term term);
	public List<BaseEntity> getUsers(Class cl, String userName, String lastName, String firstName, User user);
	public List<TuitionEnrollment> getAllPaymentsDueInDays(Class cl, Integer numberOfDays);
	public List<BaseEntity> getAllProductConsumersDueInDays(Class cl, Integer numberOfDays);
	public List<Alert> getAllActiveAlert(Class cl, String alertTypeCode);
	public Integer getReceivedStudentAlertCount(Class cl, Long alertId, Long tuitionId, Long userId);
	public List<AlertReceiver> getAlertReceiver(Class cl, Long alertId, Long tuitionId, Long userId);
	public List<Configuration> getConfigurationListByGroup(Class cl, String groupName, School school);
	public List<BaseEntity> getEntityByPropertyComparison(Class cl, String propertyName1, String propertyName2);
	public <T> List<BaseEntity> findByColumnValues(Class cl, String columnName, List<T> columnValue, Long schoolId);
	public List<TuitionEnrollment> getStudentPaymentsForTuition(Student student, Tuition t, School school);
	public List<String> getSubjectsForLevel(LevelClass levelClass);
	public List<BaseEntity> loadAll(Class<? extends BaseEntity> cl, School school);
	public List<BaseEntity> getStudentMarks(Student student);
	public List<Menu> loadAllMenus(School school);
	public List<User> loadAllUsers(School school);
	public List<BaseEntity> getMenus(Class cl, String menuName);
	public Averages getOneAverage(SchoolYear schoolYear, LevelClass lclass,
			Term term);
	public List<Averages> getAverages(SchoolYear schoolYear, LevelClass lclass,
			Term term);
	public List<Averages> getAverages(SchoolYear schoolYear, LevelClass lclass,
			Term term, Long studentId);
	public List<Averages> getAverages(SchoolYear schoolYear, LevelClass lclass,
			Long studentId);
	public List<Bulletin> getBulletins(SchoolYear schoolYear,
			LevelClass lclass, Term term);
	public List<BaseEntity> getStudentBulletins(Student student);
	public List<Object[]> getReportParameterValues(String sql);
	public BaseEntity findByColumn(Class cl, String columnName,
			String columnValue);
	public List<BaseEntity> findByColumns(Class cl, List<String> columnNames,
			List<String> columnValues);
	public School findSchoolByName(String name);
	public User getAdminUser(School school);
	public List<BaseEntity> getTimeTablesByTeacherId(Class cl, Long teacherId, Long yearId, Long termId);
	public void flush();
	public List<BaseEntity> getMedicalVisits(Date beginVisitDate, Date endVisitDate); 
	public List<Files> getStudentFiles(Student student);
	public Double getCummulatedRatio(Long schoolYearId, Long termId, Long courseId, Long examId);
	public Term getCurrentTermForClass(SchoolYear year, LevelClass lClass);
	public YearSummary getOneYearSummary(SchoolYear schoolYear, User user);
	public List<YearSummary> getYearSummaries(SchoolYear schoolYear,
			User currentUser);
	public List<Bulletin> getAllBulletins(SchoolYear schoolYear,
			User currentUser);
	public List<YearSummary> getYearSummaries(SchoolYear schoolYear,
			LevelClass lclass, School school);
	public List<BaseEntity> getTeachersSortedByPosition(School school);
	public List<BaseEntity> getEntitiesByQueryAndParameters(School school, String queryName, 
			String [] paramNames, Object[] paramValues);
	public List<News> getAllSortedNews(School school);
	public List<BaseEntity> getThisYearCurriculum(School defaultSchool);
	public List<BaseEntity> fetchCurrentYearTuitions(School defaultSchool);
	public List<BaseEntity> getThisYearFurnitures(School defaultSchool);
	
	public List<MarkVO> getMarks(Long studentId);
	public SchoolYear getSchoolYear(Date eventDate, School defaultSchool);
	public List<TermGroupSummary> getTermGroupSummaries(SchoolYear schoolYear,
			TermGroup termGroup, User currentUser);
	public List<TermGroupSummary> getTermGroupSummaries(SchoolYear schoolYear, LevelClass lClass,
			TermGroup termGroup, User currentUser);
	public List<Bulletin> getAllBulletins(SchoolYear schoolYear,
			TermGroup termGroup, User currentUser);
	public List<Bulletin> getAllBulletins (SchoolYear schoolYear,
			User currentUser, String className);
	public List<Bulletin> getAllBulletins (SchoolYear schoolYear,
			TermGroup termGroup, User currentUser, String className);
	public void save(List<TermGroupSummary> entities, User user) throws Exception;
	public int executeDeleteQuery(String sqlQuery);
	public List<Bulletin> getBulletins(Long studentId, String schoolYearName);
	public List<Tuition> fetchTuitionsForYear(School defaultSchool,
			String year);
	public Object getStudentTuition(Long studentId, Long tuitionId);
	List<Tuition> fetchSortedTuitions(School defaultSchool, String schoolYearName);
	
	public List<BaseEntity> searchParents(Parent parent, School school);
	public Parent searchParent(Parent parent, School school);
	public List<Parent> searchParentsToAssign(Parent parent, School school);
	public List<Tuition> getStudentsPaymentsByTuitionType(List<Long> studentIds, School school, Long tuitionTypeId, Long yearId);
	public List<Payment> getParentPaymentsByStudents(List<Long> studentIds, School school, Long yearId);
	public List<Payment> getPaymentsForStudents(List<Long> studentIds,  Long tuitionTypeId, Long schoolYearId, School school);
	public Exam getExam(ExamType examType, Term term, SchoolYear schoolYear, Course course, LevelClass levelClass, User currentUser);
	public Integer getStudentsCountByLevelClassAndYear(Long schoolYearId, Long levelClassId, School school);
	public List<BaseEntity> loadEntitiesByParentAndDateRange(Class<? extends BaseEntity> c,
			String parentName, String parentProperty, Long parentPropertyValue, String dateColumn,  Date beginDate, Date endDate);
	public List<BaseEntity> loadEntitiesByPropertyAndDateRange(Class<? extends BaseEntity> c,
			String property, String propertyValue, String dateColumn,  Date beginDate, Date endDate);
	public List<AssignmentFile> getCourseAssignmentFiles(School school, FileSearchVO fileSearch);	
	public void addCourseAssignmentFiles(FileSearchVO examFile, List<AssignmentFile> assignedFiles, User user);
	public List<AssignmentFile> searchCourseAssignmentFiles(School school, FileSearchVO fileSearch);
	public List<CourseVO> getCourses(School school);
	public List<CourseVO> getCourses(School school, Long teacherId) ;
	public List<CourseVO> getCourses(Long classId,School school);
	public int deleteExamMark(Long examId);
	public Integer countActiveStudent();
	
}
