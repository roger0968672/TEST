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
<link rel="stylesheet" href="<c:url value='PetAdopt/css/backstage/backstage.css'/>"/>

<link rel="stylesheet" href="<c:url value='PetAdopt/css/backstage/backstagemevent.css'/>"/>
   
<!-- Bootstrap Table with Search Column Feature -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <!--引用SweetAlert2.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<style>
  .imgpic1{
            width:200px;
            height:200px;
            margin-left:30px;
       }
	   #petInsertCell{
           display: table-cell;
           vertical-align: middle;
		  
       }
	   #petInsertCell div{
		margin: 15px;
	    width: 500px;
	   }
	   *{
        margin: auto;
        padding: auto;
       }
	   #picAdoptTexta2{
      margin-left:250px;
	  font-size: 20px;}
	   #petInsertCell select{
      color:#009393;
      }
	   #petInsertView{
		width: 490px;
           display: table;
		   background-color: linen;
		  border: 3px double royalblue; 
		  border-radius: 15px;
       }
       #petimg{
    width: 150px;
    height: 150px;
    }
.peterrora{
 color:red;
 margin-left:380px;
 display: none;
}
#petInsertCell div{
 margin-top: 10px;
}
#petInsertCell .petbreeds{
    width: 100px;
}
.petdivdiv{
	color: white; 
	background-color: lightskyblue;
	height:50px;
}
.block {
		  margin: auto;
		  margin-top: 50px;
		  margin-bottom: 100px;
		  display: flex;
		  flex-wrap: wrap;
		  border-radius: 10px;
		  border: solid 1px rgba(0, 0, 0, 0.3);
		  box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
	  }
.block h1{
	text-align: center;
	color:	#005AB5
}
.petbreedsla{
	width:110px;
}
.petgenderradio{
	margin:5px;
	width:20px;
	height: 20px;
}
.hovera:hover{
text-decoration:none;}

