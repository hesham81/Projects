package pkg;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Signup {

    private static final String DB_URL = "your_database_url"; // Use your actual database URL

    private String name;
    private String username;
    private String password;
    private String phoneNumber;
    private String gender;

    // Constructor
    public Signup(String name, String username, String password, String phoneNumber, String gender) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
    }

    // Getters and Setters for the fields
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    // Method to save the user to the database
    public void saveUserToDatabase() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            // Create a new instance of Student, Teacher, or another entity
            // Here we assume the user is being signed up as a student, adjust according to your needs
            Student student = new Student(name, phoneNumber, gender, username, password);

            // Save the student to the database
            em.persist(student);

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // Rollback transaction in case of error
            }
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }
    }

    // Method for checking if the username already exists in the database
    public static boolean isUsernameTaken(String username) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();

        try {
            // Query to find user by username
            Long count = (Long) em.createQuery("SELECT COUNT(u) FROM User u WHERE u.username = :username")
                    .setParameter("username", username)
                    .getSingleResult();

            return count > 0; // If count is greater than 0, the username is taken
        } finally {
            em.close();
            emf.close();
        }
    }
}
