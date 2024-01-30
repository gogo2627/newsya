/**
 * 
 */

$(function(){

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
            
}); 