package chau.interceptor;

import chau.consts.Consts;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import java.util.Map;

public class OwnInterceptor extends AbstractInterceptor {

    private String userId;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map session = ActionContext.getContext().getSession();
        UserDTO dto = (UserDTO) session.get("USER");
        if (dto != null) {
            if (dto.getId().equals(userId)) {
                return invocation.invoke();
            } else {
                ServletActionContext.getResponse().setStatus(403);
                return "forbidden";
            }
        } else {
            session.put("LAST_URL", ServletActionContext.getRequest().getRequestURI());
            return "login-redirect";
        }
    }
}
