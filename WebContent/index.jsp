<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ page
		import="java.util.*,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,java.util.Properties,com.email.ketan.Email"
		%>
		<%@ include file="connection.jsp" %>
			<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="ISO-8859-1">
					<title>E-Learning Portal</title>
					<style>
						* {
							margin: 0;
							padding: 0;
						}

						#top {
							font-size: 30px;
							color: white;
							background: #191970;
							height: 85px;
							font-weight: bold;

						}

						#top p {
							margin-top: 22px;
						}

						#middle {
							width: 100%;
							height: 617px;
						}

						#footer {
							font-size: 22px;
							color: white;
							margin-top: -5px;
							background: #7B68EE;
							height: 57px;
						}

						#copyright {
							margin-top: 15px;
							position: absolute;
							margin-left: 26%;
						}

						#myProgress {
							width: 97%;
							background-color: #ddd;
							margin-top: -60px;
							position: absolute;
							margin-left: 20px;
						}

						#myBar {
							width: 10%;
							height: 30px;
							background-color: #4CAF50;
							text-align: center;
							line-height: 30px;
							color: white;
						}

						.loader {
							border: 8px solid #f3f3f3;
							border-radius: 50%;
							margin-top: -45px;
							margin-left: 160px;
							border-top: 8px solid #3498db;
							width: 30px;
							height: 30px;
							-webkit-animation: spin 2s linear infinite;
							/* Safari */
							animation: spin 2s linear infinite;
						}

						/* Safari */
						@-webkit-keyframes spin {
							0% {
								-webkit-transform: rotate(0deg);
							}

							100% {
								-webkit-transform: rotate(360deg);
							}
						}

						@keyframes spin {
							0% {
								transform: rotate(0deg);
							}

							100% {
								transform: rotate(360deg);
							}
						}

						#loading {
							margin-top: -400px;
							margin-left: 40%;
							position: absolute;
							background: rgb(0, 0, 0);
							/* Fallback color */
							background: rgba(0, 0, 0, 0.5);
							/* Black background with 0.5 opacity */
							color: white;
							font-weight: bold;
							font-size: 30px;
							width: auto;
							height: auto;
							padding: 20px;
						}
					</style>
				</head>

				<body onload="move();">
					<div id="top">
						<marquee>
							<p>Welcome to E-Learning Portal</p>
						</marquee>
					</div>
					<img id="middle" src="images/jp.jpeg"></img>
					<div id="loading">
						Please Wait<div class="loader"></div>
					</div>
					<div id="myProgress">
						<div id="myBar">10%</div>
					</div>
					<div id="footer">
						<div id="copyright">Copyright © 2020.All Rights Reserved/Powered by Ketan, Sachin, Jayesh,
							Nikhil</div>
					</div>
					<% try { Date today=new Date(); SimpleDateFormat simpleDateFormat1=new
						SimpleDateFormat("dd/MM/yyyy"); Calendar calendar=Calendar.getInstance();
						calendar.setTime(today); //System.out.println(simpleDateFormat1.format(calendar.getTime()));
						calendar.add(Calendar.DATE, 1);
						//System.out.println(simpleDateFormat1.format(calendar.getTime())); String
						mydate=simpleDateFormat1.format(calendar.getTime()); String
						sql="Select college_code from college_details " ; PreparedStatement
						pstm=con.prepareStatement(sql); String ccode="" ; int flag=0; String sscode="" ,ti="" ,dued=""
						,duet="" ; String subs="" ; String uuid="" ; int emst=0; String nm="" ; ResultSet
						rs=pstm.executeQuery(); Connection con1=null; while(rs.next()) {
						ccode=rs.getString("college_code");
						con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+ccode,"root",""); String
						sql1="Select Subject_code,Title,DueDate,DueTime,Subject from facultyassignment" ;
						PreparedStatement pstm1=con1.prepareStatement(sql1); ResultSet rs1=pstm1.executeQuery();
						while(rs1.next()) { sscode=rs1.getString(1); ti=rs1.getString(2); dued=rs1.getString(3);
						duet=rs1.getString(4); subs=rs1.getString(5); String
						sql2="Select Userid from student_subject where Subject_code=?" ; PreparedStatement
						pstm2=con1.prepareStatement(sql2); pstm2.setString(1,sscode); ResultSet
						rs2=pstm2.executeQuery(); while(rs2.next()) { uuid=rs2.getString(1); String
						sql3="Select Name from student_assignments where Subject_code=? and Assignment_name=? and Name=?"
						; PreparedStatement pstm3=con1.prepareStatement(sql3); pstm3.setString(1,sscode);
						pstm3.setString(2,ti); pstm3.setString(3,uuid); ResultSet rs3=pstm3.executeQuery();
						if(rs3.next()) { } else { if(dued.compareTo(mydate)==0) { String
						sql5="Select Userid from assignment_email where Userid=? and Assignment_name=? and Subject_code=? and Assignment_date=?"
						; PreparedStatement pstm5=con1.prepareStatement(sql5); pstm5.setString(1,uuid);
						pstm5.setString(2,ti); pstm5.setString(3,sscode); pstm5.setString(4,dued); ResultSet
						rs5=pstm5.executeQuery(); if(rs5.next()) { } else { String uuname="" ; String
						sql4="Select Email_Id,Username from student_details where Userid=?" ; PreparedStatement
						pstm4=con1.prepareStatement(sql4); pstm4.setString(1,uuid); ResultSet rs4=pstm4.executeQuery();
						String emid="" ; if(rs4.next()) { emid=rs4.getString(1); uuname=rs4.getString(2); } Email
						email=new Email("ketz1767@gmail.com","Xyzabc@1234");
						email.setFrom("ketz1767@gmail.com","E-learning"); email.setSubject("Reminder: Your assignment is
						due on"+dued); email.setContent("<h4> Dear "+uuname+",</h4>Your Assignment "+ti+" for subject
						"+subs+" is due on "+dued,"text/html");
						email.addRecipient(emid);
						email.send();
						PreparedStatement ps=con1.prepareStatement("insert into
						assignment_email(Userid,Subject_code,Assignment_name,Assignment_date) values(?,?,?,?)");
						ps.setString(1,uuid);
						ps.setString(2,sscode);
						ps.setString(3,ti);
						ps.setString(4,dued);

						int row=ps.executeUpdate();

						}

						}
						}
						}


						}



						}

						con1.close();

						} catch (Exception e) {
						out.println(e.getMessage());
						}



						%>
						<script>
							var i = 0;
							function move() {
								if (i == 0) {
									i = 1;
									var elem = document.getElementById("myBar");
									var width = 10;
									var id = setInterval(frame, 150);
									function frame() {
										if (width >= 100) {
											clearInterval(id);
											i = 0;
											window.location.href = 'login.html';
										} else {
											width++;
											elem.style.width = width + "%";
											elem.innerHTML = width + "%";

										}

									}
								}

							}
						</script>
						<% try { con.close(); } catch(Exception e) { out.println(e.getMessage()); } %>
				</body>

				</html>