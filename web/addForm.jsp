<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
</head>

<body>
<div class="wrapper container">
    <header><nav class="navbar navbar-light bg-faded">
        <a class="navbar-brand" href="#">Contact List</a>
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">Main</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listItems.jsp">Contact List</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="addForm.jsp">Create new contact<span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </nav></header>

<form method="post" action="addContact.jsp">
    <h1>Create contact</h1>
    <div class="form-group">
    <label for="exampleInputEmail1" class="col-xs-2 col-form-label">First name:</label>
        <div class="col-xs-10">
        <input class="form-control" type="text" name="FirstName">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">LastName:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" name="LastName">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">MiddleName:</label>
        <div class="col-xs-10">
        <input class="form-control" type="text" name="MiddleName">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Date birth:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" id="datepicker" name="DateBirth" min="1900-01-01"max="2020-05-10" required>
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Email:</label>
        <div class="col-xs-10">
            <input class="form-control" type="email" name="Email">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Phone:</label>
        <div class="col-xs-10">
            <input class="form-control" type="number" name="Phone">
        </div>
    </div>

    <td>
        <button type="Submit" class="btn btn-success" value="Create">Create</button></td>
    <td><a href="index.jsp">
        <button type="button" class="btn btn-danger">Cancel</button>
    </a></td>

    <script>
        $(function () {
            $.datepicker.setDefaults({
                onClose: function (date) {
                    $("#selectedDateVal").html(date);
                }
            });

            $("#datepicker").datepicker();
        });
    </script>
</form>
</div>
</body>
</html>