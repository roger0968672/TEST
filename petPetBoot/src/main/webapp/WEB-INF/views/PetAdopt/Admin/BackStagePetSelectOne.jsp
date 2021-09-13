<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/PetAdopt/css/backstage/backstage.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/PetAdopt/css/backstage/backstagemevent.css"/>
<!-- Bootstrap Table with Search Column Feature -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="<c:url value='/PetAdopt/js/event/event.js'/>"></script>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!--引用SweetAlert2.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<style>
  
    
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
              left:-200px;
              margin:0px;
              width:200px;
        }
         #petbasic{
         margin:0px;
         }
        
      
        input{ 
        margin-left:2px;
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
     #petbasic p{font-size:24px;
            
           
                  }        
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
  
</style>
<title>BackStagePetAdoptInsert</title>
</head>
<body>
    <!-- 左側版型 -->
    <%@include file="../../common/bssidenav.jsp" %>
<!-- 右邊上面版型 -->
<div class="content" align="center">
    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2><b>寵物領養管理</b></h2>
                        </div>
                        <div class="col-sm-5">
                           
                            <a href="<c:url value='petadoptbackstage/sc'/>" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span style="width:40px;">圓餅圖</span></a>
                            
				    	</div>
                        <div class="col-sm-3">
                            <div class="search-box">
                                <div class="input-group">								
                                    <input type="text" id="search" class="form-control" placeholder="搜尋寵物名稱" >
                                    <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- 右邊下面表格版型，標題 -->
      <table class="table table-striped table-hover table-sm">
                   
                           <!--   <th>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="selectAll">
								    <label for="selectAll"></label>
							    </span>
					    </th>-->
					    <section class="new-arrival box">
		<!--heading------->
		
		 <div  id="petbasicdiv">
    <fieldset  class="filedsetpet" style="background-color: linen;">
   
        <legend style="margin-left: 20px;"><b>寵物資料</b></legend>
             <div  class="petDivImg" >
                     <ul class="petul1">                                                      
                         <li><img class="img1" id="imgid1" src="<c:url  value= '/petadopt/responseImage1.controller?petID=${pab.petID}'/>" ></li>
                         <li><img class="img1" id="imgid2" src="<c:url  value= '/petadopt/responseImage2.controller?petID=${pab.petID}'/>" ></li>
                         <li><img class="img1" id="imgid3" src="<c:url  value= '/petadopt/responseImage3.controller?petID=${pab.petID}'/>" ></li>
                    </ul>
             </div>   
                  
  
  <input type="hidden" value="${pab.petID}" id="petida">     
  
               <div align="center" class="petsmalldiv" > 
                    <img id="smallimg1" class="petsmallimg"  src="<c:url value='/petadopt/responseImage1.controller?petID=${pab.petID}'/>" >
                    <img class="petsmallimg"  src="<c:url value='/petadopt/responseImage2.controller?petID=${pab.petID}'/>" >
                    <img class="petsmallimg"  src="<c:url value='/petadopt/responseImage3.controller?petID=${pab.petID}'/>" >
               </div>

            <div id="petbasic">  
            
               <p> 寵物姓名 :<c:out value="${pab.petName}"/></p> 
               <p> 寵物性別 :<c:out value="${pab.petGender}"/></p>
               <p> 寵物種類 :<c:out value="${pab.petSpecies}"/></p>
               <p> 寵物毛色 :<c:out value="${pab.petColor}"/></p>
               <p> 寵物品種 :<c:out value="${pab.petBreeds}"/></p>
               <p> 是否結紮 :<c:out value="${pab.petLigation}"/></p>
               <p> 所在地區 :<c:out value="${pab.petArea}"/></p>
               <p> 其他描述內容 :<c:out value="${pab.petNarrate}"/></p>  
               <p> 最後修改時間：${pab.petInsertDay}</p>
               <c:if test="${pab.petAction ==0 }">
               <p><a>目前狀態：</a>未被領養</p>
                </c:if>
                
                <c:if test="${pab.petAction ==1 }">
               <p><a>目前狀態：</a>領養中</p>
                </c:if>
                
                <c:if test="${pab.petAction ==2 }">
               <p><a>目前狀態：</a>領養完成</p>
                </c:if>
   <input type="hidden" id="petadoptbtn" value="我要領養" 
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
              
             </div>   
	</section>
                          
       </table>

</body>
<script>

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
     
     
    
</script>
</html>