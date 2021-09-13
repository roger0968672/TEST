<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>領養首頁</title>
    <!--stylesheet-->
    <link rel='stylesheet' href="<c:url value='/PetAdopt/css/style.css' />" type="text/css" />
    <!--light-slider-css-->   
    <link rel="stylesheet" type="text/css" href="<c:url value='/PetAdopt/css/lightslider.css'/>">
    <!--jQuery-------->  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--light-slider-js-->
    <script src="<c:url value='/PetAdopt/js/lightslider.js'/>"></script>
    <!--fav-icon------------------->
    <link rel="shortcut icon" href="<c:url value='/Member/images/fav-icon.ico'/>" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
<!-- Latest compiled JavaScript -->

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

    
    
           .div2 a {
          display:block;
          text-align:center;
          color:gray;
      } 
        .test{
            text-align: center;
            margin-top: 30px;
            margin-bottom: 100px;
            
        }
        #petsearcha{
          margin-left: 40px;  
        }
       #petSpeciesa{ margin-left: 40px; 
        }
        #petSelectDiv a{
        text-decoration: none;
        color:#009100;
        }
        select{
        color:#0080FF;
        }
        #petSelect{
        background-color: lightblue;
        border-radius:5px;    
        color:#484891;
        }
        #peterror{
    color:red;
    text-align: center;
   }
   .petselectoptiona{
    font-size:24px;
   }
   #pethitsdiv p{
   margin:2px;
   }
   #pethitsdiv h3{
   margin:5px;
   }
   a:hover{
   
   }
   #pethitsdiv{
   border:2px solid #FFA042;
   border-radius:15px;
   width:300px;
   margin-left:15px;
   }
   #petHitsBigDiv{
    height:200px;
    position:relative;
    top:0px;
    left:250px;
    width:1600px;
   }
   #pethitsdiv p{
   color:#2894FF;
   }
   
   #pethith1{
   position:relative;
    top:0px;
    left:60px;
   }
   
   .services{
   width:1300px;
   }
   .petdivdiv{
	color: green;
	
	
}
    </style>

</head>

<body>
    <!--navigation-------------------------------->
    
    <%@include file="../common/nav.jsp" %>

<!----------------------------------------------NEW!!Strat!!-------------------------------------------->



<!--     nav  start       -->           
<nav class="sidenav"> 
   <!-- 找所有寵物 start -->
	<div id="firstpaneDiv" style="width: 200px; height: 40px;"class="menu_list ">
	      <h3 class="menu_head current"
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;"><a class="hovera"  href="<c:url value='/petadopt/petAdoptselectAll'/>">找尋所有寵物</a></h3>
		<div style="display: none" class="menu_nva">
		</div>
	<!-- 找所有寵物 end -->
			<!-- 站內統計 start-->
			<div id="firstpaneDiv" style="width: 200px; height: 40px;"class="menu_list ">
	      <h3 class="menu_head current"
			style="align-content: center; text-align: center; padding: 0px; font-size:20px;"><a class="hovera"  href="<c:url value='/petadopt/sc'/>">待領養寵物統計</a></h3>
		<div style="display: none" class="menu_nva">
		</div>
			
			<!-- 站內統計 end -->
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
		 
		
	</div>	
</nav>
<!--  nav end -->       





