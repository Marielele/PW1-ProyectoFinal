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
import java.util.ArrayList;
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
import misc.Notas;

/**
 *
 * @author marie
 */
public class buscarNota extends HttpServlet {

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
        ArrayList<Notas> Busqueda = new ArrayList<>();
        try {
            Context contexto = new InitialContext();
            Context ambiente = (Context) contexto.lookup("java:comp/env");
            DataSource infoconexion = (DataSource) ambiente.lookup("jdbc/info");
            Connection conexion = infoconexion.getConnection();
            PreparedStatement comando = conexion.prepareStatement("CALL sp_buscar(?,?)");
            String idS = request.getParameter("idUser");
            int idU = Integer.parseInt(idS);
            comando.setString(1, request.getParameter("buscar"));
            comando.setInt(2, idU);
            if (comando.execute()) {
                ResultSet result = comando.getResultSet();
                while (result.next()) {
                    Busqueda.add(new Notas(result.getInt("id"), result.getString("texto"), result.getString("etiqueta")));
                }
            }
            comando.execute();
            comando.close();
            conexion.close();
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(buscarNota.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("bNotas", Busqueda);
        request.getRequestDispatcher("/Busqueda.jsp").forward(request, response);

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
        processRequest(request, response);
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
