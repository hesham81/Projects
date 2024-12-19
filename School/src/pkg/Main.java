package pkg;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.List;

public class Main {

    private JFrame frame;
    private JTextArea displayArea;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Main().initializeGUI();
            }
        });
    }

    // Initialize GUI components
    public void initializeGUI() {
        frame = new JFrame("School Database System");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 500);

        // Create a container for components
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());

        // JTextArea for displaying messages
        displayArea = new JTextArea();
        displayArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(displayArea);
        panel.add(scrollPane, BorderLayout.CENTER);

        // Button panel
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(5, 2));

        // Add buttons
        addButton(buttonPanel, "Add Student", e -> openAddStudentDialog());
        addButton(buttonPanel, "Add Teacher", e -> openAddTeacherDialog());
        addButton(buttonPanel, "Add Course", e -> openAddCourseDialog());
        addButton(buttonPanel, "View All Students", e -> openViewStudentsDialog());
        addButton(buttonPanel, "View All Teachers", e -> openViewTeachersDialog());
        addButton(buttonPanel, "View All Courses", e -> openViewCoursesDialog());
        addButton(buttonPanel, "Exit", e -> System.exit(0));

        // Add the button panel to the frame
        panel.add(buttonPanel, BorderLayout.SOUTH);

        // Add the main panel to the frame
        frame.add(panel);
        frame.setVisible(true);
    }

    // Helper method to add a button with a label and action listener
    private void addButton(JPanel panel, String label, ActionListener action) {
        JButton button = new JButton(label);
        button.addActionListener(action);
        panel.add(button);
    }

    // Open dialog to add a student
    private void openAddStudentDialog() {
        JDialog dialog = new JDialog(frame, "Add Student", true);
        dialog.setSize(400, 300);

        JPanel panel = new JPanel(new GridLayout(6, 2));
        JTextField nameField = new JTextField();
        JTextField phoneField = new JTextField();
        JTextField genderField = new JTextField();
        JTextField usernameField = new JTextField();
        JTextField passwordField = new JTextField();

        panel.add(new JLabel("Name:"));
        panel.add(nameField);
        panel.add(new JLabel("Phone Number:"));
        panel.add(phoneField);
        panel.add(new JLabel("Gender:"));
        panel.add(genderField);
        panel.add(new JLabel("Username:"));
        panel.add(usernameField);
        panel.add(new JLabel("Password:"));
        panel.add(passwordField);

        JButton submitButton = new JButton("Submit");
        submitButton.addActionListener(e -> {
            String name = nameField.getText();
            String phone = phoneField.getText();
            String gender = genderField.getText();
            String username = usernameField.getText();
            String password = passwordField.getText();

            if (!name.isEmpty() && !phone.isEmpty() && !gender.isEmpty() &&
                !username.isEmpty() && !password.isEmpty()) {

                Student student = new Student(name, phone, gender, username, password);
                DatabaseConnection.addStudent(student);
                displayArea.append("Added Student: " + name + "\n");
                dialog.dispose();
            }
        });

        panel.add(new JLabel());
        panel.add(submitButton);

        dialog.add(panel);
        dialog.setVisible(true);
    }

    // Open dialog to add a teacher
    private void openAddTeacherDialog() {
        JDialog dialog = new JDialog(frame, "Add Teacher", true);
        dialog.setSize(400, 300);

        JPanel panel = new JPanel(new GridLayout(6, 2));
        JTextField nameField = new JTextField();
        JTextField phoneField = new JTextField();
        JTextField genderField = new JTextField();
        JTextField usernameField = new JTextField();
        JTextField passwordField = new JTextField();

        panel.add(new JLabel("Name:"));
        panel.add(nameField);
        panel.add(new JLabel("Phone Number:"));
        panel.add(phoneField);
        panel.add(new JLabel("Gender:"));
        panel.add(genderField);
        panel.add(new JLabel("Username:"));
        panel.add(usernameField);
        panel.add(new JLabel("Password:"));
        panel.add(passwordField);

        JButton submitButton = new JButton("Submit");
        submitButton.addActionListener(e -> {
            String name = nameField.getText();
            String phone = phoneField.getText();
            String gender = genderField.getText();
            String username = usernameField.getText();
            String password = passwordField.getText();

            if (!name.isEmpty() && !phone.isEmpty() && !gender.isEmpty() &&
                !username.isEmpty() && !password.isEmpty()) {

                Teacher teacher = new Teacher(name, phone, gender, username, password);
                DatabaseConnection.addTeacher(teacher);
                displayArea.append("Added Teacher: " + name + "\n");
                dialog.dispose();
            }
        });

        panel.add(new JLabel());
        panel.add(submitButton);

        dialog.add(panel);
        dialog.setVisible(true);
    }

    // Open dialog to add a course
    private void openAddCourseDialog() {
        JDialog dialog = new JDialog(frame, "Add Course", true);
        dialog.setSize(400, 200);

        JPanel panel = new JPanel(new GridLayout(3, 2));
        JTextField courseNameField = new JTextField();
        JTextField courseCodeField = new JTextField();

        panel.add(new JLabel("Course Name:"));
        panel.add(courseNameField);
        panel.add(new JLabel("Course Code:"));
        panel.add(courseCodeField);

        JButton submitButton = new JButton("Submit");
        submitButton.addActionListener(e -> {
            String courseName = courseNameField.getText();
            String courseCode = courseCodeField.getText();

            if (!courseName.isEmpty() && !courseCode.isEmpty()) {
                Courses course = new Courses(courseName, courseCode);
                DatabaseConnection.addCourse(course);
                displayArea.append("Added Course: " + courseName + "\n");
                dialog.dispose();
            }
        });

        panel.add(new JLabel());
        panel.add(submitButton);

        dialog.add(panel);
        dialog.setVisible(true);
    }

    // Open a dialog to view all students in a JTable
    private void openViewStudentsDialog() {
        JDialog dialog = new JDialog(frame, "All Students", true);
        dialog.setSize(600, 400);

        List<Student> students = DatabaseConnection.getAllStudents();
        String[][] data = new String[students.size()][2];
        for (int i = 0; i < students.size(); i++) {
            data[i][0] = String.valueOf(students.get(i).getStudentId());
            data[i][1] = students.get(i).getStudentName();
        }

        String[] columnNames = {"Student ID", "Name"};
        JTable table = new JTable(data, columnNames);
        JScrollPane scrollPane = new JScrollPane(table);

        // Right-click context menu to delete student
        table.setComponentPopupMenu(createPopupMenu(table, "Student"));

        dialog.add(scrollPane);
        dialog.setVisible(true);
    }

    // Open a dialog to view all teachers in a JTable
    private void openViewTeachersDialog() {
        JDialog dialog = new JDialog(frame, "All Teachers", true);
        dialog.setSize(600, 400);

        List<Teacher> teachers = DatabaseConnection.getAllTeachers();
        String[][] data = new String[teachers.size()][2];
        for (int i = 0; i < teachers.size(); i++) {
            data[i][0] = String.valueOf(teachers.get(i).getTeacherId());
            data[i][1] = teachers.get(i).getTeacherName();
        }

        String[] columnNames = {"Teacher ID", "Name"};
        JTable table = new JTable(data, columnNames);
        JScrollPane scrollPane = new JScrollPane(table);

        // Right-click context menu to delete teacher
        table.setComponentPopupMenu(createPopupMenu(table, "Teacher"));

        dialog.add(scrollPane);
        dialog.setVisible(true);
    }

    // Open a dialog to view all courses in a JTable
    private void openViewCoursesDialog() {
        JDialog dialog = new JDialog(frame, "All Courses", true);
        dialog.setSize(600, 400);

        List<Courses> courses = DatabaseConnection.getAllCourses();
        String[][] data = new String[courses.size()][2];
        for (int i = 0; i < courses.size(); i++) {
            data[i][0] = String.valueOf(courses.get(i).getCourseId());
            data[i][1] = courses.get(i).getCourseName();
        }

        String[] columnNames = {"Course ID", "Course Name"};
        JTable table = new JTable(data, columnNames);
        JScrollPane scrollPane = new JScrollPane(table);

        dialog.add(scrollPane);
        dialog.setVisible(true);
    }

    // Helper method to create the right-click menu
    private JPopupMenu createPopupMenu(JTable table, String entityType) {
        JPopupMenu popupMenu = new JPopupMenu();
        JMenuItem deleteMenuItem = new JMenuItem("Delete");

        // Delete item action
        deleteMenuItem.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row != -1) {
                int id = Integer.parseInt(table.getValueAt(row, 0).toString());
                if (entityType.equals("Student")) {
                    DatabaseConnection.deleteStudent(id);
                } else if (entityType.equals("Teacher")) {
                    DatabaseConnection.deleteTeacher(id);
                }
            }
        });

        popupMenu.add(deleteMenuItem);
        return popupMenu;
    }
}


    // Method to remove a student
