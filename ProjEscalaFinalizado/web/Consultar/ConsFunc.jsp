<%-- 
    Document   : ConsFunc
    Created on : 27 de nov. de 2024, 19:09:24
    Author     : Bruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>
<%@page import="classeDAO.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style> 
            .container{
            background-color: rgb(128,128,128);
        }  
            .container-fluid{
             background-color: rgb(128,128,128);
        }
      
        </style>
        <title>Consulta Funcionário</title>
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
              <a class="nav-link disabled text-dark" href="consGeralFuncionario.html">Relatório - FUNCIONÁRIO</a>
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
          
      <h1>Funcionário - Consulta </h1>
        <%           
        //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atrib de valor
            Funcionario func = new Funcionario();
            func.setId(id);
        
            //Select
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            if(funcDAO.consIdFuncionario(func) != null){
            
                out.println("<br> <b>Lista de Funcionários</b> <br>");
                out.println("<br> ID Escala: " + func.getId());
                out.println("<br> Nome Funcionário: " + func.getNome());
                out.println("<br> Carga Horária : " + func.getCargaH());
            }else{
               out.println("Registro não encontrado!!!");
               
            }

        %>
    </body>
</html>
