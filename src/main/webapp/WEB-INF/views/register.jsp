<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NewsYa</title>
    <style>

        .finding-wrap{
            display: flex;
            min-height: 100vh;
        }

        .finding-pw-tab{
            max-width: 400px;
            margin: 0 auto;
            padding: 7.5% 5% 4rem;
            position: relative;
        }

        .finding-head{
            text-align: center;
        }

        .finding-logo{
            display: block;
            width: 60%;
            margin: 0 auto 3rem;
        }

        .finding-pw-name, .pw-input-tab, .email-input-tab{
            display: flex;
            margin: 1rem 0;
            position: relative;
            justify-content: center;
        }

        .finding-pw-tel, .id-input-tab, .pw-chk-tab{
            display: flex;
            margin: 1rem 0 1rem;
            position: relative;
            justify-content: end;
            padding-left: 30px;
        }

        .login-find{
            margin: 0 0 1rem;
            position: relative;
        }

        .finding-input, .finding-input-auth,.register-submit{
            width: 300px;
            padding: 10px 40px 11px 1.5rem;
            border: 1px solid black;
            border-radius: 10px;
            box-sizing: border-box;
            box-shadow: 0;
            font: inherit;
            color: black;
            outline: none;
        }

        .finding-input-auth{
            width: 150px;
        }

        .finding-input{
            justify-content: end;
        }

        #finding-input-name, #pw, #email{
            margin-right: 40px;
        }

        .true, .false{
            width: 60px;
            justify-content: center;
            align-items: center;
        }

        .true{
            display: none;
        }

        .false{
            display: flex;
        }

        .fa-regular, .fa-solid{
            font-size: 30px;
        }

        .register-submit{
            background: #ff1678;
            color: black;
            justify-content: center;
            position: relative;
            border: none;
            cursor: pointer;
            font-weight: bold;
            justify-content: center;
            margin-right: 40px;
        }

        .tel-auth, .id-duplicate-chk, .true, .false{
            margin: 0 0 0 10px;
        }

        .auth{
            display: none;
            justify-content: end;
        }

        .auth-check, .auth-resend{
            display: block;
        }

        .time{
            display: flex;
            align-items: center;
            margin: 0 0 0 10px;
        }

        .time > p{
            font-weight: bold;
            color: #ff1678;
        }

        .register-submit-tab{
            display: flex;
            justify-content: center;
            margin: 1rem 0;
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

        button{
            width: 60px;
            margin: 0 0 0 10px;
            border: none;
            border-radius: 10px;
            background-color: #ff1678;
            font-weight: bold;
            cursor: pointer;
        }

        *{
            -webkit-tab-hightlight-color: white;
        }
    </style>
    <script src="https://kit.fontawesome.com/0eba089d9e.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        $(function(){

            let time;
            let authChk = 0;
            let idDuplicateChkRes = 0;
            let pwCheck = 0;

            // 클래스 내 태그들에 키보드 입력이 발생하면 공백체크해서 공백 실시간 제거
            $(".finding-input").on('keyup', function(){

                let inputVal = WhiteSpaceChk([$(this).val()]);
                $(this).val(inputVal);

                // https://0yumin.tistory.com/24
                // https://developer.mozilla.org/ko/docs/Web/API/Element/keyup_event
                // https://velog.io/@ohjoo1130/onkeydown-onkeypress-onkeyup
            });

            $(".tel-auth").click(function(event){

                // 전화번호 형식 체크 (정규식 이용)
                if(phoneChk($("#phone").val()) === 0) {
                    alert("전화번호를 확인해주세요.");
                }else{

                    event.preventDefault();
                    // form 태그 기본 동작 안멈추면 display 속성 변환 안된다.
                    $(".auth").css("display","flex");
                    let url = "/sendAuth";
                    const phone = {"to": $("#phone").val()};
                    let sendAuthRes = Send_AuthNum(url, phone);

                    if(sendAuthRes === 1){

                        // 타이머 작동 (180초) (테스트위해 5초로 세팅)
                        var timeSecond = 5;

                        time = setInterval(function(){

                            if(timeSecond != 0){

                                timeSecond -= 1;
                                $("#timer").text(Timer(timeSecond));

                            }else{
                                clearInterval(time);
                                alert("인증시간이 만료되었습니다.");
                                // 확인버튼 숨기기
                                $(".auth-check").hide(); // display : none;
                            }

                        }, 1000);

                    }else{
                        alert("인증 과정에서 오류가 발생했습니다. 다시 시도해주세요.");
                        $(".auth").hide();
                    }

                }

            });

            $(".auth-resend").click(function(event){
                let authRes;

                event.preventDefault();

                clearInterval(time);

                // 확인 버튼 있으면 남기고, 없어졌으면 다시 생기게 하기
                if($(".auth-check").css("display") == "none"){
                    $(".auth-check").show();
                }

                if(phoneChk($("#phone").val()) === 0) {
                    alert("전화번호를 확인해주세요.");
                }

                const url = "/authResend";
                const phone = {"to": $("#phone").val()};
                authRes = Send_AuthNum(url, phone);

                if(authRes === 1){

                    // 인증버튼 비활성화
                    $(".tel-auth").attr("disabled", true);

                    // 타이머 작동 (180초) (테스트위해 5초로 세팅)
                    var timeSecond = 5;

                    time = setInterval(function(){

                        if(timeSecond != 0){

                            timeSecond -= 1;
                            $("#timer").text(Timer(timeSecond));

                        }else{

                            clearInterval(time);
                            alert("인증시간이 만료되었습니다.");
                            // 확인버튼 숨기기
                            $(".auth-check").hide(); // display : none;

                        }

                    }, 1000);

                }else{
                    alert("인증 과정에서 오류가 발생했습니다. 다시 시도해주세요.");
                }

            });

            $(".auth-check").click((e) => {

                e.preventDefault();
                // 공백체크
                let auth = WhiteSpaceChk([$("#auth").val()]);
                const url = "/authCheck";

                // 입력 받은 값을 넘겨주기
                const authNum = {"authNum":auth[0]};
                const res = Send_AuthNum(url, authNum);

                // 일치라는 답을 받으면 authChk를 true로 하고, 인증 성공 alert 출력
                // 불일치면 authChk를 false로 하고, 인증 실패 alert 출력
                if(res === 1){
                    alert("인증 성공");
                    authChk = 1;
                }else{
                    alert("인증 실패");
                    authChk = 0;
                }

            });

            // 비밀번호 입력 감지해 형식에 맞으면서 둘 다 일치하면 체크마크 아니면 x마크 보이기
            // https://karismamun.tistory.com/66
            $("#pw, #pw-chk").on("keyup", () => {

                if($("#pw").val() === $("#pw-chk").val() && pwChk($("#pw").val()) === 1 && pwChk($("#pw-chk").val()) === 1){

                    $(".true").css("display", "flex");
                    $(".false").hide();
                    pwCheck = 1; // pwCheck는 submit할 때 적힌 비밀번호가 형식에 맞는지 체크용

                }else{

                    $(".false").css("display", "flex");
                    $(".true").hide();
                    pwCheck = 0; // pwCheck는 submit할 때 적힌 비밀번호가 형식에 맞는지 체크용
                    // 전역변수
                }

            });

            // 인증 받고나서 번호 변경 일어나면 다시 인증 받도록
            $("#phone").on('keyup', () => { // oninput 더 찾아보고 더 나은거 쓰기
                // https://maxkim-j.github.io/posts/keyboard-input/
                // https://karismamun.tistory.com/66
                authChk = 0;
            });

            // 중복체크하고나서 아이디 바꾸면 다시 체크 받도록
            $("#id").on('keyup', () => {
                idDuplicateChkRes = 0;
            });

            $(".register-submit").click((e) => {

                let input = [];
                let whiteSpaceChkRes = [];
                let nullChkRes = 0;

                $(".finding-input").each(function(index, element) {
                    input.push($(element).val());
                });

                nullChkRes = NullChk(WhiteSpaceChk(input));

                if(nullChkRes != 1){
                    alert("다시 작성해주세요.");
                    e.preventDefault();
                }else if($("#pw").val() != $("#pw-chk").val() || pwCheck === 0){
                    alert("비밀번호를 확인해주세요.");
                    e.preventDefault();
                }else if(idDuplicateChkRes == 0){
                    alert("아이디 중복체크를 해주세요.");
                    e.preventDefault();
                }else if(authChk === 0){
                    alert("전화번호 인증을 해주세요.");
                    e.preventDefault();
                }

            });

            $(".id-duplicate-chk").click(function(e){

                const id = {"id": $("#id").val()};
                const url = "/duplicateChk";

                e.preventDefault();

                // 전송
                const res = Send_AuthNum(url, id);

                // 일치하면 idDuplicateChkRes 는 true, 아니면 false
                if(res === 1){
                    alert("중복되는 아이디가 존재합니다.");
                    idDuplicateChkRes = 0;
                }else{
                    alert("사용 가능한 아이디입니다.");
                    idDuplicateChkRes = 1;
                }

            });

            function Timer(timeSecond){

                var minute = Math.floor(timeSecond / 60);
                var second = timeSecond % 60;

                if(second < 10){ // ex) 2:09
                    second = '0' + second;
                }

                return minute + " : " + second;

            };

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

                return whiteSpaceChk;
            }

            // 백에서 인증 문자 전송 실행 명령
            // 인증번호 일치 여부 확인
            function Send_AuthNum(url, num){

                let res;

                $.ajax({
                    url: url,
                    type:'POST',
                    data:JSON.stringify(num),
                    contentType:"application/json",
                    dataType:"json",
                    success:function(msg){
                        (msg.res == "true")? res = 1 : res = 0;
                    },
                    error:function(){
                    }
                });
                return res;
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

            // 비밀번호 형식 체크 (정규식 이용)
            // 영문자(대문자 또는 소문자), 숫자, 특수문자가 들어간 8 - 20자 비밀번호
            function pwChk(pw){

                let pwChkRes = 0;

                (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/.test(pw))? pwChkRes = 0 : pwChkRes = 1;

                console.log("함수 내 pwChkRes: " + pwChkRes);

                return pwChkRes;

            }

            // 전화번호 형식 체크
            // 010-1234-5678 (공백 X)
            function phoneChk(phone){

                let phoneChkRes;

                (!/^(010)-\d{4}-\d{4}$/.test(phone))? phoneChkRes = 0 : phoneChkRes = 1;

                return phoneChkRes;

            }

        });
    </script>
    <!-- https://so4869.tistory.com/23 -->
    <!-- 자바에서도 타이머 세팅하고 시간 지나면 값 저장한 변수 초기화하도록 한다. -->
    <!-- 자바스크립트에서 타이머 세팅, 인증 버튼 클릭하면 값 여부 체크하고, 숨겨놓은 번호 입력 태그 보여준다. -->
    <!-- https://tinokim.tistory.com/23 -->
    <!-- https://blog.naver.com/clean_brain/221779074716 -->
    <!-- https://velog.io/@yeonssu/Spring-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%EC%8B%9C-Email-%EC%9D%B8%EC%A6%9D%EB%B2%88%ED%98%B8-%EC%84%9C%EB%B9%84%EC%8A%A4 -->
