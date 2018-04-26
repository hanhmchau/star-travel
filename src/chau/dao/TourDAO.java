package chau.dao;

import chau.consts.Consts;
import chau.dto.*;
import chau.utils.MyConnection;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.sql.Statement;
import java.util.*;
import java.util.stream.Collectors;

public class TourDAO extends AbstractDAO {
    public TourDTO getTourByTitleUrl(String titleUrl) throws Exception {
        TourDTO dto = null;
        try {
            String sql = "SELECT [id],[title],[description],[number_of_days],[number_of_nights],[adult_price]," +
                    "[child_price],[creator_id],[date_created],[status],[seat_total]," +
                    "[highlights],[what_you_can_expect],[inclusions] FROM [dbo].[Tour] WHERE title_url = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, titleUrl);
            rs = psm.executeQuery();
            if (rs.next()) {
                String id = rs.getString("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int numberOfDays = rs.getInt("number_of_days");
                int numberOfNights = rs.getInt("number_of_nights");
                double adultPrice = rs.getFloat("adult_price");
                double childPrice = rs.getFloat("child_price");
                int creatorId = rs.getInt("creator_id");
                Date dateCreated = rs.getDate("date_created");
                int status = rs.getInt("status");
                int seatTotal = rs.getInt("seat_total");
                String highlights = rs.getString("highlights");
                String whatYouCanExpect = rs.getString("what_you_can_expect");
                String inclusions = rs.getString("inclusions");
                dto = new TourDTO(id, title, titleUrl, description, numberOfDays, numberOfNights, adultPrice, childPrice,
                        creatorId, dateCreated, status, seatTotal,highlights,whatYouCanExpect,inclusions);
                dto.setCategories(getTourCategories(id));
                dto.setStartDates(getTourStartDates(id));
                dto.setImages(getTourImages(id));
                dto.setItinerary(getTourItineraries(id));
                dto.setLocations(getTourLocations(id));
                dto.setReviews(getTourReviews(id));
                dto.setAverageRating(dto.getReviews().stream().mapToDouble(value -> value.getRating()).average().orElse(0));
            }
        }
        finally {
            closeConnection();
        }
        return dto;
    }

    public Map<String, Date> getTourStartDates(String id) throws Exception {
        Map<String, Date> dates = new LinkedHashMap<>();
        try {
            String sql = "SELECT id, start_date FROM Tour_StartDates WHERE tour_id = ? AND deleted = 0 ORDER BY start_date";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            while (rs.next()) {
                dates.put(rs.getString("id"), rs.getDate("start_date"));
            }
        } finally {
            closeConnection();
        }
        return dates;
    }

    public Set<LocationDTO> getTourLocations(String tourId) throws Exception {
        Set<LocationDTO> list = new LinkedHashSet<>();
        try {
            String sql = "SELECT id, name, description " +
                    "FROM [Location] l " +
                    "WHERE id IN (SELECT location_id FROM [Tour_Location] WHERE tour_id = ? AND deleted = 0) AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourId);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                list.add(new LocationDTO(id, name, description));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<ItineraryDTO> getTourItineraries(String tourId) throws Exception {
        List<ItineraryDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT id, title, content, [order] FROM Tour_Itinerary WHERE tour_id = ? AND deleted = 0 ORDER BY [order]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourId);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                int order = rs.getInt("order");
                list.add(new ItineraryDTO(id, title, content, order));
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public Map<String, Date> getTourStartDatesAfterToday(String id) throws Exception {
        Map<String, Date> dates = new LinkedHashMap<>();
        try {
            String sql = "SELECT id, start_date FROM Tour_StartDates WHERE tour_id = ? AND start_date >= (SELECT CAST(GETDATE() AS DATE)) " +
                    "AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            while (rs.next()) {
                dates.put(rs.getString("id"), rs.getDate("start_date"));
            }
        } finally {
            closeConnection();
        }
        return dates;
    }

    public Set<CategoryDTO> getTourCategories(String id) throws Exception {
        Set<CategoryDTO> categories = new LinkedHashSet<>();
        try {
            String sql = "SELECT id, name FROM [Category] WHERE id IN " +
                    "(SELECT category_id FROM Tour_Category WHERE tour_id = ? AND deleted = 0) AND status = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setInt(2, Consts.CATEGORY_STATUS.ACTIVE.value);
            rs = psm.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("id");
                String categoryName = rs.getString("name");
                categories.add(new CategoryDTO(categoryId, categoryName));
            }
        } finally {
            closeConnection();
        }
        return categories;
    }

