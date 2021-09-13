<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>查詢待領養寵物</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<!--stylesheet-->
<link rel="stylesheet" type="text/css"
href="<c:url value='/PetAdopt/css/style.css' />">
<!--light-slider-css-->
<link rel="stylesheet" type="text/css" href="<c:url value='/PetAdopt/css/lightslider.css' />">
<!--jQuery-------->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
<!--light-slider-js-->
<script src="<c:url value='/PetAdopt/js/lightslider.js'/>"></script>

<!--fav-icon------------------->
<link rel="shortcut icon" href="images/fav-icon.ico" />
<!--using-FontAwesome-for-Icons-->
<script src="https://kit.fontawesome.com/c8e4d183c2.js"
crossorigin="anonymous"></script>

<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<!-- jQuery library -->
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<style>
.menu_list {
width: 265px;
margin: 0;
}

.menu_head {
height: 47px;
line-height: 47px;
padding-left: 38px;
font-size: 14px;
color: #525252;
cursor: pointer;
border: 1px solid #ffffff;
position: relative;
margin: 0px;
font-weight: bold;
background: #B6EBCF;
}

.menu_list .current {
background: #B6EBCF;
}

.menu_nva {
line-height: 38px;
border-left: 1px solid #B6EBCF;
background: #ffffff;
border-right: 1px solid #B6EBCF;
}

.menu_head:hover{
color:blue;
}
.hovera{
color: #525252; 

}
.hovera:hover{
text-decoration:none;
color:blue;
}

.menu_nva a {
display: inline;
height: 38px;
line-height: 38px;
padding-left: 38px;
color: #777777;
background: #ffffff;
text-decoration: none;
border-bottom: 1px solid #B6EBCF;
}

.menu_nva a:hover {
text-decoration: none;
}

.sidenav {
height: 90%;
width:220px;
position: fixed;
/* z-index: 1; */
top: 100;
left: 0;
/* background-color: #ffffff; */
overflow-x: hidden;
margin-left:10px;
margin-top: 50px;
background-color: rgba(255, 255, 255, 0.2);
}

.box {
margin-left: 200px;
}

.box_bottom {
max-width: 20;
}

.imgsize {
width: 10;
height: -100;
}

span {
border: 20px
}



	
   /*  --------------------*/
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
   .imgpic1{
		width:200px;
		height:200px;
		display:none;
   }
   #petInsertCell{
	   display: table-cell;
	   vertical-align: middle;
	   width:1000px;
   }
   *{
	margin: auto;
	padding: auto;
   }
   #picAdoptTexta2{
  margin-left:250px;
  font-size: 20px;}
   #petInsertCell select{
  color:#009393;
  }
   #petInsertView{
	
	   display: table;
	   background-color: linen;
	  border: 3px double royalblue; 
	  border-radius: 15px;
   }
   #petimg{
width: 150px;
height: 150px;
}
.peterrora{
color:red;
margin-left:380px;
display: none;

}
.peterrora:hover{
text-decoration:none;
}
#petInsertCell div{
margin-top: 10px;
}
.block {
	  margin: auto;
	  margin-top: 50px;
	  margin-bottom: 100px;
	  display: flex;
	  flex-wrap: wrap;
	  border-radius: 10px;
	  border: solid 1px rgba(0, 0, 0, 0.3);
	  box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
  }
.block h1{
text-align: center;
color:	#005AB5
}
.petbreedsla{
width:110px;
}
.petgenderradio{
margin:5px;
width:20px;
height: 20px;
}
.petselectdiv{
  width:1200px;

}
.petselectsort{
   font-size:20px;
}
.petdivborder{  
   border:2px solid  #FFA042;
   border-radius: 15px;   	
}
.card-deck .card{
margin-right: 0px;
margin-left: 0px;
}
.card-body p{
margin:5px;
color:#2894FF;
}
.btn-primary{
background-color:#01B468;
}
.page-item{
margin:5px;
}
</style>
</head>
<body>
<!--navigation-------------------------------->

