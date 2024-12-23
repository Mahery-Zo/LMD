package Objet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnectionManager {
    private static Connection connection = null;

    public static Connection getConnection() throws SQLException, ClassNotFoundException {

        if (connection == null || connection.isClosed()) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:orcl";
            String user = "itu";
            String password = "itu";
            connection = DriverManager.getConnection(url, user, password);

        }
        return connection;
    }

    public static void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }

    }
}
