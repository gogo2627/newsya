<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        @font-face {
            font-family: 'JalnanGothic';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        *{
            -webkit-tap-highlight-color: white;

        }

        .navbar{
            background: #fff6f6;
            position: relative;
            border-bottom: 1px solid black;
        }

        .navbar .navbar-inner{
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 0;
            padding: 3rem 5%;
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

        .navbar-user-info > button{
            border: none;
            text-align: center;
            margin: 10px 0 10px 5px;
            padding: 3px 5px;
            border-radius: 10px;
            background-color: #ff1678;
        }

        .navbar-user-info > p{
            font-size: 1rem;
            font-weight: 500px;
            text-align: right;
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
            background-color: #ff1678;
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
            font-size: 1.15rem;
            color: rgb(255,255,255);
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


        .category-link:hover{
            color: #ff6b00;
            /*border-bottom: 3px solid black;*/
        }

        .category-link{
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 2rem;
            padding: 1.25rem 0px;
            font-size: 1.5rem;
            font-weight: 500;
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

        .news-category > h1{
            display: inline-block;
            vertical-align: middle;
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

        #interest-plus{
            display: none;
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

        .card .card-body .card-title{
            margin: 0 0 0.5rem;
            font-size: 1.25rem;
            word-wrap: break-word;
            overflow: hidden;
            white-space: normal;
            text-overflow: ellipsis;
            text-align: left;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical
            /* https://velog.io/@syoung125/CSS-text-overflow-ellipsis-%EB%91%90%EC%A4%84-%EC%9D%B4%EC%83%81-%EC%B2%98%EB%A6%AC */
        }

        .footer{
            display: flex;
            flex-wrap: wrap;
            overflow: hidden;
            margin: 0 auto;
            padding: 4rem 8% 6rem;
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
            line-height: 2;
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
            margin: 10px;
        }

        .navbar-user-info{
            display: none
        }

        /*위에는 승주님이 적으신 css*/
        button:not(:active), button:not(:focus) {
            outline: 0;
        }

        .category-title{
            margin-bottom: 3px;
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
            padding: 20px;
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

        @media screen and (max-width: 750px){ /* 화면크기가 750px 이하면 로그인했을때 로그인 정보 숨긴다. */
            /* (기본적으로 화면 조건 설정할 때, 화면 크기는 margin까지 포함한 크기이다.) */
            .navbar-user-info, #bullhorn{
                display:none;
            }

            .navbar-user-info > p, button{
                display:none;
            }

        }

        #playAllButton {
            padding: 0;
            margin: 1%;
        }

        .audioControl{
            display: flex;
            justify-content: right;
            align-items: center;
            margin: 0
            padding: 0;
        }

        #audio{
            padding: 1% 1%;
            margin: 0;
        }

        #pause{
            padding: 1% 1%;
            margin: 0;
        }

        .fa-play, .fa-stop{
            font-size: 1.5rem;
        }

    </style>
    <script src="https://kit.fontawesome.com/0eba089d9e.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">

        $(function(){

            if("${msg}" != null && "${msg}" != "") {
                swal({
                    text:"${msg}",
                    icon: "info",
                    button: "OK",
                });
            }

            if("${categoryLabel}" != null && "${categoryLabel}" != ""){
                // 사용자가 선택한 특정 날짜가 있다면 그 날짜를, 아니면 오늘 날짜를 보여준다.
                if("${date}" != null && "${date}" != ""){
                    // 날짜 선택 칸을 특정 날짜로 세팅.
                    $("#select-date").val("${date}");
                }else{
                    // 날짜 선택 칸 오늘 날짜로 세팅.
                    const today = new Date().toISOString().substring(0,10);
                    $("#select-date").val(today);
                }
            }else{
                $(".news-date").hide();
            }



            // 각 분야 목록 페이지에 어떤 목록인지 이모티콘과 함께 표시.
            $(".category-title").html(getCategoryLabel("${categoryLabel}"));

            // 오늘 이후 날짜 선택 막기.
            const maxDay = new Date((Date.now())-(new Date().getTimezoneOffset()*60000)).toISOString().split("T")[0];
            $("#select-date").prop("max", maxDay);

            // 로그인 상태
            if("${sessionScope.id}".length > 0){

                // 로그인 정보 띄우기
                $(".navbar-user-login").hide();
                $(".navbar-user-info").css("display", "flex");

            }else{ // 비로그인 상태
                $(".interest").click(function(){
                    window.location.href="/goLogin"; // 로그인 페이지로
                });
            }

            // 로그아웃
            $("#logout").click(function(){
                console.log("logout");
                window.location.href="/logout";
            });

            // 마이페이지
            $("#mypage").click(() => {
                location.href="/goMyPage";
            });

            $("#select-date").change(() => {
                location.href="/category/${category}/date=" + $("#select-date").val();
            });

            $(".like-button").click(function() {
                var newsId = $(this).data("news-id");
                $.ajax({
                    url: "/toggleLike",
                    type: "POST",
                    data: { newsId: newsId },
                    success: function(response) {
                        alert(response); // 좋아요 상태 변경 결과를 알림 // sweetalert api 사용하는 코드로 수정해주세요.
                    },
                    error:function(){
                        swal("통신 에러", "다시 시도해주세요.", "info");
                    }
                });
            });

            function Ajax(url, tmp){

                let res;

                $.ajax({
                    url: url,
                    type: "post",
                    data: JSON.stringify(tmp),
                    dataType: "json",
                    applicationType: "application/json",
                    success: function(msg){
                        res = meg.res;
                    },
                    error: function(){
                        swal("통신 에러", "다시 시도해주세요.", "info");
                    }
                });

                return res;
            }

<<<<<<< HEAD
        });
    function sAlert(message, icon, buttonText, funcName) {
            swal({
                text: message,
                icon: icon,
                button: buttonText,
             }).then(function(){
                if(funcName != null && funcName != "") {
                    eval(funcName + "()");
                }
             });
        }
    </script>
    <script>
        $(document).ready(function() {
            $(".like-button").click(function() {
                var newsId = $(this).data("news-id");
                $.ajax({
                    url: "/toggleLike",
                    type: "POST",
                    data: { newsId: newsId },
                    success: function(response) {
                        if(response == "SUCCESS") {
                            sAlert("관심기사목록에 추가 되었습니다.", "info", "OK");
                        }else {
                            sAlert("좋아요 실패", "error", "OK");
                        }
                    }
                });
            });
=======
            function getCategoryLabel(category) {
                switch (category) {
                    case "politics":
                        return "⚖\uFE0F 정치";
                        break;
                    case "economic":
                        return "\uD83D\uDCB0 경제";
                        break;
                    case "society":
                        return "\uD83E\uDD1D 사회";
                        break;
                    case "foreign":
                        return "&#127757 세계";
                        break;
                    case "all":
                        return "&#127756 전체";
                        break;
                    default:
                        return "🔍️ 검색 결과";
                        break;
                }
            }

>>>>>>> 10eb3bf2d61d4e809caddcfd711f618649d23d58
        });
    </script>
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
    <nav class="category" role="navigation">
        <div class="category-inner">
            <a class="category-link" href="/category/all">
                <span role="img">&#127756;</span>
                전체
            </a>
            <a class="category-link" href="/category/politics">
                <span>
                    <span role="img">⚖️</span>
                    정치
                </span>
            </a>
            <a class="category-link" href="/category/economic">
                <span>
                    <span role="img">💰</span>
                    경제
                </span>
            </a>
            <a class="category-link" href="/category/society">
                <span>
                    <span role="img">🤝</span>
                    사회
                </span>
            </a>
            <a class="category-link" href="/category/foreign">
                <span>
                    <span role="img">&#127757;</span>
                    세계
                </span>
            </a>
        </div>
    </nav>
    <section class="news">
        <div class="news-category">
            <h1 class="category-title"></h1>
            <div class="news-date"><input type="date" id="select-date"></div>
            <!--
            https://inpa.tistory.com/entry/JS-%F0%9F%93%9A-%EC%9D%8C%EC%95%85-%EA%B0%9D%EC%B2%B4Audio-%EB%8B%A4%EB%A3%A8%EA%B8%B0
            https://velog.io/@soob1008/js-Audio-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0
            -->
        </div>

        <div class="post-body" id="post-container">
            <!-- post-page 반복출력 -->
            <div class="audioControl">
                <i id="audio" class="fa-solid fa-play" style="color: #ff1678;"></i>
                <i id="pause" class="fa-solid fa-stop" style="color: #ff1678;"></i>
            </div>
            <c:forEach var="board" items="${boardList}">
            <div class="post-page">
                <span ><fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" /></span>
                <h2>${board.title}</h2>
                <div class="post-image">
                    <img src="${board.img}" alt="" loading="lazy">
                </div>
                <div style="margin-bottom: 20px;"></div>
                <div class="card-body">
                    <span>${board.content}</span>
                </div>
                <div class="post-icons">
                    <a href="#" class="like-button" data-news-id="${board.id}">
                        <img src="${pageContext.request.contextPath}/resources/image/yes.png">
                    </a>
                    <a href="댓글"><img src="${pageContext.request.contextPath}/resources/image/reply.png"></a>
                    <a href="공유"><img src="${pageContext.request.contextPath}/resources/image/share.png"></a>
                </div>

                <div class="reply">

                </div>
            </div>
                <p></p>
            </c:forEach>
        </div>

        <!-- 페이지네이션을 위한 이전/다음 버튼 -->
        <nav class="posts-pagination">
            <!-- 현재 페이지가 1보다 큰 경우에만 이전 버튼 표시 -->
            <c:if test="${currentPage > 1}">
                <a href="javascript:void(0);" onclick="window.history.back();" class="loadmore secondary-button">이전</a>
            </c:if>

            <!-- 다음 페이지 버튼 -->
            <a href="javascript:void(0);" onclick="nextPage();" class="loadmore secondary-button">다음</a>
        </nav>

</div>

<%--<script type="text/javascript">
    $(function(){
        // 음악 파일 주소 배열 초기화
        var audioUrls = [];

        // 각 게시물의 카테고리와 URL 정보를 가져와서 음악 파일 주소를 생성하여 배열에 추가
        <c:forEach var="board" items="${boardList}">
        // URL에서 마지막 숫자만 추출
        var url = "${board.url}";
        var lastIndex = url.lastIndexOf("/") + 1;
        var filename = url.substring(lastIndex);
        var category = "${board.category}";
        var audioUrl = "https://kr.object.ncloudstorage.com/newsya/" + category + "_" + filename + ".mp3";

        // 생성된 주소를 배열에 추가
        audioUrls.push(audioUrl);

        // 생성된 음악 파일 경로를 콘솔에 출력
        console.log("Audio URL for " + category + ": " + audioUrl);
        </c:forEach>

        // 모든 음악 파일을 재생하는 버튼 클릭 시
        $("#playAllButton").click(function() {
            // 첫 번째 음악부터 순차적으로 재생 시작
            playAudioSequentially(0);
        });

        // 오디오 순차 재생 함수
        function playAudioSequentially(index) {
            if(index < audioUrls.length) {
                var audio = new Audio(audioUrls[index]);
                audio.addEventListener('ended', function(){
                    console.log("재생 횟수 : " + index);
                    // 다음 음악 파일 재생을 위해 인덱스 증가 후 재귀 호출
                    playAudioSequentially(index + 1);
                });
                audio.play();
            }
        }
    });
</script>--%>

        <script type="text/javascript">

            $(function(){

                var audio = new Audio();
                var urlList = []; // TTS 오디오 파일 url 주소 담을 배열
                let index = 0; // TTS 오디오 파일 index

                // 각 게시물의 카테고리와 URL 정보를 가져와서 음악 파일 주소를 생성하여 배열에 추가
                <c:forEach var="board" items="${boardList}">
                // URL에서 마지막 숫자만 추출
                var url = "${board.url}";
                var lastIndex = url.lastIndexOf("/") + 1;
                var filename = url.substring(lastIndex);
                var category = "${board.category}";
                var audioUrl = "https://kr.object.ncloudstorage.com/newsya/" + category + "_" + filename + ".mp3";

                // 생성된 주소를 배열에 추가
                urlList.push(audioUrl);

                // 생성된 음악 파일 경로를 콘솔에 출력
                console.log("Audio URL for " + category + ": " + audioUrl);
                </c:forEach>


                $("#audio").click(() => {
                    playAudioSequentially(index, urlList);
                });

                $("#pause").click(() => {
                    audio.pause();
                });

                // 오디오 순차 재생 함수
                function playAudioSequentially(index, urlList) {
                    if(index < urlList.length){

                        audio.src = urlList[index];

                        // 오디오 파일 로딩 대기
                        audio.addEventListener('canplaythrough', () => {
                            audio.play();
                        });

                        // 오디오 재생 끝나면
                        audio.addEventListener('ended', function onEnded() {
                            index = index + 1;
                            audio.removeEventListener('ended', onEnded);  // Remove the event listener
                            playAudioSequentially(index, urlList);
                        }, { once: true });

                    } else {
                        index = 0;
                    }
                }

                function stopAudio(){
                    audio.pause();
                }
            });
        </script>

        <script>
            function nextPage() {
                var currentPage = parseInt('${currentPage}');
                var currentUrl = window.location.href;

                var nextPageUrl;
                if (currentUrl.includes('?')) {
                    if (currentUrl.includes('page=')) {
                        nextPageUrl = currentUrl.replace(/page=\d+/, 'page=' + (currentPage + 1));
                    } else {
                        nextPageUrl = currentUrl + '&page=' + (currentPage + 1);
                    }
                } else {
                    nextPageUrl = currentUrl + '?page=' + (currentPage + 1);
                }

                window.location.href = nextPageUrl;
            }
        </script>

</body>
</html>