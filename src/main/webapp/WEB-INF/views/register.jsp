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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        $(function(){

            let time;
            let authChk = 0;
            let idDuplicateChkRes = 0;
            let pwCheck = 0;

             if("${msg}" != null && "${msg}" != "") {
                swal({
                    text:"${msg}",
                    icon: "info",
                    button: "OK",
                });
             }

            // 클래스 내 태그들에 키보드 입력이 발생하면 공백체크해서 공백 실시간 제거
            $(".finding-input").on('keyup', function(){

                let inputVal = WhiteSpaceChk([$(this).val()]);
                $(this).val(inputVal);

                // https://0yumin.tistory.com/24
                // https://developer.mozilla.org/ko/docs/Web/API/Element/keyup_event
                // https://velog.io/@ohjoo1130/onkeydown-onkeypress-onkeyup
            });

            $(".tel-auth").click(function(event){

                event.preventDefault();

                // 전화번호 형식 체크 (정규식 이용)
                if(phoneChk($("#phone").val()) === 0) {
                    swal("잘못된 번호 형식", "번호를 다시 입력해주세요.", "error");
                }else{

                    // form 태그 기본 동작 안멈추면 display 속성 변환 안된다.
                    const url = "/sendAuth";
                    const phone = {"to": $("#phone").val()};

                    Send_AuthNum(url, phone, function(res) {

                        console.log("문자 전송 여부 : " + res);

                        if(res === 1){
                            // 인증버튼 숨기기
                            $(".tel-auth").css("visibility", "hidden");
                            $(".auth").css("display","flex");
                            $("#timer").text("3 : 00");
                            $(".time, .auth-check").show();

                            TimerSet();

                        }else{
                            swal("Error", "인증과정에서 에러가 발생했습니다.", "error");
                            $(".auth").hide();
                        }

                    });

                }

            });

            $(".auth-resend").click(function(event){

                let authRes;
                event.preventDefault();
                clearInterval(time);

                $("#auth").val("");

                if(phoneChk($("#phone").val()) === 0) {
                    swal("잘못된 번호 형식", "번호를 다시 입력해주세요.", "error");
                }

                // 확인 버튼 있으면 남기고, 없어졌으면 다시 생기게 하기
                if($(".auth-check").css("display") == "none"){
                    $(".auth-check").show();
                }

                const url = "/sendAuth";
                const phone = {"to": $("#phone").val()};

                Send_AuthNum(url, phone, (res) => {

                    console.log("재전송 체크 : " + res);

                    if(res === 1){

                        TimerSet();

                    }else{
                        swal("Error", "인증과정에서 에러가 발생했습니다.", "info");
                    }

                });

            });

            $(".auth-check").click((e) => {

                e.preventDefault();

                // 공백체크
                const auth = WhiteSpaceChk([$("#auth").val()]);
                const url = "/authCheck";

                console.log(auth);

                // 입력 받은 값을 넘겨주기
                const inputAuthNum = {"inputAuthNum":auth[0], "to":$("#phone").val()};
                Send_AuthNum(url, inputAuthNum, function(res) {

                    console.log("인증 성공 여부 확인 : " + res);

                    // 일치라는 답을 받으면 authChk를 true로 하고, 인증 성공 alert 출력
                    // 불일치면 authChk를 false로 하고, 인증 실패 alert 출력
                    if(res === 1){
                        clearInterval(time);
                        $(".time, .auth-check").hide();
                        swal("인증 완료", "전화번호가 인증되었습니다.", "success");
                        authChk = 1;
                    }else{
                        swal("인증 실패", "인증번호가 일치하지 않습니다.", "error");
                        authChk = 0;
                    }

                });

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

            // 번호 변경 일어나면 다시 인증 받도록
            $("#phone").on('keyup', () => { // oninput 더 찾아보고 더 나은거 쓰기
                // https://maxkim-j.github.io/posts/keyboard-input/
                // https://karismamun.tistory.com/66
                if($(".tel-auth").css("visibility") == "hidden"){
                    $(".tel-auth").css("visibility", "visible");
                }

                if($(".auth").css("display") == "flex"){
                    clearInterval(time);
                    $(".auth").hide();
                    $("#auth").val("");
                }

                authChk = 0;
            });

            // 중복체크하고나서 아이디 바꾸면 다시 체크 받도록
            $("#id").on('keyup', () => {
                idDuplicateChkRes = 0;
                console.log("다시 중복 체크 확인 : " + idDuplicateChkRes);
            });

            $(".register-submit").click((e) => {

                nullChkRes = check($(".finding-input"), e);

                if(nullChkRes != 1){
                    swal({
                      text: "빈 칸을 작성해주세요.", icon: "error", button: "OK",
                    });
                    e.preventDefault();
                }else if($("#pw").val() != $("#pw-chk").val() || pwCheck === 0){
                    swal("비밀번호 확인", "입력한 비밀번호를 다시 확인해주세요.", "error");
                    e.preventDefault();
                }else if(idDuplicateChkRes == 0){
                    swal("ID 중복체크", "ID 중복체크를 해주세요.", "error");
                    e.preventDefault();
                }else if(authChk === 0){
                    swal("전화번호 인증", "전화번호 인증을 해주세요.", "error");
                    e.preventDefault();
                }

            });

            $(".id-duplicate-chk").click(function(e){

                e.preventDefault();
                console.log("idDuplicateChkRes 기본 값: " + idDuplicateChkRes);
                const nullChkRes = NullChk(WhiteSpaceChk([$("#id").val()]));

                if (nullChkRes === 1) {
                    const id = { "id": $("#id").val() };
                    const url = "/duplicateChk";
                    Send_AuthNum(url, id, function (res) {
                        console.log("중복 ID 체크 : " + res);
                        idDuplicateChkRes = (res === 1) ? (swal("ID 중복 체크", "사용 가능한 ID입니다.", "success"), 1) :
                                                        (swal("ID 중복 체크", "해당 ID가 이미 존재합니다.", "error"), 0);
                        console.log("idDuplicateChkRes : " + idDuplicateChkRes);
                    });
                } else {
                    swal("중복 ID 체크 실패", "아이디를 입력해주세요.", "error");
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

            // 백에서 인증 문자 전송 실행 명령
            // 인증번호 일치 여부 확인
            function Send_AuthNum(url, val, callback){

                $.ajax({
                    url: url,
                    type:'POST',
                    data:JSON.stringify(val),
                    contentType:"application/json",
                    dataType:"json",
                    success:function(msg){
                        console.log("ajax 결과 : " + msg.res);
                        if(msg.res == true){
                            console.log("true")
                            callback(1);
                        }else{
                            console.log("false");
                            callback(0);
                        }
                    },
                    error:function(){
                        swal("통신 에러", "다시 시도해주세요.", "info");
                    }
                });
            }


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
            // 01012345678 (공백 X)
            function phoneChk(phone){

                let phoneChkRes = /^010\d{8}$/.test(phone) ? 1 : 0;

                return phoneChkRes;

            }

            function check(tmp, e){

                let input = [];
                let whiteSpaceChkRes = [];
                let nullChkRes = 0;

                tmp.each(function(index, element) { // 인덱스 3까지 반복문 수행
                    input.push($(element).val());
                });

                console.log(input);

                whiteSpaceChkRes = WhiteSpaceChk(input);

                nullChkRes = NullChk(whiteSpaceChkRes);

                if(nullChkRes != 1){
                    swal({
                        text:"빈 칸을 작성해주세요.",
                        icon:"error",
                        button:"OK",
                    });
                    e.preventDefault();
                }

                return nullChkRes;

            };

            function TimerSet(){

                clearInterval(time);

                // 타이머 작동 (180초) (테스트위해 10초로 세팅)
                var timeSecond = 20;

                time = setInterval(function(){

                    if(timeSecond != 0){

                        timeSecond -= 1;
                        $("#timer").text(Timer(timeSecond));

                    }else{

                         clearInterval(time);
                         swal("인증 유효시간 초과", "전화번호 인증을 다시 진행해주세요.", "error");
                         // 확인버튼 숨기기
                         $(".auth-check").hide(); // display : none;

                    }

                }, 1000);

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
            <form class="finding-pw-tab" name="find-pw" action="/regUser" method="post">
                <header class="finding-head">
                    <a class="finding-logo" href="/">
                        <img src="resources/image/NewsYaLogo.png">
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
                    <input type="password" name="password" id="pw" class="finding-input" maxlength="20" placeholder="비밀번호">
                </div>
                <div class="pw-chk-tab">
                    <input type="password" name="passwordChk" id="pw-chk" class="finding-input" maxlength="20" placeholder="비밀번호 확인">
                    <div class="true"><i class="fa-solid fa-check" id="check-mark" style="color: #45ca21;"></i></div>
                    <div class="false"><i class="fa-regular fa-circle-xmark" id="x-mark" style="color: #f60404;"></i></div>
                    <!-- 비밀번호 보이게 만드는 기능 나중에 추가하기 -->
                </div>
                <div class="email-input-tab">
                    <input type="email" name="email" class="finding-input" id="email" maxlength="30" placeholder="이메일">
                </div>
                <div class="finding-pw-tel">
                    <input type="tel" name="phone" id="phone" class="finding-input" maxlength="11" placeholder="전화번호(01012345678)">
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