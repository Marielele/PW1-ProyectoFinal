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
import java.util.Map;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author marie
 */
public class Registro extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//                processRequest(request, response);
        try {
            InputStream stream = null;
            Context contexto = new InitialContext();
            Context ambiente = (Context) contexto.lookup("java:comp/env");
            DataSource infoConexion = (DataSource) ambiente.lookup("jdbc/info");

            Connection conexion = infoConexion.getConnection();
            PreparedStatement comando = conexion.prepareStatement(
                    "INSERT INTO t_usuario (nombre_Usuario ,contrasena ,correo ,imagen ,nombre ,apellido, dia, mes, anio) VALUES (?,?,?,?,?,?,?,?,?)");
            /////////////////////////////////
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
                    stream = item.getInputStream();
                    comando.setBlob(4, stream);
                } else {
                    String name = item.getFieldName();
                    if (name.equals("Nombre")) {
                        comando.setString(5, item.getString());
                    }
                    if (name.equals("Apellidos")) {
                        comando.setString(6, item.getString());
                    }
                    if (name.equals("usuario")) {
                        comando.setString(1, item.getString());
                    }
                    if (name.equals("password")) {
                        comando.setString(2, item.getString());
                    }
                    if (name.equals("email")) {
                        comando.setString(3, item.getString());
                    }
                    if (name.equals("dia")) {
                        comando.setString(7, item.getString());
                    }
                    if (name.equals("mes")) {
                        comando.setString(8, item.getString());
                    }
                    if (name.equals("anio")) {
                        comando.setString(9, item.getString());
                    }
                    ///////////////////
                }
            }
            comando.execute();
            stream.close();
            comando.close();
            conexion.close();

        } catch (NamingException | SQLException | FileUploadException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.sendRedirect("/Login.html");

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
