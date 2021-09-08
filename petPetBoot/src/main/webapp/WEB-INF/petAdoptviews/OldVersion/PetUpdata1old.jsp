<%@ page language="java" contentType="text/html; charset=UTF-8"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- import javabean -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>寵物修改頁面</title>
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
	height: 100%;
	width: 200px;
	position: fixed;
	top: 100;
	left: 0;
	overflow-x: hidden;
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
#petInsertCell  p{  margin-left: 20px ;
            margin-bottom: 10px;    
            color: brown;  
            
        }
      
        #petfieldset    {
            border:3px double royalblue;
            border-radius: 15px;
            width: 410px;
            margin-top: 20px;
                    }
        
        .btn1{
            margin-left: 250px;
            margin-bottom: 5px; 
            width:50px;
        }  
        .input1{   outline: none;
                    border-radius: 10px;
        
        }
        .div3{
             width: 400px;
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
     
       }
       
       .imgpic1{
            width:200px;
            height:200px;
            margin-left:100px;
       }
       #petInsertView{
           display: table;
       }
       #petInsertCell{
           display: table-cell;
           vertical-align: middle;
       }
       *{
        margin: auto;
        padding: auto;
       }
      #picAdoptTexta2{
      margin-left:100px }
      
      #petInsertCell select{
      color:#009393;
      }
       legend{
         color:	#AE57A4;
         width:150px;
       } 
       #petimg{
    width: 150px;
    height: 150px;
    }
.peterrora{
color:red;
}
.btnclass{
 margin-top: 10px;}
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
                <img src="<c:url value='/Member/images/PetPetLogo.png'/>" />
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
<nav class="sidenav">
		<div id="firstpaneDiv" style="width: 200px; height: 40px;"class="menu_list">
			
			<h3 class="menu_head current"
				style="align-content: center; text-align: center; padding: 0px;">商品分類</h3>
			<div style="display: block" class="menu_nva">
				<form id="form" method="get"
					action="<c:url value='/categoryproduct'/> ">
					<input type="Hidden" name="category" value="食物"> <input
						type="submit" class="btn btn-outline-success form-control"
						value="食物">
				</form>
				<form id="form" method="get"
					action="<c:url value='/categoryproduct'/> ">
					<input type="Hidden" name="category" value="玩具"> <input
						type="submit" class="btn btn-outline-success form-control"
						value="玩具">
				</form>
				<form id="form" method="get"
					action="<c:url value='/categoryproduct'/> ">
					<input type="Hidden" name="category" value="日用品"> <input
						type="submit" class="btn btn-outline-success form-control"
						value="日用品">
				</form>
				<form id="form" method="get"
					action="<c:url value='/categoryproduct'/> ">
					<input type="Hidden" name="category" value="服飾"> <input
						type="submit" class="btn btn-outline-success form-control"
						value="服飾">
				</form>
				<form id="form" method="get"
					action="<c:url value='/categoryproduct'/> ">
					<input type="Hidden" name="category" value="清潔、美容"> <input
						type="submit" class="btn btn-outline-success form-control"
						value="清潔、美容">
				</form>
			</div>
	</nav>

<!-- ........................ -->

