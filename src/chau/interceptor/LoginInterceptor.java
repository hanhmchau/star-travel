package chau.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class LoginInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.containsKey("USER")) {
            return invocation.invoke();
        } else {
            session.put("LAST_URL", ServletActionContext.getRequest().getRequestURI());
            return "login-redirect";
        }
    }
}
