<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        html{
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

        head{
            display: none;
        }

        body{
            font-family: 'JalnanGothic';
            background-color: #fff6f6;
            letter-spacing: -.0125rem;
            margin: 0px;
        }

        *{
            -webkit-tap-highlight-color: white;

        }

        .navbar{
            background: #fff6f6;
            position: relative;
            background-color: #FEDBEA;
        }

        .navbar .navbar-inner{
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 0;
            padding: 3rem 5% 2.5rem 5%;
        }

        .navbar-menu{
            display: flex;
        }

        .navbar-logo{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 300px;
            box-sizing: border-box; /* 테두리와 padding 값을 포함한 크기로 박스영역 지정된다. */
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .navbar-user{
            display: flex;
            align-items: center;
            justify-content: flex-end; /* 여기선 flex 설정된 상위 div태그인 navbar-inner의 끝으로 이동한다. */
            position: relative;
        }

        .navbar-user-login{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            border: 1px solid black;
            box-sizing: border-box;
        }

        .intro-head{
            position: relative;
            cursor: default;
        }

        .intro-head-title{
            padding: 1rem 0;
            font-size: 3rem;
            letter-spacing: -.025rem;
            border-bottom: 1px solid black;
            background-color: #fff6f6;
        }

        .intro-inner{
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 5%;
            box-sizing: border-box;
        }

        .intro-inner > img{
            max-width: 150px;
        }

        .mobile-block{
            display: inline;
        }

        .intro-head-banner{
            position: relative;
            padding: 2rem 0 3rem;
            background-color: black;
            box-sizing: border-box;
        }

        .intro-bullhorn{
            position: absolute;
            left: 50%;
            width: 100%;
            max-width: 250px;
            margin-left: 200px;
        }

        #bullhorn{
            width: 250px;
        }

        #logo{
            width: 300px;
        }

        #login{
            width: 18px;
            height: 19px;
        }

        .search-tab, .intro-inner > p{
            max-width: 560px;
            font-size: 1.125rem;
            color: hotpink;
        }

        .search-tab{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: black;
            position: relative;
        }

        .search-button{
            border: none;
            border-radius: 0 10px 10px 0;
            background: white;
            cursor: pointer;
            font: inherit;
            width: 55.5px;
            height: 55.5px;
            display: flex;
            box-sizing: border-box;
            justify-content: center;
            align-items: center;
        }

        .search-button > img{
            width: 45px;
            height: 45px;
        }

        .search-input{
            overflow: hidden;
            border: none;
            border-radius: 10px 0 0 10px;
            padding: 5px 20px;
            width: 100%;
            box-shadow: none;
            outline: none; /* input 태그 선택시 생기는 테두리 없애기 */
        }

        .category{
            display: flex;
            justify-content: center;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            background-color: white;
            box-sizing: border-box;
            overflow: hidden;
            position: sticky; /* 원래 자기위치보다 내려가면 상단에 위치 고정되어 보여준다. */
            /* https://coding-factory.tistory.com/951 */
            top: 0px;
            margin-bottom: -1px;
            z-index: 1; /* 안하면 스크롤 이동할 때 겹침문제 발생 */
        }

        .category-inner{
            display: flex;
            overflow: auto;
            white-space: nowrap; /* 연속 공백을 하나로 합친다. 줄 바꿈은 <br>에서만 발생 */
            overflow: overlay; /* https://developer.mozilla.org/ko/docs/Web/CSS/overflow */
        }

        .category-link-active{
            border-bottom: 3px solid black;
        }

        .category-link-active, .category-link{
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 1rem;
            padding: 1.25rem 0px;
            font-size: 1.125rem;
            color: black;
            cursor: pointer;
        }

        a, abbr{
            text-decoration: none;
        }

        .news{
            width: 90%;
            max-width: 1360px;
            margin: 0 auto 8rem;
            padding: 0px 5%;
            position: relative;
        }

        .news-category > h2{
            display: inline-block;
            vertical-align: middle;
            margin-right: 15px;
            text-align: center;
        }

        .news-category{
            cursor: default;
            text-align: center;
        }

        .interest{
            vertical-align: middle; /* 가로 기준 정렬 */
            /* https://developer.mozilla.org/ko/docs/Web/CSS/vertical-align */
            background: gray;
            margin: 0;
            padding: 5px 5px;
            border-radius: 10px;
            border: none;
            box-sizing: border-box;
            cursor: pointer;
        }

        .posts{
            display: flex;
            flex-wrap: wrap; /* 강제로 한줄에 배치되게 할 것인지, 또는 가능한 영역 내에서 벗어나지 않고 여러행으로 나누어 표현 할 것인지 결정하는 속성 */
            /* https://developer.mozilla.org/ko/docs/Web/CSS/flex-wrap */
            position: relative;
            border: 1px solid black; /* 전체 박스의 위쪽, 왼쪽 경계선 */
            border-width: 1px 0 0 1px;
        }

        .posts-pagination {
            padding: 2rem 0;
        }

        .card, .card .card-thumbnail{
            box-sizing: border-box;
            position: relative;
        }

        .card .card-thumbnail{
            padding-bottom: 75%;
            height: 0;
            border-bottom: 1px solid black; /* 각 포스트 아래쪽 경계선 */
            border-radius: 0;
            overflow: hidden;
        }

        .card-thumbnail{
            display: block;
            margin: 0px;
        }

        .card .card-thumbnail img {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card .card-body{
            padding: 1.5rem 1.75rem;
            box-sizing: border-box;
        }

        .card-body{
            text-align: left;
        }

        .card{
            display: block;
            width: 25%;
            color: black;
            border: 1px solid black;
            border-width: 0 1px 1px 0;
            cursor: pointer;
        }

        .card > *{
            pointer-events: none;
        }

        .card .card-body .card-title{
            margin: 0 0 0.5rem;
            font-size: 1.25rem;
        }

        .footer{
            display: flex;
            flex-wrap: wrap;
            overflow: hidden;
            margin: 0 auto;
            padding: 4rem 5% 6rem;
            background-color: black;
            box-sizing: border-box;
            position: relative;
        }

        .footer-address{
            width: 50%;
        }

        .footer-logo{
            display: inline-block;
            max-width: 250px;
            margin: 0 0 5px;
        }

        .footer-info{
            width: 100%;
            margin: 1rem 0 0;
        }

        .footer-info > p{
            color: white;
        }

        a{
            -webkit-text-decoration-skip: ink;
            text-decoration-skip-ink: auto;
            /* https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-skip-ink */
            color: rgb(255, 246, 246);
        }

        fieldset{
            margin: 1rem 0;
            padding: 0;
            display: flex;
            border: none;
        }

        img{
            vertical-align: middle;
            overflow-clip-margin: content-box;
            overflow: clip;
        }

        h1, h2, h3{
            font-weight: 700px;
            color: black;
            line-height: 1.4;
            word-break: keep-all; /* 텍스트가 자신의 콘텐츠 박스 밖으로 오버플로 할 때 줄을 바꿀 지 지정 */
            /* https://developer.mozilla.org/ko/docs/Web/CSS/word-break */
        }

        h1{
            display: block;
            margin-block-start: 0.67em;
            margin-block-end: 0.67em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }

        h1, p{
            margin: 0;
        }

        /*위에는 승주님이 적으신 css*/
        button:not(:active), button:not(:focus) {
            outline: 0;
        }
        .secondary-button {
            display: inline-block;
            min-width: 104px;
            background: #ff6b00;
            padding: 10px 1.5rem 11px;
            border-radius: 0;
            text-align: center;
            color: #fff;
            cursor: pointer;
            position: relative;
            border-radius: 8px;
            border: 1px solid #051619;
            box-sizing: border-box;
            background: #fff;
            color: #051619;
        }
        button {
            padding: 0;
            border: none;
            background: none;
            cursor: pointer;
            font: inherit;
            position: relative;
        }
        .secondary-button:focus:not(:disabled), .secondary-button:hover:not(:disabled) {
            background: #ff1678;
        }
        .loadmore {
            display: block;
            margin: 0 auto;
            width: 20rem;
            flex-wrap: wrap;
        }

        .reply-input{
            width: 500px;
            padding: 10px 40px 11px 1.5rem;
            border: 1px solid black;
            border-radius: 10px;
            box-sizing: border-box;
            box-shadow: 0;
            font: inherit;
            color: black;
            outline: none;
        }
        .reply-submit{
            width: 60px;
            margin: 0 0 0 10px;
            border: none;
            border-radius: 10px;
            background-color: #ff1678;
            font-weight: bold;
            cursor: pointer;
            height: 48px;
        }

        .reply-list {
            padding: 0px 35px 0px 35px;
        }

        .reply-content {
            padding: 15px;
            text-align: left;
        }

        .reply-name{
            font-size: 1.17em;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            font-weight: bold;
        }

        .reply-date {
            color: gray;
            padding-left: 10px;
        }

        .reply-comment {
            display: block;
        }

        .reply-icons {
            text-align: right;
        }

        #play {
            padding:0;
            margin:20px;
            background-color:transparent;

            width:20px;
            height:20px;
            border-color:transparent transparent transparent gray;
            border-style:solid solid solid solid;
            border-width:10px 0 10px 20px;
            float:right;
        }

        .post-body{    max-width: 45.7142rem;
            margin: 0 auto;
            padding: 0 1.4285rem 5.7142rem;
        }

        .post-page {
            border-top: solid 1px;
            padding-top: 20px;
            text-align: center;
        }
        .post-image {
            margin-top: 2rem;
            margin-bottom: 0rem;
            padding: 0!important;
            border: 1px solid #051619;
            background: #fff;
        }

        .post-image > img {
            width:100%;
        }

        .post-icons {
            padding-top: 20px;
        }
        .post-icons > a > img {
            width: 25px;
            padding: 15px;
        }

        .reply-icons > a > img {
            width: 20px;
            padding: 5px;
        }

    </style>
