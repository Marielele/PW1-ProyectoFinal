/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package misc;
/**
 *
 * @author marie
 */
public class Usuario {
    private int id;
    private String nombre_Usuario;
    private String contrasena;
    private String correo;
    private String imagen;
    private String nombre;
    private String apellido;
    private String dia;
    private String mes;
    private String anio;

    public Usuario() {
    }

    public Usuario(int id, String nombre_Usuario, String contrasena, String correo, String imagen, String nombre, String apellido, String dia, String mes, String anio) {
        this.id = id;
        this.nombre_Usuario = nombre_Usuario;
        this.contrasena = contrasena;
        this.correo = correo;
        this.imagen = imagen;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public Usuario(int id, String nombre_Usuario, String contrasena, String correo, String nombre, String apellido, String dia, String mes, String anio) {
        this.id = id;
        this.nombre_Usuario = nombre_Usuario;
        this.contrasena = contrasena;
        this.correo = correo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dia = dia;
        this.mes = mes;
        this.anio = anio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
     
    public String getNombre_Usuario() {
        return nombre_Usuario;
    }

    public void setNombre_Usuario(String nombre_Usuario) {
        this.nombre_Usuario = nombre_Usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }
    
    
}
