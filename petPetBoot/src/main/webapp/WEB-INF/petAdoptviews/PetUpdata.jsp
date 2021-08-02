<%@ page language="java" contentType="text/html; charset=UTF-8"
 %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- import javabean -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<title>修改寵物資料</title>
<link rel="stylesheet" href="http://localhost:8080/TopicTest/petCss/rwd.css">
<link rel="stylesheet" media="screen and  (max-width: 780px)" href="http://localhost:8080/TopicTest/petCss/rwd780.css" />
</head>
<style>

   p{margin-left: 10px ;
            margin-bottom: 10px;  
    }
      
        fieldset{
            border:3px double royalblue;
            border-radius: 15px;
            width: 400px;
            margin-top: 20px;
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
                    <li><a href="/">領養區</a></li>
                </ul>
            </nav>            
        </header>
        
        <div id="content">
            <article class="article">
                <section class="section">
      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
 <form  method="post" action="petUpdate.controller" class="fo" enctype="multipart/form-data">  
 
 <fieldset>
     <legend ><b>修改寵物資料</b></legend>
          
            <div> <input type="hidden" name="petID" value="${pas.petID}">
                 <p><a>寵物姓名 :</a><input type="text" name="petName"  value="${pas.petName}" class="input1" id="petname">
             <br>
                 <input type="hidden" name="petGender" value="${pas.petGender}">
                 <input type="hidden" name="petSpecies" value="${pas.petSpecies}" class="spe">
                 <p><a>寵物毛色:</a><input type="text" name="petColor" class="input1" value="${pas.petColor}"></p>
                 <p><a>寵物品種:</a><input type="text" name="petBreeds" class="input1" value="${pas.petBreeds}"></p>
             <div>
                 <p><a><label>結紮:</label></a>
                     <select name="petLigation">
                            <option value="有">有</option> 
                            <option value="無">無</option>
                            <option value="不確定">不確定</option>
                      </select></p>
             </div>	

        <div>
        <p><a><label>寵物所在地區</label></a>
           <select name="petArea">
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
        <textarea cols="40" rows="5" name="petNarrate">${pas.petNarrate}</textarea></p>
        </div>
        <input type="text" name="petInsertDay" id="insertday" value="${pas.petInsertDay}"> <!-- 日期在這邊 -->
       
        <p><a>寵物圖片1:</a><input type="file" name="petPic1" id="petpic1"></p>
          <img id="img1" class="imgpic1" src=" <spring:url value='http://localhost:8081/petpet/responseImage1.controller?petID=${pas.petID}'/>" > 
        <p><a>寵物圖片2:</a><input type="file" name="petPic2" id="petpic2" ></p>  
          <img id="img2" class="imgpic1" src=" <spring:url value='http://localhost:8081/petpet/responseImage2.controller?petID=${pas.petID}'/>" > 
        <p><a>寵物圖片3	:</a><input type="file" name="petPic3" id="petpic3" ></p>  
          <img id="img3" class="imgpic1" src=" <spring:url value='http://localhost:8081/petpet/responseImage3.controller?petID=${pas.petID}'/>" >
                                   
                 <input type="submit" value="送出" class="btn1 input1" id="enter">
                 <input type="reset" value="重新編寫" class="input1" id="reset"> 
                
            
            </div>
</fieldset>   
                       
</form> 

            <section class="section1">
                           <div class="div2 select">
                          <a href="petSelectAll">查詢寵物</a>
                        </div>
                        <div class="div2 insert">
                          <a href="petInsertview">刊登送養寵物</a>
                        </div>
                    </section>
     </aside>
        </div>  <!--end content-->
        <footer>
                <p>第八組專題petpet寵物網</p>
        </footer>
    </div>  <!--end allpage-->
    <script>
       $("#enter").click(function(){
    	   if (confirm("是否修改完成")==true){
               $("#petName").attr("value",petName);                  
             alert("修改成功");
             window.location.href="petSelectAll";
//                 	 petID=$().closest("tr").children().children().eq(0).val();
//                      petName=$(this).closest("tr").children().children().eq(1).val();
//                      petGender=$(this).closest("tr").children().children().eq(2).val();
//                 	 alert("1"+petID);
//                 	 alert("2"+petName);
             }   
         })
               
                
                //修改日期
         $("#petname").click(function(){
    	      var date1= new Date();
     	      var year =date1.getFullYear();
     	      var mon  =date1.getMonth()+1;
     	      var day  =date1.getUTCDate();
     	      var cs= year+"年"+mon+"月"+day+"日";
     	             console.log(cs);
     	           $("#insertday").val(cs);
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
            </script>
</body>
</html>