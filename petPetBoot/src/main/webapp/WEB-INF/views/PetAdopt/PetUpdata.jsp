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
<title>修改寵物資料</title>
<<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
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
 <link rel="shortcut icon" href="<c:url value='/Member/images/fav-icon.ico'/>" />
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

.menu_nva a {
	display: block;
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

.test {
	width: 1200px;
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
            margin-left:170px;
       }
	   #petInsertCell{
           display: table-cell;
           vertical-align: middle;
		  
       }
	   #petInsertCell div{
		margin: 15px;
	    width: 500px;
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
		width: 490px;
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
#petInsertCell div{
 margin-top: 10px;
}
#petInsertCell .petbreeds{
    width: 100px;
}
.petdivdiv{
	color: white; 
	background-color: lightskyblue;
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
.hovera:hover{
text-decoration:none;}

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
	<!--new-arrival------------------->
	<section class="new-arrival box">
		<!--heading------->
		
		 <div class="block" id="petInsertView">
			
            <div class="dataBlock" id="petInsertCell">
				<h1 >修改寵物資料</h1>
                <form  method="post" action="" enctype="multipart/form-data" class="fo"> 
                    <input type="hidden" name="petID" value="${pas.petID}">
                    <div class="input-group input-group-lg div">
                        <span class="input-group-text  petdivdiv">寵物名稱</span>
                        <input type="text"  class="form-control" placeholder="最多輸入10字" name="petName" 
						style="width: 30px;" id="petID" onblur="checkpetname();" value="${pas.petName}">
                    </div>
                    <a id="petnamea" class="peterrora"></a>
					<input type="hidden" name="petGender" value="${pas.petGender}">
					<input type="hidden" name="petSpecies" value="${pas.petSpecies}" class="spe">

					<div class="input-group input-group-lg div">
                        <span class="input-group-text petdivdiv" >寵物毛色</span>
                        <input type="text" class="form-control"  name="petColor" id="petcolor" 
						style="width: 30px;" onblur="checkpetcolor();" value="${pas.petColor}">
                    </div>
					<a id="petcolora" class="peterrora"></a></p>

					<div class="input-group input-group-lg div">
                        <span class="input-group-text petdivdiv" >寵物品種</span>
                        <input type="text" class="form-control"  name="petBreeds" 
						style="width: 30px;" id="petbreeds" onblur="checkpetbreeds();" value="${pas.petBreeds}">
                    </div>
					<a id="petbreedsa" class="peterrora"></a></p>

                    <div class="input-group input-group-lg div">
                        <label  class="input-group-text petdivdiv" for="inputGroupSelect01">是否結紮</label>
                        <select  class="form-select petbreeds" id="inputGroupSelect01" name="petLigation" >
                          <c:if test="${pas.petLigation =='有'}">
                            <option value="不確定">不確定</option>
							<option value="有" selected="selected">有</option> 
							<option value="無">無</option>
                           </c:if>
                           
                           <c:if test="${pas.petLigation =='無'}">
                            <option value="不確定">不確定</option>
							<option value="有" >有</option> 
							<option value="無" selected="selected">無</option>
                           </c:if>
                           
                           <c:if test="${pas.petLigation =='不確定'}">
                            <option value="不確定" selected="selected">不確定</option>
							<option value="有" >有</option> 
							<option value="無" >無</option>
                           </c:if>
							
                        </select>

					<label  class="input-group-text petdivdiv" for="inputGroupSelect01">所在地區</label>
                        <select  class="form-select petbreeds" id="inputGroupSelect01" name="petArea">
							<option>${pas.petArea}</option>
							<option value="台北市">台北市</option>
							<option value="新北市">新北市</option>
							<option value="基隆市">基隆市</option>
							<option value="宜蘭縣">宜蘭縣</option>
							<option value="桃園市">桃園市</option>
							<option value="新竹市">新竹市</option>
							<option value="新竹縣">新竹縣</option>
							<option value="苗栗縣">苗栗縣</option>
							<option value="台中市">台中市</option>
							<option value="彰化縣">彰化縣</option> 
							<option value="南投縣">南投縣</option>
							<option value="嘉義市">嘉義市</option>
							<option value="嘉義縣">嘉義縣</option>
							<option value="雲林縣">雲林縣</option>
							<option value="台南市">台南市</option>
							<option value="高雄市">高雄市</option>
							<option value="澎湖縣">澎湖縣</option>
							<option value="金門縣">金門縣</option>
							<option value="屏東縣">屏東縣</option>
							<option value="台東縣">台東縣</option>
							<option value="花蓮縣">花蓮縣</option>
							<option value="連江縣">連江縣</option>
                        </select>
                    </div>
                   
					<span id="picAdoptTexta2"></span>
                    <div class="input-group ">
                        <span class="input-group-text petdivdiv" style="height: 95px;">其他描述內容</span>                                            
                        <textarea class="form-control" aria-label="With textarea" cols="30" rows="3" id="picAdoptText1" name="petNarrate" onblur="checkpetarea()">${pas.petNarrate}</textarea>
                      </div>  <a id="petareaa" class="peterrora"></a>
					  <input type="hidden" name="petInsertDay" id="insertday">


                
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text petdivdiv">寵物圖片1</span>
                        <input type="file" class="form-control" name="petPic1" id="petpic1" accept="image/*">
                    </div>
					<img id="img1" class="imgpic1" src=" <c:url value='/petadopt/responseImage1.controller?petID=${pas.petID}'/>" >
					<div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text petdivdiv">寵物圖片2</span>
                        <input type="file" class="form-control" name="petPic2" id="petpic2" accept="image/*">
                    </div>
					<img id="img2" class="imgpic1" src=" <c:url value='/petadopt/responseImage2.controller?petID=${pas.petID}'/>" >
					<div class="input-group flex-nowrap input-group-lg div ">
                        <span class="input-group-text petdivdiv" >寵物圖片3</span>
                        <input type="file" class="form-control" name="petPic3" id="petpic3" accept="image/*">
                    </div>
					<img id="img3" class="imgpic1" src=" <c:url value='/petadopt/responseImage3.controller?petID=${pas.petID}'/>" >

                    

			        <div class="btnBlock gap-3 col-6 mx-auto container">
						<input type="button" value="送出" class="button btn btn-success" id="enter" style="width:80px;height:40px; ">
						<input type="reset" value="重新編寫" class="button btn btn-success" style="width:100px;height:40px; " id="reset"> 
                    </div>
                </form>
                <div class="last"></div>
            </div>
        </div>

          
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
		 //日期
		  $("#petID").click(function(){
		    	var date1= new Date();
		     	var year =date1.getFullYear();
		     	var mon  =(date1.getMonth()+1)>10? (date1.getMonth()+1):"0"+(date1.getMonth()+1);
		     	var day  =(date1.getUTCDate()<10)? "0"+date1.getUTCDate():date1.getUTCDate();
		     	var cs= year+"年"+mon+"月"+day+"日";
		     	console.log(cs);
		     	$("#insertday").val(cs);
		    })
		          
		   //圖片1
		   $("#petpic1").change(function() {  
		       $("#img1").css("display","block"); 
			   var file = $("#petpic1")[0].files[0];
			   var reader = new FileReader;
			   reader.onload = function(e) {
			   $('#img1').attr('src', e.target.result);
			   };
			  reader.readAsDataURL(file);
			})
			  
		   //圖片2
		   $("#petpic2").change(function() {  
		       $("#img2").css("display","block"); 
			   var file = $("#petpic2")[0].files[0];
			   var reader = new FileReader;
			   reader.onload = function(e) {
			    $('#img2').attr('src', e.target.result);
			   };
			  reader.readAsDataURL(file);
		    })
			  
		   //圖片3
		   $("#petpic3").change(function() {  
		       $("#img3").css("display","block"); 
			   var file = $("#petpic3")[0].files[0];
			   var reader = new FileReader;
			   reader.onload = function(e) {
			   $('#img3').attr('src', e.target.result);
			   };
			   reader.readAsDataURL(file);
			})

		    move_div();
		     $(window).resize(move_div);
		  function move_div() {
		      let windowWidth=$(this).width();
		      let objWidth=$(".petInsertView").width();
		      let wi =  objWidth/windowWidth;   // 抓寬度縮放比例
		      let wit=  windowWidth * wi; //寬度比例
		    $(".petInsertView").css("width",wit)   
		     let left=( windowWidth-wit)/2;

		     $(".petInsertView").css("left",left)
		}   

		   //計算文字
		   $.fn.extend({
		         wordCount: function (maxLength, wordWrapper) {
		         var self = this;
		         $(self).attr("maxlength", maxLength);//最多輸入的字數
		         showWordCount();
		         $(this).on("input propertychange", showWordCount);//input propertychange當input的屬性發生改變就觸發 
		     function showWordCount() {
		        curLength = $(self).val().length;
		        var leaveCount = maxLength - curLength;
		        wordWrapper.text("其他描述內容還可輸入"+leaveCount+"字").css("color","blue");
		      }
		        }      
		   })
		  $(function () {
		    $("#picAdoptText1").wordCount(90, $("#picAdoptTexta2"));
		  })
		   //---------------------------------------------------------------------------
//------------------------------------------------------------------
     
	  
	   
         
var petnameflag=true;
var petcolorflag=true;
var petbreedsflag=true;	 
var petareaflag=true;

//------------------檢查欄位
function checkpetname(){
	 petName=$("#petID").val();
	if(petName.length==""){
		$("#petnamea").html("未輸入寵物名稱");
		$("#petnamea").css("display","inline");
		petnameflag=false;
	}
	else{
		$("#petnamea").html(" ");
		$("#petnamea").css("display","none");
		petnameflag=true;}
}
function checkpetcolor(){
	 petcolor=$("#petcolor").val();
	if(petcolor.length==""){
		$("#petcolora").html("未輸入寵物毛色");
		$("#petcolora").css("display","inline");
		petcolorflag=false;}
	else{
	   $("#petcolora").html(" ");
	   $("#petcolora").css("display","none");
	   petcolorflag=true;
  }
}
function checkpetbreeds(){
	var petbreeds=$("#petbreeds").val();
  if(petbreeds.length==""){
     $("#petbreedsa").html("未輸入寵物品種");
     $("#petbreedsa").css("display","inline");
     petbreedsflag=false;
  }else{
  	$("#petbreedsa").html(" ");
  	$("#petbreedsa").css("display","none");
  	petbreedsflag=true;
  }
}

function  checkpetarea(){
	 var petarea=$("#picAdoptText1").val();
	 if(petarea.length==""){
		 $("#petareaa").html("未輸入描述內容");
		 $("#petareaa").css("display","inline");
		 petareaflag=false;
	}else{
		$("#petareaa").html(" ");
		$("#petareaa").css("display","none");
		petareaflag=true;}
}
//下方為confirm API 有夠長= =
swal.setDefaults({
            confirmButtonText:"確定",
            cancelButtonText:"取消"
        });
  var petTestInt=1;
  $("#enter").click(function(){
	checkpetname();
	checkpetcolor();
	checkpetbreeds();
	checkpetarea();
  if(petnameflag && petcolorflag && petbreedsflag &&  petareaflag){
	  if(petTestInt===1){  	 
		  swal({
	          title: "確定修改？",
	          html: "按下確定後資料將被修改",
	          type: "question",
	          showCancelButton: true//顯示取消按鈕
	      }).then(
	          function (result) {
	        	  var date1= new Date();
	              var year =date1.getFullYear();
	              var mon  =date1.getMonth()+1;
	              var day  =date1.getUTCDate();
	             // var datetime="2021年08月09日";
	            var datetime = date1.getFullYear()+ "年"
	          + ((date1.getMonth() + 1) > 10 ? (date1.getMonth() + 1)+"月" : "0"
	          + (date1.getMonth() + 1 + "月"))
	          + (date1.getDate() < 10 ? "0" + date1.getDate()+"日" : date1
	                  .getDate()+"日");
	            $("#insertday").val(datetime);            
	              if (result.value===true) {
	            	  petTestInt=0; //讓數字判斷變成0
	                  //使用者按下「確定」要做的事
	                   swal({title:"修改成功",
	                         type:"success",
	                         showCancelButton:false}).then(function(result1){//多寫一行判斷,避免強制跳掉
	                            if(result1.value){
	                            	$(".fo").attr("action","petUpdate.controller");
	                                $("#enter").attr("type","submit");
	                                $("#enter").click();                    
	                             }//if判斷式
	                    })                  
	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
	                  swal("取消成功", "資料未修改", "error");
	              }//end else  
	          });//end then 
 
		  }
		}else{
  	 swal("資料尚未輸入完成", "", "error");
       }
  });
	</script>
</body>
</html>