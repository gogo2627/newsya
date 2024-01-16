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

            .login-id{
                margin: 1rem 0;
                position: relative;
            }

            .login-pw{
                margin: 1rem 0 2px;
                position: relative;
            }

            .login-find{
                margin: 0 0 1rem;
                position: relative;
            }

            .login-input, .login-submit{
                display: block;
                width: 100%;
                padding: 10px 40px;
                border: 1px solid black;
                border-radius: 10px;
                box-sizing: border-box;
                box-shadow: 0;
                font: inherit;
                color: black;
                outline: none;
            }

            .finding{
                display: inline-block;
                margin: 0;
                padding: 0 5px 5px;
                color: #ff1678;
            }

            .login-submit{
                background: #ff1678;
                color: black;
                text-align: center;
                position: relative;
                border: none;
                cursor: pointer;
                font-weight: bold;
            }

            body{
                background-color: #fff6f6;
                letter-spacing: -.0125rem;
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">

            $(function(){

                 if("${msg}" != null && "${msg}" != "") {
                    swal({
                        text:"${msg}",
                        icon: "info",
                    });
                 }

                // 실시간 공백 제거
                $(".login-input").on('keyup',function(){

                    $(this).each(function(index, element){
                        let inputVal = [$(this).val()];
                        inputVal = WhiteSpaceChk(inputVal);
                        $(this).val(inputVal);
                    });

                });

                $(".login-submit").click(function(event){

                    let tmp = 0;
                    let inputVal = [];

                    $(".login-input").each(function(index, element) {
                        inputVal.push($(element).val());
                    });

                    let whiteSpaceChkRes = WhiteSpaceChk(inputVal);

                    let nullChkRes = NullChk(whiteSpaceChkRes);

                    if(nullChkRes != 1){
                        event.preventDefault();
                    }

                });

                // 공백 제거 (반복문, 정규식과 replace 함수 이용)
                function WhiteSpaceChk(whiteSpaceChk){

                    $.each(whiteSpaceChk, function(index, res){
                    whiteSpaceChk[index] = res.replace(/\s/g, "");
                    /*
                    res[index]는 배열의 각 요소에 대한 접근 방식이 아닙니다.
                    $.each를 사용하면 res가 각 배열 요소를 나타내기 때문에 res[index] 대신에 res를 직접 수정해야 합니다.
                    replace 함수는 문자열에 대해서 동작하므로, 배열의 각 요소에 대해 바로 사용할 수 없습니다.
                    배열 요소를 문자열로 변환한 후에 replace를 사용해야 합니다. (입력 값은 전부 문자열이어서 변환 필요 X)
                    */
                    });

                console.log(whiteSpaceChk);

                return whiteSpaceChk;
                }

                function NullChk(whiteSpaceChkRes){
                    let nullChkRes = 0;

                    $.each(whiteSpaceChkRes, function(index, element){
                        if(element.length > 0){
                            nullChkRes = 1;
                        }else{
                            nullChkRes = 0;
                            return false;
                        }

                    });

                    return nullChkRes;
                    // https://ifuwanna.tistory.com/227
                }

            });


        </script>
</head>
<body>
        <div>
            <section class="login-wrap">
                <form class="login-tab" name="login" action="/login" method="post">
                    <header class="login-head">
                        <a class="login-logo" href="/">
                            <img src="resources/image/NewsYaLogo.png">
                        </a>
                    </header>
                    <div class="login-id">
                        <input type="id" name="id" class="login-input" placeholder="아이디">
                    </div>
                    <div class="login-pw">
                        <input type="password" name="password" class="login-input" placeholder="비밀번호" max-length="20">
                    </div>
                    <div class="login-find">
                        <a class="finding" href="/goFindId">아이디 찾기</a>
                        <a class="finding" href="/goFindPw">비밀번호 찾기</a>
                        <a class="finding" href="/goRegister">회원가입</a>
                    </div>
                    <input type="submit" class="login-submit" value="로그인">
                </form>
            </section>
        </div>
</body>
</html>