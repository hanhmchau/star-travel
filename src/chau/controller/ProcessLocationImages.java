package chau.controller;

import chau.consts.Consts;
import chau.dao.LocationDAO;
import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.util.List;
import java.util.Map;

public class ProcessLocationImages extends ActionSupport {
    private List<File> file;
    private List<String> fileContentType;
    private List<String> fileFileName;
    private List<String> locationId;
    private Map<String, String> addedFiles;

    public void setLocationId(List<String> tourId) {
        this.locationId = tourId;
    }

    public void setFile(List<File> file) {
        this.file = file;
    }

    public void setFileContentType(List<String> fileContentType) {
        this.fileContentType = fileContentType;
    }

    public void setFileFileName(List<String> fileFileName) {
        this.fileFileName = fileFileName;
    }

    public Map<String, String> getAddedFiles() {
        return addedFiles;
    }

    @Override
    public String execute() throws Exception {
        String folder = ServletActionContext.getServletContext().getRealPath("/") + Consts.LOCATION_IMAGE_DIRECTORY;
        LocationDAO dao = new LocationDAO();
        addedFiles = dao.addLocationImages(locationId.get(0), file, fileFileName, folder);
        return addedFiles.size() > 0 ? Action.SUCCESS : Action.ERROR;
    }
}
