<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Car</title>
    <style>
        form {
            width: 50%;
            margin: 20px auto;
        }
        label, input {
            display: block;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>${car == null ? 'Add New Car' : 'Edit Car'}</h2>
    <form action="${car == null ? 'insert' : 'update'}" method="post">
        <input type="hidden" name="carId" value="${car == null ? '' : car.carId}" />
        <label for="brand">Brand:</label>
        <input type="text" id="brand" name="brand" value="${car == null ? '' : car.brand}" required />
        
        <label for="model">Model:</label>
        <input type="text" id="model" name="model" value="${car == null ? '' : car.model}" required />
        
        <label for="cylinder">Cylinder:</label>
        <input type="number" id="cylinder" name="cylinder" value="${car == null ? '' : car.cylinder}" required />
        
        <label for="price">Price:</label>
        <input type="number" step="0.01" id="price" name="price" value="${car == null ? '' : car.price}" required />
        
        <input type="submit" value="${car == null ? 'Add Car' : 'Update Car'}" />
    </form>
</body>
</html>