<!-- select -->
<div class="test"  style="margin-left: 40px;">
    <div>
     <form method="get" action=""  class="petfo">
            <section class="new-arrival box">  
       <div class="block">
   
       <div class="input-group input-group-lg div">

						<label  class="input-group-text petdivdiv petselectoptiona" for="inputGroupSelect01" style="margin-left: 40px;">所在地區</label>
                        <select  class="form-select petbreeds petselectoptiona" id="petArea" name="petArea">
						<option value=""></option>
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
                        
                        
                        
                       <label  class="input-group-text petdivdiv petselectoptiona" for="inputGroupSelect01" id="petsearcha">寵物種類</label>
                        <select  class="form-select petbreeds petselectoptiona" id="petSpeciesSelect" name="petSpecies" >
					   <option></option>
                       <option value="貓">貓</option>
                       <option value="狗">狗</option>
                       <option value="鳥">鳥</option>
                       <option value="鼠">鼠</option>
                       <option value="兔">兔</option>
                       <option value="龜">龜</option>
                       <option value="蛇">蛇</option>
                       <option value="豬">豬</option>
                        </select>
                       
                        <span class="input-group-text  petdivdiv petselectoptiona" style="margin-left: 40px; ">關鍵字搜尋</span>
                        <input type="search" style="margin-left:1px" id="petsearch" value="" name="seachpet" class=" petselectoptiona form-select"  placeholder="最少輸入一字搜尋寵物">
                        <input type="button" value="尋找寵物" id="petSelect" class="petselectoptiona">      
                    </div>
   </div>
    </section>     
       </form>
           </div>
         
       <!-- select end -->  	
      
    <!-- test -->
                <c:if test="${error !=null}" >
                   <h1 id="peterror">${error}</h1>
                </c:if>
               
               
              <c:if test="${not empty Hits}">
                  
                   <h1 style="color:red; font-size:44px;text-shadow:4px 4px 4px #BEBEBE;" id="pethith1">點擊率TOP5</h1>
                   <div id="petHitsBigDiv product-box" style="margin-left: 200px;"> 
                    <c:forEach items="${Hits}" var="pas">
                       <div id="pethitsdiv" style="float:left;background-color:linen;" class="petadoptdiv">
                       
                          <img style="margin-top:10px; width:100px;height:100px;" class="card-img-top" src="<c:url value='/petadopt/responseImage1.controller?petID=${pas.petID}'/>" id="petimg">
                          <h3 style="color:brown;">寵物名稱：<c:out value="${pas.petName}"/></h3>
                          <P>寵物種類：<c:out value="${pas.petSpecies}"/></P>
                          <p>寵物性別：<c:out value="${pas.petGender}"/></p>
                          <p>所在區域：<c:out value="${pas.petArea}"/></p> 
                          <p>觀看數：<c:out value="${pas.petHits}"/></p>
                          <p>最後更新日期：<c:out value="${pas.petInsertDay}"/></p>
                          <form id="form" method="get"
				          action="<c:url value='/petadopt/select/pet'/> ">
				          <input type="Hidden" name="petID" value="${pas.petID}"> <input
					      type="submit"  value="查看寵物" style="margin:5px;background-color:
                          #CAFFFF;border-radius:10px;width:80px;height:30px; font-size:16px;">
			              </form>
                       
                       </div>
                    </c:forEach>
                    </div>  
              </c:if>  
                
                
               
 </div>               
                
                
                
               
               
              



<!--    <div> -->
 
<!--  <section class="section1"> -->
<!--                     <div class="div2 select"> -->
<%--                          <a href="<c:url value='/petadopt/petAdoptselectAll'/>">查詢待領養寵物</a> --%>
<!--                     </div> -->
<!--                      <div class="div2 insert"> -->
<%--                           <a href="<c:url value='/petadopt/petInsert'/>">刊登送養寵物</a> --%>
<!--                      </div> -->
                    
<!--                      <div class="div2 insert"> -->
<%--                           <a href="<c:url value='/petadopt/addbird' />">圓餅圖</a> --%>
<!--                      </div> -->
                      
<%--                      <c:if test="${memberid !=null}" > --%>
<!--                      <div class="div2 insert"> -->
<%--                           <a href=" <c:url value='/petadopt/backstagePetAdopt' />">寵物後台管理</a> --%>
<!--                      </div> -->
<%--                      </c:if> --%>
                     
<!--                  </section> -->
<!--  </div> -->
                 

<!--  error -->

                
<!--services--------------------------------------------->
    <section class="services">
        <!--service-box-1-------------------->
        <div class="services-box" style="width:50px;">
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
     <%@include file="../common/footer.jsp" %>














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
  
  /*  */
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
  
  /*   */
  $("#petSelect").click(function(){
	 var petSpecies=$("#petSpeciesSelect").val();
	 var petArea=$("#petArea").val();
	 var petsearch=$("#petsearch").val();
     if(petSpecies!="" && petArea==""){
			 $(".petfo").attr("action","selectpetspecies");
		 	 $("#petSelect").attr("type","submit");
			}
     else if(petSpecies==""  && petArea!=""){
    	     $(".petfo").attr("action","selectpetarea");
	 	     $("#petSelect").attr("type","submit");
         }
     else if(petSpecies!="" && petArea!=""){
    	 $(".petfo").attr("action","selectpetareaandpetarea");
 	     $("#petSelect").attr("type","submit");
         }
     else if(petsearch!="" && petSpecies=="" && petArea==""){
         $(".petfo").attr("action","seachpetadopt");
	     $("#petSelect").attr("type","submit");
         }
	  })
	   
	  
    </script>
</body>

</html>