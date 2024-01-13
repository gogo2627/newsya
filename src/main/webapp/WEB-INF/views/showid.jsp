<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NewsYa</title>
        <style>

            .login-wrap{
                display: flex;
                min-height: 100vh;
            }

             .login-tab{
                 max-width: 400px;
                 margin: 0 auto;
                 padding: 7.5% 5% 4rem;
                 position: relative;
             }

            .login-head{
                text-align: center;
            }

            .login-logo{
                display: block;
                width: 60%;
                margin: 0 auto 3rem;
            }

            .show-id-div{
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .show-id, .real-id{
                text-align: center;
                color: black;
                font-size: 1.5rem;
                font-weight: bold;
            }

            .real-id{
                color: #ff1678;
            }

            .go-login{
                display: block;
                width: 70%;
                margin: 5% auto;
                padding: 10px 40px;
                border: 1px solid black;
                border-radius: 10px;
                box-sizing: border-box;
                box-shadow: 0;
                font: inherit;
                color: black;
                outline: none;
                background: #ff1678;
                text-align: center;
                position: relative;
                border: none;
                cursor: pointer;
                font-weight: bold;
            }

            body{
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
        </style>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script type="text/javascript">

            $(function(){

                $(".go-login").click(() => {
                    location.href="/goLogin";
                });

            });

        </script>
</head>
<body>
        <div>
            <section class="login-wrap">
                <div class="login-tab" name="login" action="/login" method="post">
                    <header class="login-head">
                        <a class="login-logo" href="/">
                            <img src="resources/image/NewsYaLogo.png">
                        </a>
                    </header>
                    <div class="show-id-div">
                        <p class="show-id">찾으시는 ID는 <span class="real-id">${id}</span> 입니다.</p>
                    </div>
                    <button class="go-login">로그인</button>
                </div>
            </section>
        </div>

</body>
</html>