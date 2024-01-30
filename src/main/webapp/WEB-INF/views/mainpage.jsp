<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewsYa</title>
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
            margin: 0 0 0 5px;
            padding: 3px 5px;
            border-radius: 10px;
            background-color: #ff1678;
        }

        .navbar-user-info > p{
            font-size: 1rem;
            font-weight: 500px;
            text-align: right;
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

        .intro-head{
            position: relative;
            cursor: default;
        }

        .intro-head-title{
            padding: 1rem 0;
            font-size: 2.5rem;
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
            transform: translateX(-50%);
            width: 100%;
            max-width: 250px;
            margin-left: 20%;
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
            font-size: 1.5rem;
            color: rgb(255,255,255);
            font: inherit;
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
        }

        .news-category{
            cursor: default;
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
            display: inline;
        }

        #interest-check{
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

        .navbar-user-info{
            display: none;
        }

        button{
            border: none;
        }

    </style>
    <script src="https://kit.fontawesome.com/0eba089d9e.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">

        $(function(){

            var audio = new Audio();
            let urlList = []; // TTS 오디오 파일 url 주소 담을 배열
            let index = 0; // TTS 오디오 파일 index

            // 배열에 TTS 오디오 파일 주소 적재
            "${ulist}".replace(/^\[|\]$/g, '').split(',').forEach((element, index) => {
                urlList.push("https://kr.object.ncloudstorage.com/newsya/" + element.trim() + ".mp3");
            });

             if("${msg}" != null && "${msg}" != "") {
                swal({
                    text:"${msg}",
                    icon: "info",
                    button: "OK",
                });
             }

            // 로그인 상태
            if("${sessionScope.id}".length > 0){

                // 로그인 정보 띄우기
                $(".navbar-user-login").hide();
                $(".navbar-user-info").css("display", "flex");

                const id = {"id": "${sessionScope.id}"};
                // ajax로 관심분야 갖고오기(배열값 리턴 받는다.)
                const ajaxRes = Ajax("/getInterest", id);

                // 해당 아이디에 이미 설정된 관심분야는 V 표시
                // each의 index와 interest 클래스와 eq를 사용해 hide, show
                $.each(ajaxRes, function(index, element){
                    if(ajaxRes[index] === true){
                        $(".interest:eq(" + index + ") > span:eq(0)").css("display", "none");
                        $(".interest:eq(" + index + ") > span:eq(1)").css("display", "inline");
                    }
                });


                $(".interest").click(function(){

                    // 변경사항 db에 저장
                    const val = {"id":"${sessionScope.id}", "index":Index($(".interest").index(this))};
                    const ajaxRes = Ajax("/updateInterest", val);
                    // 정치를 눌렀다면 백으로 정치라는 단어를 보내주고,
                    // db에 정치가 있으면 삭제, 없다면 추가

                    if(ajaxRes === "0"){
                        $(this).find("> span:eq(1)").css("display", "none");
                        $(this).find("> span:eq(0)").css("display", "inline");
                    }else if(ajaxRes === "1"){
                        $(this).find("> span:eq(0)").css("display", "none");
                        $(this).find("> span:eq(1)").css("display", "inline");
                    }else{
                        swal({
                            text: ajaxRes,
                            icon: "info",
                            button: "OK",
                        });
                    }

                });

            }else{ // 비로그인 상태

                $("#interest-plus").css("display", "inline");
                $("#interest-check").css("display", "none");

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

            $("#audio").click(() => {
                playAudioSequentially(index, urlList);
            });

            $("#pause").click(() => {
                audio.pause();
            });

            function Ajax(url, val){

                let res;

                $.ajax({
                    url: url,
                    type:'POST',
                    data:JSON.stringify(val),
                    async:false, // 비동기 -> 동기식
                    contentType:"application/json",
                    dataType:"json",
                    success: function(msg){

                        res = msg.res;

                    },
                    error: function(){
                        swal("통신 에러", "다시 시도해주세요.", "info");
                    }
                });

                return res;
            }

            function Index(index){

                console.log("인덱스 함수 인덱스 : " + index);
                let res;

                switch(index) {
                    case 0:
                        res = "politics";
                        break;
                    case 1:
                        res = "economic";
                        break;
                    case 2:
                         res = "social";
                         break;
                    case 3:
                         res = "foreign";
                         break;
                    default:
                         break;
                }

                console.log("인덱스 함수 결과 : " + res);
                return res;
            }

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

                }else{
                    index = 0;
                }

            }

            function stopAudio(){
                audio.pause();
            }
        });
    </script>
    <!--
        문제:
        playAudioSequentially 함수에서 한번 오디오 파일을 재생할 때마다 'ended' 이벤트에서 찍히는 로그의 개수가 2배씩 늘어나는 문제가 있었다.

        원인과 해결:
        The issue with the doubling of console log messages is likely due to the fact that the code snippet is inside an event listener that is called multiple times.
        Every time the ended event is triggered (indicating that an audio file has finished playing),
        the event listener is invoked, leading to the increase in the number of console log messages.

        In your code:

        audio.addEventListener('ended', function(){
            console.log("재생 횟수 : " + index);
            index = index + 1;
            playAudioSequentially(index, urlList);
        });

        The ended event listener is calling the playAudioSequentially function recursively.
        However, each time it does so, it attaches a new instance of the event listener to the ended event.
        As a result, when the next audio file finishes playing, all the attached event listeners are invoked,
        causing the console log messages to multiply.

        To address this issue, you can consider removing the event listener before attaching a new one. One way to achieve this is by using the once option when attaching the event listener:

        audio.addEventListener('ended', function onEnded() {
            console.log("재생 횟수 : " + index);
            index = index + 1;
            audio.removeEventListener('ended', onEnded);  // Remove the event listener
            playAudioSequentially(index, urlList);
        }, { once: true });

        By using { once: true }, you ensure that the event listener is automatically removed after it has been executed once. This should prevent the doubling of console log messages.
    -->
