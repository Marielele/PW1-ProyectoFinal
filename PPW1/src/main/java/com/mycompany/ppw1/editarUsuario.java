/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ppw1;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
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

/**
 *
 * @author marie
 */
public class editarUsuario extends HttpServlet {

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
            InputStream stream = null;
            Context contexto = new InitialContext();
            Context ambiente = (Context) contexto.lookup("java:comp/env");
            DataSource infoconexion = (DataSource) ambiente.lookup("jdbc/info");
            Connection conexion = infoconexion.getConnection();
            PreparedStatement comando = conexion.prepareStatement(
                    "UPDATE t_usuario SET nombre = ?, apellido = ?, correo = ?, contrasena = ?, dia = ?, mes = ?, anio = ?, imagen = ? WHERE nombre_Usuario = ?");

            comando.setString(1, request.getParameter("nombre"));
            comando.setString(2, request.getParameter("apellido"));
            comando.setString(3, request.getParameter("email"));
            comando.setString(4, request.getParameter("contra"));
            comando.setString(5, request.getParameter("dia"));
            comando.setString(6, request.getParameter("mes"));
            comando.setString(7, request.getParameter("anio"));
            comando.setString(8, request.getParameter("avatar"));
            comando.setString(9, request.getParameter("nombreuser"));
            comando.execute();

        } catch (NamingException | SQLException ex) {
            Logger.getLogger(actualizarNota.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/IndexI.jsp");
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
