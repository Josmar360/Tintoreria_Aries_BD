package Conexion_BD;

import java.sql.*;
import javax.swing.JOptionPane;
/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;*/
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author josma
 */

public class Conexion_BD 
{
    Connection Conexion_BD;
    static Login L = new Login();
    static String Usuario = "";
    static String Contraseña = "";
    
    public static void main(String[] args) 
    {
        //Login L = new Login();
        L.setTitle("                                            Iniciar Sesión");
        L.setVisible(true);   
    }
    
    public Connection conexion()
    {   
        try
        {           
            Class.forName("com.mysql.jdbc.Driver");//.newInstance();
            //Conexion_BD=DriverManager.getConnection("jdbc:mysql://localhost:3306/Tintoreria_aries", Usuario, Contraseña);
            Conexion_BD=DriverManager.getConnection("jdbc:mysql://192.168.100.6:3306/Tintoreria_aries", Usuario, Contraseña);
            JOptionPane.showMessageDialog(null, "Exito en la conexion de la base de datos");
        }
        catch(Exception e) 
        {
            JOptionPane.showMessageDialog(null, "Error de conexion de la base de datos "+e.getMessage());
            System.exit(0);
        }
        return Conexion_BD;
    }
        
    Statement createStatement()
    {
        throw new UnsupportedOperationException("No soportable");
    }
            
    public void Capturar()
    {
        Usuario=Login.Usuario.getText();
        Contraseña=Login.Contraseña.getText();
        L.setVisible(false);
        Consulta C = new Consulta(); 
        C.setTitle("                       Consulta Tabla");
        C.setVisible(true);      
    }
}    