<%@include file="../common/nav.jsp" %>

<!-- 側邊nav -->
<nav class="sidenav"> 
   <!-- 首頁 start -->
	<div id="firstpaneDiv" style="width: 200px; height: 40px;"class="menu_list ">
	      <h3 class="menu_head current"
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;"><a class="hovera"  href="<c:url value='/petadopt/'/>">首頁</a></h3>
		<div style="display: none" class="menu_nva">
		</div>
	<!-- 首頁end -->
		  <!-- 站內統計 start-->
			<div id="firstpaneDiv" style="width: 200px; height: 40px;"class="menu_list ">
	      <h3 class="menu_head current"
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;"><a class="hovera"  href="<c:url value='/petadopt/sc'/>">待領養寵物統計</a></h3>
		<div style="display: none" class="menu_nva">
		</div>
			
			<!-- 站內統計 end -->
		<!-- 寵物分類 Start-->
		<h3 class="menu_head current"
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;">寵物分類</h3>
		<div style="display: none" class="menu_nva">
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="狗"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="狗">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="貓"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="貓">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="鳥"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="鳥">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="鼠"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="鼠">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="兔"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="兔">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="龜"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="龜">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="蛇"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="蛇">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetspecies'/> ">
				<input type="Hidden" name="petSpecies" value="豬"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="豬">
			</form>
			</div>
		<!-- 寵物分類 end -->
		
		
		
		 <!-- 會員專區 Start -->
		<h3 class="menu_head current"  
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;">會員專區</h3>
		<div style="display: none" class="menu_nva">
			<form id="form" method="get"
				action="<c:url value='/petadopt/petInsert'/> ">
				 <input
					type="submit" class="btn btn-outline-success form-control"
					value="新增待領養寵物">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/backstagePetAdopt'/> ">
				 <input
					type="submit" class="btn btn-outline-success form-control"
					value="待領養寵物管理">	
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/petadopted'/> ">
				 <input
					type="submit" class="btn btn-outline-success form-control"
					value="查詢已認養寵物">	
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/mylike'/> ">
				 <input
					type="submit" class="btn btn-outline-success form-control"
					value="我的最愛">	
			</form>
		 </div>
	     <!-- 會員專區end -->	 
		 
		<!-- 寵物所在地區 start-->
		<h3 class="menu_head current"
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;">寵物所在地區</h3>
		<div style="display: none" class="menu_nva">
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="台北市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="台北市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="新北市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="新北市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="基隆市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="基隆市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="宜蘭縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="宜蘭縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="新竹市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="新竹市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="新竹縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="新竹縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="苗栗縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="苗栗縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="彰化縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="彰化縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="南投縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="南投縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="嘉義市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="嘉義市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="嘉義縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="嘉義縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="雲林縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="雲林縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="台南市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="台南市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="高雄市"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="高雄市">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="澎湖縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="澎湖縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="金門縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="金門縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="屏東縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="屏東縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="澎湖縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="澎湖縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="台東縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="台東縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="花蓮縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="花蓮縣">
			</form>
			<form id="form" method="get"
				action="<c:url value='/petadopt/selectpetarea'/> ">
				<input type="Hidden" name="petArea" value="連江縣"> <input
					type="submit" class="btn btn-outline-success form-control"
					value="連江縣">
			</form>
			</div>
        <!-- 寵物所在地區  end -->
	</div>	
</nav>



