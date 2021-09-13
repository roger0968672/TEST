<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:title" content="可愛的毛小孩,快來領養!!" />
    <meta property="og:image" content="${shareurl}/petpet/petadopt/responseImage1.controller?petID=${pab.petID}"/>
    <meta property="og:description" content="PETPET寵物網，毛小孩想要的東西全都在這裡" />
    <title>寵物查詢</title>
    <!--stylesheet-->
   
     <!--stylesheet-->
    <link rel='stylesheet' href="<c:url value='/PetAdopt/css/style.css' />" type="text/css" />
    <!--light-slider-css-->
    <link rel="stylesheet" type="text/css" href="<c:url value='/PetAdopt/css/lightslider.css'/>">
    <!--jQuery-------->        
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
    <!--light-slider-js-->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>

    <!--fav-icon------------------->
    <link rel="shortcut icon" href="<c:url value='/Member/images/fav-icon.ico'/>" />
    <!--using-FontAwesome-for-Icons--> 
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    
        <!--引用SweetAlert2.js-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


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
    
    
    
      .filedsetpet p{  margin-left: 40px ;
            margin-bottom: 10px;    
            color: 	#930000;
            
              
        }
      
        fieldset    {
         
            border-radius: 15px;
            width: 650px;
            margin: 20px;
            
            
                    }
        #petbasicdiv{
         position:relative;
             top:0px;
              left:620px;
              margin:0px;
              width:200px;
        }
        
        
      
        input{ 
        margin-left:2px;
        }
 
   
       *{
        margin: auto;
        padding: auto;
       }
       .img1{
      width:350px;
      height: 280px;
 
      }
      .petDivImg{
            position: relative;
            width:350px;
            height:280px;
            overflow:hidden;
            margin:0 auto;   
        }
    
  
     .petdot{
            bottom:10px;
            width:100%;
            display: flex;
            justify-content: center;
            
        }
        .petdot li{
            border:1.5px solid ;
             border-radius: 20%; 
            margin: 0 5px;
            width:20px;
            height: 10px;
            color:cornflowerblue;
        }
        .petul1{
            width: 750px;  
            left: 0px;
            transition: all 1s;
            display: flex;
            margin:0;
            padding: 0;
            position: absolute;
            }
        .petul1 li{
         list-style: none;
        }
         .filedsetpet legend{
         color:	#AE57A4;
         font-size:40px;
         } 
          .share1{
        width: 70px;
        height: 70px;
        border-radius: 10px;
        margin-top: 10px;
      }
      #petshare{
        width: 600px;
        background-color: #FFD306;  
        color: #000000;
        text-align:center;
        margin-bottom:10px;
      }
      
       .petsmallimg{
         width:100px;
         height:100px;
           }
      #smallimg1{
      border:2px solid red;
      }
     #petbasic p{font-size:24px; }       
     #pethitsdiv{
             height:40px;
             width:90px;
             position: relative;
             top:-980px;
             left:500px;
     } 
     #petlikeimg{
             position: relative;
             top:-790px;
             left:500px;
             width:100px;
             height: 100px;   
     }	
     #petmainfacea:hover{
      color:	#AAAAFF;
     }
     
     .blackimg{
     -webkit-filter:grayscale(1);
     }
     .petcheckaccept{
             position:relative;
             top:-1000px;
             left:700px;
             width:400px;
            
     }
     .petcheckaccept h1{
     margin:5px;
     }
     .petcheckaccept p{
      font-size:20px;
      margin:0px;
      margin-left:20px;
      height:30px;
     }
    </style>

</head>

