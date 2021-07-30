<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

<script>

         


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

</script>
</body>
</html>