package chau.controller;

import chau.consts.Consts;
import chau.dao.TourDAO;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ProcessTourImages extends ActionSupport {

    private List<File> file;
    private List<String> fileContentType;
    private List<String> fileFileName;
    private List<String> tourId;
    private Map<String, String> addedFiles;

    public void setTourId(List<String> tourId) {
        this.tourId = tourId;
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
        String folder = ServletActionContext.getServletContext().getRealPath("/") + Consts.TOUR_IMAGE_DIRECTORY;
        TourDAO dao = new TourDAO();
        addedFiles = dao.addTourImages(tourId.get(0), file, fileFileName, folder);
        return Action.SUCCESS;
    }
}
