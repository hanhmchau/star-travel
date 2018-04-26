package chau.utils;

import chau.dao.LocationDAO;
import chau.dao.TourDAO;
import org.apache.struts2.ServletActionContext;

import javax.ejb.Local;
import javax.servlet.http.Cookie;
import java.io.File;
import java.io.Serializable;
import java.security.*;
import java.text.Normalizer;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Random;

public class MyUtils implements Serializable {
    public static String createRandomSalt() {
        Random s = new SecureRandom();
        byte[] salt = new byte[32];
        s.nextBytes(salt);
        return new String(salt);
    }

    public static Date getDate(int day, int month, int year) {
        LocalDate localDate = LocalDate.of(year, month, day);
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public static Date getDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public static String hash(String original) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(original.getBytes());
        return new String(md.digest());
    }

    public static Cookie getCookie(String name) {
        for (Cookie c: ServletActionContext.getRequest().getCookies()) {
            if (c.getName().equals(name)) {
                return c;
            }
        }
        return null;
    }

    public static String createTitleUrl(String title, int number) throws Exception {
        String url = Normalizer.normalize(title, Normalizer.Form.NFD)
                .replaceAll("\\p{InCOMBINING_DIACRITICAL_MARKS}", "")
                .replaceAll("[đ]+", "d")
                .replaceAll("[\\W]+", "-").toLowerCase();
        if (number > 1) {
            url = url + "-" + number;
        }
        TourDAO dao = new TourDAO();
        if (dao.getTourByTitleUrl(url) != null) {
            return createTitleUrl(title, number + 1);
        } else {
            return url;
        }
    }

    public static String createLocationTitleUrl(String title, int number) throws Exception {
        String url = Normalizer.normalize(title, Normalizer.Form.NFD)
                .replaceAll("\\p{InCOMBINING_DIACRITICAL_MARKS}", "")
                .replaceAll("[đ]+", "d")
                .replaceAll("[\\W]+", "-").toLowerCase();
        if (number > 1) {
            url = url + "-" + number;
        }
        LocationDAO dao = new LocationDAO();
        if (dao.getLocationByTitleUrl(url) != null) {
            return createLocationTitleUrl(title, number + 1);
        } else {
            return url;
        }
    }
}
