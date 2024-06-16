<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car List</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .add-button {
            display: block;
            width: 100px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h2>Car List</h2>
    <a href="new" class="add-button">Add New Car</a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Cylinder</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${carList}" var="car">
                <tr>
                    <td>${car.carId}</td>
                    <td>${car.brand}</td>
                    <td>${car.model}</td>
                    <td>${car.cylinder}</td>
                    <td>${car.price}</td>
                    <td>
                        <a href="edit?carId=${car.carId}">Edit</a>
                        &nbsp;|&nbsp;
                        <a href="delete?carId=${car.carId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
