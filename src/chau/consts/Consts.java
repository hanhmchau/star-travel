package chau.consts;

import com.opensymphony.xwork2.ActionSupport;

public class Consts {
    public static final int UNCANCELLABLE_WINDOW = 7;
    public static final int TOP_REPORT_SIZE = 5;

    public enum CANCEL_WINDOW {
        FAR(21, 0.75),
        MID(14, 0.5),
        CLOSE(7, 0.25);

        public int dayToTourDate;
        public double refundRate;

        CANCEL_WINDOW(int dayToTourDate, double refundRate) {
            this.dayToTourDate = dayToTourDate;
            this.refundRate = refundRate;
        }
    }

    public enum ROLE_STATUS {
        FAIL(-1),
        ADMIN(1),
        USER(0);

        public int value;

        ROLE_STATUS(int value) {
            this.value = value;
        }
    }

    public enum CATEGORY_STATUS {
        ACTIVE(1),
        DELETED(0);

        public int value;

        CATEGORY_STATUS(int value) {
            this.value = value;
        }
    }

    public enum USER_STATUS {
        ACTIVE(1),
        BANNED(0);

        public int value;

        USER_STATUS(int value) {
            this.value = value;
        }
    }

    public enum TOUR_STATUS {
        ACTIVE(1),
        DELETED(0);

        public int value;

        TOUR_STATUS(int value) {
            this.value = value;
        }
    }

    public static String TOUR_IMAGE_DIRECTORY = (new ActionSupport()).getText("images.folder.tour");
    public static String LOCATION_IMAGE_DIRECTORY = (new ActionSupport()).getText("images.folder.location");

    public static class PREFIX {
        public static final String TOUR_PREFIX = (new ActionSupport()).getText("tour.prefix");
        public static final String TOUR_CATEGORY_PREFIX = (new ActionSupport()).getText("tour.category.prefix");
        public static final String TOUR_IMAGE_PREFIX = (new ActionSupport()).getText("tour.image.prefix");
        public static final String TOUR_ITINERARY_PREFIX = (new ActionSupport()).getText("tour.itinerary.prefix");
        public static final String TOUR_LOCATION_PREFIX = (new ActionSupport()).getText("tour.location.prefix");
        public static final String TOUR_START_DATES_PREFIX = (new ActionSupport()).getText("tour.start.dates.prefix");
        public static final String LOCATION_PREFIX = (new ActionSupport()).getText("location.prefix");
        public static final String LOCATION_IMAGE_PREFIX = (new ActionSupport()).getText("location.image.prefix");
        public static final String ORDER_PREFIX = (new ActionSupport()).getText("order.prefix");
        public static final String ORDER_ITEM_PREFIX = (new ActionSupport()).getText("order.item.prefix");
        public static final String USER_PREFIX = (new ActionSupport()).getText("user.prefix");
        public static final String REVIEW_PREFIX = (new ActionSupport()).getText("user.prefix");
        public static final String MESSAGE_THREAD_PREFIX = (new ActionSupport()).getText("message.thread.prefix");
        public static final String MESSAGE_PREFIX = (new ActionSupport()).getText("message.prefix");
        public static final String REFUND_PREFIX = (new ActionSupport()).getText("refund.prefix");
    }

    public static class SORT_TYPE {
        public static final int PRICE_ASCENDING = 0;
        public static final int PRICE_DESCENDING = 1;
        public static final int POPULARITY = 2;
    }

    public static class ORDER_STATUS {
        public static final int ACTIVE = 1;
        public static final int CANCELLED = 0;
    }
}
