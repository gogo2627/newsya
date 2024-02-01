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
    font-family: 'JalnanGothic';
	background-color: #fff6f6;
	letter-spacing: -.0125rem;
	margin: 0px;
}

@font-face {
	font-family: 'JalnanGothic';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
	font-weight: normal;
	font-style: normal;
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
	height: 100%;
    object-fit: cover;
    max-height: 450px;
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


/* article */
.news {
    width: 90%;
    max-width: 1360px;
    margin-left: 2%;
    padding: 100px 5% 30px 5%;
    position: relative;
}

.posts {
    display: flex;
    flex-wrap: wrap;
    position: relative;
    border-width: 1px 0 0 1px;
    padding-left: 50px;

.card {
    display: block;
    width: 29%;
    color: black;
    border-width: 0 1px 1px 0;
    cursor: pointer;
    margin-bottom: 70px;
    margin-right: 50px;
    text-decoration: none;
}

.card img {
    width: 100%;
    height: auto;
}

.card > * {
    pointer-events: none;
}

.card .card-thumbnail {
    padding-bottom: 75%;
    height: 0;
    border-radius: 0;
    overflow: hidden;
}

.card, .card .card-thumbnail {
    box-sizing: border-box;
    position: relative;
}

.card-thumbnail {
    display: block;
    margin: 0px;
}

.card .card-body {
    padding: 1.5rem 0.5rem 0rem 0.5rem;
    box-sizing: border-box;
}

.card .card-body .card-title, .card-content {
    margin: 0 0 0.5rem;
    font-size: 1.25rem;
    word-wrap: break-word;
    overflow: hidden;
    white-space: normal;
    text-overflow: ellipsis;
    text-align: left;
    display: -webkit-box;
    -webkit-box-orient: vertical /* https://velog.io/@syoung125/CSS-text-overflow-ellipsis-%EB%91%90%EC%A4%84-%EC%9D%B4%EC%83%81-%EC%B2%98%EB%A6%AC */;
}

.card-title {
    -webkit-line-clamp: 2;
}

.card-content {
     -webkit-line-clamp: 5;
         font-family: "Noto Sans KR", "Apple SD Gothic Neo", sans-serif;
         font-weight: 600;
 }
/* article */
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
			<h1 id="title">북마크</h1>
		</nav>
	</div>
	<c:choose>
	<c:when test="${fn:length(myLikedNewsList)==0}">
		<section class="cont02" style="margin-top: 120px; text-align: center;">
			조회할 데이터가 없습니다.
		</section>
	</c:when>
	<c:otherwise>
	<section class="news">
		<div class="posts">
            <c:forEach var="myLikedNewsList" items="${myLikedNewsList}">
                <a class="card" href="/category/${myLikedNewsList.category}/article/${myLikedNewsList.id}">
                    <div class="card-inner">
                        <figure class="card-thumbnail">
                                <img src="${myLikedNewsList.img}">
                        </figure>
                        <div class="card-body">
                            <h3 class="card-title">${myLikedNewsList.title}</h3>
                            <p class="card-content">${myLikedNewsList.content}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
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