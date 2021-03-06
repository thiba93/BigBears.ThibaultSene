<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.model.Users"%>
<%@ page import="com.xprodmvc.model.Cart"%>
<%@ page import="com.xprodmvc.dao.ProductsDao"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/adressForPaymentForOnline-style.css">
<link rel="stylesheet" href="css/home-style2.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forwart(1))!=null)
window.history.forward(1);
</script>
</head>
<body>
	<br>
	<table>
		<thead>
			<%
			 String email=session.getAttribute("email").toString(); 
			int total = 0;
			int sno = 0;
			try {
				Connection con = DbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs1 = st
				.executeQuery("select sum(total) from orders where email='" + email + "'is not NULL and adresse is NULL ");
				while (rs1.next()) {
					total = rs1.getInt(1);
				}
			%>
			<tr>
				<th scope="col"><a href=""><i
						class='fas fa-arrow-circle-left'> Back</i></a></th>
				<th scope="col" style="background-color: yellow;">Total: <%out.println(total);%><i
					class="fa fa-inr"></i> 
				</th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Product Name</th>
				<th scope="col">Category</th>
				<th scope="col"> price<i class="fa fa-inr"></i></th>
				<th scope="col">Quantity</th>
				<th scope="col">Sub Total</th>
			</tr>
		</thead>

		<tbody>
			<%
			ResultSet rs2 = st.executeQuery("select * from produits inner join orders on produits.idProd = orders.idOrder");
			while (rs2.next()) {

			}
			%>
			<tr>
				<%
				sno = sno + 1;
				%>
				<td><%out.println(sno);%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(4)%><i class="fa fa-inr"></i> ></td>
				<td><%=rs2.getString(8)%></td>
				<td><%=rs2.getString(6)%><i class="fa fa-inr"></i></td>
			</tr>

		</tbody>
	</table>

	<hr style="width: 100%">

	<div class="left-div">
		<h3>Enter Address</h3>

	</div>

	<div class="right-div">
		<h3>Enter city</h3>

	</div>

	<div class="left-div">
		<h3>Enter State</h3>

	</div>

	<div class="right-div">
		<h3>Enter country</h3>

	</div>
	<h3 style="color: red">*If there is no address its mean that you
		did not set you address!</h3>
	<h3 style="color: red">*This address will also updated to your
		profile</h3>
	<hr style="width: 100%">
	<div class="left-div">
		<h3>Select way of Payment</h3>

	</div>

	<div class="right-div">
		<h3>Pay online on this btechdays@pay.com</h3>

		<h3 style="color: red">*If you select online Payment then enter
			you transaction ID here otherwise leave this blank</h3>
	</div>
	<hr style="width: 100%">

	<div class="left-div">
		<h3>Mobile Number</h3>

		<h3 style="color: red">*This mobile number will also updated to
			your profile</h3>
	</div>
	<div class="right-div">
		<h3 style="color: red">*If you enter wrong transaction id then
			your order will we can cancel!</h3>
		<i class='far fa-arrow-alt-circle-right'></i>
		<h3 style="color: red">*Fill form correctly</h3>
	</div>
	<%
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

	<br>
	<br>
	<br>

	<%@include file="includes/footer.jsp"%>
</body>
</html>