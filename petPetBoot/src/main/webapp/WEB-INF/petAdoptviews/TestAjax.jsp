<%@ page language="java" contentType="text/html; charset=UTF-8"
 %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- import javabean -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<title>測試ajax</title>

</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <input type="button" id="submitpet" value="使用">
    <a id="testa"></a>
    <script>
    window.onload=function(){
        $("#submitpet").click(function(){
        	var xhr = new XMLHttpRequest();
             if(xml != null){
                 xml.onreadystatechange=function(){
                     console.log(xhr.readyState);
                 }  
                
             }
             else{
                 $("#testa").html("無法顯示");
             }
         

          })
        }
    </script>
</body>
</html>