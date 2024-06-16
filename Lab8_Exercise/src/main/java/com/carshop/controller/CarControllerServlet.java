package com.carshop.controller;

import com.carshop.dao.CarDAO;
import com.carshop.model.Car;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class CarControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarDAO carDAO;

    public void init() {
        carDAO = new CarDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertCar(request, response);
                    break;
                case "/delete":
                    deleteCar(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateCar(request, response);
                    break;
                default:
                    listCars(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Car> carList = carDAO.selectAllCars();
        request.setAttribute("carList", carList);
        request.getRequestDispatcher("car-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("car-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        Car existingCar = carDAO.selectCar(carId);
        request.setAttribute("car", existingCar);
        request.getRequestDispatcher("car-form.jsp").forward(request, response);
    }

    private void insertCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));
        Car newCar = new Car(0, brand, model, cylinder, price);
        carDAO.insertCar(newCar);
        response.sendRedirect("list");
    }

    private void updateCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));

        Car car = new Car(carId, brand, model, cylinder, price);
        carDAO.updateCar(car);
        response.sendRedirect("list");
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        carDAO.deleteCar(carId);
        response.sendRedirect("list");
    }
}