</head>
<body>
    <div>
        <section class="finding-wrap">
            <form class="finding-pw-tab" name="find-pw">
                <header class="finding-head">
                    <a class="finding-logo" href="/">
                        <img src="./image/NewsYaLogo.png">
                    </a>
                </header>
                <div class="finding-pw-name">
                    <input type="text" name="name" id="finding-input-name" class="finding-input" maxlength="10" placeholder="이름">
                </div>
                <div class="id-input-tab">
                    <input type="text" name="id" id="id" class="finding-input" maxlength="10" placeholder="아이디">
                    <button class="id-duplicate-chk">중복<br>확인</button>
                </div>
                <div class="pw-input-tab">
                    <input type="password" name="password" id="pw" class="finding-input" maxlength="15" placeholder="비밀번호">
                </div>
                <div class="pw-chk-tab">
                    <input type="password" name="passwordChk" id="pw-chk" class="finding-input" maxlength="15" placeholder="비밀번호 확인">
                    <div class="true"><i class="fa-solid fa-check" id="check-mark" style="color: #45ca21;"></i></div>
                    <div class="false"><i class="fa-regular fa-circle-xmark" id="x-mark" style="color: #f60404;"></i></div>
                    <!-- 비밀번호 보이게 만드는 기능 나중에 추가하기 -->
                </div>
                <div class="email-input-tab">
                    <input type="email" name="email" class="finding-input" id="email" maxlength="30" placeholder="이메일">
                </div>
                <div class="finding-pw-tel">
                    <input type="tel" name="phone" id="phone" class="finding-input" maxlength="13" placeholder="전화번호(010-1234-5678)">
                    <button class="tel-auth">인증</button>
                </div>
                <div class="auth">
                    <input type="text" class="finding-input-auth" id="auth" name="auth-number" maxlength="4" placeholder="인증번호">
                    <div class="time">
                        <p id="timer">3 : 00</p>
                    </div>
                    <button class="auth-check">확인</button>
                    <button class="auth-resend">재전송</button>
                </div>
                <div class="register-submit-tab">
                    <input type="submit" class="register-submit" value="확인">
                </div>
            </form>
        </section>
    </div>
</body>
</html>