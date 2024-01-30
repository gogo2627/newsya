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

        .fontBtn {
            font-family: 'JalnanGothic';
        }

        @font-face {
             font-family: 'JalnanGothic';
             src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
             font-weight: normal;
             font-style: normal;
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

        .form-group {
            margin-bottom: 10px;
            margin-left: 100px;
        }

        label {
            display: inline-block;
            width: 150px; /* 라벨의 고정 너비 */
            margin-right: 30px;
            margin-left: 200px;
            border: 1px solid deeppink; /* 테두리 스타일 지정 */
            padding: 5px; /* 테두리 내부 여백 설정 */
            border-radius: 5px; /* 테두리 둥글게 설정 */
            font-size: 18px;
            text-align: center;
        }

        input {
            border-radius: 5px;
            padding: 8px;
            border: 1px solid black;
            width: 600px;
        }
        /* 문자인증 여기부터 */
        .finding-pw-tel{
            margin-bottom: 10px;

        }
        .finding-input-auth {
            border-radius: 5px;
            padding: 8px;
            border: 1px solid rgb(255, 22, 120);
            width: 120px; /* 작게 설정 */
            margin-right: 10px; /* 간격 설정 */
        }
        .tel-auth {
            background-color: rgb(255, 22, 120);
            color: black;
            border-color: rgb(255, 22, 120);
            display: inline-block;
            width: 50px;
            height: 30px;
            margin-right: 10px;
            border-radius: 10px;
        }
        .auth{
            display: none;
            justify-content: end;
            margin-right: 355px;
        }

        .auth-check, .auth-resend{
            background-color: rgb(255, 22, 120);
            color: black;
            border-color: rgb(255, 22, 120);
            display: inline-block;
            width: 60px;
            height: 35px;
            margin-bottom: 15px;
            margin-left: 5px;
            border-radius: 10px;
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
        #verification_Code {
            display: flex; /* 인증번호 입력창과 시간을 가로로 배치 */
            align-items: center; /* 세로 중앙 정렬 */
            margin-left: auto; /* 오른쪽으로 정렬 */
        }

        .button-container {
            text-align: center; /* 가운데 정렬을 위한 텍스트 정렬 설정 */
            margin-top: 20px; /* 버튼과 입력 요소 사이 여백 */
        }

        .btn-style {
            background-color: rgb(255, 22, 120); /* submit 버튼 배경색 */
            color: black; /* submit 버튼 텍스트 색상 */
            border-color: rgb(255, 22, 120); /* submit 버튼 테두리 색상 */
            display: inline-block;
            width: 100px; /* 버튼의 너비 */
            margin-right: 10px;
        }

        .verificationCode {
            padding: 6px;
            margin-left: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: rgb(255, 22, 120);
            color: black;
            cursor: pointer;
        }

        #verificationCode {
            border-radius: 5px;
            padding: 8px;
            border: 1px solid rgb(255, 22, 120);
            width: 150px;
            margin-left: 900px;
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
        <h1 id="title">비밀번호 변경</h1>
<!--
            <div class="form-group">
                <label for="loginId">아이디:</label>
                <input type="text" id="loginId" name="loginId" value="${user.id}" readonly>
            </div>

            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${user.name}" readonly>
            </div>
-->
            <div class="form-group">
                <label for="password">현재 비밀번호:</label>
                <input type="password" id="password" name="password">
            </div>

            <div class="form-group">
                <label for="new_password">새 비밀번호:</label>
                <input type="password" id="new_password" name="password" placeholder="영문, 숫자, 기호 포함 8-20자">
            </div>

            <div class="form-group">
                <label for="new_password_confirm">비밀번호 확인:</label>
                <input type="password" id="new_password_confirm" name="confirmPassword">
            </div>

<%--            <div class="form-group">--%>
<%--                <label for="phoneNumber">전화번호:</label>--%>
<%--                <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phone}">--%>
<%--                <button class="verificationCode fontBtn">인증</button>--%>
<%--            </div>--%>

