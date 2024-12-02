<%-- 
    Document   : ConsGeralFunc
    Created on : 30 de nov. de 2024, 17:26:26
    Author     : Bruna
--%>
<%@page import="model.*"%>
<%@page import="classeDAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        
       <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Relatórios Funcionários</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style> 
            .container{
            background-color: rgb(128,128,128);
        }  
            .container-fluid{
             background-color: rgb(128,128,128);
        }      
        </style>

    </head>
    <body>
         <div class="container-fluid p-2">
            <ul class="nav">
            <li class="nav-item ">
              <a class="nav-link disabled text-dark" href="../index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../cadastro/cadastroEsc.html">Criar Escala</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../cadastro/cadastroFun.html">Cadastro Funcionário</a>
            </li>   
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="conLista.html">Relatório - ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="consultaFuncionario.html">Consulta - FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="consultaEscala.html">Consulta-ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarFunc.html">Alterar Funcionário</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarEscala.html">Alterar Escala</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirFun.html">Excluir Funcionário</a>
            </li>
             <li class="nav-item">
                <a class="nav-link disabled text-dark" href="../Excluir/excluirEscala.html">Excluir Escala</a>
            </li>
        </div>
        
    <center><h1>Relatório Funcionários</h1></center>
        <%                    
            //Select "Geral"
     
              FuncionarioDAO consDAO = new FuncionarioDAO();
            
            List<Funcionario> lista = new ArrayList<>();
            lista = consDAO.consFuncLista();
            
            int n_reg = 0 ;
            
           
            
        %>    
        
        <div class="p-3 m-4"> 
        <table class="table bg-light ">
            <tr>
            <th scope="col">registro</th>
            <th scope="col">Nome Funcionario</th>
            <th scope="col">ID Funcioario</th>
            <th scope="col">Carga Horaria</th>
            </tr>
                   
            
        <%   
    
           for( int i = 0; i <= lista.size()-1; i++){                
                //Minha tabela - DT/TR/...
           
        %>        
           <tr>
                <td><%= n_reg+1 %> </td>
                 <td><%= lista.get(i).getNome()%></td>
                <td><%= lista.get(i).getId() %> </td>
                <td><%= lista.get(i).getCargaH()%></td>
                
            </tr>                                                          
        <%
                n_reg++;                           
            }
        %>
    </table>
            <%
                out.println("<b>Registros: </b>" + n_reg + "<br>");
            %>
        
    </body>

</html>
