<%-- 
    Document   : tablero
    Created on : 22-dic-2020, 13:15:15
    Author     : user
--%>

<%@page import="com.tarea.model.Tarea"%>
<%@page import="java.util.Collection"%>
<%@page import="com.tarea.services.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/fragmentos/includes.jspf" %>
        <title>Tablero</title>
    </head>
    <body>
        <%@include file="WEB-INF/fragmentos/includes-body.jspf" %>
        algun dia pondré bien los botones
        <c:if test="${sessionScope.usuario == null}">
            <div class="aler alert-danger" role="alert">
                No te has logueado (en un futuro mandarle al login y que no pueda meterse aqui)
            </div>
        </c:if>

        <div class="container" id="tablero">
            <div class="jumbotron">
                <div class="row">
                    <!--TODO-->
                    <div class="col">
                        <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                            <div class="card-header">To Do</div>
                            <div class="card-body ">
                                <div class="list-group list-group-flush" id="todo"  role="tablist">
                                    <c:forEach var="tarea" items="${requestScope.todo}"> 
                                        <a class="list-group-item list-group-item-dark list-group-item-action" href="#idTarea=${tarea.idTarea}" data-toggle="list">${tarea.descripcion}</a>
                                    </c:forEach> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--BOTONES TODO-PROGRESS-->
                    <div class="col-auto d-flex flex-column">
                        <div class="btn-group-vertical" role="group" aria-label="Button group">
                            <input type="button" onclick="todoProgress()" class="btn btn-secondary btn-der" value=">" />
                            <input type="button" onclick="progressTodo()" class="btn btn-secondary btn-izq" value="<"/>
                        </div>
                    </div>
                    <!--IN PROGRESS-->
                    <div class="col">
                        <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                            <div class="card-header">
                                In progress
                            </div>
                            <div class="card-body">
                                <div class="list-group list-group-flush" id="progress" role="tablist">
                                    <c:forEach var="tarea" items="${requestScope.progress}"> 
                                        <a class="list-group-item list-group-item-dark list-group-item-action" href="#idTarea=${tarea.idTarea}"   data-toggle="list">${tarea.descripcion}</a>
                                    </c:forEach> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--BOTONES IN PROGRESS-DONE-->
                    <div class="col-auto d-flex flex-column">
                        <div class="btn-group-vertical" role="group" aria-label="Button group">
                            <button type="button" class="btn btn-secondary">></button>
                            <button type="button" class="btn btn-secondary"><</button>
                        </div>
                    </div>
                    <!--DONE-->
                    <div class="col">
                        <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                            <div class="card-header">
                                Done
                            </div>
                            <div class="card-body">
                                <div class="list-group list-group-flush" id="done" role="tablist"> 
                                    <c:forEach var="tarea" items="${requestScope.done}"> 
                                        <a class="list-group-item list-group-item-dark list-group-item-action" href="tablero?tabla=done&idTarea=${tarea.idTarea}" data-toggle="list">${tarea.descripcion}</a>
                                    </c:forEach> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <!--<script src="js/arrastrar.js" type="text/javascript"></script>-->
    <script>
        //lo dejamos para un futuro (quiero que si clica una tarea marcada, se desmarque)
        $('#todo a').on('click', function () {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
                //no se por que no funciona eso pero bueno
            }

        })
        
        function todoProgress() {
           var tareas = document.querySelector('#todo');
           //mejor for each pero bueno, no se js
           for (i = 0; i < tareas.length; ++i) {
               if (tareas[i].hasClass('active')) {
                   alert(i);
                   //intentar mostrar el ID
               } 
           }
           alert('nada');
        }
        
        function progressTodo() {

        }

    </script>
</html>
