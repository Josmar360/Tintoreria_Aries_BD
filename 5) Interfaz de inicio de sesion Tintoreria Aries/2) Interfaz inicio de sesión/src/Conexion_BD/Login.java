package Conexion_BD;

import Conexion_BD.Usuario;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author josma
 */
public class Login extends javax.swing.JFrame 
{
    /**
     * Creates new form Login
     */
    public Login() 
    {
        initComponents();
    }
    //Usuario U = new Usuario();
    Conexion_BD BD = new Conexion_BD();

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton2 = new javax.swing.JButton();
        jPanel1 = new javax.swing.JPanel();
        Salir = new javax.swing.JButton();
        Usuario = new javax.swing.JTextField();
        IniciarSesion = new javax.swing.JButton();
        Contraseña = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        TextLogin = new javax.swing.JLabel();
        TextUsuario = new javax.swing.JLabel();
        TextContraseña = new javax.swing.JLabel();

        jButton2.setText("jButton2");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Salir.setBackground(new java.awt.Color(255, 153, 51));
        Salir.setFont(new java.awt.Font("Arial Black", 0, 10)); // NOI18N
        Salir.setText("Salir");
        Salir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SalirActionPerformed(evt);
            }
        });
        jPanel1.add(Salir, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 20, 60, 30));

        Usuario.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jPanel1.add(Usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 170, 80, 20));

        IniciarSesion.setBackground(new java.awt.Color(255, 153, 51));
        IniciarSesion.setFont(new java.awt.Font("Arial Black", 0, 10)); // NOI18N
        IniciarSesion.setText("Iniciar Sesion");
        IniciarSesion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IniciarSesionActionPerformed(evt);
            }
        });
        jPanel1.add(IniciarSesion, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 240, 120, 30));
        jPanel1.add(Contraseña, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 200, 80, 20));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Login.png"))); // NOI18N
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 680, 380));

        TextLogin.setFont(new java.awt.Font("Arial Black", 0, 24)); // NOI18N
        TextLogin.setText("Login");
        jPanel1.add(TextLogin, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 30, -1, -1));

        TextUsuario.setFont(new java.awt.Font("Arial Black", 0, 14)); // NOI18N
        TextUsuario.setForeground(new java.awt.Color(0, 0, 1));
        TextUsuario.setText("Usuario:");
        jPanel1.add(TextUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 170, -1, -1));

        TextContraseña.setFont(new java.awt.Font("Arial Black", 0, 14)); // NOI18N
        TextContraseña.setText("Contraseña:");
        jPanel1.add(TextContraseña, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 200, -1, -1));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 382, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void SalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SalirActionPerformed
        System.exit(0);
    }//GEN-LAST:event_SalirActionPerformed

    private void IniciarSesionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_IniciarSesionActionPerformed
        BD.Capturar();
        //U.Capturar();
        //U.ImprimirDatos();
    }//GEN-LAST:event_IniciarSesionActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public static javax.swing.JTextField Contraseña;
    private javax.swing.JButton IniciarSesion;
    private javax.swing.JButton Salir;
    private javax.swing.JLabel TextContraseña;
    private javax.swing.JLabel TextLogin;
    private javax.swing.JLabel TextUsuario;
    public static javax.swing.JTextField Usuario;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
