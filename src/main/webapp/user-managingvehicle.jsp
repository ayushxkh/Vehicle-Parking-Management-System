<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>

<html class="no-js" lang="">
<head>

<title>VPMS - Manage Incoming Vehicle</title>


<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!-- Left Panel -->

	<jsp:include page="includes/user-sidebar.jsp"></jsp:include>

	<jsp:include page="includes/user-header.jsp"></jsp:include>

	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Dashboard</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="user-dashboard.jsp">Dashboard</a></li>
								<li><a href="manage-incomingvehicle.jsp">Manage Vehicle</a></li>
								<li class="active">Manage Incoming Vehicle</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Manage Incoming Vehicle</strong>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>S.NO</th>
										<th>Parking Number</th>
										<th>Owner Name</th>
										<th>Vehicle Reg Number</th>
										<th>Action</th>
									</tr>
								</thead>
								<%
										String status = null;
										Connection con = DatabaseConnection.getConnection();
										Statement statement = con.createStatement();
										ResultSet resultset = statement.executeQuery("select * from  tblvehicle where OwnerName='" + session.getAttribute("fullName") + "'");
										while (resultset.next()) {
								%>
								<tr>
									<td><%=resultset.getInt(1)%></td>
									<td><%=resultset.getString(2)%></td>
									<td><%=resultset.getString(6)%></td>
									<td><%=resultset.getString(5)%></td>
									<td><a
										href="view-user-incomingview-details.jsp?viewid=<%=resultset.getInt(1)%>&parkingNo=<%=resultset.getString(2)%>">View</a>
										| <a href="print.jsp?vid=<%=resultset.getInt(1)%>"
										style="cursor: pointer" target="_blank">Print</a></td>
								</tr>
								<%
									}
								%>
							</table>

						</div>
					</div>
				</div>



			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>
	<%
		} else {
			response.sendRedirect("user-login.jsp");
		}
	%>

</body>
</html>
