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

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 150px; /* 라벨의 고정 너비 */
            margin-right: 30px;
            margin-left: 250px;
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
        <h1 id="title">회원정보수정</h1>

            <div class="form-group">
                <label for="loginId">아이디:</label>
                <input type="text" id="loginId" name="loginId" value="${user.id}" readonly>
            </div>

            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${user.name}" readonly>
            </div>

            <div class="form-group">
                <label for="password">현재 비밀번호:</label>
                <input type="password" id="password" name="password">
            </div>

            <div class="form-group">
                <label for="new_password">새 비밀번호:</label>
                <input type="password" id="new_password" name="password">
            </div>

            <div class="form-group">
                <label for="new_password_confirm">비밀번호 확인:</label>
                <input type="password" id="new_password_confirm" name="confirmPassword">
            </div>

            <div class="form-group">
                <label for="phoneNumber">전화번호:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phone}">
                <button class="verificationCode">인증</button>
            </div>

            <div class="form-group">
                <input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호를 입력하세요">
                <button class="verificationCode">확인</button>
                <button class="verificationCode">재전송</button>
            </div>

            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="text" id="email" name="email" value="${user.email}">
            </div>

            <div class="button-container">
                <input type="button" value="취소" onclick="moveHome()" class="btn-style">
                <input type="submit" value="수정" onclick="modify()" class="btn-style">
            </div>
    </nav>
</div>
</body>
</html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
    // 메인 화면으로 이동
    function moveHome() {
        location.href = "/";
    }

    // 수정 저장 처리
    function modify() {

        const loginId = $("#loginId").val();
        const name = $("#name").val();
        const password = $("#password").val();
        const newPassword = $("#new_password").val();
        const newPasswordConfirm = $("#new_password_confirm").val();
        const phoneNumber = $("#phoneNumber").val();
        const email = $("#email").val();

        $.ajax({
            type: "POST",
            url: "/ModifyProfile",
            contentType: "application/json",
            data: JSON.stringify({
                name : name,
                password : password,
                newPassword : newPassword,
                newPasswordConfirm : newPasswordConfirm,
                phoneNumber : phoneNumber,
                email : email,
            }),
            success: function (data) {
                alert("성공적으로 저장했습니다.")
                moveHome();
            },
            error: function (error) {
                alert(error.responseJSON.message)
            }
        });
    }


</script>