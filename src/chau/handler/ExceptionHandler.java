package chau.handler;

import com.opensymphony.xwork2.ActionSupport;

import java.awt.*;

public class ExceptionHandler extends ActionSupport {
    @Override
    public String execute() throws Exception {
//                <global-exception-mappings>
//            <exception-mapping exception="java.lang.Exception" result="exception" />
//        </global-exception-mappings>
        return super.execute();
    }
}
