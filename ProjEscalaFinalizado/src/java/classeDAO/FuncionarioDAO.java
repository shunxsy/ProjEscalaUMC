

package classeDAO;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Funcionario;
import util.ConexaoBD;

public class FuncionarioDAO {
    
        //MÉTODO CADASTRAR
    public boolean cadFun(Funcionario cadFun) throws ClassNotFoundException {
    Connection conexao = null;
    PreparedStatement pstmt = null;
    try {
        conexao = ConexaoBD.conectar();
        String sql = "INSERT INTO funcionarios(id_funcionario, nome, carga_horaria) VALUES (?, ?, ?)";
        pstmt = conexao.prepareStatement(sql);
        
        pstmt.setInt(1,cadFun.getId()); 
        pstmt.setString(2,cadFun.getNome());
        pstmt.setInt(3, cadFun.getCargaH());

        pstmt.executeUpdate(); 
        return true;
    } catch (SQLException ex) {
        System.out.println("Erro: " + ex);
        return false;
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conexao != null) conexao.close();
        } catch (SQLException e) {
            System.out.println("Erro ao fechar recursos: " + e);
        }
    }
}
    
        //MÉTODO DELETAR 
    public boolean delFun(Funcionario d_fun) throws ClassNotFoundException{
        Connection conexao = null;
        
        try{
            conexao = ConexaoBD.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "DELETE from funcionarios WHERE id_funcionario = " + d_fun.getId();
            stmt.executeUpdate(sql); 
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
        //MÉTODO CONSULTAR POR ID
    public Funcionario consIdFuncionario(Funcionario p_func) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConexaoBD.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM funcionarios WHERE id_funcionario = '" + p_func.getId()+ "'";
            
            ResultSet rs = stmt.executeQuery(sql); 
            
            int n_reg = 0;
            while (rs.next()) {                 
                
                p_func.setNome(rs.getString("nome"));                
                p_func.setCargaH(Integer.parseInt(rs.getString("carga_horaria")));
                  
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_func;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }
    
        //MÉTODO ALTERAR DADOS             
    public boolean altFunc(Funcionario a_func) throws ClassNotFoundException{
        Connection conexao = null;
        PreparedStatement pstmt = null;
        try{
            conexao = ConexaoBD.conectar();             
                        
            String sql = "UPDATE funcionarios SET nome= ?,carga_horaria = ? WHERE id_funcionario = ?";
            pstmt = conexao.prepareStatement(sql);
            
            //Valores parametros
            pstmt.setString(1, a_func.getNome());
            pstmt.setInt(2, a_func.getCargaH());
            pstmt.setInt(3, a_func.getId());
            
            pstmt.executeUpdate();
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        } finally {
            try{
                if (pstmt != null)      pstmt.close();
                if (conexao != null)    conexao.close();
            } catch (SQLException ex){
                ex.printStackTrace();
            }
        }
        return true;
    } 
    
       List lista = new ArrayList(); 

        //MÉTODO CONSULTAR LISTA        
 public List consFuncLista() throws ClassNotFoundException{        
        Connection conexao = null;
        try{
            conexao = ConexaoBD.conectar();     
            Statement stmt = conexao.createStatement();                                 
            String sql = "SELECT * FROM funcionarios";
            ResultSet rs = stmt.executeQuery(sql); 
            int n_reg = 0;
            while (rs.next()) {
                Funcionario p_esc = new Funcionario();
                p_esc.setId(rs.getInt("id_funcionario")); 
                p_esc.setNome(rs.getString("nome"));                
                p_esc.setCargaH(rs.getInt("carga_horaria"));                
                lista.add(p_esc);
                n_reg++;
            }
            conexao.close();
            if (n_reg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }
         
}
