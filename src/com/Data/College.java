package com.Data;

public class College 
{
private String College_name;
private String Admin_name;
private String Address;
private String College_code;
private int college_id;
public String getCollege_code() {
	return College_code;
}
public void setCollege_code(String college_code) {
	College_code = college_code;
}
public int getCollege_id() {
	return college_id;
}
public void setCollege_id(int college_id) {
	this.college_id = college_id;
}
public String getCollege_name() {
	return College_name;
}
public void setCollege_name(String college_name) {
	College_name = college_name;
}
public String getAdmin_name() {
	return Admin_name;
}
public void setAdmin_name(String admin_name) {
	Admin_name = admin_name;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
}
