<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<style>
html {
	height: 100%;
	overflow-x: hidden;
	color: black;
	font-size: 14px;
	font-family: "Noto Sans KR", "Apple SD Gothic Neo", sans-serif;
	line-height: 1.8;
	text-rendering: optimizeLegibility;
	-webkit-text-size-adjust: 100%;
	-webkit-font-smoothing: antialiased;
}

head {
	display: none;
}

body {
	background-color: #fff6f6;
	letter-spacing: -.0125rem;
	margin: 0px;
}

.navbar {
	background: #fff6f6;
	position: relative;
	height: 126px;
	border-bottom: 1px solid black;
}

.navbar .navbar-inner {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin: 0;
	height: 49px;
	padding: 3rem 5% 2.5rem 5%;
}

.navbar-menu {
	display: flex;
}

.navbar-logo {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 300px;
	box-sizing: border-box;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

#logo {
	width: 300px;
}

img {
	vertical-align: middle;
	overflow-clip-margin: content-box;
	overflow: clip;
}

a {
	-webkit-text-decoration-skip: ink;
	text-decoration-skip-ink: auto;
	/* https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-skip-ink */
	color: rgb(255, 246, 246);
}

#title {
	text-align: center;
	font-weight: bold;
	font-size: 40px;
	margin-top: 10px;
}

/* article */
.quickMenu {
	float: left;
	margin-top: 120px;
	width: 100%;
}

article img {
	width: 100%;
}

.report {
	float: left;
	width: 400px;
	margin-left: 60px;
	margin-bottom: 60px;
	list-style-type: none;
}
/* article */

/* 	pagination */
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
}

.pagination a:first-child {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

.pagination a:last-child {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

.center {
	text-align: center;
	padding-bottom: 100px;
}
/* 	pagination */
</style>
</head>
<body>
	<div>
		<nav class="navbar" role="navigation">
			<div class="navbar-inner">
				<div class="navbar-menu" role="navigation"></div>
				<a class="navbar-logo" href="/"> <img id="logo"
					src="resources/image/NewsYaLogo.png" alt="로고">
				</a>
			</div>
			<h1 id="title">관심기사목록</h1>
		</nav>
	</div>
	<c:choose>
	<c:when test="${fn:length(myLikedNewsList)==0}">
		<section class="cont02" style="margin-top: 120px; text-align: center;">
			조회할 데이터가 없습니다.
		</section>
	</c:when>
	<c:otherwise>
	<section class="cont02">
		<div class="contentBox">
			<ul class="quickMenu">
				<c:forEach var="myLikedNewsList" items="${myLikedNewsList}">
					<li class="report">
						<article>
							<img src="${myLikedNewsList.img}" alt="">
							<c:choose>
                                <c:when test="${fn:length(myLikedNewsList.title) > 47}">
                                    <h3>${fn:substring(myLikedNewsList.title,0,47)} ...</h3>
                                </c:when>
                            	<c:otherwise>
                            		<h3>${myLikedNewsList.title}</h3>
                            	</c:otherwise>
                            </c:choose>
                            <c:choose>
                            	<c:when test="${fn:length(myLikedNewsList.content) > 320}">
                                    <p>${fn:substring(myLikedNewsList.content,0,340)} ...</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myLikedNewsList.content}</p>
                                 </c:otherwise>
                            </c:choose>
						</article>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>

	<div class="center">
		<div class="pagination" id="pages">
			<c:choose>
				<c:when test="${paging.prev != 0}">
					<a href="/goLikedArticle?pageNum=${paging.prev}"> &lt;</a>
				</c:when>
			</c:choose>

			<c:forEach var="i" begin="${paging.first}" end="${paging.last}">
				<c:choose>
					<c:when test="${i == paging.pageNum}">
						<a href="/goLikedArticle?pageNum=${i}" class="active">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="/goLikedArticle?pageNum=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.next != 0}">
					<a href="/goLikedArticle?pageNum=${paging.next}"> &gt;</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
</body>
</html>