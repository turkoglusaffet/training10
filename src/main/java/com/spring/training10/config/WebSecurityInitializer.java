package com.spring.training10.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.ws.transport.http.MessageDispatcherServlet;

public class WebSecurityInitializer extends AbstractSecurityWebApplicationInitializer {

	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {

		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(AppConfig.class);
		context.setServletContext(servletContext);

		// MVC + REST
		DispatcherServlet mvcDispatcherServlet = new DispatcherServlet(context);
		ServletRegistration.Dynamic mapping = servletContext.addServlet("mvcDispatcher", mvcDispatcherServlet);
		mapping.addMapping("/mvc/*");
		mapping.setLoadOnStartup(1);

		
		servletContext.addListener(new ContextLoaderListener(context));

	}

}
