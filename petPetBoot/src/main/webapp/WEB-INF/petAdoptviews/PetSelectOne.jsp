<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>寵物查詢</title>
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
        p{  margin-left: 10px ;
            margin-bottom: 10px;    
            color: brown;  
        }
      
        fieldset    {
            border:3px double royalblue;
            border-radius: 15px;
            width: 400px;
            margin-top: 20px;
                    }
        
        .btn1{
            margin-left: 250px;
            margin-bottom: 5px; 
            width:40px;
        }  
        .input1{   outline: none;
                    border-radius: 10px;
        
        }
        .div3{
             width: 400px;
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
   
       *{
        margin: auto;
        padding: auto;
       }
       .img1{
      width:250px;
      height: 200px;
 
      }
      .petDivImg{
            position: relative;
            width:250px;
            height:200px;
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






    <fieldset>
        <legend ><b>寵物資料</b></legend>

            <div>
               <p><a> 寵物姓名 :</a>${pab.petName}</p> 
               <p><a> 寵物性別 :</a>${pab.petGender}</p>
               <p><a> 寵物種類 :</a>${pab.petSpecies}</p>
               <p><a> 寵物毛色 :</a>${pab.petColor}</p>
               <p><a> 寵物品種 :</a>${pab.petBreeds}</p>
               <p><a> 是否結紮 :</a>${pab.petLigation}</p>
               <p><a> 所在地區 :</a>${pab.petArea}</p>
               <p><a> 其他描述內容 :</a>${pab.petNarrate}</p>  
             </div>

        </fieldset>
        
             <div  class="petDivImg">
                     <ul class="petul1">
                         <li><img class="img1" id="imgid1" src="<spring:url value='http://localhost:8081/petpet/responseImage1.controller?petID=${pab.petID}'/>" ></li>
                         <li><img class="img1" id="imgid2" src="<spring:url value='http://localhost:8081/petpet/responseImage2.controller?petID=${pab.petID}'/>" ></li>
                         <li><img class="img1" id="imgid3" src="<spring:url value='http://localhost:8081/petpet/responseImage3.controller?petID=${pab.petID}'/>" ></li>
                    </ul>
            
<%--                <img class="img1" id="imgid1" src="<spring:url value='http://localhost:8081/petpet/responseImage1.controller?petID=${pab.petID}'/>" > --%>
<%--                <img class="img1" id="imgid2" src="<spring:url value='http://localhost:8081/petpet/responseImage2.controller?petID=${pab.petID}'/>">     --%>
<%--                <img class="img1" id="imgid3" src="<spring:url value='http://localhost:8081/petpet/responseImage3.controller?petID=${pab.petID}'/>"> --%>
             </div>
 
            <div class="div2 select">
                <a href="http://localhost:8081/petpet/petSelectAll">查詢寵物</a>
            </div>
            <div class="div2 insert">
                <a href="http://localhost:8081/petpet/petInsert">刊登送養寵物</a>
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
   
   showNum=0;
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
           let slidemove=-250*showNum;    //總寬度750 有四張圖 用-250*num的方式輪播
           console.log(slidemove);  //查看位置
           $(".petul1").css("left",slidemove); //往左移動到指定位置
           showNum+=1;//每跑一次 num自動+1
   } 
   
    </script>
</body>

</html>