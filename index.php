<?php
if(isset($_GET["submit"])){
    $connection = mysqli_connect("localhost", "root", "", "studentdata");
    $identifier = mysqli_real_escape_string($connection, $_GET["identifier"]);
    $query = mysqli_real_escape_string($connection, $_GET["fname"]);
    $sql = "SELECT certificate.staffID, certificate.certificateTitle, certificate.certificateNumber,
            certificate.issueDate, certificate.ExpiryDate, certificate.courseID FROM certificate JOIN
                staff ON staff.userID = certificate.staffID WHERE staff.$identifier = '$query'";
    $result = mysqli_query($connection, $sql);}
?>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Amtc logo behind AMTC header*/
        .header {
            background-color: #f1f1f1;
            padding: 20px;
            text-align: center;
        }
        body {
            background-color: lightblue;
        }
        h1,h2 {
            border: 3px solid black;
            background-color: lightblue;
            padding-top: 50px;
            padding-right: 30px;
            padding-bottom: 50px;
            padding-left: 80px;
        }
        p {
            font-size: 20px;
        }

        .radiobtn{
            text-align: left;
            margin-left: 190px ;
        }

        table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

         td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

         tr:nth-child(even){background-color: #f2f2f2;}

         tr:hover {background-color: #ddd;}

         th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: saddlebrown;
            color: white;
        }

    </style>

</head>
<body>
<div class="header">
    <h1><center>Advance Multiskills Training Center</h1>
</div>

<p><center>Course Verification Record</p>
    <p><center>Search By</p><br>

        <form action="index.php" method="get">
            <p>Please select one option to continew to next action:</p>
            <div class="radiobtn">
                <input type="radio" id="name" name="identifier" value="fullName">
                <label for="name">Name</label><br>

                <input type="radio" id="ic" name="identifier" value="identityCardNo">
                <label for="ic">Identity Card</label><br>

                <input type="radio" id="pn" name="identifier" value="passportNo">
                <label for="pn">Passport Number</label><br><br>
            </div>

            <label for="fname"></label>
            <input type="text" id="fname" name="fname" placeholder="Fill this form"><br><br>

            <input type="submit" name="submit" value="Submit" ><br><br>
        </form>
        <table>
            <?php
            if(isset($result)){
                if (mysqli_num_rows($result) == 0) {
                    echo "Wrong Credentials";
                } else {
                    echo "<tr>
                <th>Certificate Number</th>
                <th>Course ID</th>
                <th>Certificate Title</th>
                <th>Issue Date</th>
                <th>Expiry Date</th>
            </tr>";
                    while ($data = mysqli_fetch_assoc($result)) {
                        echo "<tr> <td>{$data["certificateNumber"]}</td>
                                <td>{$data["courseID"]}</td>
                                <td>{$data["certificateTitle"]}</td>
                                <td>{$data["issueDate"]}</td>
                                <td>{$data["ExpiryDate"]}</td>
                        </tr>";
                    }
                }
            }
            ?>

        </table>




</body>
</html>



