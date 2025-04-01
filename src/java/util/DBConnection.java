package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static DBConnection instance;
    private Connection connection;
    
    // Change the port if it's different (Check SQL Configuration Manager)
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=MegaCityCabsDB;integratedSecurity=true;encrypt=false;";
    
    // Private constructor to enforce Singleton pattern
    private DBConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            this.connection = DriverManager.getConnection(URL);
            System.out.println("Database connected successfully!");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Failed to connect to database: " + e.getMessage());
        }
    }

    // Singleton instance method
    public static DBConnection getInstance() {
        if (instance == null) {
            synchronized (DBConnection.class) {
                if (instance == null) {
                    instance = new DBConnection();
                }
            }
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
        }
    }

    // Test connection (Run this class directly)
    public static void main(String[] args) {
        DBConnection db = DBConnection.getInstance();
        if (db.getConnection() != null) {
            System.out.println("Connection test successful!");
        } else {
            System.err.println("Connection test failed!");
        }
        db.closeConnection();
    }
}
