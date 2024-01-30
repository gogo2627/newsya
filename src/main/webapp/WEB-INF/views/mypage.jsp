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

        button {
            font-family: 'JalnanGothic';
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
                <button class="pink-button">비밀번호 변경</button>
            </a>

            <a href="/goLikedArticle?pageNum=1">
                <button class="pink-button">북마크</button>
            </a>

            <button onclick="withdrawConfirm()" class="pink-button">회원탈퇴</button>
        </div>
    </nav>
</div>
</body>
</html>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/0eba089d9e.js" crossorigin="anonymous"></script>
<script>

    // 메인 화면으로 이동
    function moveHome() {
        location.href = "/";
    }

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

    function sConfirm(message, icon, okFuncName, cancelFuncName) {
        swal({
          text: message,
          icon: icon,
          buttons: true,
          dangerMode: true,
        })
        .then((isConfirm) => {
          if (isConfirm) {
            if(okFuncName != null && okFuncName != "") {
               eval(okFuncName + "()");
            }
          } else {
            if(cancelFuncName != null && cancelFuncName != "") {
                eval(cancelFuncName + "()");
            }
          }
        });
    }

    function withdrawConfirm() {
        sConfirm("탈퇴를 진행 하시겠습니까?", "warning", "withdraw", "");
    }

    function withdraw() {
        $.ajax({
                type: "POST",
                url: "/Withdraw",
                contentType: "application/json",
                success: function (data) {
                    if(data == "SUCCESS") {
                        sAlert("성공적으로 탈퇴 되었습니다.", "info", "OK", "moveHome");
                    }else {
                        sAlert("탈퇴에 실패 했습니다.", "error", "OK");
                    }
                },
                error: function (error) {
                    alert(error.responseJSON.message)
                }
            });
    }
</script>