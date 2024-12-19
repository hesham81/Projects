package pkg;

import java.util.Date;
import javax.persistence.*;
@Entity
abstract public class Users {
	@Id
	@GeneratedValue
    private int userId;
    private String username;
    private String userType;
    private String userPassword;
    private String userPhoneNumber;
    private String userGender;
    private Date userBirthDate;
    private int availableDaysForAbsents = 25;

    public Users(String userType, String phoneNumber, String userGender, String username, String userPassword) {
        if (userType.toLowerCase().equals("teacher")) {
            this.setUserType("Teacher");
        } else if (userType.toLowerCase().equals("student")) {
            this.setUserType("Student");
        } else if (userType.toLowerCase().equals("admin")) {
            this.setUserType("Admin");
        }
        if (phoneNumber.length() == 11) {
            this.setUserPhoneNumber(phoneNumber);
        }
        char firstCharInUserGender = Character.toUpperCase(userGender.charAt(0));
        if (userGender.toUpperCase().equals("MALE") || firstCharInUserGender == 'M') {
            setUserGender("Male");
        } else if (userGender.toUpperCase().equals("FEMALE") || firstCharInUserGender == 'F') {
            setUserGender("Female");
        }
        setUserPassword(userPassword);
        setUsername(username);
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Date getUserBirthDate() {
        return userBirthDate;
    }

    public void setUserBirthDate(Date userBirthDate) {
        this.userBirthDate = userBirthDate;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void absentDay() {
        availableDaysForAbsents--;
    }

    public abstract int ageOfUser();
}
