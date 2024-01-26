<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
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

        .button-group {
            margin-top: 100px;
            display: flex;
            justify-content: center;
            gap: 80px; /* 버튼 사이의 간격을 조절 */
        }

        .pink-button {
            border-radius: 100px;
            background-color: rgb(255, 22, 120);
            color: white;
            border: none;
            padding: 80px;
            font-size: 30px;
        }


    </style>
</head>
<body>
<div>
    <nav class="navbar" role="navigation">
        <div class="navbar-inner">
            <div class="navbar-menu" role="navigation"></div>
            <a class="navbar-logo" href="/">
                <img id="logo" src="resources/image/NewsYaLogo.png" alt="로고">
            </a>
        </div>
        <h1 id="title">마이페이지</h1>
        <div class="button-group">
            <a href="/goEditProfile">
                <button class="pink-button">회원정보 수정</button>
            </a>

            <a href="/goLikedArticle?pageNum=1">
                <button class="pink-button">관심기사목록</button>
            </a>

            <button onclick="withdraw()" class="pink-button">회원탈퇴</button>
        </div>
    </nav>
</div>
</body>
</html>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    function withdraw() {
        const isOk = confirm("탈퇴를 진행 하시겠습니까?");
        if (isOk) {

            $.ajax({
                type: "POST",
                url: "/Withdraw",
                contentType: "application/json",
                success: function (data) {
                    alert("성공적으로 탈퇴 되었습니다.")
                    location.href="/";
                },
                error: function (error) {
                    alert(error.responseJSON.message)
                }
            });
        }
    }
</script>