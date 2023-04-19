<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form id="editForm">
	<div class="modal fade" tabindex="-1" id="ModalEdit" aria-labelledby="ModalLabel2">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5">개인정보수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" faria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td>
								<div class="spacing">아이디</div> <input type="text" name="id"
								id="id" readonly>
							</td>
						</tr>
						<tr>
							<td>
								<div class="spacing">
									비밀번호<span class="essential"> *</span>
								</div> <input type="password" name="pwd" id="pwd" placeholder="비밀번호">
								<div class="checkDiv" id="checkPwd"></div> <input
								type="password" id="rePwd" placeholder="비밀번호 확인">
								<div class="checkDiv" id="checkRePwd"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="spacing">
									이름<span class="essential"> *</span>
								</div> <input type="text" name="name" id="name"
								placeholder="이름을 입력하세요">
								<div class="checkDiv" id="checkName"></div>
							</td>
						</tr>
						<tr>
							<td id="emailTd">
								<div class="spacing">
									이메일<span class="essential"> *</span>
								</div> <input type="text" name="email1" id="email1" readonly>
								@ <input type="text" name="email2" id="email2" readonly>
								&nbsp; <select name="selectEmail" id="selectEmail"
								onChange="select()">
									<option value="" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="kakao.com">kakao.com</option>
							</select>
								<div class="checkDiv" id="checkEmail"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="spacing">
									연락처<span class="essential"> *</span>
								</div> <input type="text" name="tel1" id="tel1" readonly> - <input
								type="text" name="tel2" id="tel2"> - <input type="text"
								name="tel3" id="tel3">
								<div class="checkDiv" id="checkTel"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="spacing">
									주소 <span class="essential"> *</span>
								</div> <input type="text" name="zipcode" id="zipcode"
								placeholder="우편번호" size="5" readonly> <input
								type="button" value="검색" id="search"> <input type="text"
								name="addr1" id="addr1" placeholder="주소" readonly> <input
								type="text" name="addr2" id="addr2" placeholder="상세주소">
								<div class="checkDiv" id="checkAddr"></div>
							</td>
						</tr>
						<tr>
							<td id="btn"><input type="button" id="save" value="저장">
								<input type="reset" id="cancel" data-bs-dismiss="modal"
								value="취소"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		$.ajax({
			type : 'post',
			url : '/OhMyGoal/member/getMember',
			success : function(data) {
				$('#id').val(data.id);
				$('#name').val(data.name);
				$('#email1').val(data.email1);
				$('#email2').val(data.email2);
				$('#tel1').val(data.tel1);
				$('#tel2').val(data.tel2);
				$('#tel3').val(data.tel3);
				$('#zipcode').val(data.zipcode);
				$('#addr1').val(data.addr1);
				$('#addr2').val(data.addr2);
			},
			error : function(err) {
				console.log(err);
			}
		});
	});

	$('#save').click(function() {
		$('#checkPwd').empty();
		$('#checkName').empty();
		$('#checkEmail').empty();
		$('#checkTel').empty();
		$('#checkAddr').empty();

		if ($('#pwd').val() == '') {
			$('#checkPwd').text('비밀번호를 입력하세요');
			$('#pwd').focus();
		} else if ($('#rePwd').val() == '') {
			$('#checkPwd').text('비밀번호 재확인을 입력하세요');
			$('#rePwd').focus();
		} else if ($('#name').val() == '') {
			$('#checkName').text('아이디를 입력하세요');
			$('#name').focus();
		} else if ($('#email1').val() == '') {
			$('#checkEmail').text('이메일을 입력하세요');
			$('#email1').focus();
		} else if ($('#email2').val() == '') {
			$('#checkEmail').text('이메일을 입력하세요');
			$('#email2').focus();
		}else if ($('#tel2').val() == '') {
			$('#checkTel').text('전화번호를 입력하세요');
			$('#tel2').focus();
		}else if ($('#tel3').val() == '') {
			$('#checkTel').text('전화번호를 입력하세요');
			$('#tel3').focus();
		}else if ($('#zipcode').val() == '') {
			$('#checkAddr').text('우편번호를 입력하세요');
			$('#zipcode').focus();
		}else if ($('#addr1').val() == '') {
			$('#checkAddr').text('주소를 입력하세요');
			$('#addr1').focus();
		}else if ($('#addr2').val() == '') {
			$('#checkAddr').text('상세주소를 입력하세요');
			$('#addr2').focus();
		} else {
			$.ajax({
				type : 'post',
				url : '/OhMyGoal/member/update',
				data : $('#editForm').serialize(),
				success : function(data) {
					if (date != 0) {
						alert("수정되었습니다.");
					} else {
						alert("다시 시도해주세요.");
					}
				},
				error : function(err) {
					alert("다시 시도해주세요.");
				}
			})
		}
	});
</script>
