<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Connection</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	
	<form action="/member/join.kh" method="post">
		아이디 : <input type="text" name="memberId"> <button type="button" id="idDuplChk">중복체크</button><br>
		비밀번호 : <input type="password" name="memberPw"> <br>
		비밀번호 확인 : <input type="password" name="memberPwChk"> <br>
		닉네임 : <input type="text" name="memberNickname"> <button type="button" id="nickDuplChk">중복체크</button> <br>
		주소 : <input type="text" name="memberAddr"> <button>도로명주소 찾기</button> <br>
		전화번호 : <input type="text" name="memberPhone"> <button>인증</button><br>
		<input type="text" name="memberPhoneCerti" placeholder="전화번호 인증코드 입력"><br>
		이메일 : <input type="text" name="memberEmail"> <button>인증</button><br>
		<input type="text" name="memberEmailCerti" placeholder="이메일 인증코드 입력"><br>
		성별 : <input type="radio" name="memberGender" value="0">남자
			  <input type="radio" name="memberGender" value="1">여자
			  <input type="radio" name="memberGender" value="2">비공개 <br>
		
		<input type="submit" value="회원가입">
	</form>
	
	<script>
	$('#idDuplChk').on('click', function(){
		
		let memberId = $('input[name=memberId]').val();
		
		$.ajax({
			url : '/member/idDuplChk.kh',
			data : {memberId : memberId},
			type : 'get',
			success : function(res){
				if(res == '1'){
					alert('이미 사용중인 아이디입니다');
				}else{
					alert('사용가능한 아이디입니다');
				}
			} 
			,error : function(){
				console.log('ajax 통신 오류');
			}
				
		});
		
	});
	
	$('#nickDuplChk').on('click', function(){
		
		let memberNickname = $('input[name=memberNickname]').val();
		
		$.ajax({
			url : '/member/nickDuplChk.kh',
			data : {memberNickname : memberNickname},
			type : 'get',
			success : function(res){
				if(res == '1'){
					alert('이미 사용중인 닉네임입니다');
				}else{
					alert('사용가능한 닉네임입니다');
				}
			} 
			,error : function(){
				console.log('ajax 통신 오류');
			}
				
		});
		
	});
	</script>
</body>
</html>