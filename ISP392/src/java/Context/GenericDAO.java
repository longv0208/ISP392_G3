package Context;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * GenericDAO class for common database operations.
 * @param <T> Type of the object that will be mapped to/from the database.
 */
public abstract class GenericDAO<T> {
    
    protected Connection connection;
    protected PreparedStatement preparedStatement;
    protected ResultSet resultSet;
    
    public GenericDAO() {
        try {
            // Get the connection from DBContext
            DBContext dbContext = new DBContext();
            this.connection = dbContext.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Method to close the connection, preparedStatement, and resultSet
    protected void close() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Generic method for executing an update (INSERT, UPDATE, DELETE)
    protected boolean executeUpdate(String query, Object... params) {
        try {
            preparedStatement = connection.prepareStatement(query);
            setParameters(preparedStatement, params);
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return false;
    }

    // Generic method for executing a query (SELECT)
    protected ResultSet executeQuery(String query, Object... params) {
        try {
            preparedStatement = connection.prepareStatement(query);
            setParameters(preparedStatement, params);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    
    // Helper method to set parameters for PreparedStatement
    private void setParameters(PreparedStatement preparedStatement, Object... params) throws SQLException {
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }
    }
    
    // Abstract method for mapping a ResultSet row to a specific object type
    protected abstract T mapRow(ResultSet resultSet) throws SQLException;
}