<%--            <div class="form-group">--%>
<%--                <input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요">--%>
<%--                <button class="verificationCode fontBtn">확인</button>--%>
<%--                <button class="verificationCode fontBtn">재전송</button>--%>
<%--            </div>--%>
        <div class="form-group">
            <div class="finding-pw-tel">
                <label for="phoneNumber">전화번호:</label>
                <input type="tel" name="phone" id="phone" class="finding-input" maxlength="11" value="${user.phone}" placeholder="전화번호(01012345678)">
                <button class="tel-auth fontBtn">인증</button>
            </div>
            <div class="auth">
                <div id="verification_Code">
                    <input type="text" class="finding-input-auth" id="auth" name="auth-number" maxlength="4" placeholder="인증번호">
                </div>
                <div class="time">
                    <p id="timer">3 : 00</p>
                </div>
                <div class="button-container">
                <button class="auth-check fontBtn">확인</button>
                <button class="auth-resend fontBtn">재전송</button>
                </div>
            </div>
        </div>
<%--            <div class="form-group">--%>
<%--                <label for="email">이메일:</label>--%>
<%--                <input type="text" id="email" name="email" value="${user.email}">--%>
<%--            </div>--%>

            <div class="button-container">
                <input type="button" value="취소" onclick="moveHome()" class="btn-style fontBtn">
                <input type="submit" value="수정" onclick="modify()" class="btn-style fontBtn">
            </div>
    </nav>
</div>
</body>
</html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/0eba089d9e.js" crossorigin="anonymous"></script>
<script>

    //문자인증추가
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
						$(".auth").css("margin-right","320px");
                        // ㄴ>인증버튼 누루고 인증입력창 확인 재전송 버튼 남은상태

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
				$(".auth").css("margin-right","350px");
                //ㄴ>재전송 누른 후
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
					$(".auth").css("margin-right","400px");
                    swal("인증 완료", "전화번호가 인증되었습니다.", "success");
                    //ㄴ>확인 버튼 누른 후 인증번호창이랑 재전송버튼만 남은상태
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
					$(".auth").css("margin-right","300px");

                }

            }, 1000);

        }

    });


    ///////////////여기까지
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

    // 수정 저장 처리
    function modify() {

        const password = $("#password").val();
        const newPassword = $("#new_password").val();
        const newPasswordConfirm = $("#new_password_confirm").val();
        const phoneNumber = $("#phone").val();
        // const email = $("#email").val();

        if( ! validationCheck(password,newPassword,newPasswordConfirm,phoneNumber) ) {
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/ModifyProfile",
            contentType: "application/json",
            data: JSON.stringify({
                password : password,
                newPassword : newPassword,
                newPasswordConfirm : newPasswordConfirm,
                phoneNumber : phoneNumber,
                // email : email,
            }),
            success: function (data) {
                if(data=="MISSMATCHEDPWD") {
                    sAlert("비밀번호가 일치하지 않습니다.", "error", "OK");
                }else if(data=="FAIL") {
                    sAlert("정보 수정에 실패 헀습니다.", "error", "OK");
                }else if(data=="SUCCESS") {
                     sAlert("성공적으로 저장 했습니다. 다시 로그인해주세요.", "info", "홈으로 가기", "moveHome");
                }
            },
            error: function (error) {
                alert(error.responseJSON.message)
            }
        });
    }

    function validationCheck(password,newPassword,newPasswordConfirm,phoneNumber) {
        validationResponse = false;
        if(password == "" || newPassword == "" || newPasswordConfirm == "" || phoneNumber == "") {
            sAlert("정보를 입력해주세요.", "error", "OK");
        } else if (!(newPassword==newPasswordConfirm)) {
            sAlert("새로운 비밀번호가 일치하지 않습니다.", "error", "OK");
        } else if (pwChk(newPassword) != 1) {
            sAlert("사용할 수 없는 비밀번호입니다. 다시 입력하세요.", "error", "OK");
        }else if (phoneChk(phoneNumber) != 1) {
            sAlert("전화번호를 다시 입력하세요.", "error", "OK");
        }else {
            validationResponse = true;
        }

        return validationResponse;

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


</script>