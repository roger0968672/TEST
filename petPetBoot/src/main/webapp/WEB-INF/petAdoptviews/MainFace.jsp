<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="shortcut icon" href="/images/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>

    <style>
        .test{
            border: red 2px solid;
            text-align: center;
            margin-top: 100px;
            margin-bottom: 100px;
        }
        #petsearcha{
          margin-left: 40px;  
        }
       #petSpeciesa{ margin-left: 40px; 
        }
        #petSelectDiv{
        color:#009100;
        }
         #petSelectDiv select{
        color:#0080FF;
        }
        #petSelect{
        background-color: lightblue;
        border-radius:5px;    
        color:#484891;
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




<div class="test">
     <form method="get" action=""  class="petfo">
           <div id="petSelectDiv">
             <a><label>地區查詢</label></a>
              <select name="petArea" id="petArea">
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
                  <a  id="petSpeciesa"><label>寵物種類</label></a>
                   <select name="petSpecies" id="petSpeciesSelect">
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
                   <a id="petsearcha">關鍵字搜尋</a><input type="search" id="petsearch" value="" name="seachpet"  placeholder="搜尋寵物相關資料">
                   <input type="button" value="尋找寵物" id="petSelect">
                </div>
      </form>
                 <section class="section1">
                    <div class="div2 select">
                         <a href="http://localhost:8081/petpet/petSelectAll">查詢寵物</a>
                    </div>
                     <div class="div2 insert">
                          <a href="http://localhost:8081/petpet/petInsert">刊登送養寵物</a>
                     </div>
                     <div>
                          <a href="http://localhost:8081/petpet/backstagePetAdopt">寵物後台管理</a>
                     </div>
                 </section>

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