</head>
<body>
<nav class="navbar" role="navigation">
    <div class="navbar-inner">
        <div class="navbar-menu" role="navigation"></div>
        <a class="navbar-logo" href="/">
            <img id="logo" src="${pageContext.request.contextPath}/resources/image/NewsYaLogo.png">
        </a>
        <div class="navbar-user">
            <a class="navbar-user-login" href="/goLogin">
                <img id="login" src="${pageContext.request.contextPath}/resources/image/Login.png">
            </a>
            <div class="navbar-user-info">
                <p id="user-name">${sessionScope.id}님</p>
                <button id="logout">로그아웃</button>
                <button id="mypage">마이페이지</button>
            </div>
        </div>
    </div>
</nav>
    <section class="news">
        <div class="news-category">
            <h2><span role="img" aria-label="" class="emoji">${categoryLabel}</span>  </h2>
            <span>2024-01-20</span>
            <button id="play"></button>
        </div>
        <div class="post-body">
            <!-- post-page 반복출력 -->
            <c:forEach var="board" items="${boardList}">
            <div class="post-page">
                <span >${board.date}</span>
                <h2>${board.title}</h2>
                <div class="post-image">
                    <img src="${board.img}" alt="" loading="lazy">

                </div>
                <div style="margin-bottom: 20px;"><span><%--[사진-뉴윅]--%></span></div>
                <div class="card-body">
                    <span>${board.content}</span>
                </div>
                <div class="post-icons">
                    <a href="좋아요"><img src="${pageContext.request.contextPath}/resources/image/yes.png"></a>
                    <a href="싫어요"><img src="${pageContext.request.contextPath}/resources/image/no.png"></a>
                    <a href="댓글"><img src="${pageContext.request.contextPath}/resources/image/reply.png"></a>
                    <a href="공유"><img src="${pageContext.request.contextPath}/resources/image/share.png"></a>
                </div>

                <div class="reply">
                    <h3 style="text-align: left;">댓글 10개</h3>
                    <!-- 댓글 갯수 불러오기 -->
                    <form action="reply">
                        <input type="text" class="reply-input" placeholder="댓글을 남겨주세요. 뉴스야는 독자 여러분의 의견을 경청하겠습니다." width="100%">
                        <button type="submit" class="reply-submit">작성</button>
                    </form>
                    <div class="reply-list">
                        <div class="reply-content">
                            <span class="reply-name">HB</span> <span class="reply-date">11:44:55</span>
                            <span class="reply-comment">인생을 풍부하게 하는 온갖 과실이 어디 있으랴?</span>
                            <div class="reply-icons">
                                <a href="좋아요"><img src="image/yes.png"></a>
                                <a href="싫어요"><img src="image/no.png"></a>
                            </div>
                        </div>
                        <hr>
                        <div class="reply-content">
                            <span class="reply-name">HB</span> <span class="reply-date">11:44:55</span>
                            <span class="reply-comment">인생을 풍부하게 하는 온갖 과실이 어디 있으랴?</span>
                            <div class="reply-icons">
                                <a href="좋아요"><img src="image/yes.png"></a>
                                <a href="싫어요"><img src="image/no.png"></a>
                            </div>
                        </div>

                    </div><div class="paging">  </div>
                </div>
            </div>
                <p></p>
            </c:forEach>
        </div>
        <nav class="posts-pagination">
            <button type="button" class="loadmore secondary-button">더보기</button>

        </nav>
    </section>
</div>
</body>
</html>