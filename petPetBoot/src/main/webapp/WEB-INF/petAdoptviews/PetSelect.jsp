<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Website</title>
    <!--stylesheet-->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--light-slider-css-->
    <link rel="stylesheet" type="text/css" href="css/lightslider.css">
    
    <!--jQuery-------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
    <!--light-slider-js-->
    <script src="js/lightslider.js"></script>

    <!--fav-icon------------------->
    <link rel="shortcut icon" href="images/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>

    <style>
          p{margin-left: 10px ;
            margin-bottom: 10px;  
    }
      
       
        
        .btn1{
            margin-left: 270px;
            margin-bottom: 5px; 
            width:40px;
        }  
        .input1{
             border-radius: 10px;
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
 .div2 a:link{
       text-decoration:none;
       
 }
 .div2 a:hover{
       background-color:#467e14	;
       color:#ffffff;
       border-radius:20px;
       }
   .input1{    outline: none;
            border-radius: 10px;
   }
   .imgpic1{
         width:200px;
         height: 200px;
   }
    #picAdoptTexta2{
      margin-left:100px }
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
    </style>
  
</head>

<body>
    <!--navigation-------------------------------->
    <nav>
        <!--social-link-and-phont-number-->
        <div class="social-call">
            <!--social-links-->
            <div class="social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <!--phone-number-->
            <div class="phone">
                <span>Call +123456789</span>
            </div>
        </div>

        <!--menu-bar-------------------------------------->
        <div class="navigation">
            <!--logo---------->
            <a href="#" class="logo">
                <img src="images/PetPetLogo.png" />
            </a>
            <!--menu-icon---------------------->
            <div class="toggle"></div>

            <!--menu----------->
            <ul class="menu">
                <li><a href="#">最新消息</a></li>

                <li><a href="#">商品總覽</a>
                    <!--sale-label-->
                    <span class="sale-lable">Sale</span>
                </li>

                <li><a href="#">寵愛認養</a></li>
                <li><a href="#">毛寵大小事</a></li>
                <li><a href="#">會員中心</a></li>
            </ul>
            <!--right-menu------->
            <div class="right-menu">
                <!--search-->
                <a href="javascript:void(0);" class="search">
                    <i class="fas fa-search"></i>
                </a>
                <!--user-->
                <a href="javascript:void(0);" class="user">
                    <i class="fas fa-user"></i>
                </a>
                <!--cart-icon-->
                <a href="#">
                    <i class="fas fa-shopping-cart">
                        <!--number-of-product-in-cart-->
                        <span class="num-cart-product">0</span>
                    </i>
                </a>
            </div>
        </div>
    </nav>
    <!--search-bar------------------------------->
    <div class="search-bar">
        <!--search-input-------->
        <div class="search-input">
            <!--input----->
            <input type="text" placeholder="Search For Product" />
            <!--cancel-btn-->
            <a href="javascript:void(0);" class="search-cancel">
                <i class="fas fa-times"></i>
            </a>
        </div>
    </div>

    <!--login-and-sign-up-form--------------------->
    <div class="form">
        <!--login-------------------->
        <div class="login-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>會員登入</strong>
            <!--inputs-->
            <form>
                <input type="email" placeholder="Example@gmail.com" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <!--submit-btn-->
                <input type="submit" value="Log In">
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="#" class="forget">忘記密碼？</a>
                <a href="javascript:void(0);" class="sign-up-btn">建立帳戶</a>
            </div>

        </div>


        <!--Sign-up-------------------->
        <div class="sign-up-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>建立帳戶</strong>
            <!--inputs-->
            <form>
                <input type="email" placeholder="Example@gmail.com" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <input type="password" placeholder="Confirm Password" name="password" required>
                <!--submit-btn-->
                <input type="submit" value="Sign Up">
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="javascript:void(0);" class="already-acount">已經是會員？</a>
            </div>

        </div>

    </div>

<!----------------------------------------------NEW!!Strat!!-------------------------------------------->



<form method="post" action=" " class="fo">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
<fieldset>
        <legend>目前資料</legend>
        <a id="petnull"></a>
<table border="1" class="tab ">
<tr style="background-color:#a8fefa">
<th class="td"></th><th>寵物名稱</th><th>寵物圖片</th><th>寵物性別</th>
<th>寵物種類</th><th>寵物毛色</th><th>寵物類別</th>
<th>是否結紮</th><th>所在地區</th><th>更新日期</th>

<c:forEach items="${PetAdopts}" var="pas" varStatus="s">
      
      
<tr>    
    <td class="td">${pas.petID}</td>
<%--     <td> <a  href=" <c:url value='/find/${pas.petID}'/>">${pas.petName}</a></td> --%>
       
    <td><a href="<spring:url value='select/pet?petID=${pas.petID}'/>"/>${pas.petName}</td>
    <td><img src="<spring:url value='${shareurl}/petpet/responseImage1.controller?petID=${pas.petID}'/>" id="petimg"></td>
    <td>${pas.petGender}</td>
    <td>${pas.petSpecies}</td>
    <td>${pas.petColor}</td>
    <td>${pas.petBreeds}</td>
    <td>${pas.petLigation}</td>
    <td>${pas.petArea}</td>
    <td>${pas.petInsertDay}</td>
    
<!--     <td><input type="button" value="修改" class="updatebtn"></td> -->
<!--     <td><input type="button" value="刪除" class="deletebtn"></td> -->
     <c:set var="petID" value="${pas.petID}"/>
</tr>         

<c:set var="count" value="${s.count}"/>


</c:forEach>

</table>

</fieldset>
<h3>共 ${count}筆寵物資料</h3><!-- emps的陣列筆數 -->

<div class="displaydiv">
<input type="hidden" name="petID" value=" " id="petID">

</div>
</form>
<div class="div2 select">
    <a href="http://localhost:8081/petpet/petSelectAll">查詢領養寵物</a>
</div>
<div class="div2 insert">
    <a href="http://localhost:8081/petpet/petInsert">刊登送養寵物</a>
</div>
<div class="div2 insert">
    <a href="http://localhost:8081/petpet/">回領養首頁</a>
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
  $(".deletebtn").click(function(){
    	 if (confirm("您真的確定要刪除嗎?")==true){
    	    	petID=$(this).closest("tr").children().eq(0).text(); 
    	    	alert("已刪除");
    	    	 $("#petID").attr("value",petID);
    	    	 //alert($("#petID").val());
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