.fonta{
font-size:24px;
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
		
		 <div class="block" id="petInsertView">
			
            <div class="dataBlock" id="petInsertCell">
				<h1 >修改寵物資料</h1>
                <form  method="post" action="petadoptbackstagepetUpdata.controller" enctype="multipart/form-data" class="fo"> 
                    <input type="hidden" name="petID" value="${pas.petID}">
                    <div class="input-group input-group-lg div"> 
                        <span class="input-group-text  petdivdiv fonta">寵物名稱</span>
                        <input type="text"  class="form-control" placeholder="最多輸入10字" name="petName" 
						style="width: 30px;" id="petID" onblur="checkpetname();" value="${pas.petName}">
                    </div>
                    
                     <a id="petnamea" class="peterrora"></a>
					 <div class="input-group flex-nowrap input-group-lg div  ">
					 <span class="input-group-text petdivdiv fonta" style="margin:0px;">寵物性別</span>
                    <c:if test="${pas.petGender =='公'}">
                        <a style="font-size: 30px;margin:0px 10px 0px 10px;">公<input type="radio" name="petGender" value="公" class="petgenderradio" checked="checked"  ></a>
						<a style="font-size: 30px;margin:0px 25px 0px 0px;">母<input type="radio" name="petGender" value="母" class="petgenderradio"></a>
                    </c:if>
               
                    <c:if test="${pas.petGender =='母'}">
                        <a style="font-size: 24px;margin:0px 10px 0px 10px;">公<input type="radio" name="petGender" value="公" class="petgenderradio"></a>
						<a style="font-size: 24px;margin:0px 25px 0px 0px; ">母<input type="radio" name="petGender" value="母" class="petgenderradio" checked="checked"></a>
                    </c:if>
                   
				
                        
                       <span class="input-group-text petdivdiv fonta" style="margin:0px; width:130px;">寵物種類</span>
                        <select  class="form-select " id="inputGroupSelect01" style="width: 80px;margin:0px; font-size:24px;" name="petSpecies">
                            <c:if test="${pas.petSpecies =='貓' }">
                                   <option value="貓" selected="selected">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='狗' }">
                                   <option value="貓">貓</option>
                                   <option value="狗" selected="selected">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='鳥' }">
                                   <option value="貓">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥"  selected="selected">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='鼠' }">
                                   <option value="貓">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠" selected="selected">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='兔' }">
                                   <option value="貓">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔" selected="selected">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='龜' }">
                                   <option value="貓">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜" selected="selected">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='蛇' }">
                                   <option value="貓">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇"  selected="selected">蛇</option>
                                   <option value="豬">豬</option>
                            </c:if>
                            
                            <c:if test="${pas.petSpecies =='豬' }">
                                   <option value="貓">貓</option>
                                   <option value="狗">狗</option>
                                   <option value="鳥">鳥</option>
                                   <option value="鼠">鼠</option>
                                   <option value="兔">兔</option>
                                   <option value="龜">龜</option>
                                   <option value="蛇">蛇</option>
                                   <option value="豬"  selected="selected">豬</option>
                            </c:if>
                           
                        </select>
					</div>
					
					
					

					<div class="input-group input-group-lg div">
                        <span class="input-group-text petdivdiv fonta" >寵物毛色</span>
                        <input type="text" class="form-control"  name="petColor" id="petcolor" 
						style="width: 30px;" onblur="checkpetcolor();" value="${pas.petColor}">
                    </div>
					<a id="petcolora" class="peterrora"></a>

					<div class="input-group input-group-lg div">
                        <span class="input-group-text petdivdiv fonta">寵物品種</span>
                        <input type="text" class="form-control"  name="petBreeds" 
						style="width: 30px;" id="petbreeds" onblur="checkpetbreeds();" value="${pas.petBreeds}">
                    </div>
					<a id="petbreedsa" class="peterrora"></a>

                    <div class="input-group input-group-lg div">
                        <label  class="input-group-text petdivdiv fonta" for="inputGroupSelect01" style="margin:0px;">是否結紮</label>
                        <select  class="form-select petbreeds" id="inputGroupSelect01" name="petLigation" style="margin:0px 20px 0px 0px;font-size:24px;">
                          <c:if test="${pas.petLigation =='有'}">
                            <option value="不確定">不確定</option>
							<option value="有" selected="selected">有</option> 
							<option value="無">無</option>
                           </c:if>
                           
                           <c:if test="${pas.petLigation =='無'}">
                            <option value="不確定">不確定</option>
							<option value="有" >有</option> 
							<option value="無" selected="selected">無</option>
                           </c:if>
                           
                           <c:if test="${pas.petLigation =='不確定'}">
                            <option value="不確定" selected="selected">不確定</option>
							<option value="有" >有</option> 
							<option value="無" >無</option>
                           </c:if>
							
                        </select>

					<label  class="input-group-text petdivdiv fonta" for="inputGroupSelect01" style="margin:0px 0px 0px 10px;">所在地區</label>
                        <select  class="form-select petbreeds" id="inputGroupSelect01" name="petArea" style="width:125px; font-size:24px;">
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
                        </select>
                    </div>
                   
                   <div class="input-group flex-nowrap input-group-lg div  ">
					 <span class="input-group-text petdivdiv fonta" style="margin:0px;">寵物領養狀態</span>
                    <c:if test="${pas.petAction =='0'}">
                        <a style="font-size: 20px;margin:0px 10px 0px 10px;">未被領養<input type="radio" name="petAction" value="0" class="petgenderradio" checked="checked"></a>
						<a style="font-size: 20px;margin:0px 25px 0px 0px;">領養中<input type="radio" name="petAction" value="1" class="petgenderradio"></a>
						<a style="font-size: 20px;margin:0px 25px 0px 0px;">領養完成<input type="radio" name="petAction" value="2" class="petgenderradio"></a>
                    </c:if>
                    
                    <c:if test="${pas.petAction =='1'}">
                        <a style="font-size: 20px;margin:0px 10px 0px 10px;">未被領養<input type="radio" name="petAction" value="0" class="petgenderradio"></a>
						<a style="font-size: 20px;margin:0px 25px 0px 0px;">領養中<input type="radio" name="petAction" value="1" class="petgenderradio" checked="checked"></a>
						<a style="font-size: 20px;margin:0px 25px 0px 0px;">領養完成<input type="radio" name="petAction" value="2" class="petgenderradio"></a>
                    </c:if> 
                    
                    <c:if test="${pas.petAction =='2'}">
                        <a style="font-size: 20px;margin:0px 10px 0px 10px;">未被領養<input type="radio" name="petAction" value="0" class="petgenderradio"></a>
						<a style="font-size: 20px;margin:0px 25px 0px 0px;">領養中<input type="radio" name="petAction" value="1" class="petgenderradio"></a>
						<a style="font-size: 20px;margin:0px 25px 0px 0px;">領養完成<input type="radio" name="petAction" value="2" class="petgenderradio" checked="checked"  ></a>
                    </c:if>
               
                   </div>
                       
                              
					<span id="picAdoptTexta2"></span>
                    <div class="input-group ">
                        <span class="input-group-text petdivdiv" style="height: 95px;">其他描述內容</span>                                            
                        <textarea class="form-control" aria-label="With textarea" cols="30" rows="3" id="picAdoptText1" name="petNarrate" onblur="checkpetarea()">${pas.petNarrate}</textarea>
                      </div>  <a id="petareaa" class="peterrora"></a>
					  <input type="hidden" name="petInsertDay" id="insertday">


                
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text petdivdiv ">寵物圖片1</span>
                        <input type="file" class="form-control" name="petPic1" id="petpic1" accept="image/*">
                    </div>
					<img id="img1" class="imgpic1" src=" <c:url value='/petadopt/responseImage1.controller?petID=${pas.petID}'/>" >
					<div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text petdivdiv">寵物圖片2</span>
                        <input type="file" class="form-control" name="petPic2" id="petpic2" accept="image/*">
                    </div>
					<img id="img2" class="imgpic1" src=" <c:url value='/petadopt/responseImage2.controller?petID=${pas.petID}'/>" >
					<div class="input-group flex-nowrap input-group-lg div ">
                        <span class="input-group-text petdivdiv" >寵物圖片3</span>
                        <input type="file" class="form-control" name="petPic3" id="petpic3" accept="image/*">
                    </div>
					<img id="img3" class="imgpic1" src=" <c:url value='/petadopt/responseImage3.controller?petID=${pas.petID}'/>" >

                    

			        <div class="btnBlock gap-3 col-6 mx-auto container">
						<input type="button" value="送出" class="button btn btn-success" id="enter" style="width:80px;height:40px;margin-left:30px;">
						<input type="reset" value="重新編寫" class="button btn btn-success" style="width:100px;height:40px; " id="reset"> 
                    </div>
                </form>
                <div class="last"></div>
            </div>
        </div>

          
	</section>

	</section>
                          
       </table>

