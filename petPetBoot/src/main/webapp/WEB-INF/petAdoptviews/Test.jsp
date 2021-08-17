<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>測試</title>
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
</style>

</head>
<body>
<!-- ${pets} -->
<figure class="highcharts-figure">
        <div id="container"></div>
        <p class="highcharts-description">
          寵物種類分布
        </p>
      </figure>
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
    text: '站內寵物種類分布圖'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
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
</body>
</body>
</html>