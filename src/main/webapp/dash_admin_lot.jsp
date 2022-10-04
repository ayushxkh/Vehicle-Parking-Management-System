<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*,java.net.URL,java.net.URLEncoder,javax.net.ssl.HttpsURLConnection" %><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
      body {
        color: #566787;
        background: #f5f5f5;
        font-family: "Varela Round", sans-serif;
        font-size: 13px;
      }
      .table-responsive {
        margin: 30px 0;
      }
      .table-wrapper {
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        min-width: 1000px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
      }
      .table-title {
        padding-bottom: 15px;
        background: #435d7d;
        color: #fff;
        padding: 16px 30px;
        min-width: 100%;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
      }
      .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
      }
      .table-title .btn-group {
        float: right;
      }
      .table-title .btn {
        color: #fff;
        float: right;
        font-size: 13px;
        border: none;
        min-width: 50px;
        border-radius: 2px;
        border: none;
        outline: none !important;
        margin-left: 10px;
      }
      .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
      }
      .table-title .btn span {
        float: left;
        margin-top: 2px;
      }
      table.table tr th,
      table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
      }
      table.table tr th:first-child {
        width: 60px;
      }
      table.table tr th:last-child {
        width: 100px;
      }
      table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
      }
      table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
      }
      table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
      }
      table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
      }
      table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
        outline: none !important;
      }
      table.table td a:hover {
        color: #2196f3;
      }
      table.table td a.edit {
        color: #ffc107;
      }
      table.table td a.delete {
        color: #f44336;
      }
      table.table td i {
        font-size: 19px;
      }
      table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
      }
      .pagination {
        float: right;
        margin: 0 0 5px;
      }
      .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
      }
      .pagination li a:hover {
        color: #666;
      }
      .pagination li.active a,
      .pagination li.active a.page-link {
        background: #03a9f4;
      }
      .pagination li.active a:hover {
        background: #0397d6;
      }
      .pagination li.disabled i {
        color: #ccc;
      }
      .pagination li i {
        font-size: 16px;
        padding-top: 6px;
      }
      .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
      }
      /* Custom checkbox */
      .custom-checkbox {
        position: relative;
      }
      .custom-checkbox input[type="checkbox"] {
        opacity: 0;
        position: absolute;
        margin: 5px 0 0 3px;
        z-index: 9;
      }
      .custom-checkbox label:before {
        width: 18px;
        height: 18px;
      }
      .custom-checkbox label:before {
        content: "";
        margin-right: 10px;
        display: inline-block;
        vertical-align: text-top;
        background: white;
        border: 1px solid #bbb;
        border-radius: 2px;
        box-sizing: border-box;
        z-index: 2;
      }
      .custom-checkbox input[type="checkbox"]:checked + label:after {
        content: "";
        position: absolute;
        left: 6px;
        top: 3px;
        width: 6px;
        height: 11px;
        border: solid #000;
        border-width: 0 3px 3px 0;
        transform: inherit;
        z-index: 3;
        transform: rotateZ(45deg);
      }
      .custom-checkbox input[type="checkbox"]:checked + label:before {
        border-color: #03a9f4;
        background: #03a9f4;
      }
      .custom-checkbox input[type="checkbox"]:checked + label:after {
        border-color: #fff;
      }
      .custom-checkbox input[type="checkbox"]:disabled + label:before {
        color: #b8b8b8;
        cursor: auto;
        box-shadow: none;
        background: #ddd;
      }
      /* Modal styles */
      .modal .modal-dialog {
        max-width: 400px;
      }
      .modal .modal-header,
      .modal .modal-body,
      .modal .modal-footer {
        padding: 20px 30px;
      }
      .modal .modal-content {
        border-radius: 3px;
        font-size: 14px;
      }
      .modal .modal-footer {
        background: #ecf0f1;
        border-radius: 0 0 3px 3px;
      }
      .modal .modal-title {
        display: inline-block;
      }
      .modal .form-control {
        border-radius: 2px;
        box-shadow: none;
        border-color: #dddddd;
      }
      .modal textarea.form-control {
        resize: vertical;
      }
      .modal .btn {
        border-radius: 2px;
        min-width: 100px;
      }
      .modal form label {
        font-weight: normal;
      }
    </style>
    <script>
      $(document).ready(function () {
        // Activate tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Select/Deselect checkboxes
        var checkbox = $('table tbody input[type="checkbox"]');
        $("#selectAll").click(function () {
          if (this.checked) {
            checkbox.each(function () {
              this.checked = true;
            });
          } else {
            checkbox.each(function () {
              this.checked = false;
            });
          }
        });
        checkbox.click(function () {
          if (!this.checked) {
            $("#selectAll").prop("checked", false);
          }
        });
      });
    </script>
  </head>
  <body style="background-color: rgb(196, 185, 185)">
    <div class="container-xl" style="margin-top: 9%">
      <div class="table-responsive">
        <div class="table-wrapper">
          <div class="table-title">
            <div class="row">
              <div class="col-sm-6">
                <h2>Parking Locations</h2>
              </div>
              <div class="col-sm-6">
                <a
                  href="#adduserModal"
                  class="btn btn-success"
                  data-toggle="modal"
                  ><i class="material-icons">&#xE147;</i>
                  <span>Add New Parking Loctions</span></a
                >
                <a
                  href="#deleteuserModal"
                  class="btn btn-danger"
                  data-toggle="modal"
                  ><i class="material-icons">&#xE15C;</i> <span>Delete</span></a
                >
              </div>
            </div>
          </div>
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>
                  <span class="custom-checkbox">
                    <input type="checkbox" id="selectAll" />
                    <label for="selectAll"></label>
                  </span>
                </th>
                <th>Name</th>
                <th>Big Spaces</th>
                <th>Small Spaces</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <span class="custom-checkbox">
                    <input
                      type="checkbox"
                      id="checkbox1"
                      name="options[]"
                      value="1"
                    />
                    <label for="checkbox1"></label>
                  </span>
                </td>
                <td>Ameerpet</td>
                <td id="b1">3</td>
                <td id="s1">17</td>
                <td>Active</td>
                <td>
                  <a href="#edituserModal" class="edit" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Edit"
                      >&#xE254;</i
                    ></a
                  >
                  <a href="#deleteuserModal" class="delete" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Delete"
                      >&#xE872;</i
                    ></a
                  >
                </td>
              </tr>
              <tr>
                <td>
                  <span class="custom-checkbox">
                    <input
                      type="checkbox"
                      id="checkbox2"
                      name="options[]"
                      value="1"
                    />
                    <label for="checkbox2"></label>
                  </span>
                </td>
                <td>Jubilee Hills</td>
                <td id="b2">1</td>
                <td id="s2">21</td>
                <td>Active</td>
                <td>
                  <a href="#edituserModal" class="edit" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Edit"
                      >&#xE254;</i
                    ></a
                  >
                  <a href="#deleteuserModal" class="delete" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Delete"
                      >&#xE872;</i
                    ></a
                  >
                </td>
              </tr>
              <tr>
                <td>
                  <span class="custom-checkbox">
                    <input
                      type="checkbox"
                      id="checkbox3"
                      name="options[]"
                      value="1"
                    />
                    <label for="checkbox3"></label>
                  </span>
                </td>
                <td>Begumpet</td>
                <td id="b3">6</td>
                <td id="s3">14</td>
                <td>Active</td>
                <td>
                  <a href="#edituserModal" class="edit" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Edit"
                      >&#xE254;</i
                    ></a
                  >
                  <a href="#deleteuserModal" class="delete" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Delete"
                      >&#xE872;</i
                    ></a
                  >
                </td>
              </tr>
              <tr>
                <td>
                  <span class="custom-checkbox">
                    <input
                      type="checkbox"
                      id="checkbox4"
                      name="options[]"
                      value="1"
                    />
                    <label for="checkbox4"></label>
                  </span>
                </td>
                <td>Manikonda</td>
                <td id="b4">9</td>
                <td id="s4">11</td>
                <td>Active</td>
                <td>
                  <a href="#edituserModal" class="edit" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Edit"
                      >&#xE254;</i
                    ></a
                  >
                  <a href="#deleteuserModal" class="delete" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Delete"
                      >&#xE872;</i
                    ></a
                  >
                </td>
              </tr>
              <tr>
                <td>
                  <span class="custom-checkbox">
                    <input
                      type="checkbox"
                      id="checkbox5"
                      name="options[]"
                      value="1"
                    />
                    <label for="checkbox5"></label>
                  </span>
                </td>
                <td>Golconda</td>
                <td id="b5">2</td>
                <td id="s5">15</td>
                <td>Inactive</td>
                <td>
                  <a href="#edituserModal" class="edit" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Edit"
                      >&#xE254;</i
                    ></a
                  >
                  <a href="#deleteuserModal" class="delete" data-toggle="modal"
                    ><i
                      class="material-icons"
                      data-toggle="tooltip"
                      title="Delete"
                      >&#xE872;</i
                    ></a
                  >
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
     <%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/module_1", "root", "saks");
						Statement st = conn.createStatement();
						ResultSet i = st.executeQuery("SELECT * from da_admin_lot ");
						out.println("<table style='width:100%'><tr><th>UserName</th><th>Email</th><th>Address</th><th>Phone</th></tr>");
						while(i.next()) {
							String name = i.getString("name");
							String bigspaces = i.getString("bigspaces");
							String smallspaces = i.getString("smallspaces");
							String status = i.getString("status");
							
							out.println("<tr><th>"+name+ "</th><th>"+bigspaces+ "</th><th>"+smallspaces+"</th><th>"+status+ "</th></tr>");
							
						}
						
						out.println("</table>");
					}
					
					catch (Exception e) {
						System.out.println(e.toString());
					}
					
	%>
    
    <!-- Edit Modal HTML -->
    <div id="adduserModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <form action ="dash_admin_lot_1.jsp" method = "post">
            <div class="modal-header">
              <h4 class="modal-title">Add Parking Locations</h4>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-hidden="true"
              >
                &times;
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Name</label>
                <input type="text" name="name"class="form-control" required />
              </div>
              <div class="form-group">
                <label>Big Spaces</label>
                <input type="Big Spaces" name="bigspaces"class="form-control" required />
              </div>
              <div class="form-group">
                <label>Small Spaces</label>
                <textarea class="form-control" name="smallspaces"required></textarea>
              </div>
              <div class="form-group">
                <label>Status</label>
                <input type="text" name="status" class="form-control" required />
              </div>
            </div>
            <div class="modal-footer">
              <input
                type="button"
                class="btn btn-default"
                data-dismiss="modal"
                value="Cancel"
              />
              <input type="submit" class="btn btn-success" value="Add" />
            </div>
          </form>
        </div>
      </div>
    </div>
   
   
    <!-- Edit Modal HTML -->
    <div id="edituserModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <form>
            <div class="modal-header">
              <h4 class="modal-title">Edit Parking Locations</h4>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-hidden="true"
              >
                &times;
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" required />
              </div>
              <div class="form-group">
                <label>Big Spaces</label>
                <input type="Big Spaces" class="form-control" required />
              </div>
              <div class="form-group">
                <label>Small Spaces</label>
                <textarea class="form-control" required></textarea>
              </div>
              <div class="form-group">
                <label>Status</label>
                <input type="text" class="form-control" required />
              </div>
            </div>
            <div class="modal-footer">
              <input
                type="button"
                class="btn btn-default"
                data-dismiss="modal"
                value="Cancel"
              />
              <input type="submit" class="btn btn-info" value="Save" />
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Delete Modal HTML -->
    <div id="deleteuserModal" class="modal fade">
      <div class="modal-dialog">
        <div class="modal-content">
          <form>
            <div class="modal-header">
              <h4 class="modal-title">Delete Parking Locations</h4>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-hidden="true"
              >
                &times;
              </button>
            </div>
            <div class="modal-body">
              <p>Are you sure you want to delete these Records?</p>
              <p class="text-warning">
                <small>This action cannot be undone.</small>
              </p>
            </div>
            <div class="modal-footer">
              <input
                type="button"
                class="btn btn-default"
                data-dismiss="modal"
                value="Cancel"
              />
              <input type="submit" class="btn btn-danger" value="Delete" />
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
