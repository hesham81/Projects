package pkg;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Courses {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int courseId;
    private String courseName;
    private String courseTeacher;
    private double totalGrade;
    private boolean availableOrNot;

    // Default constructor
    public Courses() {}

    // Constructor
    public Courses(String courseName, String courseTeacher) {
        this.courseName = courseName;
        this.courseTeacher = courseTeacher;
        this.availableOrNot = true; // Default availability is true
    }

    // Getters and Setters
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseTeacher() {
        return courseTeacher;
    }

    public void setCourseTeacher(String courseTeacher) {
        this.courseTeacher = courseTeacher;
    }

    public double getTotalGrade() {
        return totalGrade;
    }

    public void setTotalGrade(double totalGrade) {
        this.totalGrade = totalGrade;
    }

    public boolean isAvailableOrNot() {
        return availableOrNot;
    }

    public void setAvailableOrNot(boolean availableOrNot) {
        this.availableOrNot = availableOrNot;
    }
}