</body>
<script>
$("#petID").click(function(){
	var date1= new Date();
 	var year =date1.getFullYear();
 	var mon  =(date1.getMonth()+1)>10? (date1.getMonth()+1):"0"+(date1.getMonth()+1);
 	var day  =(date1.getUTCDate()<10)? "0"+date1.getUTCDate():date1.getUTCDate();
 	var cs= year+"年"+mon+"月"+day+"日";
 	console.log(cs);
 	$("#insertday").val(cs);
})
      
//圖片1
$("#petpic1").change(function() {  
   $("#img1").css("display","block"); 
   var file = $("#petpic1")[0].files[0];
   var reader = new FileReader;
   reader.onload = function(e) {
   $('#img1').attr('src', e.target.result);
   };
  reader.readAsDataURL(file);
})
  
//圖片2
$("#petpic2").change(function() {  
   $("#img2").css("display","block"); 
   var file = $("#petpic2")[0].files[0];
   var reader = new FileReader;
   reader.onload = function(e) {
    $('#img2').attr('src', e.target.result);
   };
  reader.readAsDataURL(file);
})
  
//圖片3
$("#petpic3").change(function() {  
   $("#img3").css("display","block"); 
   var file = $("#petpic3")[0].files[0];
   var reader = new FileReader;
   reader.onload = function(e) {
   $('#img3').attr('src', e.target.result);
   };
   reader.readAsDataURL(file);
})

