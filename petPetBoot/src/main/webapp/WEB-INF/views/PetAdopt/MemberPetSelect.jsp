<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>待領養寵物</title>
     <!--stylesheet-->
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

<!-- Popper JS -->
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" /> 



    <style>
       
      th{text-align: center;
      color:#984B4B;
      }
      .table td{
      font-size:20px;
      text-align:center;
      vertical-align:middle;
      }   
        .div3{
             width: 400px;
        }
        .p1{
             text-align: center;
        }
        input{ 
        margin-left:2px;
        }
        .div2 a {
     display:block;
     text-align:center;
     color:gray;
      } 

 

   *{
      margin: auto;
      padding: auto;
       }
   .td{
    display:none;
    }  
    #petimg{
  width:100px;
  height:100px
  }
  /* */
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

   *{
	margin: auto;
	padding: auto;
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

.table a:hover{
color:	#9F4D95;
text-decoration:none;
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

.table{
width:1400px;
position: relative;
left:80px;
}
.deletebtn{background-color:red;}
  .updatebtn{background-color:lightblue;}
  .petbtn{border-radius: 10px;
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
<!----------------------------------------------NEW!!Strat!!-------------------------------------------->
         
            
		<div  style="margin-top:10px;">
		<h1 style="color:#97CBFF; font-size:40px; text-align:center;" >會員待領養寵物資料</h1>
		    <c:if test="${not empty petupdataerror }"> 
               <h3 style="text-align: center;color:red;">${petupdataerror}</h3>
             </c:if>
			<table id="contentTable"  class="table table-hover rgba" style="background-color: linen;">
				<thead>

					<tr>
						<th class="text-center" scope="col" style="width:200px;">寵物名稱</th>
						<th scope="col" style="width: 140px;">寵物圖片</th>
						<th scope="col" style="width: 120px;">寵物性別</th>
						<th scope="col" style="width: 120px;">寵物類別</th>
						<th scope="col" style="width: 120px;">寵物毛色</th>
						<th scope="col" style="width: 160px;">寵物種類</th>
						<th scope="col" style="width: 120px;">是否結紮</th>
						<th scope="col" style="width: 120px;">地區</th>
						<th scope="col" style="width: 280px;">更新日期</th>
						<th scope="col" style="width: 220px;">目前狀態</th>
					</tr>
				</thead>
				<tbody>
                <form method="post" action=" " class="fo">  
				<c:forEach items="${PetAdopts}" var="pas" varStatus="s">


					
						<tr>
						    <td class="td">${pas.petID}</td>
							<td><a href="<c:url value='/petadopt/select/pet?petID=${pas.petID}'/>">${pas.petName}</a></td>
							<td><img src="<spring:url value='/petadopt/responseImage1.controller?petID=${pas.petID}'/>" id="petimg"></td>
                            <td>${pas.petGender}</td>
                            <td>${pas.petSpecies}</td>
                            <td>${pas.petColor}</td>
                            <td>${pas.petBreeds}</td>
                            <td>${pas.petLigation}</td>
                            <td>${pas.petArea}</td>
                            <td>${pas.petInsertDay}</td>
                            
                            
                            <c:if test="${pas.petAction ==1 }">
                            <td><p>被領養中</p><p>不可修改資料</p></td>
                            <td colspan="2"><a href="<c:url value='/petadopt/select/pet?petID=${pas.petID}'/>">查看聯絡資料</a></td>
                            </c:if>
                            
                            <c:if test="${pas.petAction ==0 }">
                            <td><p>未被領養</p><p>可修改資料</p></td>
                            <td><input type="button" value="修改" class="updatebtn petbtn"></td>
                            <td><input type="button" value="刪除" class="deletebtn petbtn"></td>  
                            </c:if>
                            
                            <c:if test="${pas.petAction == 2 }">
                               <td><p>已領養完成</p><td>
                               <td colspan="2"><input type="button" value="刪除" class="deletebtn petbtn"></td>
                            </c:if>    
						    <c:set var="petID" value="${pas.petID}"/>
						 </tr>							
		            
				</c:forEach>
				    <div class="displaydiv">
                        <input type="hidden" name="petID" value="" id="petID">
                    </div>
				</form>
				 </tbody>
				<c:set var="petID" value="${pas.petID}"/> 
			</table>				
		</div>						
								
			
							
							
								
							
	
		





<!-- old -->








                               
    
    
    
    
     
        












<!--services--------------------------------------------->
    <section class="services">
        <!--service-box-1-------------------->
        <div class="services-box">
            <i class="fas fa-shipping-fast"></i>
            <span>免運費</span>
            <p>額滿即享免運費</p>
        </div>

        <!--service-box-2-------------------->
        <div class="services-box">
            <i class="fas fa-headphones-alt"></i>
            <span>24小時客服</span>
            <p>提供即時在線服務</p>
        </div>

        <!--service-box-3-------------------->
        <div class="services-box">
            <i class="fas fa-sync"></i>
            <span>鑑賞期內 100%退款</span>
            <p>購回一周內若不滿意，享全額退款</p>
        </div>
    </section>

<!--footer--------------------------------------->
    <footer>
        <!--copyright----------------->
        <span class="copyright">
            Copyright 2021 - EEIT31全端工程師課程第7組
        </span>
        <!--subscribe--->
        <div class="subscribe">
            <form>
                <input type="email" placeholder="Example@gmail.com" required/>
                <input type="submit" value="Subscribe">
            </form>
        </div>
    </footer>















    <!--script-------->
    <script type="text/javascript">

        /*----For Search bar---------------------*/
        $(document).on('click', '.search', function () {
            $('.search-bar').addClass('search-bar-active')
        });

        $(document).on('click', '.search-cancel', function () {
            $('.search-bar').removeClass('search-bar-active')
        });

        /*--login-sign-up-form-----------------*/
        $(document).on('click', '.user,.already-acount', function () {
            $('.form').addClass('login-active').removeClass('sign-up-active')
        });

        $(document).on('click', '.sign-up-btn', function () {
            $('.form').addClass('sign-up-active').removeClass('login-active')
        });

        $(document).on('click', '.form-cancel', function () {
            $('.form').removeClass('login-active').removeClass('sign-up-active')
        });

        /*---full-slider-script--------------*/
        $(document).ready(function () {
            $('#adaptive').lightSlider({
                adaptiveHeight: true,
                auto: true,
                item: 1,
                slideMargin: 0,
                loop: true
            });
        });
        /*--Feature-slider--------------------*/
        $(document).ready(function() {
        $('#autoWidth').lightSlider({
        autoWidth:true,
        loop:true,
        onSliderLoad: function() {
            $('#autoWidth').removeClass('cS-hidden');
        } 
    });  
  });

  /*----for-fix-menu-when-scroll----------------------*/
  $(window).scroll(function(){
      if($(document).scrollTop() > 50){
          $('.navigation').addClass('fix-nav');
      }
      else{
        $('.navigation').removeClass('fix-nav');
      }
  })
  /*--for-responsive-menu-----------------*/
  $(document).ready(function(){
      $('.toggle').click(function(){
          $('.toggle').toggleClass('active')
          $('.navigation').toggleClass('active')
      })
  })
      
     //下方為confirm API 有夠長= =
  swal.setDefaults({
            confirmButtonText:"確定",
            cancelButtonText:"取消"
        });
  var petTestInt=1;
  $(".deletebtn").click(function(){   //刪除
	
	  if(petTestInt===1){  
		  petID=$(this).closest("tr").children().eq(0).text(); 
	  	  $("#petID").attr("value",petID);
	  	  console.log(petID);
		  swal({
	          title: "確定刪除？",
	          html: "按下確定後資料將被刪除",
	          type: "question",
	          showCancelButton: true//顯示取消按鈕
	      }).then(
	          function (result) {         
	              if (result.value===true) {
	            	  petTestInt=0; //讓數字判斷變成0
	                  //使用者按下「確定」要做的事
	                   swal({title:"刪除成功",
	                         type:"success",
	                         showCancelButton:false}).then(function(result1){//多寫一行判斷,避免強制跳掉
	                            if(result1.value){  	
	                            	$(".fo").attr("action","petDelete.controller");
	                    	    	$(".deletebtn").attr("type","submit");
	                                $(".deletebtn").click();                    
	                             }//if判斷式
	                    })                  
	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
	                  swal("取消成功", "資料未刪除", "success");
	              }//end else  
	          });//end then 
 
		  }
  })
  
  $(".updatebtn").click(function(){
	 
	  if(petTestInt===1){  
		  petID=$(this).closest("tr").children().eq(0).text();
	  	  petName=$(this).closest("tr").children().eq(1).text();
	  	  petGender=$(this).closest("tr").children().eq(2).text();
	  	  console.log(petID);
	  	  $("#petID").attr("value",petID);
		  
		  swal({
	          title: "是否修改資料？",
	          html: "按下確定後網頁將跳轉到修改頁面",
	          type: "question",
	          showCancelButton: true//顯示取消按鈕
	      }).then(
	          function (result) {         
	              if (result.value===true) {
	            	  petTestInt=0; //讓數字判斷變成0
	                  //使用者按下「確定」要做的事
	                   swal({title:"確定修改,按下確認跳轉頁面",
	                         type:"success",
	                         showCancelButton:false}).then(function(result1){//多寫一行判斷,避免強制跳掉
	                            if(result1.value){
	                            	$(".fo").attr("action","petUpdataView");
	                            	$(".updatebtn").attr("type","submit");
	                                $(".updatebtn").click();                    
	                             }//if判斷式
	                    })                  
	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
	                  swal("取消成功", "回到原頁面", "success");
	              }//end else  
	          });//end then 
 
		  }
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
    
     

    </script>
</body>

</html>