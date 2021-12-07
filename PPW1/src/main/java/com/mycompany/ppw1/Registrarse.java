/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ppw1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import misc.Usuario;

/**
 *
 * @author marie
 */
public class Registrarse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Context contexto = new InitialContext();
            Context ambiente = (Context) contexto.lookup("java:comp/env");
            DataSource infoConexion = (DataSource) ambiente.lookup("jdbc/info");

            Connection conexion = infoConexion.getConnection();
            PreparedStatement comando = conexion.prepareStatement(
                    "INSERT INTO t_usuario (nombre_Usuario ,contrasena ,correo ,imagen ,nombre ,apellido, dia, mes, anio) VALUES (?,?,?,?,?,?,?,?,?)");
            comando.setString(1, request.getParameter("usuario"));
            comando.setString(2, request.getParameter("password"));
            comando.setString(3, request.getParameter("email"));
            comando.setString(4, request.getParameter("avatar"));
            comando.setString(5, request.getParameter("Nombre"));
            comando.setString(6, request.getParameter("Apellidos"));
            comando.setString(7, request.getParameter("dia"));
            comando.setString(8, request.getParameter("mes"));
            comando.setString(9, request.getParameter("anio"));

            comando.execute();
            comando.close();
            conexion.close();
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/index.html");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
