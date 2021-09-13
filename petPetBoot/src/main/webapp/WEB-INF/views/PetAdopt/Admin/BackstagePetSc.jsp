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
<script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
     <script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style>

.highcharts-figure, .highcharts-data-table table {
  min-width: 320px; 
  max-width: 660px;
  margin: 1em auto;
}
.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-data-table tr:hover {
  background: #f1f7ff;
}
.highcharts-description{
color:purple;}
.petc{
   width:80vh;
   height: 80vh;
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
            <div style="height: 1200px;background-color: white;">
                <h1 style="color:#97CBFF; font-size:40px; text-align:center;margin-left:140px;" >站內寵物種類分布圖</h1>
                <table class="table table-striped table-hover table-sm">
                    <figure class="highcharts-figure petc">
                       <div id="container" class="petc"></div>
      
                    </figure>
                   </table> 
             </div>       
            <!-- 右邊下面內容欄位 -->
                
  


</body>
 <script>   
      
      var data = {"pet":[
          ${pets}
       ]};
      var catnum=data.pet[0].貓;
      var dognum=data.pet[0].狗;
      var birdnum=data.pet[0].鳥;
      var mousenum=data.pet[0].鼠;
      var rabbitnum=data.pet[0].兔;
      var turtlenum=data.pet[0].龜;
      var snakenum=data.pet[0].蛇;
      var pignum=data.pet[0].豬;
      console.log("豬"+pignum)

      
          Highcharts.setOptions({
  colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
    return {
      radialGradient: {
        cx: 0.5,
        cy: 0.3,
        r: 0.7
      },
      stops: [
        [0, color],
        [1, Highcharts.color(color).brighten(-0.3).get('rgb')] // darken
      ]
    };
  })
});

// Build the chart
Highcharts.chart('container', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: ''
  },
  tooltip: {
    pointFormat: '<p style="font-size:24px;">{series.name}: <b>{point.percentage:.1f}%</b></p>'
  },
  accessibility: {
    point: {
      valueSuffix: '%'
    }
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        format: '<p style="font-size:24px"><b>{point.name}</b>: {point.percentage:.1f} %<p>',
        connectorColor: 'silver'
      }
    }
  },
  series: [{
    name: '筆數',
    data: [
      { name: '貓', y: catnum },
      { name: '狗', y: dognum },
      { name: '鳥', y: birdnum }, 
      { name: '鼠', y: mousenum },
      { name: '兔', y: rabbitnum },
      { name: '龜', y: turtlenum },
      { name: '蛇', y: snakenum },
      { name: '豬', y: pignum }
    ]
  }]
});

      </script>
</html>