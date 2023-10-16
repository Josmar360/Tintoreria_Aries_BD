package Conexion_BD;


import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author josma
 */
public class Usuario
{
    Usuario() 
    {
    }
    String Usuario="";
    String Contraseña="";
    
    /*
    //Atributos
    private String Usuario;
    private String Contraseña;        
    
    //Metodo Get
    public String getUsuario(){return Usuario;}
    public String getContrasena(){return Contraseña;}
    
    //Metodo Set
    public void setUsuario(String Usuario){this.Usuario=Usuario;}
    public void setContraseña(String Contraseña){this.Contraseña=Contraseña;}
    
    //Constructor
    Usuario(String Usuario, String Contraseña)
    {
        this.Usuario=Usuario;
        this.Contraseña=Contraseña;
    }*/
        
    public void Capturar()
    {
        Usuario=Login.Usuario.getText();
        Contraseña=Login.Contraseña.getText();
    }
    
    public void ImprimirDatos()
    {
        JOptionPane.showMessageDialog(null, "El usuario es: "+Usuario+"\nLa contraseña es: "+Contraseña, "Datos Capturados", JOptionPane.PLAIN_MESSAGE);
    }
}
