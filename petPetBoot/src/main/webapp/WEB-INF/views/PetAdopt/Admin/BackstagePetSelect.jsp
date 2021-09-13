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
   #petimg{
  width:100px;
  height:100px
  }
  .updatebtn{
  android:stateListAnimator;
  }
  .td{
    display:none;
    } 
  .deletebtn{background-color:red;}
  .updatebtn{background-color:lightblue;}
  .petbtn{border-radius: 10px;
  }
</style>
<title>BackStage</title>
</head>
<body>
    <!-- 左側版型 -->
    <%@include file="../../common/bssidenav.jsp" %>
<!-- 右邊上面版型 -->
<div class="content" align="center">
    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">
            <form method="get" action="<c:url value=''/>">   
				
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
                               						
                                    <input type="text" id="search" class="form-control" placeholder="搜尋寵物" name="searchpet">
                                    <span class="input-group-addon"><i class="material-icons">&#xE8B6;</i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            <!-- 右邊下面表格版型，標題 -->
                <table class="table table-striped table-hover table-sm">
                    <thead>
                        <tr>
                           <!--   <th>
							    <span class="custom-checkbox">
								    <input type="checkbox" id="selectAll">
								    <label for="selectAll"></label>
							    </span>
					    </th>-->
                            <th colspan=2 scope="col">寵物名稱</th>
                            <th scope="col" style="width:100px;">寵物圖片</th>
                            <th scope="col" style="width:100px;">寵物性別</th>
                            <th scope="col" style="width:100px;">寵物種類</th>
                            <th scope="col" style="width:100px;">寵物毛色</th> 
                            <th scope="col" >寵物類別</th>
                            <th scope="col" style="width:100px;">是否結紮</th>
                            <th scope="col">所在地區</th>
                            <th scope="col" style="width:160px;">更新日期</th>
                            <th scope="col">目前狀態</th>
                        </tr>
                    </thead>
            <!-- 右邊下面內容欄位 -->
                <tbody>
<form method="post" action="" class="fo">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
<fieldset>
        <legend>目前資料</legend>
<c:forEach items="${PetAdopts}" var="pas" varStatus="s">    
<tr>    
      

    <td class="td">${pas.petID}</td>    
    <td colspan=2><a href="<c:url value='/petadoptbackstagepetselectone?petID=${pas.petID}'/>"/>${pas.petName}</td>
    <td><img src="<c:url value='https://eeit131t7.eastasia.cloudapp.azure.com/petpet/petadopt/responseImage1.controller?petID=${pas.petID}'/>" id="petimg"></td>
    <td><spring:url value="${pas.petGender}"/></td> 
    <td><spring:url value="${pas.petSpecies}"/></td>
    <td><spring:url value="${pas.petColor}"/></td>  
    <td><spring:url value="${pas.petBreeds}"/></td>
    <td><spring:url value="${pas.petLigation}"/></td>
    <td><spring:url value="${pas.petArea}"/></td>
    <td><spring:url value="${pas.petInsertDay}"/></td>

    <c:if test="${pas.petAction =='0'}">
       <td>未被領養</td>
    </c:if>
     <c:if test="${pas.petAction =='1'}">
       <td>領養中</td>
    </c:if>
     <c:if test="${pas.petAction =='2'}">
       <td>領養完成</td>
    </c:if>
    
    
    
    <td><input type="button" value="修改" class="updatebtn petbtn"><i class="material-icons" data-toggle="tooltip" title="修改">&#xE254;</i></td>
    <td><input type="button" value="刪除" class="deletebtn petbtn"><i class="material-icons" data-toggle="tooltip" title="刪除">&#xE872;</i></td>
    <td class="td">${pas.petID}</td>
     <c:set var="petID" value="${pas.petID}"/>
     
</tr>         

<c:set var="count" value="${s.count}"/>


</c:forEach>


</fieldset>
<h3>共 ${count}筆寵物資料</h3><!-- emps的陣列筆數 -->

<div class="displaydiv">
<input type="hidden" name="petID" value=" " id="petID">

</div>
</form>
                            
                            
                </tbody>



</body>
<script>
   

  
     
     
     
     //下方為confirm API 有夠長= =
  swal.setDefaults({
            confirmButtonText:"確定",
            cancelButtonText:"取消"
        });
  var petTestInt=1;
  $(".deletebtn").click(function(){   //刪除
	
	  if(petTestInt===1){  
		  petID=$(this).closest("tr").children().eq(0).text(); 
	  	  $("#petID").attr("value",petID);
	  	  console.log(petID);
		  swal({
	          title: "確定刪除？",
	          html: "按下確定後資料將被刪除",
	          type: "question",
	          showCancelButton: true//顯示取消按鈕
	      }).then(
	          function (result) {         
	              if (result.value===true) {
	            	  petTestInt=0; //讓數字判斷變成0
	                  //使用者按下「確定」要做的事
	                   swal({title:"刪除成功",
	                         type:"success",
	                         showCancelButton:false}).then(function(result1){//多寫一行判斷,避免強制跳掉
	                            if(result1.value){  	
	                            	$(".fo").attr("action","petadoptpetDeletebackstage");
	                    	    	$(".deletebtn").attr("type","submit");
	                                $(".deletebtn").click();                    
	                             }//if判斷式
	                    })                  
	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
	                  swal("取消成功", "資料未刪除", "success");
	              }//end else  
	          });//end then 
 
		  }
  })
  
  $(".updatebtn").click(function(){
	 
	  if(petTestInt===1){  
		  petID=$(this).closest("tr").children().eq(0).text();
	  	  petName=$(this).closest("tr").children().eq(1).text();
	  	  petGender=$(this).closest("tr").children().eq(2).text();
	  	  console.log(petID);
	  	  $("#petID").attr("value",petID);
		  
		  swal({
	          title: "是否修改資料？",
	          html: "按下確定後網頁將跳轉到修改頁面",
	          type: "question",
	          showCancelButton: true//顯示取消按鈕
	      }).then(
	          function (result) {         
	              if (result.value===true) {
	            	  petTestInt=0; //讓數字判斷變成0
	                  //使用者按下「確定」要做的事
	                   swal({title:"確定修改,按下確認跳轉頁面",
	                         type:"success",
	                         showCancelButton:false}).then(function(result1){//多寫一行判斷,避免強制跳掉
	                            if(result1.value){
	                            	$(".fo").attr("action","petadoptbackstagepetUpdataView");
	                            	$(".updatebtn").attr("type","submit");
	                                $(".updatebtn").click();                    
	                             }//if判斷式
	                    })                  
	              } else if (result.dismiss === "cancel"){   //使用者按下「取消」要做的事
	                  swal("取消成功", "回到原頁面", "success");
	              }//end else  
	          });//end then 
 
		  }
  })
</script>
</html>