<div id="petInsertView">
      <div id="petInsertCell">
      <form  method="post" action="" class="fo" enctype="multipart/form-data">  
        
        
        <fieldset id="petfieldset">
            <legend ><b>修改寵物資料</b></legend>
                 
                   <div> <input type="hidden" name="petID" value="${pas.petID}">
                        <p><a>寵物姓名：</a><input type="text" name="petName"  value="${pas.petName}" class="input1" id="petname">
                    <br>
                        <input type="hidden" name="petGender" value="${pas.petGender}">
                        <input type="hidden" name="petSpecies" value="${pas.petSpecies}" class="spe">
                        <p><a>寵物毛色：</a><input type="text" name="petColor" class="input1" value="${pas.petColor}"></p>
                        <p><a>寵物品種：</a><input type="text" name="petBreeds" class="input1" value="${pas.petBreeds}"></p>
                    <div>
                        <p><a><label>結紮：</label></a>
                            <select name="petLigation">
                                   <option value="有">有</option> 
                                   <option value="無">無</option>
                                   <option value="不確定">不確定</option>
                             </select></p>
                    </div>	
       
               <div>
               <p><a><label>寵物所在地區</label></a>
                  <select name="petArea">
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
                   </select></p>  
               </div>
               
                <div>
                   <p><a><label>其他描述內容</label></a>
                      <span id="picAdoptTexta2"></span>
                      <textarea cols="40" rows="5" name="petNarrate" id="picAdoptText1">${pas.petNarrate}</textarea></p>
               </div>
               
               <input type="hidden" name="petInsertDay" id="insertday" value="${pas.petInsertDay}"> <!-- 日期在這邊 -->
              
               <p><a>寵物圖片1 </a><input type="file" name="petPic1" id="petpic1" accept="image/*"></p>
                 <img id="img1" class="imgpic1" src=" <spring:url value='http://localhost:7070/petpet/petadopt/responseImage1.controller?petID=${pas.petID}'/>" > 
               <p><a>寵物圖片2 </a><input type="file" name="petPic2" id="petpic2" accept="image/*"></p>  
                 <img id="img2" class="imgpic1" src=" <spring:url value='http://localhost:7070/petpet/petadopt/responseImage2.controller?petID=${pas.petID}'/>" > 
               <p><a>寵物圖片3 </a><input type="file" name="petPic3" id="petpic3" accept="image/*"></p>  
                 <img id="img3" class="imgpic1" src=" <spring:url value='http://localhost:7070/petpet/petadopt/responseImage3.controller?petID=${pas.petID}'/>" >
                       <div class="btnclass">               
                        <input type="button" value="送出" class="btn1 input1" id="enter">
                        <input type="reset" value="重新編寫" class="input1" id="reset">
                       </div>
                   
                   </div>
       </fieldset>   
                             
       </form> 
     </div>                   
</div>
<div class="div2 select">
    <a href="http://localhost:7070/petpet/petAdopt/petSelectAll">查詢領養寵物</a>
</div> 
<div class="div2 insert">
    <a href="http://localhost:7070/petpet/petadopt/petInsert">刊登送養寵物</a>
</div>
<div class="div2 insert">
    <a href="http://localhost:7070/petpet/petadopt/">回領養首頁</a>
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
              
     
                 
        //圖片1修改
          $("#petpic1").change(function() {  
	           var file = $("#petpic1")[0].files[0];
	           var reader = new FileReader;
	           reader.onload = function(e) {
	           $('#img1').attr('src', e.target.result);
	           };
	            reader.readAsDataURL(file);
	        }) 
	      
	      //圖片2
	  $("#petpic2").change(function() {  
	         var file = $("#petpic2")[0].files[0];
	         var reader = new FileReader;
	         reader.onload = function(e) {
	         $('#img2').attr('src', e.target.result);
	        };
	         reader.readAsDataURL(file);
	  })
	  
	  //圖片3
	  $("#petpic3").change(function() {  
     
	         var file = $("#petpic3")[0].files[0];
	         var reader = new FileReader;
	         reader.onload = function(e) {
	         $('#img3').attr('src', e.target.result);
	         };
	         reader.readAsDataURL(file);
	  })
	  
	
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
        wordWrapper.text("還可輸入"+leaveCount+"字").css("color","red");
      }
        }      
   })
  $(function () {
    $("#picAdoptText1").wordCount(50, $("#picAdoptTexta2"));
  })
  
  
  //下方為confirm API 有夠長= =
  swal.setDefaults({
            confirmButtonText:"確定",
            cancelButtonText:"取消"
        });
  var petTestInt=1;
  $("#enter").click(function(){
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
	 
  });
   
    </script>
</body>

</html>