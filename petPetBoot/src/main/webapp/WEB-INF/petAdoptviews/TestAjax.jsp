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
        	
             xhr.open("GET","<c:url value='/find/1' />",true);
             xhr.send();
                 xhr.onreadystatechange=function(){
                     if(xhr.readyState ==4 && xhr.status==200){
                         console.log("12");
                         }
                     else{
                         console.log("23");}
                 }  
                
             
     
            
         

          })
        }
    </script>
</body>
</html>