</head>
<body>
<div>
    <nav class="navbar" role="navigation">
        <div class="navbar-inner">
            <div class="navbar-menu" role="navigation"></div>
            <a class="navbar-logo" href="/">
                <img id="logo" src="resources/image/NewsYaLogo.png">
            </a>
            <div class="navbar-user">
                <a class="navbar-user-login" href="/goLogin">
                    <img id="login" src="resources/image/Login.png">
                </a>
                <div class="navbar-user-info">
                    <p id="user-name">${sessionScope.id}님</p>
                    <button id="logout">로그아웃</button>
                    <button id="mypage">마이페이지</button>
                </div>
            </div>
        </div>
    </nav>
    <header class="intro-head">
        <h1 class="intro-head-title">
            <div class="intro-inner">
                시간이 없어?
                <span class="mobile-block">그럼 핵심만 들려줄게!</span>
            </div>
        </h1>
        <div class="intro-head-banner">
            <div class="intro-bullhorn">
                <img id="bullhorn" src="resources/image/LoudSpeaker.png">
            </div>
            <div class="intro-inner">
                <p>하루 하루 바쁘시죠?</p>
                <p>그런 당신을 위해 우리가 핵심만 들려줄게요.</p>
                <br>
                <p>바쁜 당신을 위한 뉴스 요약 서비스</p>
                <div class="search-tab">
                    <form action="/searchKeyWord" method="post">
                        <fieldset>
                            <input type="search" class="search-input" name="keyWord">
                            <button type="submit" class="search-button">
                                <img src="resources/image/Search.png">
                            </button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </header>
    <nav class="category" role="navigation">
        <div class="category-inner">
            <a class="category-link" href="/category/all">
                <span role="img">&#127756;</span>
                    전체
                </span>
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
        <div class="audioControl">
            <i id="audio" class="fa-solid fa-play" style="color: #ff1678;"></i>
            <i id="pause" class="fa-solid fa-stop" style="color: #ff1678;"></i>
        </div>
        <div class="news-category">
            <h2>⚖️ 정치</h2>
            <!--
            <button class="interest">
                <span id="interest-plus">➕</span>
                <span id="interest-check">✔</span>
                <span>관심분야</span>
            </button>
            -->
        </div>
        <div class="posts">
            <c:forEach var="plist" items="${plist}">
            <a class="card" href="/category/politics/article/${plist.id}">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="${plist.img}">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">${plist.title}</h3>
                        <time class="card-date">${plist.date}</time>
                    </div>
                </div>
            </a>
            </c:forEach>
            <!--
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시2</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시3</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시4</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            -->

        </div>

        <div class="news-category">
            <h2>💰 경제</h2>
            <!--
            <button class="interest">
                <span id="interest-plus">➕</span>
                <span id="interest-check">✔</span>
                <span>관심분야</span>
            </button>
            -->
        </div>
        <div class="posts">
            <c:forEach items="${elist}" var="elist">
            <a class="card" href="/category/economic/article/${elist.id}">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="${elist.img}">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">${elist.title}</h3>
                        <time class="card-date">${elist.date}</time>
                    </div>
                </div>
            </a>
            </c:forEach>
            <!--
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시2</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시3</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시4</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            -->
        </div>

        <div class="news-category">
            <h2>🤝 사회</h2>
            <!--
            <button class="interest">
                <span id="interest-plus">➕</span>
                <span id="interest-check">✔</span>
                <span>관심분야</span>
            </button>
            -->
        </div>
        <div class="posts">
            <c:forEach var="slist" items="${slist}">
            <a class="card" href="/category/society/article/${slist.id}">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="${slist.img}">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">${slist.title}</h3>
                        <time class="card-date">${slist.date}</time>
                    </div>
                </div>
            </a>
            </c:forEach>
            <!--
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시2</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시3</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시4</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            -->
        </div>

        <div class="news-category">
            <h2>&#127757; 세계</h2>
            <!--
            <button class="interest">
                <span id="interest-plus">➕</span>
                <span id="interest-check">✔</span>
                <span>관심분야</span>
            </button>
            -->
        </div>
        <div class="posts">
            <c:forEach var="flist" items="${flist}">
            <a class="card" href="/category/foreign/article/${flist.id}">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="${flist.img}">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">${flist.title}</h3>
                        <time class="card-date">${flist.date}</time>
                    </div>
                </div>
            </a>
            </c:forEach>
            <!--
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시2</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시3</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            <a class="card" href="">
                <div class="card-inner">
                    <figure class="card-thumbnail">
                        <img src="">
                    </figure>
                    <div class="card-body">
                        <h3 class="card-title">예시4</h3>
                        <time class="card-date">2023/12/15</time>
                    </div>
                </div>
            </a>
            -->
        </div>
    </section>

    <footer class="footer" role="contentinfo">
        <div class="footer-address">
            <a class="footer-logo" href="/">
                <img id="logo" src="resources/image/NewsYaLogo.png">
            </a>
        </div>
        <div class="footer-info">
            <p>(주)NewsYa</p>
            <p>대표: 뉴스야 / 사업자 등록번호: 123-00-123456</p>
            <p>서울특별시 광진구 능동로 195-16 5층, 6층</p>
            <p>newsya@newsya.com</p>
            <small class="footer-copyright">Copyright &copy; NewsYa</small>
        </div>
    </footer>
</div>
</body>
</html>