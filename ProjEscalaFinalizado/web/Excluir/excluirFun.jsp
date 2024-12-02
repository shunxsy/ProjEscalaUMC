
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="model.Funcionario"%>
<%@page import="classeDAO.FuncionarioDAO"%>
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
        <title>Excluir Funcionário</title>
    </head>
    <body>
        <%-- MENU ABAS --%>
         <div class="container-fluid p-2">
            <ul class="nav">
            <li class="nav-item ">
              <a class="nav-link disabled text-dark" href="../index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/cadastroEsc.html">Criar Escala</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/cadastroFun.html">Cadastro Funcionário</a>
            </li>   
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/conLista.html">Relatório - ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/consGeralFuncionario.html">Relatório - FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/consultaEscala.html">Consulta-ESCALA</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../Consultar/consultaFuncionario.html">Consulta-FUNCIONÁRIO</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarFunc.html">Alterar Funcionário</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled text-dark" href="../alterar/alterarEscala.html">Alterar Escala</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled text-dark" href="excluirEscala.html">Excluir Escala</a>
            </li>
            </div>        
        <h1>Exclusão</h1>
        <%
        //Entrada/Receber
         int id = Integer.parseInt(request.getParameter("id"));

            // Instância e atrib de valor
        Funcionario func = new Funcionario();
        func.setId(id); 

        //Apagar
        FuncionarioDAO funcDAO = new FuncionarioDAO();
        if(funcDAO.delFun(func)){
            out.println("Registro excluído com sucesso!");
        }else{
           out.println("Erro! Registro não excluído!!!");
        }
        
        %>
    </body>
</html>