//    private void removeStudent() {
//        String studentId = JOptionPane.showInputDialog(frame, "Enter student ID to remove:");
//        if (studentId != null && !studentId.isEmpty()) {
//            int id = Integer.parseInt(studentId);
//            boolean removed = DatabaseConnection.removeStudent(id);
//            if (removed) {
//                displayArea.append("Removed Student with ID: " + id + "\n");
//            } else {
//                displayArea.append("No student found with ID: " + id + "\n");
//            }
//        }
//    }
//
//    // Method to remove a teacher
//    private void removeTeacher() {
//        String teacherId = JOptionPane.showInputDialog(frame, "Enter teacher ID to remove:");
//        if (teacherId != null && !teacherId.isEmpty()) {
//            int id = Integer.parseInt(teacherId);
//            boolean removed = DatabaseConnection.removeTeacher(id);
//            if (removed) {
//                displayArea.append("Removed Teacher with ID: " + id + "\n");
//            } else {
//                displayArea.append("No teacher found with ID: " + id + "\n");
//            }
//        }
//    }
//
//    // Method to remove a course
//    private void removeCourse() {
//        String courseId = JOptionPane.showInputDialog(frame, "Enter course ID to remove:");
//        if (courseId != null && !courseId.isEmpty()) {
//            int id = Integer.parseInt(courseId);
//            boolean removed = DatabaseConnection.deleteCourse(id);
//            if (removed) {
//                displayArea.append("Removed Course with ID: " + id + "\n");
//            } else {
//                displayArea.append("No course found with ID: " + id + "\n");
//            }
//        }
//    }
//}