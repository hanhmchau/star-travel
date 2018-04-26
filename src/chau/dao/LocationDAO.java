package chau.dao;

import chau.consts.Consts;
import chau.dto.LocationDTO;
import chau.utils.MyConnection;
import chau.utils.MyUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.math.BigInteger;
import java.sql.Statement;
import java.util.*;

public class LocationDAO extends AbstractDAO {
    public List<LocationDTO> getLocationsByName(String search) throws Exception {
        List<LocationDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT id, [name] " +
                    "FROM Location l WHERE [name] LIKE ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, "%" + search + "%");
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                list.add(new LocationDTO(id, name, null));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public String createNewLocation(String name, String titleUrl, String description) throws Exception {
        String id = getNextLocationId();
        try {
            String sql = "INSERT INTO Location(id, name, description, title_url) VALUES(?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, name);
            psm.setString(3, description);
            psm.setString(4, titleUrl);
            psm.executeUpdate();
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextLocationId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Location]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.LOCATION_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.LOCATION_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextLocationImageId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Location_Images]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.LOCATION_IMAGE_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.LOCATION_IMAGE_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextLocationImageId(String lastId) throws Exception {
        long number = Long.parseLong(lastId.substring(Consts.PREFIX.LOCATION_IMAGE_PREFIX.length())) + 1;
        return Consts.PREFIX.LOCATION_IMAGE_PREFIX + number;
    }

    public Map<String, String> addLocationImages(String locationId, List<File> files, List<String> fileNames, String path) throws Exception {
        Map<String, String> map = new LinkedHashMap<>();
        String newId = getNextLocationImageId();
        try {
            String sql = "INSERT INTO Location_Images(id, location_id, fileName, deleted) VALUES(?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            int i = 0;
            for (File file: files) {
                String fileName = String.valueOf(System.currentTimeMillis()) + "." + FilenameUtils.getExtension(fileNames.get(i));
                String filePath = path + fileName;
                File dest = new File(filePath);
                FileUtils.copyFile(file, dest);
                psm.setString(1, newId);
                psm.setString(2, locationId);
                psm.setString(3, fileName);
                psm.setBoolean(4, false);
                psm.addBatch();
                map.put(newId, "/" + Consts.LOCATION_IMAGE_DIRECTORY + fileName);
                newId = getNextLocationImageId(newId);
                i++;
            }
            psm.executeBatch();
        } finally {
            closeConnection();
        }
        return map;
    }

    public LocationDTO getLocationByTitleUrl(String url) throws Exception {
        LocationDTO location = null;
        try {
            String sql = "SELECT id, [name], description " +
                    " FROM [Location] WHERE title_url = ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, url);
            rs = psm.executeQuery();
            if (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                location = new LocationDTO(id, name, description);
                location.setImages(getLocationImages(id));
            }
        } finally {
            closeConnection();
        }
        return location;
    }

    public Map<String, String> getLocationImages(String locationId) throws Exception {
        Map<String, String> map = new LinkedHashMap<>();
        try {
            String sql = "SELECT id, fileName FROM [Location_Images] WHERE location_id = ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, locationId);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String fileName = "/" + Consts.LOCATION_IMAGE_DIRECTORY + rs.getString("fileName");
                map.put(id, fileName);
            }
        } finally {
            closeConnection();
        }
        return map;
    }

    public boolean locationExists(String id) throws Exception {
        try {
            String sql = "SELECT id FROM [Location] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            return rs.next();
        } finally {
            closeConnection();
        }
    }

    public boolean setLocationName(String id, String name) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [Location] SET [name] = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, name);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setDescription(String id, String description) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [Location] SET description = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, description);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeImageFromLocation(String id) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE [Location_Images] SET deleted = 1 WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<LocationDTO> getAllLocations() throws Exception {
        List<LocationDTO> list =  new ArrayList<>();
        try {
            String sql = "SELECT id, [name], description, title_url, " +
                    " (SELECT TOP 1 fileName FROM Location_Images WHERE location_id = l.id ORDER BY id ASC) AS 'image', " +
                    " (SELECT COUNT(DISTINCT tour_id) FROM Tour_Location WHERE location_id = l.id AND deleted = 0) AS 'count' " +
                    "FROM [Location] l WHERE deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String url = rs.getString("title_url");
                String description = rs.getString("description");
                String image = rs.getString("image");
                int count = rs.getInt("count");
                if (image != null) {
                    image = "/" + Consts.LOCATION_IMAGE_DIRECTORY + image;
                } else {
                    image = "/location/default.png";
                }
                LocationDTO dto = new LocationDTO(id, name, description, url);
                dto.setCount(count);
                Map<String, String> images = new HashMap<>();
                images.put("image", image);
                dto.setImages(images);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<LocationDTO> getLocations(int page, int perPage) throws Exception {
        List<LocationDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT id, [name], title_url " +
                    "FROM [Location] WHERE deleted = 0 ORDER BY id ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, perPage * (page -1));
            psm.setInt(2, perPage);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String url = rs.getString("title_url");
                LocationDTO dto = new LocationDTO(id, name, null, url);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean deleteLocation(String id) throws Exception {
        try {
            String sql = "UPDATE [Location] SET deleted = 1 WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public List<LocationDTO> getHighestProfitLocations(int limit) throws Exception {
        List<LocationDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT l.id as 'id', name, title_url, total "
                    + "FROM Location l, "
                    + "( "
                    + "SELECT TOP (?) tabl.locId as 'id', SUM(tabl.total) as 'total' "
                    + "FROM ( "
                    + "SELECT temp.id, temp.total, l.id as 'locId', l.name, l.title_url "
                    + "FROM "
                    + "( "
                    + "SELECT id, title, title_url, ((SELECT SUM(adult_seat) FROM OrderItem oi WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id)) * t.adult_price + "
                    + "(SELECT SUM(child_seat) FROM OrderItem oi WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id)) * t.child_price - "
                    + "ISNULL((SELECT SUM((adult_seat) * refund_rate) FROM Refund WHERE order_item_id IN (SELECT id FROM OrderItem WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id))), 0) * t.adult_price - "
                    + "ISNULL((SELECT SUM((child_seat) * refund_rate) FROM Refund WHERE order_item_id IN (SELECT id FROM OrderItem WHERE tour_date_id IN (SELECT id FROM Tour_StartDates WHERE tour_id = t.id))), 0) * t.child_price) as 'total' FROM Tour t "
                    + ") temp, Tour_Location tl, Location l "
                    + "WHERE temp.id = tl.tour_id AND l.id = tl.location_id) tabl "
                    + "GROUP BY locId "
                    + "ORDER BY total DESC "
                    + ") big_table "
                    + "WHERE big_table.id = l.id";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, limit);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String titleUrl = rs.getString("title_url");
                double total = rs.getDouble("total");
                LocationDTO dto = new LocationDTO();
                dto.setId(id);
                dto.setName(name);
                dto.setUrl(titleUrl);
                dto.setTotal(total);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