<!--new-arrival------------------->
<section class="new-arrival box">
	<!--heading------->
	
	
	
	    <div class="block" id="petInsertView">    
	    <H1 style="margin-top: 5px;">搜尋結果</H1>                                     
		<div style="margin: 10px;">
		<div class="dataBlock" id="petInsertCell">
	<c:if test="${empty seachpet && empty mylike}" >
	 
		<a style="font-size:22px; margin-left:620px;">排序方式</a>
			<select id="sort"  class="petselectsort">
			 <c:if test="${sortField == 'petInsertDay'}">           
		               <option value="petInsertDay" selected="selected">資料更新時間 </option>
		               <option value="petHits" >觀看數</option>
		     </c:if> 
                <c:if test="${sortField == 'petHits'}">  
                    <option value="petInsertDay" selected="selected">資料更新時間 </option>
                    <option value="petHits" selected="selected">觀看數</option>
                </c:if>
               <c:if test="${sortField == 'petID'}">
				<option value="petInsertDay">資料更新時間</option>
				<option value="petHits">觀看數</option>
				</c:if>
			</select>
			

			  <select id="sortdict" style="margin-left: 30px " class="petselectsort">
			     <c:if test="${sortField == 'petInsertDay' && sortDir=='desc'}">  
			        <option value="desc" selected="selected">新到舊</option>
				    <option value="asc">舊到新</option>
			     </c:if>
			     <c:if test="${sortField == 'petInsertDay' && sortDir=='asc'}">  
			        <option value="desc" >新到舊</option>
				    <option value="asc" selected="selected">舊到新</option>
			     </c:if>
			     
			     <c:if test="${sortField == 'petHits' && sortDir=='desc'}"> 
			         <option value="desc" selected="selected">高到低</option>
				     <option value="asc">低到高</option>
			     </c:if>
			     <c:if test="${sortField == 'petHits' && sortDir=='asc'}">  
			        <option value="desc">高到低</option>
				    <option value="asc" selected="selected">低到高</option>
			     </c:if>
			     <c:if test="${sortField == 'petID'}">
			        <option value="desc" selected="selected">新到舊</option>
				    <option value="asc">舊到新</option>
			     </c:if>
			 </c:if>    
				
	
	 <c:if test="${not empty seachpet && empty mylike}" >
	
		<a style="font-size:22px; margin-left:620px;">排序方式</a>
			<select id="sort"  class="petselectsort">
			 <c:if test="${sortField == 'petInsertDay'}">           
		               <option value="petInsertDay" selected="selected">資料更新時間 </option>
		               <option value="petHits" >觀看數</option>
		     </c:if> 
                <c:if test="${sortField == 'petHits'}">  
                    <option value="petInsertDay" selected="selected">資料更新時間 </option>
                    <option value="petHits" selected="selected">觀看數</option>
                </c:if>
               <c:if test="${sortField == 'petID'}">
				<option value="petInsertDay">資料更新時間</option>
				<option value="petHits">觀看數</option>
				</c:if>
			</select>
			

			  <select id="sortdict" style="margin-left: 30px " class="petselectsort">
			     <c:if test="${sortField == 'petInsertDay' && sortDir=='desc'}">  
			        <option value="desc" selected="selected">新到舊</option>
				    <option value="asc">舊到新</option>
			     </c:if>
			     <c:if test="${sortField == 'petInsertDay' && sortDir=='asc'}">  
			        <option value="desc" >新到舊</option>
				    <option value="asc" selected="selected">舊到新</option>
			     </c:if>
			     
			     <c:if test="${sortField == 'petHits' && sortDir=='desc'}"> 
			         <option value="desc" selected="selected">高到低</option>
				     <option value="asc">低到高</option>
			     </c:if>
			     <c:if test="${sortField == 'petHits' && sortDir=='asc'}">  
			        <option value="desc">高到低</option>
				    <option value="asc" selected="selected">低到高</option>
			     </c:if>
			     <c:if test="${sortField == 'petID'}">
			        <option value="desc" selected="selected">新到舊</option>
				    <option value="asc">舊到新</option>
			     </c:if>
			 </c:if>   
				
			  </select>
		</div>	

			<c:set var="count" value="0" scope="page" />
			<div class="card-deck  petselectdiv" style="margin: 0.5em 0;" >
				<c:forEach items="${PetAdopts}" var="pas" varStatus="s">
				  
				  <c:if test="${count%3==0}">
					<div class="card-deck"  style="margin: 0.5em 0">
				  </c:if>
					  <div class="card petdivborder" style="width: 400px;">
					 
						<img style="margin-top:10px;" class="card-img-top" src="<c:url value='/petadopt/responseImage1.controller?petID=${pas.petID}'/>" id="petimg">
						<div class="card-body">           
						  <h4 class="card-title" style="color:brown;">寵物名：${pas.petName} </h4>
						  <p class="card-text">性別：${pas.petGender}</p>
						  <p class="card-text">寵物種類：${pas.petSpecies}</p>
						  <p class="card-text">所在地區：${pas.petArea}</p>
						  <p class="card-text">觀看數： ${pas.petHits}</p>
						  <p class="card-text"><c:out value="最後更新日期：${pas.petInsertDay}"></c:out></p>
						  <a class="btn btn-primary stretched-link" href="<c:url value='/petadopt/select/pet?petID=${pas.petID}'/>" />查看寵物</a>  
						</div> 
						               
					  </div>
				  <c:if test="${count%3==2}">
					</div> 
				  </c:if>
				  <c:set var="count" value="${count + 1}" scope="page"/>
				  </c:forEach>
		   </div>
		   <!-- 頁面  -->
		   <!-- 搜尋全部-->
		<c:if test="${empty seachpet && empty petSpecies && empty petArea && empty mylike}" >	
		    <div class="container">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/${currentPage - 1}?sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
						</c:if>
		
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/1?sortField=${sortField}&sortDir=${sortDir}">1</a></li>
						</c:if>
						<c:if test="${currentPage == 1}">
							<li class="page-item"><a class="page-link" style="color:red;">1</a></li>
						</c:if>
		
						<c:forEach var="i" begin="2" end="${totalPages}">
		
							<c:if test="${currentPage != i}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/${i}?sortField=${sortField}&sortDir=${sortDir}">${i}</a></li>
							</c:if>
							<c:if test="${currentPage == i}">
								<li class="page-item"><a class="page-link" style="color:red;">${i}</a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/${currentPage + 1}?sortField=${sortField}&sortDir=${sortDir}">下一頁</a></li>
						</c:if>
						<c:if test="${currentPage == i}">
							<li class="page-item"><a class="page-link">下一頁</a></li>
						</c:if>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/${totalPages}?sortField=${sortField}&sortDir=${sortDir}">最後一頁</a></li>
						</c:if>
						<c:if test="${currentPage == totalPages}">
							<li class="page-item"><a class="page-link">最後一頁</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
	
			<!-- 有搜尋 沒有種類 沒有地區 -->
			<c:if test="${not empty seachpet && empty petSpecies && empty petArea && empty mylike}" >	
		    <div class="container">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/${currentPage - 1}?seachpet=${seachpet}&sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
						</c:if>                                        
		
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/1?seachpet=${seachpet}&sortField=${sortField}&sortDir=${sortDir}">1</a></li>
						</c:if>
						<c:if test="${currentPage == 1}">
							<li class="page-item"><a class="page-link"style="color:red;">1</a></li>
						</c:if>
		
						<c:forEach var="i" begin="2" end="${totalPages}">
		
							<c:if test="${currentPage != i}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/${i}?seachpet=${seachpet}&sortField=${sortField}&sortDir=${sortDir}">${i}</a></li>
							</c:if>
							<c:if test="${currentPage == i}">
								<li class="page-item"><a class="page-link" style="color:red;">${i}</a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/${currentPage + 1}?seachpet=${seachpet}&sortField=${sortField}&sortDir=${sortDir}">下一頁</a></li>
						</c:if>
						<c:if test="${currentPage == i}">
							<li class="page-item"><a class="page-link">下一頁</a></li>
						</c:if>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/${totalPages}?seachpet=${seachpet}&sortField=${sortField}&sortDir=${sortDir}">最後一頁</a></li>
						</c:if>
						<c:if test="${currentPage == totalPages}">
							<li class="page-item"><a class="page-link">最後一頁</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
			
			
			<!-- 有種類 沒搜尋 沒有地區 -->
			<c:if test="${ not empty petSpecies && empty seachpet && empty petArea && empty mylike}" >	
		    <div class="container">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/${currentPage - 1}?petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
						</c:if>                                        
		
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/1?petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">1</a></li>
						</c:if>
						<c:if test="${currentPage == 1}">
							<li class="page-item"><a class="page-link" style="color:red;">1</a></li>
						</c:if>
		
						<c:forEach var="i" begin="2" end="${totalPages}">
		
							<c:if test="${currentPage != i}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/${i}?petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">${i}</a></li>
							</c:if>
							<c:if test="${currentPage == i}">
								<li class="page-item"><a class="page-link" style="color:red;">${i}</a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/${currentPage + 1}?petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">下一頁</a></li>
						</c:if>
						<c:if test="${currentPage == i}">
							<li class="page-item"><a class="page-link">下一頁</a></li>
						</c:if>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/${totalPages}?petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">最後一頁</a></li>
						</c:if>
						<c:if test="${currentPage == totalPages}">
							<li class="page-item"><a class="page-link">最後一頁</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
           
           
            <!-- 沒種類 沒搜尋 有地區  -->
          <c:if test="${  empty petSpecies && empty seachpet && not empty petArea && empty mylike}" >	
		    <div class="container">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/${currentPage - 1}?petArea=${petArea}&sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
						</c:if>                                        
		
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/1?petArea=${petArea}&sortField=${sortField}&sortDir=${sortDir}">1</a></li>
						</c:if>
						<c:if test="${currentPage == 1}">
							<li class="page-item"><a class="page-link"style="color:red;">1</a></li>
						</c:if>
		
						<c:forEach var="i" begin="2" end="${totalPages}">
		
							<c:if test="${currentPage != i}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/${i}?petArea=${petArea}&sortField=${sortField}&sortDir=${sortDir}">${i}</a></li>
							</c:if>
							<c:if test="${currentPage == i}">
								<li class="page-item"><a class="page-link" style="color:red;">${i}</a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/${currentPage + 1}?petArea=${petArea}&sortField=${sortField}&sortDir=${sortDir}">下一頁</a></li>
						</c:if>
						<c:if test="${currentPage == i}">
							<li class="page-item"><a class="page-link">下一頁</a></li>
						</c:if>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/${totalPages}?petArea=${petArea}&sortField=${sortField}&sortDir=${sortDir}">最後一頁</a></li>
						</c:if>
						<c:if test="${currentPage == totalPages}">
							<li class="page-item"><a class="page-link">最後一頁</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>

             
             <!-- 有種類 有地區 沒搜尋 -->
              <c:if test="${ not empty petSpecies && not empty petArea  && empty seachpet && empty mylike}" >	
		    <div class="container">
					<ul class="pagination">
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/${currentPage - 1}?petArea=${petArea}&petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">前一頁</a></li>
						</c:if>                                        
		
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/1?petArea=${petArea}&sortField=${sortField}&petSpecies=${petSpecies}&sortDir=${sortDir}">1</a></li>
						</c:if>
						<c:if test="${currentPage == 1}">
							<li class="page-item"><a class="page-link" style="color:red;">1</a></li>
						</c:if>
		
						<c:forEach var="i" begin="2" end="${totalPages}">
		
							<c:if test="${currentPage != i}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/${i}?petArea=${petArea}&petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">${i}</a></li>
							</c:if>
							<c:if test="${currentPage == i}">
								<li class="page-item"><a  class="page-link" style="color:red;">${i}</a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/${currentPage + 1}?petArea=${petArea}&petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">下一頁</a></li>
						</c:if>
						<c:if test="${currentPage == i}">
							<li class="page-item"><a class="page-link">下一頁</a></li>
						</c:if>
		
						<c:if test="${currentPage < totalPages}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/${totalPages}?petArea=${petArea}&petSpecies=${petSpecies}&sortField=${sortField}&sortDir=${sortDir}">最後一頁</a></li>
						</c:if>
						<c:if test="${currentPage == totalPages}">
							<li class="page-item"><a class="page-link">最後一頁</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
