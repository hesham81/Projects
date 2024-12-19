package pkg;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class Login {

    private static final String DB_URL = "objectdb/db/school.odb"; // Adjust the database URL as needed
	private static Users user;

    // Method to authenticate user
    public static boolean authenticate(String username, String password) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        
        // Query to find the user by username
        String query = "SELECT u FROM Users u WHERE u.username = :username AND u.password = :password";
        TypedQuery<Users> typedQuery = em.createQuery(query, Users.class);
        typedQuery.setParameter("username", username);
        typedQuery.setParameter("password", password);
        
        user = null;
        try {
            user = typedQuery.getSingleResult();
        } catch (Exception e) {
            // If no user is found or an exception occurs, return false
            System.out.println("Invalid username or password.");
            em.close();
            emf.close();
            return false;
            
        }
        
        // If user is found, authentication is successful
        em.close();
        emf.close();
        return true;  // User is authenticated
    }

    // Method to check if the user exists
    public static Users getUserByUsername(String username) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(DB_URL);
        EntityManager em = emf.createEntityManager();
        
        // Query to find the user by username
        String query = "SELECT u FROM Users u WHERE u.username = :username";
        TypedQuery<Users> typedQuery = em.createQuery(query, Users.class);
        typedQuery.setParameter("username", username);
        
        Users user = null;
        try {
            user = typedQuery.getSingleResult();
        } catch (Exception e) {
            // If no user is found, return null
            user = null;
        }
        
        em.close();
        emf.close();
        return user;
    }
}