<body>
    <!--navigation-------------------------------->
     <%@include file="../common/nav.jsp" %>
     
     <!-- nav -->
     
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
    
         <c:if test="${checkpet !=null}"> 
          <a style="text-align: center; width: 160px; margin-left:40px;" id="petmainfacea" href="<c:url value='/petadopt/' />"><h1>${checkpet}</h1><h1>按此返回認領首頁</h1></a>   
         </c:if>
         
    <div  id="petbasicdiv">
    <fieldset  class="filedsetpet" style="background-color: linen;">
   
        <legend style="margin-left: 270px;"><b>寵物資料</b></legend>
             <div  class="petDivImg" >
                     <ul class="petul1">                                                      
                         <li><img class="img1" id="imgid1" src="<c:url value='/petadopt/responseImage1.controller?petID=${pab.petID}'/>" ></li>
                         <li><img class="img1" id="imgid2" src="<c:url value='/petadopt/responseImage2.controller?petID=${pab.petID}'/>" ></li>
                         <li><img class="img1" id="imgid3" src="<c:url value='/petadopt/responseImage3.controller?petID=${pab.petID}'/>" ></li>
                    </ul>
             </div> 
                 
  
  <input type="hidden" value="${pab.petID}" id="petida">
  
               <div align="center" class="petsmalldiv" > 
                    <img id="smallimg1" class="petsmallimg"  src="<c:url value='/petadopt/responseImage1.controller?petID=${pab.petID}'/>" >
                    <img class="petsmallimg"  src="<c:url value='/petadopt/responseImage2.controller?petID=${pab.petID}'/>" >
                    <img class="petsmallimg"  src="<c:url value='/petadopt/responseImage3.controller?petID=${pab.petID}'/>" >
               </div>

            <div id="petbasic">
               <p><a> 寵物姓名 :</a><c:out value="${pab.petName}"/></p> 
               <p><a> 寵物性別 :</a><c:out value="${pab.petGender}"/></p>
               <p><a> 寵物種類 :</a><c:out value="${pab.petSpecies}"/></p>
               <p><a> 寵物毛色 :</a><c:out value="${pab.petColor}"/></p>
               <p><a> 寵物品種 :</a><c:out value="${pab.petBreeds}"/></p>
               <p><a> 是否結紮 :</a><c:out value="${pab.petLigation}"/></p>
               <p><a> 所在地區 :</a><c:out value="${pab.petArea}"/></p>
               <p><a> 其他描述內容 :</a><c:out value="${pab.petNarrate}"/></p>  
               <p><a>最後修改時間：</a>${pab.petInsertDay}
                
   <input type="button" id="petadoptbtn" value="我要領養" 
   style="margin-left: 480px;height:40px;width:100px; font-size:20px;border-radius: 10px;
   background-color:	#4A4AFF;color:#FFFFFF">
   
   
  <div id="petshare" >  
  <a >點擊分享</a>   
  <a href="http://line.naver.jp/R/msg/text/?PETPET寵物網，可愛的寵物都在這!!快來領養吧!!!%0D%0A${shareurl}/petpet/petadopt/select/pet?petID=${pab.petID}">
  <img class="share1" src="<c:url value='/PetAdopt/petimage/share-c.png'/>"/></a>
  
  <a href="https://www.facebook.com/sharer.php?u=${shareurl}/petpet/petadopt/select/pet?petID=${pab.petID}&quote=可愛的毛小孩快來領養!!" target="_blank">
  <img class="share1" src="<c:url value='/PetAdopt/petimage/1628644538769.jpeg'/>" /></a>
  </div> 
     
    
           
                        
             </div>    
   
        </fieldset>
        
     
      
       <div id="petlikeimg">
          <p id="petlikep" style="color:#930000; font-size:24px;">加入最愛 </p>
          <img id="petlikeimgin" class="blackimg" style="width:100px; height: 100px;" src="<c:url value='/PetAdopt/petimage/favorites-33054.jpg'/>" >
       </div>             
                <div id="pethitsdiv">
                   <a style="color:	#930000; font-size:30px;" >觀看數</a><a style="color:	#46A3FF;margin-left:50px; font-size:24px;">${pab.petHits}</a>
                </div>
      
      
      
        <c:if test="${not empty checkaccept && checkaccept=='正確'}">
     <div style="background-color:#99BBFF;height: 190px;" class="petcheckaccept">
        <h1>發布人聯絡資料</h1>
        <P>聯絡人：<c:out value="${pab.testmember.fullname}"/></P>        
        <P>電話：<c:out value="${pab.testmember.mobile}"/> </P>
        <P>信箱：<c:out value="${pab.testmember.email}"/> </P>
           <form method="post" action="/petpet/petadopt/petadoptfinish">
              <P><input type="button" id="petadoptbtnfin" value="領養完成" style="height:40px; font-size:24px;margin-left:260px;
              background-color:#E63F00;color:	#DDDDDD;border-radius: 10px;"></P>
              <input type="hidden" name="petID" value="${pab.petID}">
           </form>
     </div>
    </c:if>
       
       
    <c:if test="${not empty checkaccept && checkaccept=='領收'}">
     <div style="background-color:#99BBFF" class="petcheckaccept">
        <h1>領養人聯絡資料</h1>
        <P>聯絡人：<c:out value="${petAdoptMember.fullname}"/></P>        
        <P>電話：<c:out value="${petAdoptMember.mobile}"/> </P>
        <P>信箱：<c:out value="${petAdoptMember.email}"/> </P>
     </div>
    </c:if>
  
     <c:if test="${not empty checkaccept && checkaccept=='完成'}">
     <div style="background-color:#46A3FF" >
        <h1>已完成領養</h1>  
     </div>
    </c:if>
 </div>

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
    likepetcheck();
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
   
   var showNum=0;
   time1 =setInterval(show,2000);//每隔一秒跑show
   var imgle =$(".petul1>li").length;
   //console.log(imgle);
   var lastimgle=imgle-1;
   //console.log(lastimgle);
    $(".img1").hover(function(){//指到圖片停止自動輪播
           clearInterval(time1);
       },function(){//離開圖片繼續撥放
        time1 =setInterval(show,1500);
       })
   
   
   
   function show(){ //播放內容
       if(showNum>lastimgle){showNum=0;} //若跑超出圖的範圍 num歸0
           let slidemove=-350*showNum;    //總寬度750 有四張圖 用-250*num的方式輪播
           //console.log(slidemove);  //查看位置
           $(".petul1").css("left",slidemove); //往左移動到指定位置
           $(".petsmalldiv img").eq(showNum).css("border","2px solid red").
           siblings().css("border","transparent");
           showNum+=1;//每跑一次 num自動+1
   } 
    $(".petsmalldiv img").hover(function(){
       imgindex=$(this).index();
       //console.log("img的數字"+imgindex)
       $(".petsmalldiv img").eq(imgindex).css("border","2px solid red").
       siblings().css("border","transparent");
       showNum=imgindex;
       show();
       clearInterval(time1);
    },function(){
        time1 =setInterval(show,1500);
        $(".petsmalldiv img").css("border","transparent");
    })
   
   $("#petlikeimg").click(function(){
      petid=$("#petida").val();
      console.log(petid);
      uri="/petpet/petadopt/likepet/"+petid;
      $.ajax({  
    	  type :"post",
          url :uri,
          success: function(response) {
              if(response =="true"){
            	  swal("已加入最愛", "", "success");
                  $("petlikeimgin").removeClass();
                 // $("#petlikeimgin").attr("-webkit-filter","grayscale(1)");
                  $("#petlikep").html("已加入!!");
                  $("#petlikeimgin").removeClass();
                  }
              else if(response =="nologin"){
            	  swal("尚未登入會員", "", "error");
                  }
              else{
            	  swal("已取消", "", "success");
            	  $("#petlikeimgin").addClass("blackimg");
            	  $("#petlikep").html("加入最愛");
               }
          },
          complete: function(XMLHttpRequest, textStatus) { },
          error: function(){
             console.log(petid);}
          });
   });

     var  btnflag=1;
    $("#petadoptbtn").click(function(){
  	  petid=$("#petida").val();
        uri="/petpet/petadopt/actionchange/"+petid;
        $.ajax({ 
              type:"post",
              url:uri,
              success:function(response){
              if(response=="true"){
              	//swal("認養成功", "已認養寵物", "success");
                 swal({
	          title: "認養成功",
	          html: "",
	          type: "success",
	          showCancelButton: false//顯示取消按鈕
	      }).then(
	          function (result) {         
	              if (result.value===true) {
	            	  btnflag=0; //讓數字判斷變成0
	                  //使用者按下「確定」要做的事
	                  window.location.href="<c:url value='/petadopt/select/pet?petID="+petid+"'/>";
	                    }                         
	          });//end then 
              	
              }
              else if(response=="errorsame"){
              	swal("你這個小壞壞居然想認養自己刊登的寵物", "", "error");
              }
              else if(response=="nologin"){
              	swal("尚未登入會員", "", "error");
              }
              else if(response=="actionsame"){
              	swal("已領養", "", "error");
              }

              }
              ,complete: function(XMLHttpRequest, textStatus){ }
              ,error:function(){
                     alert("error");
                      }
            })      
  	 });






    
    swal.setDefaults({
        confirmButtonText:"確定",
        cancelButtonText:"取消"
    });

    function likepetcheck(){
      <c:if test="${not empty likepet }">
      $("#petlikep").html("已加入!!");
      $("#petlikeimgin").removeClass();
      </c:if>
        }

    var petTestInt=1;
    $("#petadoptbtnfin").click(function(){
    	  if(petTestInt===1){  

    		  swal({
    	          title: "是否領養完成？",
    	          html: "按下確定後就無法取消",
    	          type: "question",
    	          showCancelButton: true//顯示取消按鈕
    	      }).then(
    	          function (result) {         
    	              if (result.value===true) {
    	            	  petTestInt=0; //讓數字判斷變成0
    	                  //使用者按下「確定」要做的事
    	                   swal({title:"領養完成!!",
    	                         type:"success",
    	                         showCancelButton:false}).then(function(result1){//多寫一行判斷,避免強制跳掉
    	                            if(result1.value){
    	                            
    	                            	$("#petadoptbtnfin").attr("type","submit");
    	                                $("#petadoptbtnfin").click();                    
    	                             }//if判斷式
    	                    })                  
    	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
    	                  swal("取消成功", "回到原頁面", "success");
    	              }//end else  
    	          });//end then 

    		  }

        })
  /*   */
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
	/*   */
    
    </script>
</body>

</html>