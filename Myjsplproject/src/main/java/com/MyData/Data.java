package com.MyData;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Data {
	Connection con=null;
	ResultSet rs=null;
	public Data(Connection con) {
		this.con=con;
	}
	public ResultSet Select_Student() {
		try {
			Statement st=con.createStatement();
			rs=st.executeQuery("Select * from student");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("system running");
		return rs;
	}
	
	

}