<!-- 		下面為全部搜尋該出現的頁面           -->
	
			</section>
	

	  
	 






<!--services--------------------------------------------->
<section class="services box">
	<!--service-box-1-------------------->
	<div class="services-box">
		<i class="fas fa-shipping-fast"></i> <span>免運費</span>
		<p>額滿即享免運費</p>
	</div>

	<!--service-box-2-------------------->
	<div class="services-box">
		<i class="fas fa-headphones-alt"></i> <span>24小時客服</span>
		<p>提供即時在線服務</p>
	</div>

	<!--service-box-3-------------------->
	<div class="services-box">
		<i class="fas fa-sync"></i> <span>鑑賞期內 100%退款</span>
		<p>購回一周內若不滿意，享全額退款</p>
	</div>
</section>





<input type="hidden" id="petAreaaa" value="<c:out value='${petArea}'/>" >
<input type="hidden" id="petseachaa" value="<c:out value='${seachpet}'/>">
<input type="hidden" id="petSpeciesaa" value="<c:out value='${petSpecies}'/>" >
</body>






<!--script-------->
<script type="text/javascript">
	/*----For Search bar---------------------*/
	$(document).on('click', '.search', function() {
		$('.search-bar').addClass('search-bar-active')
	});

	$(document).on('click', '.search-cancel', function() {
		$('.search-bar').removeClass('search-bar-active')
	});

	/*--login-sign-up-form-----------------*/
	$(document).on('click', '.user,.already-acount', function() {
		$('.form').addClass('login-active').removeClass('sign-up-active')
	});

	$(document).on('click', '.sign-up-btn', function() {
		$('.form').addClass('sign-up-active').removeClass('login-active')
	});

	$(document).on(
			'click',
			'.form-cancel',
			function() {
				$('.form').removeClass('login-active').removeClass(
						'sign-up-active')
			});

	/*----for-fix-menu-when-scroll----------------------*/
	$(window).scroll(function() {
		if ($(document).scrollTop() > 50) {
			$('.navigation').addClass('fix-nav');
		} else {
			$('.navigation').removeClass('fix-nav');
		}
	})
	/*--for-responsive-menu-----------------*/
	$(document).ready(function() {
		$('.toggle').click(function() {
			$('.toggle').toggleClass('active')
			$('.navigation').toggleClass('active')
		})
	})

	$(document).ready(
			function() {
				$("#firstpaneDiv .menu_nva:eq(0)").show();
				$("#firstpaneDiv h3.menu_head").click(
						function() {
							$(this).addClass("current")
									.next("div.menu_nva").slideToggle(200)
									.siblings("div.menu_nva").slideUp(
											"slow");
							$(this).siblings().removeClass("current");
						});
				$("#secondpane .menu_nva:eq(0)").show();
				$("#secondpane h3.menu_head").mouseover(
						function() {
							$(this).addClass("current")
									.next("div.menu_nva").slideDown(400)
									.siblings("div.menu_nva").slideUp(
											"slow");
							$(this).siblings().removeClass("current");
						});
			});


	
	<c:if test="${empty seachpet && empty petSpecies && empty petArea}">
	$(document).ready(function() {
		  $('#sort').change("click", function() {
		    var sorting = $('#sort').val();
		    var sortdict = $('#sortdict').val();
		    console.log(sorting);
		    window.location.href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/${currentPage}?sortField="+sorting+"&sortDir="+sortdict;
		  })  
		  $('#sortdict').change("click", function() {		  
		      var sorting = $('#sort').val();  
		      var sortdict = $('#sortdict').val();	   
		    window.location.href="${pageContext.request.contextPath}/petadopt/petAdoptselectAll/page/${currentPage}?sortField="+sorting+"&sortDir="+sortdict;
		  })

		})
	</c:if>

	<c:if test="${not empty seachpet && empty petSpecies && empty petArea}"> 
	$(document).ready(function() {
		  $('#sort').change("click", function() {
			var seach=$("#petseachaa").val();
		    var sorting = $('#sort').val();
		    var sortdict = $('#sortdict').val();
		    console.log(sorting);
		    window.location.href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/${currentPage}?seachpet="+seach+"&sortField="+sorting+"&sortDir="+sortdict;
		  })  
		  $('#sortdict').change("click", function() {
			  var seachpet= $("#petseachaa").val()
			  var sorting = $('#sort').val();  
		      var sortdict = $('#sortdict').val();	
		   
		    window.location.href="${pageContext.request.contextPath}/petadopt/seachpetadopt/page/${currentPage}?seachpet="+seachpet+"&sortField="+sorting+"&sortDir="+sortdict;
		  })

		})
	</c:if>

	<c:if test="${not empty petSpecies && empty seachpet && empty petArea}"> 
	$(document).ready(function() {
		  $('#sort').change("click", function() {
		    var petSpecies= $("#petSpeciesaa").val();
		    var sorting = $('#sort').val();
		    var sortdict = $('#sortdict').val();
		
		    window.location.href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/${currentPage}?petSpecies="+petSpecies+"&sortField="+sorting+"&sortDir="+sortdict;
		  })  
		  $('#sortdict').change("click", function() {
			  var petSpecies= $("#petSpeciesaa").val();
			  var sorting = $('#sort').val();  
		      var sortdict = $('#sortdict').val();	

		    window.location.href="${pageContext.request.contextPath}/petadopt/selectpetspecies/page/${currentPage}?petSpecies="+petSpecies+"&sortField="+sorting+"&sortDir="+sortdict;
		  })

		})
	</c:if> 

	<c:if test="${ empty petSpecies && empty seachpet && not empty petArea}"> 
	$(document).ready(function() {
		  $('#sort').change("click", function() { 
		    var petArea= $("#petAreaaa").val();
		    var sorting = $('#sort').val();
		    var sortdict = $('#sortdict').val();
		
		    window.location.href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/${currentPage}?petArea="+petArea+"&sortField="+sorting+"&sortDir="+sortdict;
		  })  
		  $('#sortdict').change("click", function() {
			  var petArea= $("#petAreaaa").val();
			  var sorting = $('#sort').val();  
		      var sortdict = $('#sortdict').val();	

		    window.location.href="${pageContext.request.contextPath}/petadopt/selectpetarea/page/${currentPage}?petArea="+petArea+"&sortField="+sorting+"&sortDir="+sortdict;
		  })

		})
	</c:if>

	<c:if test="${not empty petSpecies && not empty petArea && empty seachpet }"> 
	$(document).ready(function() {
		  $('#sort').change("click", function() {
		    var petArea= $("#petAreaaa").val();
		    var petSpecies= $("#petSpeciesaa").val();
		    var sorting = $('#sort').val();
		    var sortdict = $('#sortdict').val();
		    
		    window.location.href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/${currentPage}?petArea="+petArea+"&petSpecies="+petSpecies+"&sortField="+sorting+"&sortDir="+sortdict;
		  })  
		  $('#sortdict').change("click", function() {
			  var petArea= $("#petAreaaa").val();
			  var petSpecies= $("#petSpeciesaa").val();
			  var sorting = $('#sort').val();  
		      var sortdict = $('#sortdict').val();	
		      
		    window.location.href="${pageContext.request.contextPath}/petadopt/selectpetareaandpetarea/page/${currentPage}?petArea="+petArea+"&petSpecies="+petSpecies+"&sortField="+sorting+"&sortDir="+sortdict;
		  })

		})
	</c:if>
	
</script>

</html>
