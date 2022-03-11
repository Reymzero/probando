/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package probando;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
/**
 *
 * @author luis pablo
 */
public class Conexion {
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","root","1234");
        } catch (Exception e) {
            System.err.println("Error:" +e);
        }
    }
    public static void main(String[] args) {
        Conexion cn=new Conexion();
        Statement st;
        ResultSet rs;
        try {
            st=cn.con.createStatement();
            rs=st.executeQuery("select * from cliente");
            while (rs.next()) {                
                System.out.println(rs.getInt("ID_Cliente")+" " +rs.getString("Nombres")+" " +rs.getString("Apellidos")+" " +rs.getString("Direccion")+" " +rs.getString("Telefono"));
            }
            cn.con.close();
        } catch (Exception e) {
        }
        
    }
}
