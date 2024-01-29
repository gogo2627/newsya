/**
 * 
 */

$(function(){

            let time;
            let authChk = 0;
            let idDuplicateChkRes = 0;
            let pwCheck = 0;

            if("${msg}" != null && "${msg}" != "") {
                    swal({
                        text:"${msg}",
                        icon: "info",
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
            
            $(".go-login").click(() => {
                location.href="/goLogin";
            });            
            
            // 이거는 js 합칠 때 .auth-check와 별개로 놔두기
            $(".finding-pw-auth-check").click((e) => {

                e.preventDefault();
                // 공백체크
                let nullChkRes = check($(".finding-input:lt(3)"), e);
                const auth = WhiteSpaceChk([$("#auth").val()]);
                const url = "/authCheck";

                if(nullChkRes != 1){ return };
                // 입력 받은 값을 넘겨주기
                const inputAuthNum = {"inputAuthNum":auth[0], "to":$("#phone").val()};

                Send_AuthNum(url, inputAuthNum, function(res) {

                    console.log("인증 성공 여부 확인 : " + res);

                    // 일치라는 답을 받으면 authChk를 true로 하고, 인증 성공 alert 출력
                    // 불일치면 authChk를 false로 하고, 인증 실패 alert 출력
                    if(res === 1){
                        clearInterval(time);
                        authChk = 1;

                        // ajax로 정보 넘겨주고, db와 값 비교
                        const data = {"name":$("#finding-input-name").val(), "id":$("#finding-input-id").val(), "phone":$("#phone").val()};

                        Send_AuthNum("/findingPw", data, function(res){

                            console.log("회원 존재 여부 확인 : " + res);

                            if(res === 1){
                                // 새 비밀번호 입력창, form 태그의 확인버튼 빼고 전부 다 hide
                                $(".hiding-part").hide();

                                // 새 비밀번호 입력창, form 태그 확인버튼 show
                                $(".finding-submit-tab").css("display", "flex");
                                $(".pw-change").css("display", "flex");

                            }else{
                                swal({
                                    text: "일치하는 회원 정보가 없습니다.",
                                    icon: "error",
                                    button: "OK",
                                });
                                $("#auth").val("");
                                $(".auth").hide();
                                $(".tel-auth").css("visibility", "visible");
                                authChk = 0;
                            }

                        });

                    }else{
                        swal("인증 실패", "인증번호가 일치하지 않습니다.", "error");
                        authChk = 0;
                    }

                });

            });
            
            // 비밀번호 입력 감지해 형식에 맞으면서 둘 다 일치하면 체크마크 아니면 x마크 보이기
            // https://karismamun.tistory.com/66
            $("#newpw").on("keyup", () => {

                console.log("비번 체크 " + pwCheck);

                if(pwChk($("#newpw").val()) === 1){

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
            
            // 나중에 js 합칠 때, finding-submit과 별개로 남겨두기.
            $(".finding-pw-submit").click(function(e){

                if(pwCheck != 1){
                    swal("비밀번호 체크", "비밀번호를 다시 작성해주세요.", "error");
                    e.preventDefault();
                }

            });
            
	// 레지스터 

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

            function Ajax(url, val){

                let res;

                $.ajax({
                    url: url,
                    type:'POST',
                    data:JSON.stringify(val),
                    async:false,
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

                return res;
            }
            
}); 