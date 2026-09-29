 package Sl314.mystudent;
import java.io.*;

public class Student implements Serializable{

	String firstname;
	String lastname;
	String department;
	String mobilenumber;
	String DOB;
	
	public Student() {
		firstname=null;
		lastname=null;
		department=null;
		mobilenumber=null;
		DOB=null;
	}
	public void setfirstname(String firstname) {
		this.firstname=firstname;
	}
	public String getfirstname() {
		return firstname;
	}
	public void setlastname(String lastname) {
		this.lastname=lastname;
	}
	public String getlastname() {
		return lastname;
	}
	public void setdepartment(String department) {
		this.department=department;
	}
	public String getdepartment() {
		return department;
	}
	public void setmobilenumber(String mobilenumber) {
		this.mobilenumber=department;
	}
	public String getmobilenumber() {
		return department;
	}
	public void setDOB(String DOB) {
		this.DOB=DOB;
	}
	public String getDate() {
		return DOB;
	}

}