    public List<ReviewDTO> getTourReviews(String id) throws Exception {
        List<ReviewDTO> reviews = new ArrayList<>();
        try {
            String sql = "SELECT id, user_id, rating, comment FROM [Review] WHERE tour_id = ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            while (rs.next()) {
                String reviewId = rs.getString("id");
                String userId = rs.getString("user_id");
                UserDAO dao = new UserDAO();
                UserDTO user = dao.findUserById(userId);
                int rating = rs.getInt("rating");
                String comment = rs.getString("comment");
                reviews.add(new ReviewDTO(reviewId, user, id, rating, comment));
            }
        } finally {
            closeConnection();
        }
        return reviews;
    }

    public Map<String, String> getTourImages(String id) throws Exception {
        Map<String, String> images = new LinkedHashMap<>();
        try {
            String sql = "SELECT id, fileName FROM [Tour_Images] WHERE tour_id = ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            while (rs.next()) {
                String imageId = rs.getString("id");
                String fileName = "/" + Consts.TOUR_IMAGE_DIRECTORY +
                        rs.getString("fileName");
                images.put(imageId, fileName);
            }
        } finally {
            closeConnection();
        }
        return images;
    }

    public int getTotalSeatCountLeft(String id) throws Exception {
        int result = -1;
        try {
            String sql = "IF ? IN (SELECT id FROM Tour_StartDates WHERE deleted = 0) " +
                    "           SELECT (SELECT seat_total FROM Tour WHERE id = (SELECT tour_id FROM Tour_StartDates WHERE id = ?)) - " +
                    "           ISNULL((SELECT SUM(adult_seat+child_seat) FROM OrderItem WHERE tour_date_id = ?), 0) + " +
                    "           ISNULL((SELECT SUM(adult_seat+child_seat) FROM Refund ref WHERE order_item_id IN (SELECT id FROM OrderItem WHERE tour_date_id = ?)), 0)" +
                    "     ELSE SELECT -1";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, id);
            psm.setString(3, id);
            psm.setString(4, id);
//            psm.setDate(5, new java.sql.Date(date.getTime()));
            rs = psm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public TourDateDTO getTourDateForCartItem(String id) throws Exception {
        TourDateDTO dto = null;
        try {
            String sql = "SELECT tour_id, start_date FROM Tour_StartDates WHERE id = ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                String tourId = rs.getString("tour_id");
                Date date = rs.getDate("start_date");
                dto = new TourDateDTO();
                dto.setId(id);
                dto.setTour(getTourForCartItem(tourId));
                dto.setDate(date);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public TourDTO getTourForCartItem(String id) throws Exception {
        TourDTO dto = null;
        try {
            String sql = "SELECT [title], [title_url], [number_of_days],[number_of_nights],[adult_price],[child_price], [seat_total] " +
                    "FROM [dbo].[Tour] WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String titleUrl = rs.getString("title_url");
                int numberOfDays = rs.getInt("number_of_days");
                int numberOfNights = rs.getInt("number_of_nights");
                int seatTotal = rs.getInt("seat_total");
                double adultPrice = rs.getFloat("adult_price");
                double childPrice = rs.getFloat("child_price");
                dto = new TourDTO(id, title, titleUrl, numberOfDays, numberOfNights, adultPrice, childPrice);
                dto.setSeatTotal(seatTotal);
            }
        }
        finally {
            closeConnection();
        }
        return dto;
    }

    public String insertNewTour(String title, String titleUrl, String description, int numberOfDays, int numberOfNights, double adultPrice,
                                double childPrice, String creatorId, int seatTotal, String highlights,
                                String whatYouCanExpect, String inclusions, Set<Integer> categories, Set<String> locations,
                                Set<Date> startDates, List<ItineraryDTO> itinerary) throws Exception {
        String tourId = getNextTourId();
        try {
            String sql = "INSERT INTO Tour([id],[title],[title_url],[description],[number_of_days],[number_of_nights],[adult_price],[child_price]," +
                    "[creator_id],[date_created],[status],[seat_total]," +
                    "[highlights],[what_you_can_expect],[inclusions]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            psm.setString(1, tourId);
            psm.setString(2, title);
            psm.setString(3, titleUrl);
            psm.setString(4, description);
            psm.setInt(5, numberOfDays);
            psm.setInt(6, numberOfNights);
            psm.setDouble(7, adultPrice);
            psm.setDouble(8, childPrice);
            psm.setString(9, creatorId);
            psm.setDate(10, new java.sql.Date(new Date().getTime()));
            psm.setInt(11, Consts.TOUR_STATUS.ACTIVE.value);
            psm.setInt(12, seatTotal);
            psm.setString(13, highlights);
            psm.setString(14, whatYouCanExpect);
            psm.setString(15, inclusions);
            int res = psm.executeUpdate();
            if (res > 0) {
                insertTourLocations(tourId, locations);
                insertTourCategories(tourId, categories);
                insertTourDates(tourId, startDates);
                insertTourItineraries(tourId, itinerary);
            }
        } finally {
            closeConnection();
        }
        return tourId;
    }

    private void insertTourLocations(String tourId, Set<String> locations) throws Exception {
        String id = getNextTourLocationId();
        try {
            con = MyConnection.getMyConnection();
            String sqlUpdate = "INSERT INTO Tour_Location(id, tour_id, location_id) VALUES(?, ?, ?)";
            psm = con.prepareStatement(sqlUpdate);
            for (String locationId: locations) {
                psm.setString(1, id);
                psm.setString(2, tourId);
                psm.setString(3, locationId);
                psm.addBatch();
                id = getNextTourLocationId(id);
            }
            psm.executeBatch();
        } finally {
            closeConnection();
        }
    }

    private void insertTourItineraries(String tourId, List<ItineraryDTO> list) throws Exception {
        String id = getNextTourItineraryId();
        try {
            con = MyConnection.getMyConnection();
            String sqlUpdate = "INSERT INTO Tour_Itinerary(id, tour_id, title, content, [order]) VALUES(?, ?, ?, ?, ?)";
            psm = con.prepareStatement(sqlUpdate);
            for (ItineraryDTO itineraryDTO: list) {
                psm.setString(1, id);
                psm.setString(2, tourId);
                psm.setString(3, itineraryDTO.getTitle());
                psm.setString(4, itineraryDTO.getContent());
                psm.setInt(5, itineraryDTO.getOrder());
                psm.addBatch();
                id = getNextTourItineraryId(id);
            }
            psm.executeBatch();
        } finally {
            closeConnection();
        }
    }

    private void insertTourDates(String tourId, Set<Date> dates) throws Exception {
        String id = getNextTourDateId();
        try {
            con = MyConnection.getMyConnection();
            String sqlUpdate = "INSERT INTO Tour_StartDates(id, tour_id, start_date) VALUES(?, ?, ?)";
            psm = con.prepareStatement(sqlUpdate);
            for (Date date: dates) {
                psm.setString(1, id);
                psm.setString(2, tourId);
                psm.setDate(3, new java.sql.Date(date.getTime()));
                psm.addBatch();
                id = getNextTourDateId(id);
            }
            psm.executeBatch();
        } finally {
            closeConnection();
        }
    }

    private void insertTourCategories(String tourId, Set<Integer> categories) throws Exception {
        String id = getNextTourCategoryId();
        try {
            con = MyConnection.getMyConnection();
            String sqlUpdate = "INSERT INTO Tour_Category(id, tour_id, category_id) VALUES(?, ?, ?)";
            psm = con.prepareStatement(sqlUpdate);
            for (Integer category: categories) {
                psm.setString(1, id);
                psm.setString(2, tourId);
                psm.setInt(3, category);
                psm.addBatch();
                id = getNextTourCategoryId(id);
            }
            psm.executeBatch();
        } finally {
            closeConnection();
        }
    }

    public Map<String, String> addTourImages(String tourId, List<File> files, List<String> fileNames, String path) throws Exception {
        Map<String, String> map = new LinkedHashMap<>();
        String id = getNextTourImageId();
        try {
            String sql = "INSERT INTO Tour_Images(id, tour_id, fileName) VALUES(?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            int i = 0;
            for (File file: files) {
                String fileName = String.valueOf(System.currentTimeMillis()) + "." + FilenameUtils.getExtension(fileNames.get(i));
                String filePath = path + fileName;
                File dest = new File(filePath);
                FileUtils.copyFile(file, dest);
                psm.setString(1, id);
                psm.setString(2, tourId);
                psm.setString(3, fileName);
                psm.addBatch();
                map.put(id, "/" + Consts.TOUR_IMAGE_DIRECTORY + fileName);
                id = getNextTourImageId(id);
                i++;
            }
            psm.executeBatch();
        } finally {
            closeConnection();
        }
        return map;
    }

    public boolean setTourTitle(String id, String title) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET title = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, title);
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
            String sql = "UPDATE Tour SET description = ? WHERE id = ?";
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

    public boolean setHighlights(String id, String highlights) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET highlights = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, highlights);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setWhatYouCanExpect(String id, String whatYouCanExpect) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET what_you_can_expect = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, whatYouCanExpect);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setInclusions(String id, String inclusions) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET inclusions = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, inclusions);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setNumberOfDays(String id, int numberOfDays) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET number_of_days = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, numberOfDays);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setNumberOfNights(String id, int numberOfNights) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET number_of_nights = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, numberOfNights);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setSeatTotal(String id, int seatTotal) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET seat_total = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, seatTotal);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setAdultPrice(String id, double adultPrice) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET adult_price = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setDouble(1, adultPrice);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setChildPrice(String id, double childPrice) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour SET child_price = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setDouble(1, childPrice);
            psm.setString(2, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean tourExists(String id) throws Exception {
        boolean result;
        try {
            String sql = "SELECT TOP 1 id FROM Tour WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            result = psm.executeQuery().next();
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean addCategoryToTour(String tourId, int categoryId) throws Exception {
        String id = getNextTourCategoryId();
        boolean result;
        try {
            String sql = "INSERT INTO Tour_Category(id, tour_id, category_id) VALUES(?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, tourId);
            psm.setInt(3, categoryId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeCategoryFromTour(String tourId, int categoryId) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour_Category SET deleted = 1 WHERE tour_id = ? and category_id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourId);
            psm.setInt(2, categoryId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean addStartDatesToTour(String tourId, Date date) throws Exception {
        String id = getNextTourDateId();
        boolean result;
        try {
            String sql = "INSERT INTO Tour_StartDates(id, tour_id, start_date) VALUES (?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, tourId);
            psm.setDate(3, new java.sql.Date(date.getTime()));
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getTourDateOrderItemCount(String tourDateId) throws Exception {
        int result = 0;
        try {
            String sql = "SELECT Count(id) FROM [OrderItem] WHERE tour_date_id = ? AND status = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourDateId);
            psm.setInt(2, Consts.ORDER_STATUS.ACTIVE);
            rs = psm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeStartDatesFromTour(String tourDateId) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour_StartDates SET deleted = 1 WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourDateId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean addTourItineraryItem(String tourId, String title, String content) throws Exception {
        String id = getNextTourItineraryId();
        boolean result;
        try {
            String sql = "INSERT INTO Tour_Itinerary(id, tour_id, title, content, [order]) " +
                    "VALUES(?, ?, ?, ?, (SELECT ISNULL((SELECT MAX([order])+1 FROM Tour_Itinerary WHERE tour_id = ?), 1)))";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, tourId);
            psm.setString(3, title);
            psm.setString(4, content);
            psm.setString(5, tourId);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeTourItineraryItem(String id) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour_Itinerary SET deleted = 1 WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean editTourItineraryItem(String id, String title, String content) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour_Itinerary SET title = ?, content = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, title);
            psm.setString(2, content);
            psm.setString(3, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeImageFromTour(String id) throws Exception {
        boolean result;
        try {
            String sql = "UPDATE Tour_Images SET deleted = 1 WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean addTourLocationAction(String tourId, String locationId) throws Exception {
        try {
            String sql = "IF EXISTS (SELECT id FROM Tour_Location WHERE tour_id = ? AND location_id = ?) " +
                    "UPDATE Tour_Location SET deleted = 0 WHERE tour_id = ? AND location_id = ? " +
                        "ELSE " +
                    "INSERT INTO Tour_Location(tour_id, location_id, deleted) VALUES(?,?,0)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourId);
            psm.setString(2, locationId);
            psm.setString(3, tourId);
            psm.setString(4, locationId);
            psm.setString(5, tourId);
            psm.setString(6, locationId);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public boolean removeTourLocationAction(String tourId, String locationId) throws Exception {
        try {
            String sql = "UPDATE Tour_Location SET deleted = 1 WHERE tour_id = ? AND location_id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourId);
            psm.setString(2, locationId);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public List<TourDTO> getAllTours(int page, int perpage) throws Exception {
        List<TourDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT [id],[title], [title_url], [description],[number_of_days],[number_of_nights],[adult_price]," +
                    "[child_price],[creator_id],[date_created],[status],[seat_total], " +
                    "(SELECT TOP 1 fileName FROM Tour_Images WHERE tour_id = t.id AND deleted = 0 ORDER BY id ASC) AS 'image', " +
                    "[highlights],[what_you_can_expect],[inclusions], (SELECT AVG(CAST(rating AS FLOAT)) FROM [Review] WHERE tour_id = t.id) as 'rating'" +
                    " FROM [dbo].[Tour] t WHERE status = ? " +
                    "AND GETDATE() < ANY(SELECT start_date FROM Tour_StartDates WHERE tour_id = t.id AND deleted = 0) " +
                    "ORDER BY adult_price DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.ACTIVE.value);
//            psm.setDate(2, new java.sql.Date(new Date().getTime()));
            psm.setInt(2, perpage * (page-1));
            psm.setInt(3, perpage);
            rs = psm.executeQuery();
            while (rs.next()) {
                TourDTO dto = null;
                String id = rs.getString("id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                if (image != null) {
                    image = "/" + Consts.TOUR_IMAGE_DIRECTORY + image;
                } else {
                    image = "/tour/default.png";
                }
                String titleUrl = rs.getString("title_url");
                String description = rs.getString("description");
                int numberOfDays = rs.getInt("number_of_days");
                int numberOfNights = rs.getInt("number_of_nights");
                double adultPrice = rs.getFloat("adult_price");
                double childPrice = rs.getFloat("child_price");
                int creatorId = rs.getInt("creator_id");
                Date dateCreated = rs.getDate("date_created");
                int status = rs.getInt("status");
                int seatTotal = rs.getInt("seat_total");
                dto = new TourDTO(id, title, titleUrl, description, numberOfDays, numberOfNights, adultPrice, childPrice,
                        creatorId, dateCreated, status, seatTotal,null,null,null);
                Map<String, String> images = new HashMap<>();
                dto.setAverageRating(rs.getDouble("rating"));
                images.put("0", image);
                dto.setImages(images);
                list.add(dto);
            }
        }
        finally {
            closeConnection();
        }
        return list;
    }

    public int getTotalTourCount() throws Exception {
        int count = 0;
        try {
            String sql = "SELECT COUNT(id) FROM [Tour] t WHERE status = ? AND GETDATE() < ANY(SELECT start_date FROM Tour_StartDates WHERE deleted = 0 AND tour_id = t.id)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.ACTIVE.value);
            rs = psm.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } finally {
            closeConnection();
        }
        return count;
    }

    public boolean removeTour(String id) throws Exception {
        try {
            String sql = "UPDATE [Tour] SET status = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.DELETED.value);
            psm.setString(2, id);
            return psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
    }

    public List<TourDTO> getToursByConditions(String phrase, Date fromDate, Date toDate, double minPrice, double maxPrice,
                                              List<Integer> categories, int sort, int page, int perPage) throws Exception {
        List<TourDTO> tours = new ArrayList<>();
        String orderBy;
        switch (sort) {
            case Consts.SORT_TYPE.PRICE_ASCENDING:
                orderBy = "ORDER BY adult_price ASC";
                break;
            case Consts.SORT_TYPE.PRICE_DESCENDING:
                orderBy = "ORDER BY adult_price DESC";
                break;
            case Consts.SORT_TYPE.POPULARITY:
                orderBy = "ORDER BY (SELECT AVG(CAST(rating AS FLOAT)) FROM [Review] WHERE tour_id = t.id) DESC";
                break;
            default:
                orderBy = "ORDER BY id ASC";
                break;
        }
        try {
            String sql = "SELECT [id],[title],[title_url],[description],[number_of_days],[number_of_nights],[adult_price],[child_price]," +
                    "[creator_id],[date_created],[status],[seat_total], " +
                    "                    (SELECT TOP 1 fileName FROM Tour_Images WHERE tour_id = t.id AND deleted = 0 ORDER BY id ASC) AS 'image'," +
                    "(SELECT AVG(CAST(rating AS FLOAT)) FROM [Review] WHERE tour_id = t.id) as 'rating' " +
                    "FROM [dbo].[Tour] t " +
                    "WHERE status = ? AND (title LIKE ? OR description LIKE ?) AND (adult_price BETWEEN ? AND ?) " +
                    "      AND id IN (SELECT DISTINCT tour_id FROM Tour_Category WHERE deleted = 0 AND category_id IN "+ createListParameter(categories)+") " +
                    "      AND id IN (SELECT DISTINCT tour_id FROM Tour_StartDates WHERE deleted = 0 AND start_date BETWEEN ? AND ?) " +
                     orderBy + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.ACTIVE.value);
            psm.setString(2, "%" + phrase + "%");
            psm.setString(3, "%" + phrase + "%");
            psm.setDouble(4, minPrice);
            psm.setDouble(5, maxPrice);
            psm.setDate(6, new java.sql.Date(fromDate.getTime()));
            psm.setDate(7, new java.sql.Date(toDate.getTime()));
            psm.setInt(8, perPage * (page - 1));
            psm.setInt(9, perPage);
            rs = psm.executeQuery();
            while (rs.next()) {
                TourDTO dto = null;
                String id = rs.getString("id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                if (image != null) {
                    image = "/" + Consts.TOUR_IMAGE_DIRECTORY + image;
                } else {
                    image = "/tour/default.png";
                }
                String titleUrl = rs.getString("title_url");
                String description = rs.getString("description");
                int numberOfDays = rs.getInt("number_of_days");
                int numberOfNights = rs.getInt("number_of_nights");
                double adultPrice = rs.getFloat("adult_price");
                double childPrice = rs.getFloat("child_price");
                int creatorId = rs.getInt("creator_id");
                Date dateCreated = rs.getDate("date_created");
                int status = rs.getInt("status");
                int seatTotal = rs.getInt("seat_total");
                dto = new TourDTO(id, title, titleUrl, description, numberOfDays, numberOfNights, adultPrice, childPrice,
                        creatorId, dateCreated, status, seatTotal,null,null,null);
                dto.setAverageRating(rs.getDouble("rating"));
                Map<String, String> images = new HashMap<>();
                images.put("0", image);
                dto.setImages(images);
                tours.add(dto);
            }
        } finally {
            closeConnection();
        }
        return tours;
    }

    public int countToursByConditions(String phrase, Date fromDate, Date toDate, double minPrice, double maxPrice,
                                              List<Integer> categories) throws Exception {
        int result = 0;
        try {
            String sql = "SELECT COUNT (id) " +
                    "FROM [dbo].[Tour] t " +
                    "WHERE status = ? AND (title LIKE ? OR description LIKE ?) AND (adult_price BETWEEN ? AND ?) " +
                    "      AND id IN (SELECT DISTINCT tour_id FROM Tour_Category WHERE deleted = 0 AND category_id IN "+ createListParameter(categories)+") " +
                    "      AND id IN (SELECT DISTINCT tour_id FROM Tour_StartDates WHERE start_date BETWEEN ? AND ? AND deleted = 0)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.ACTIVE.value);
            psm.setString(2, "%" + phrase + "%");
            psm.setString(3, "%" + phrase + "%");
            psm.setDouble(4, minPrice);
            psm.setDouble(5, maxPrice);
            psm.setDate(6, new java.sql.Date(fromDate.getTime()));
            psm.setDate(7, new java.sql.Date(toDate.getTime()));
            rs = psm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    private String createListParameter(List<Integer> categories) {
        StringBuilder sb = new StringBuilder("(");
        sb.append(String.join(",", categories.stream().map(String::valueOf).collect(Collectors.toList())));
        if (categories.isEmpty()) {
            sb.append("-1");
        }
        sb.append(")");
        return sb.toString();
    }

    public List<TourDTO> getToursByLocation(String locationId, int page, int perpage) throws Exception {
        List<TourDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT [id],[title], [title_url], [description],[number_of_days],[number_of_nights],[adult_price]," +
                    "[child_price],[creator_id],[date_created],[status],[seat_total], " +
                    "(SELECT TOP 1 fileName FROM Tour_Images WHERE tour_id = t.id ORDER BY id ASC) AS 'image', " +
                    "[highlights],[what_you_can_expect],[inclusions] FROM [dbo].[Tour] t WHERE status = ? " +
                    "AND GETDATE() < ANY(SELECT start_date FROM Tour_StartDates WHERE tour_id = t.id AND deleted = 0) " +
                    "AND id in (SELECT tour_id FROM Tour_Location WHERE location_id = ? AND deleted = 0) " +
                    "ORDER BY adult_price DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.ACTIVE.value);
            psm.setString(2, locationId);
            psm.setInt(3, perpage * (page-1));
            psm.setInt(4, perpage);
            rs = psm.executeQuery();
            while (rs.next()) {
                TourDTO dto = null;
                String id = rs.getString("id");
                String title = rs.getString("title");
                String image = rs.getString("image");
                if (image != null) {
                    image = "/" + Consts.TOUR_IMAGE_DIRECTORY + image;
                } else {
                    image = "/tour/default.png";
                }
                String titleUrl = rs.getString("title_url");
                String description = rs.getString("description");
                int numberOfDays = rs.getInt("number_of_days");
                int numberOfNights = rs.getInt("number_of_nights");
                double adultPrice = rs.getFloat("adult_price");
                double childPrice = rs.getFloat("child_price");
                int creatorId = rs.getInt("creator_id");
                Date dateCreated = rs.getDate("date_created");
                int status = rs.getInt("status");
                int seatTotal = rs.getInt("seat_total");
                dto = new TourDTO(id, title, titleUrl, description, numberOfDays, numberOfNights, adultPrice, childPrice,
                        creatorId, dateCreated, status, seatTotal,null,null,null);
                Map<String, String> images = new HashMap<>();
                images.put("0", image);
                dto.setImages(images);
                list.add(dto);
            }
        }
        finally {
            closeConnection();
        }
        return list;
    }

    public int countToursByLocation(String locationId) throws Exception {
        int count = 0;
        try {
            String sql = "SELECT count(id) FROM [Tour] t WHERE status = ? " +
                    "AND GETDATE() < ANY(SELECT start_date FROM Tour_StartDates WHERE tour_id = t.id AND deleted = 0) " +
                    "AND id in (SELECT tour_id FROM Tour_Location WHERE location_id = ? AND deleted = 0)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, Consts.TOUR_STATUS.ACTIVE.value);
            psm.setString(2, locationId);
            rs = psm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        }
        finally {
            closeConnection();
        }
        return count;
    }

    private String getNextTourId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Tour]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.TOUR_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.TOUR_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextTourItineraryId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Tour_Itinerary]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.TOUR_ITINERARY_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.TOUR_ITINERARY_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextTourItineraryId(String lastId) throws Exception {
        long number = Long.parseLong(lastId.substring(Consts.PREFIX.TOUR_LOCATION_PREFIX.length())) + 1;
        return Consts.PREFIX.TOUR_LOCATION_PREFIX + number;
    }

    private String getNextTourLocationId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Tour_Location]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.TOUR_LOCATION_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.TOUR_LOCATION_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextTourLocationId(String lastId) throws Exception {
        long number = Long.parseLong(lastId.substring(Consts.PREFIX.TOUR_LOCATION_PREFIX.length())) + 1;
        return Consts.PREFIX.TOUR_LOCATION_PREFIX + number;
    }

    private String getNextTourImageId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Tour_Images]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.TOUR_IMAGE_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.TOUR_IMAGE_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextTourImageId(String lastId) throws Exception {
        long number = Long.parseLong(lastId.substring(Consts.PREFIX.TOUR_IMAGE_PREFIX.length())) + 1;
        return Consts.PREFIX.TOUR_IMAGE_PREFIX + number;
    }

    private String getNextTourCategoryId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Tour_Category]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.TOUR_CATEGORY_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.TOUR_CATEGORY_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextTourCategoryId(String lastId) throws Exception {
        long number = Long.parseLong(lastId.substring(Consts.PREFIX.TOUR_CATEGORY_PREFIX.length())) + 1;
        return Consts.PREFIX.TOUR_CATEGORY_PREFIX + number;
    }

    private String getNextTourDateId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Tour_StartDates]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.TOUR_START_DATES_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.TOUR_START_DATES_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextTourDateId(String lastId) throws Exception {
        long number = Long.parseLong(lastId.substring(Consts.PREFIX.TOUR_START_DATES_PREFIX.length())) + 1;
        return Consts.PREFIX.TOUR_START_DATES_PREFIX + number;
    }

    public boolean canUserCommentOnTour(String userId, String tourId) throws Exception {
        boolean result = false;
        try {
            String sql = "IF ? IN (SELECT DISTINCT tour_id " +
                    "             FROM Tour_StartDates " +
                    "             WHERE id IN (SELECT DISTINCT tour_date_id" +
                    "                         FROM [OrderItem]" +
                    "                         WHERE order_id IN (SELECT id" +
                    "                                           FROM [Order]" +
                    "                                           WHERE user_id = ? AND status = ?)" +
                    "                               AND status = ?)" +
                    "                   AND deleted = 0) " +
                    "       AND ? NOT IN (SELECT tour_id FROM [Review] WHERE user_id = ? AND deleted = 0) " +
                    "    SELECT 1 " +
                    "    ELSE" +
                    "    SELECT 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, tourId);
            psm.setString(2, userId);
            psm.setInt(3, Consts.ORDER_STATUS.ACTIVE);
            psm.setInt(4, Consts.ORDER_STATUS.ACTIVE);
            psm.setString(5, tourId);
            psm.setString(6, userId);
            rs = psm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1) == 1;
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String addNewReview(String tourId, String userId, int rating, String comment) throws Exception {
        String id = getNextReviewId();
        try {
            String sql = "INSERT INTO [Review](id, tour_id, user_id, rating, comment) VALUES(?,?,?,?,?)";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            psm.setString(2, tourId);
            psm.setString(3, userId);
            psm.setInt(4, rating);
            psm.setString(5, comment);
            if (psm.executeUpdate() == 0) {
                id = null;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    private String getNextReviewId() throws Exception {
        String id = null;
        try {
            String sql = "SELECT MAX(CAST(SUBSTRING(id, LEN(?)+1, LEN(id)) AS INT))+1 AS 'nextId' FROM [Review]";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, Consts.PREFIX.REVIEW_PREFIX);
            rs = psm.executeQuery();
            if (rs.next()) {
                long nextId = rs.getLong("nextId");
                id = Consts.PREFIX.REVIEW_PREFIX + nextId;
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean editReview(String id, int rating, String comment) throws Exception {
        boolean result = false;
        try {
            String sql = "UPDATE [Review] SET rating = ?, comment = ? WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, rating);
            psm.setString(2, comment);
            psm.setString(3, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean removeReview(String id) throws Exception {
        boolean result = false;
        try {
            String sql = "UPDATE [Review] SET deleted = 1 WHERE id = ?";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            result = psm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }

    public double getTourAverage(String id) throws Exception {
        double average = 0;
        try {
            String sql = "SELECT AVG(CAST(rating AS decimal)) FROM Review WHERE tour_id = ? AND deleted = 0";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setString(1, id);
            rs = psm.executeQuery();
            if (rs.next()) {
                average = rs.getDouble(1);
            }
        } finally {
            closeConnection();
        }
        return average;
    }

    public List<TourDTO> getMostBoughtTours(int limit) throws Exception {
        List<TourDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP (?) id, title, title_url, ((SELECT SUM(adult_seat + child_seat) " +
                    "                                         FROM OrderItem oi " +
                    "                                         WHERE tour_date_id IN (SELECT id " +
                    "                                                               FROM Tour_StartDates " +
                    "                                                               WHERE tour_id = t.id)) - " +
                    "                                       ISNULL((SELECT SUM((adult_seat + child_seat)) " +
                    "                                               FROM Refund " +
                    "                                               WHERE order_item_id IN " +
                    "                                                           (SELECT id " +
                    "                                                           FROM OrderItem " +
                    "                                                           WHERE tour_date_id IN " +
                    "                                                                           (SELECT id " +
                    "                                                                           FROM Tour_StartDates " +
                    "                                                                           WHERE tour_id = t.id))), 0)) as 'total' FROM Tour t " +
                    "ORDER BY total DESC";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, limit);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String title = rs.getString("title");
                String titleUrl = rs.getString("title_url");
                int sum = rs.getInt("total");
                TourDTO tourDTO = new TourDTO();
                tourDTO.setId(id);
                tourDTO.setTitle(title);
                tourDTO.setTitleUrl(titleUrl);
                tourDTO.setTotalBought(sum);
                list.add(tourDTO);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public List<TourDTO> getHighestProfitTours(int limit) throws Exception {
        List<TourDTO> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP (?) id, title, title_url, " +
                    "       ((SELECT SUM(adult_seat) " +
                    "       FROM OrderItem oi " +
                    "       WHERE tour_date_id IN " +
                    "               (SELECT id " +
                    "                FROM Tour_StartDates " +
                    "               WHERE tour_id = t.id)) " +
                    "       * t.adult_price + " +
                    "       (SELECT SUM(child_seat) " +
                    "       FROM OrderItem oi " +
                    "       WHERE tour_date_id IN " +
                    "             (SELECT id " +
                    "              FROM Tour_StartDates " +
                    "             WHERE tour_id = t.id)) * " +
                    "       t.child_price - " +
                    "       ISNULL((SELECT SUM((adult_seat * refund_rate)) " +
                    "               FROM Refund " +
                    "               WHERE order_item_id IN " +
                    "                   (SELECT id " +
                    "                   FROM OrderItem " +
                    "                   WHERE tour_date_id IN " +
                    "                       (SELECT id " +
                    "                       FROM Tour_StartDates " +
                    "                       WHERE tour_id = t.id))), 0) " +
                    "       * t.adult_price -" +
                    "       ISNULL((SELECT SUM((child_seat * refund_rate)) " +
                    "               FROM Refund WHERE order_item_id IN " +
                    "                    (SELECT id " +
                    "                    FROM OrderItem " +
                    "                    WHERE tour_date_id IN " +
                    "                           (SELECT id " +
                    "                           FROM Tour_StartDates " +
                    "                           WHERE tour_id = t.id))), 0) " +
                    "       * t.child_price) as 'total' " +
                    "FROM Tour t " +
                    "ORDER BY total DESC";
            con = MyConnection.getMyConnection();
            psm = con.prepareStatement(sql);
            psm.setInt(1, limit);
            rs = psm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String title = rs.getString("title");
                String titleUrl = rs.getString("title_url");
                double sum = rs.getDouble("total");
                TourDTO tourDTO = new TourDTO();
                tourDTO.setId(id);
                tourDTO.setTitle(title);
                tourDTO.setTitleUrl(titleUrl);
                tourDTO.setTotalMoney(sum);
                list.add(tourDTO);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
