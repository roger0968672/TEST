<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:8080/TopicTest/petCss/rwd.css"/>
<link rel="stylesheet" media="screen and  (max-width: 780px)" href="http://localhost:8080/TopicTest/petCss/rwd780.css" />
<title>新增寵物資料</title>
<style>
        
       p{  margin-left: 10px ;
            margin-bottom: 10px;      
        }
      
        fieldset    {
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
        .input1{    outline: none;
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
       
       .imgpic1{
            width:300px;
            height:300px;
            display:none;
       }
    </style>  
   
</head>
<body>

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
                     <li><a href="petSelectAll">領養區</a></li>
                </ul>
            </nav>            
        </header>
        <div id="content">
            <article class="article">
                <section class="section">
                    <form  method="post" action="petInsert.controller" enctype="multipart/form-data">  
                        <fieldset>
                        <legend ><b>新增寵物資料</b></legend>
                            <div>
         <p><a>寵物名稱:</a><input type="text" name="petName" id="petID"  autocomplete="off" class="input1"></p>
        <p><a> 寵物性別 :</a>公<input type="radio" name="petGender" value="公" checked="checked">
                          母<input type="radio" name="petGender" value="母"></p>
        <div>
            <p><a><label>寵物種類:</label></a>
                <select name="petSpecies" >
                     <option value="貓">貓</option>
                     <option value="狗">狗</option>
                     <option value="鳥">鳥</option>
                     <option value="鼠">鼠</option>
                     <option value="兔">兔</option>
                     <option value="龜">龜</option>
                     <option value="蛇">蛇</option>
                     <option value="豬">豬</option>
                </select></p>
            </div>
    
        <p><a>寵物毛色:</a><input type="text" name="petColor" class="input1"></p>
        <p><a>寵物品種:</a><input type="text" name="petBreeds" class="input1"></p>
        
        <div>
        <p><a><label>結紮:</label></a>
             <select name="petLigation">
             <option value="有">有</option> 
             <option value="無">無</option>
             <option value="不確定">不確定</option>
             </select></p>
         <input type="hidden" name="petInsertDay" id="insertday">
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
        <textarea cols="40" rows="5" name="petNarrate"></textarea></p>
        </div>
        
        <p><a>寵物圖片:</a><input type="file" name="petPic1" id="petpic1"></p>
                  <img class="imgpic1" src="#" id="img1"/> 
           
        
                               <input type="submit" value="送出" class="btn1 input1" id="submit">
                               <input type="reset" value="重新編寫" class="input1" > 
                            </div>
                        </fieldset>
                        <br>
                    </form> 
        
                   
                </section>                
            </article>
            <aside class="aside">
                    <section class="section1">
                           <div class="div2 select">
                          <a href="petSelectAll">查詢寵物</a>
                        </div>
                        <div class="div2 insert">
                          <a href="petInsert">刊登送養寵物</a>
                        </div>
                    </section>
     </aside>
        </div>  <!--end content-->
        <footer>
                <p>第八組專題petpet寵物網</p>
        </footer>
    </div>  <!--end allpage-->
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    
      $("#petID").click(function(){
    		var date1= new Date();
     	   var year =date1.getFullYear();
     	   var mon  =date1.getMonth()+1;
     	   var day  =date1.getUTCDate();
     	   var cs= year+"年"+mon+"月"+day+"日";
     	   console.log(cs);
     	   $("#insertday").val(cs);
          })
          
      $("#petpic1").change(function() {  
       $("#img1").css("display","block"); 
	  var file = $("#petpic1")[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
	    $('#img1').attr('src', e.target.result);
	  };
	  reader.readAsDataURL(file);
	  })
            
 
    	
    </script>

</body>
</html>