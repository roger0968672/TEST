<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>單一</title>
<link rel="stylesheet" href="http://localhost:8080/TopicTest/petCss/rwd.css">
<link rel="stylesheet" media="screen and  (max-width: 780px)" href="http://localhost:8080/TopicTest/petCss/rwd780.css" />
</head>
<style>
         p{  
            margin-left: 10px ;
            margin-bottom: 10px;
        }
        a{
            color:brown;
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
        }  
        .input1{
            border-radius: 10px;
             outline: none;
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
                   <li><a href="petSelectAll">領養區</a></li>
                </ul>
            </nav>            
        </header>
        
        <div id="content">
            <article class="article">
                <section class="section">
<form  method="post" action="">  
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
                        <br>
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
    
  
    	
    	
    
   
    </script>
</body>
</html>