package chau.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class AbstractDAO implements Serializable {
    protected Connection con;
    protected PreparedStatement psm;
    protected ResultSet rs;

    protected void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (psm != null) {
            psm.close();
        }
        if (con != null) {
            con.close();
        }
    }
}