move_div();
 $(window).resize(move_div);
function move_div() {
  let windowWidth=$(this).width();
  let objWidth=$(".petInsertView").width();
  let wi =  objWidth/windowWidth;   // 抓寬度縮放比例
  let wit=  windowWidth * wi; //寬度比例
$(".petInsertView").css("width",wit)   
 let left=( windowWidth-wit)/2;

 $(".petInsertView").css("left",left)
}   

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
    wordWrapper.text("其他描述內容還可輸入"+leaveCount+"字").css("color","blue");
  }
    }      
})
$(function () {
$("#picAdoptText1").wordCount(90, $("#picAdoptTexta2"));
})
//---------------------------------------------------------------------------



//-----------------------------------------------------
var petnameflag=true;
var petcolorflag=true;
var petbreedsflag=true;	 
var petareaflag=true;

//------------------檢查欄位
function checkpetname(){
	 petName=$("#petID").val();
	if(petName.length==""){
		$("#petnamea").html("未輸入寵物名稱");
		$("#petnamea").css("display","inline");
		petnameflag=false;
	}
	else{
		$("#petnamea").html(" ");
		$("#petnamea").css("display","none");
		petnameflag=true;}
}
function checkpetcolor(){
	 petcolor=$("#petcolor").val();
	if(petcolor.length==""){
		$("#petcolora").html("未輸入寵物毛色");
		$("#petcolora").css("display","inline");
		petcolorflag=false;}
	else{
	   $("#petcolora").html(" ");
	   $("#petcolora").css("display","none");
	   petcolorflag=true;
  }
}
function checkpetbreeds(){
	var petbreeds=$("#petbreeds").val();
  if(petbreeds.length==""){
     $("#petbreedsa").html("未輸入寵物品種");
     $("#petbreedsa").css("display","inline");
     petbreedsflag=false;
  }else{
  	$("#petbreedsa").html(" ");
  	$("#petbreedsa").css("display","none");
  	petbreedsflag=true;
  }
}

function  checkpetarea(){
	 var petarea=$("#picAdoptText1").val();
	 if(petarea.length==""){
		 $("#petareaa").html("未輸入描述內容");
		 $("#petareaa").css("display","inline");
		 petareaflag=false;
	}else{
		$("#petareaa").html(" ");
		$("#petareaa").css("display","none");
		petareaflag=true;}
}
//下方為confirm API 有夠長= =
swal.setDefaults({
            confirmButtonText:"確定",
            cancelButtonText:"取消"
        });
  var petTestInt=1;
  $("#enter").click(function(){
	checkpetname();
	checkpetcolor();
	checkpetbreeds();
	checkpetarea();
  if(petnameflag && petcolorflag && petbreedsflag &&  petareaflag){
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
	                            	$(".fo").attr("action","petadoptbackstagepetUpdata.controller");
	                                $("#enter").attr("type","submit");
	                                $("#enter").click();                    
	                             }//if判斷式
	                    })                  
	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
	                  swal("取消成功", "資料未修改", "error");
	              }//end else  
	          });//end then 
 
		  }
		}else{
  	 swal("資料尚未輸入完成", "", "error");
       }
  });

  
     
     
     
    
</script>
</html>