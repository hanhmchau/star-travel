package chau.interceptor;

import chau.consts.Consts;
import chau.dao.UserDAO;
import chau.dto.UserDTO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import java.util.Map;

public class AdminOrOwnInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map session = ActionContext.getContext().getSession();
        UserDTO dto = (UserDTO) session.get("USER");
        String userId = ActionContext.getContext().getParameters().get("userId").getValue();
        if (dto != null) {
            if (dto.getRole() == Consts.ROLE_STATUS.ADMIN.value || dto.getId().equals(userId)) {
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
