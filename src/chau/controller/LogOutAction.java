package chau.controller;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;

public class LogOutAction extends ActionSupport {
    private String url;

    public String getUrl() {
        return url;
    }

    @Override
    public String execute() throws Exception {
        SessionMap session = (SessionMap) ActionContext.getContext().getSession();
        session.invalidate();
        url = ServletActionContext.getRequest().getHeader("referer");
        return Action.SUCCESS;
    }
}
