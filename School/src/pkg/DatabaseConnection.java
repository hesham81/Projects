package pkg;

import javax.persistence.*;
import java.util.List;

public class DatabaseConnection {

    private static final String DB_URL = "objectdb/db/school.odb"; // Adjust the database URL as needed

    // Add Student
    public static void addStudent(Student s) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(s);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    // Add Teacher
    public static void addTeacher(Teacher t) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(t);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    // Add Course
    public static void addCourse(Courses c) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    // Get all Students
    public static List<Student> getAllStudents() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        List<Student> students = em.createQuery("SELECT s FROM Student s", Student.class).getResultList();
        em.close();
        emf.close();
        return students;
    }

    // Get all Teachers
    public static List<Teacher> getAllTeachers() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        List<Teacher> teachers = em.createQuery("SELECT t FROM Teacher t", Teacher.class).getResultList();
        em.close();
        emf.close();
        return teachers;
    }

    // Get all Courses
    public static List<Courses> getAllCourses() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        List<Courses> courses = em.createQuery("SELECT c FROM Courses c", Courses.class).getResultList();
        em.close();
        emf.close();
        return courses;
    }

    // Get Course by ID
    public static Courses getCourseById(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        Courses course = em.find(Courses.class, id);
        em.close();
        emf.close();
        return course;
    }

    // Update Course
    public static void updateCourse(Courses c) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(c);
        em.getTransaction().commit();
        em.close();
        emf.close();
    }

    // Delete Course
    public static void deleteCourse(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        Courses c = em.find(Courses.class, id);
        if (c != null) {
            em.getTransaction().begin();
            em.remove(c);
            em.getTransaction().commit();
        }
        em.close();
        emf.close();
    }
    public static void deleteStudent(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        Student student = em.find(Student.class, id);
        if (student != null) {
            em.getTransaction().begin();
            em.remove(student);
            em.getTransaction().commit();
            System.out.println("Student with ID " + id + " has been deleted.");
        } else {
            System.out.println("Student with ID " + id + " not found.");
        }
        em.close();
        emf.close();
    }
    public static void deleteTeacher(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        Teacher teacher = em.find(Teacher.class, id);
        if (teacher != null) {
            em.getTransaction().begin();
            em.remove(teacher);
            em.getTransaction().commit();
            System.out.println("Teacher with ID " + id + " has been deleted.");
        } else {
            System.out.println("Teacher with ID " + id + " not found.");
        }
        em.close();
        emf.close();
    }
public static void updateTeacher(Teacher t) {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
    EntityManager em = emf.createEntityManager();
    em.getTransaction().begin();
    em.merge(t); // Using merge to update an existing Teacher
    em.getTransaction().commit();
    em.close();
    emf.close();
}
public static void updateStudent(Student s) {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
    EntityManager em = emf.createEntityManager();
    em.getTransaction().begin();
    em.merge(s); // Using merge to update an existing Student
    em.getTransaction().commit();
    em.close();
    emf.close();
}

}
