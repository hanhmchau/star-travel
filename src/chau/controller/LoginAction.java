/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chau.controller;

import chau.consts.Consts;
import chau.dao.TourDAO;
import chau.dto.UserDTO;
import chau.utils.MyUtils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import chau.dao.UserDAO;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

public class LoginAction extends ActionSupport {
    private String email, password;
    private boolean rememberMe;
    private String url;
    private boolean success;

    public LoginAction(String email, String password, boolean rememberMe) {
        this.email = email;
        this.password = password;
        this.rememberMe = rememberMe;
    }

    public LoginAction() {
    }

    public boolean getSuccess() {
        return success;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }

    public String execute() throws Exception {
        UserDAO dao = new UserDAO();
        UserDTO dto = dao.checkLogin(email, password);
        if(dto == null){
            success=false;
            return Action.ERROR;
        } else {
            if (dto.getStatus() == Consts.USER_STATUS.ACTIVE.value) {
                ActionContext.getContext().getSession().put("USER", dto);
                if (url == null) {
                    url = ServletActionContext.getRequest().getHeader("referer");
                } else if (url.isEmpty()) {
                    url = "/";
                }
                success = true;
                return Action.SUCCESS;
            } else {
                return "banned";
            }
        }
    }
}
