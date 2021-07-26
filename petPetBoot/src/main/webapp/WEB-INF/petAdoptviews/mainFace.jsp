<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>領養寵物首頁</title>
<link rel="stylesheet" href="http://localhost:8080/TopicTest/petCss/rwd.css">
<link rel="stylesheet" media="screen and  (max-width: 780px)" href="http://localhost:8080/TopicTest/petCss/rwd780.css" />
<style>   
        fieldset{
            border:3px double royalblue;
            border-radius: 15px;
            width: 400px;
            margin-top: 20px;
                    }
      
           .p1{
               text-align: center;
           }
            .btn1{
            text-align: center;
            margin-left: 300px;
            margin-bottom: 5px;  
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
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
<!-- <from id="form1" action="/test" method="POST"> -->
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
                    <li><a href="/petSelectAll">領養區</a></li>
                </ul>
            </nav>            
   </header>
        <div id="content">
   <article class="article">
                <section class="section">
                    <form id="form1" method="post" action="http://localhost:8080/TopicTest/petInsert1">  
                        <fieldset>
                            <legend>領養主頁</legend>        
                            <br>

                         </fieldset>
                         
                         
                    </form>
                </section>                
    </article>
      <aside class="aside">
      
                    <section class="section1">
                           <div class="div2 select">
                          <a href="petSelectAll">查詢寵物</a>
                        </div>
                        <div class="div2 insert">
                          <a href="petinsert">刊登送養寵物</a>
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