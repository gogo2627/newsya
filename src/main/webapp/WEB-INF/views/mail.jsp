<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NewsYa</title>
    <style>

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

        body{
            font-family: 'JalnanGothic';
            background-color: #fff6f6;
            letter-spacing: -.0125rem;
            positon: relative;
        }

        html{
            overflow: hidden;
            height: 100%;
            color: black;
            font-size: 14px;
            font-family: "Noto Sans KR", "Apple SD Gothic Neo", sans-serif;
            line-height: 1.8;
            text-rendering: optimizeLegibility; /* 작은 글자 가독성 최적화 */
            -webkit-text-size-adjust: 100%;
            -webkit-font-smoothing: antialiased;
        }

        img{
            vertical-align: middle;
            width: 100%;
            border: 0px;
            overflow-clip-margin: content-box; /*  */
            overflow: clip;
        }

        *{
            -webkit-tab-hightlight-color: white;
        }

        @font-face {
             font-family: 'JalnanGothic';
             src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
             font-weight: normal;
             font-style: normal;
        }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">

        $(function(){



        });

    </script>
</head>
<body>
<div>
    <nav class="navbar" role="navigation">
        <div class="navbar-inner">
            <div class="navbar-menu" role="navigation"></div>
            <div class="navbar-logo">
                <img id="logo" src="resources/image/NewsYaLogo.png">
            </div>
        </div>
    </nav>
    <section class = "news">
        <div class = "article">
            <div class = "img">
                <img src="">
            </div>
            <div class = "title">
                <p></p>
            </div>
            <div class = "content">

            </div>
        </div>
    </section>
</div>

</body>
</html>