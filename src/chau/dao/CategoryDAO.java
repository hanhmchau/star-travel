package chau.dao;

import chau.consts.Consts;
import chau.dto.CategoryDTO;
import chau.utils.MyConnection;

import java.util.LinkedHashSet;
import java.util.Set;

public class CategoryDAO extends AbstractDAO {
    public Set<CategoryDTO> getAllCategories() throws Exception {
        Set<CategoryDTO> categories = new LinkedHashSet<>();
        try {
            String sql = "SELECT id, name, [status] FROM Category WHERE status = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.CATEGORY_STATUS.ACTIVE.value);
            rs = psm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int status = rs.getInt("status");
                categories.add(new CategoryDTO(id, name, status));
            }
        } finally {
            closeConnection();
        }
        return categories;
    }

    public boolean createCategory(String name) throws Exception {
        try {
            String sql = "INSERT INTO [Category](name, status) VALUES(?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, name);
            psm.setInt(2, Consts.CATEGORY_STATUS.ACTIVE.value);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public boolean updateCategory(int id, String name) throws Exception {
        try {
            String sql = "UPDATE [Category] SET name = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, name);
            psm.setInt(2, id);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public boolean removeCategory(int id) throws Exception {
        try {
            String sql = "UPDATE [Category] SET status = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.CATEGORY_STATUS.DELETED.value);
            psm.setInt(2, id);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }
}
