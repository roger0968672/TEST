<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<title>目前待領養的寵物</title>
<link rel="stylesheet" href="http://localhost:8080/TopicTest/petCss/rwd.css">
<link rel="stylesheet" media="screen and  (max-width: 780px)" href="http://localhost:8080/TopicTest/petCss/rwd780.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
   tr>td>.inputdis{
   width:80px;}
   
   h3{
   color:#8600FF;
   text-align:center;
   }
   .displaydiv{
    display:none;
    width:1px;
   }
   .div2 a {
     display:block;
     text-align:center;
     color:gray;
      } 
 .div2 a:link{
       text-decoration:none;
       
 }
 .div2 a:hover{
       background-color:#467e14	;
       color:#ffffff;
       border-radius:20px;
       }
  .td{
  display:none;
  }  
</style>
<body>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<div id="allpage">
        <header>
            <h1 class="head">petpet寵物網</h1>
           <!-- <img class="logo-img" src="" title="logo" alt="logo">-->
            <nav>
                <ul class="menu">
                    <li><a href="">首頁</a></li>
                    <li><a href="">會員中心</a></li>
                    <li><a href="">討論區</a></li>
                    <li><a href="">活動</a></li>
                    <li><a href="http://localhost:8081/petpet/petSelectAll">領養區</a></li>
                </ul>
            </nav>            
        </header>
        
        <div id="content">
            <article class="article">
                <section class="section">
<form method="post" action=" " class="fo">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
<fieldset>
        <legend>目前資料</legend>
<table border="1" class="tab ">
<tr style="background-color:#a8fefa">
<th class="td"></th><th>寵物名稱</th><th>寵物性別</th>
<th>寵物種類</th><th>寵物毛色</th><th>寵物類別</th>
<th>是否結紮</th><th>所在地區</th><th>更新日期</th>

<c:forEach items="${PetAdopts}" var="pas" varStatus="s">
      
      
<tr>    
    <td class="td">${pas.petID}</td>
<%--     <td> <a  href=" <c:url value='/find/${pas.petID}'/>">${pas.petName}</a></td> --%>
   
    
<%--    <spring:url value=''/> --%>
<%--      <a href="<spring:url value='group?gid=${group.id}'/>">  --%>
                                   <%-- /select/pet  --%>
    <td><a href="<spring:url value='select/pet?petID=${pas.petID}'/>"/>${pas.petName}</td>
<%--     "<a href='" + "<c:url value='/ajax/editForm' />?id=" + member.id + "'>" + member.id + "</a>"; --%>
<%--     <td>${pas.petName}</td>  --%>
    <td>${pas.petGender}</td>
    <td>${pas.petSpecies}</td>
    <td>${pas.petColor}</td>
    <td>${pas.petBreeds}</td>
    <td>${pas.petLigation}</td>
    <td>${pas.petArea}</td>
    <td>${pas.petInsertDay}</td>
    
    <td><input type="button" value="修改" class="updatebtn"></td>
    <td><input type="button" value="刪除" class="deletebtn"></td>
     <c:set var="petID" value="${pas.petID}"/>
</tr>         

<c:set var="count" value="${s.count}"/>

<!-- <input type="submit" value="修改"> -->
</c:forEach>
</table>

</fieldset>
<h3>共 ${count}筆寵物資料</h3><!-- emps的陣列筆數 -->

<div class="displaydiv">
<input type="text" name="petID" value=" " id="petID">

</div>
</form>
          <section class="section1">
                 <div class="div2 select">
                      <a href="http://localhost:8081/petpet/petSelectAll">查詢寵物</a>
                 </div>
                 <div class="div2 insert">
                      <a href="http://localhost:8081/petpet/petInsert">刊登送養寵物</a>
                 </div>
          </section>
     </aside>
        </div>  <!--end content-->
        <footer>
                <p>第八組專題petpet寵物網</p>
        </footer>
    </div>  <!--end allpage-->
    <script>
  

     $(".deletebtn").click(function(){
    	 if (confirm("您真的確定要刪除嗎?")==true){
    	    	petID=$(this).closest("tr").children().eq(0).text(); 
    	    	alert("已刪除");
    	    	 $("#petID").attr("value",petID);
    	    	 alert($("#petID").val());
    	    	 $(".fo").attr("action","petDelete.controller");
    	    	 $(".deletebtn").attr("type","submit");
    	 }
    	     else{alert("取消成功")
    	    	 }
     })
     
     $(".updatebtn").click(function(){
    	 petID=$(this).closest("tr").children().eq(0).text();
    	petName=$(this).closest("tr").children().eq(1).text();
    	petGender=$(this).closest("tr").children().eq(2).text();
    	 $("#petID").attr("value",petID);
    	 //alert(petID);
    	 
         if(confirm("是否要修改")==true){
            $(".fo").attr("action","petUpdataView");
           //petID=$(this).closest("tr").children().children().eq(0).val();
          
           //window.location.href="http://localhost:8080/TopicTest/petSelectOne";
    		$(".updatebtn").attr("type","submit");
         } else{
             alert("已取消")}
     })
   
    </script>
</body>
</html>