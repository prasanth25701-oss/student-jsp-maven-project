package Sl314.MyListener;

import java.sql.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;
import com.MyData.Data;
import javax.naming.InitialContext;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;



/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */

@WebListener
public class JSPListener implements ServletContextListener {
	Connection con=null;
	ScheduledExecutorService schedule=null;
	public JSPListener() {
	}
	
	public void contextInitialized(ServletContextEvent sce){ 
	try {
		ServletContext sc= sce.getServletContext();
		InitialContext ctx=new InitialContext();
		
		DataSource ds=(DataSource)ctx.lookup("java:/comp/env/jdbc/MyDataBase");
		
		con=ds.getConnection();
		System.out.println("Listener Established");
		Data data=new Data(con);
		schedule =Executors.newSingleThreadScheduledExecutor();
		schedule.scheduleAtFixedRate(() -> data.Select_Student(), 0, 1, TimeUnit.SECONDS);
		sc.setAttribute("data", data);
		
	}
	catch(Exception e) {
		System.out.println(e);
	}
	    }
	 @Override
	    public void contextDestroyed(ServletContextEvent sce) {

	        try {
	            if(con != null) {
	                con.close();
	            }
	            if(schedule!=null) {
	            		schedule.close();
	            }
	            		
	        }
	        catch(Exception e) {
	            e.printStackTrace();
	        }
	 }
	 
}