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
import java.sql.ResultSet;
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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import misc.Usuario;

/**
 *
 * @author marie
 */
public class IniciaSesion extends HttpServlet {

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
        Usuario usuarioActivo = null;
        try {
            Context contexto = new InitialContext();
            Context ambiente = (Context) contexto.lookup("java:comp/env");
            DataSource infoConexion = (DataSource) ambiente.lookup("jdbc/info");

            Connection conexion = infoConexion.getConnection();
            PreparedStatement comando = conexion.prepareStatement("SELECT * FROM t_usuario WHERE nombre_Usuario = ? AND contrasena = ?");
            comando.setString(1, request.getParameter("usuario"));
            comando.setString(2, request.getParameter("contrasena"));
            if (comando.execute()) {
                ResultSet miSelect = comando.getResultSet();
                while (miSelect.next()) {
                    usuarioActivo = new Usuario(
                            miSelect.getInt("idUsuario"),
                            miSelect.getString("nombre_Usuario"),
                            miSelect.getString("contrasena"),
                            miSelect.getString("correo"),
                            miSelect.getString("imagen"),
                            miSelect.getString("nombre"),
                            miSelect.getString("apellido"),
                            miSelect.getString("dia"),
                            miSelect.getString("mes"),
                            miSelect.getString("anio"));
                }
            }
            comando.execute();
            comando.close();
            conexion.close();
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (usuarioActivo == null) {
            response.sendRedirect("/LoginError.jsp");
        } else {
            HttpSession sesionActiva = request.getSession();
            sesionActiva.setAttribute("usuario", usuarioActivo);
            response.sendRedirect("/IndexI.jsp");
        }

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
