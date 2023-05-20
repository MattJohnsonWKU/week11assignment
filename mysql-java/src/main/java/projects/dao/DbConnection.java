package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import projects.exception.DbException;

public class DbConnection {
    private static String HOST = "localhost";
    private static int PORT = 3306;
    private static String SCHEMA = "projects";
    private static String USER = "projects";
    private static String PASSWORD = "projects";

    public static Connection getConnection() {
        String uri = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false", HOST,  PORT, SCHEMA, USER, PASSWORD);

        try {
            Connection conn = DriverManager.getConnection(uri);
            System.out.println("Connection to schema '" + SCHEMA + "' is successful.");
            return conn;
        } catch (SQLException e) {
            System.err.println("Connection failed at " + uri);
            throw new DbException("Unable to get connection at \" + uri");
        }
    }
}
