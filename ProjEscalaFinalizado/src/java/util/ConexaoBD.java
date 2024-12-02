    //CLASSE DE CONEXÃO AO BANCO DE DADOS

package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexaoBD {
    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao =null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");                         //NOME BANCO      //USER //SENHA
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/escaladetrabalho" ,"root"   ,"");
            return conexao;
        }catch( SQLException ex){
            System.out.println("error: " + ex);
        }
        return conexao;
    }
}
