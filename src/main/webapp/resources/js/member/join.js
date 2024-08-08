let emailInput;
let selectedDomain;
let customDomainInput;
   
   $(document).ready(function() {
    const minLength = 8;
    const maxLength = 16;
    const idMinLength = 4;
    const idMaxLength = 12;
    const passwordInput = $('#join--password');
    const passwordWarning = $('#join--passwordWarning');
    const passwordConfirm = $('#join--passwordConfirm');
    const confirmWarning = $('#join--confirmWarning');
    const memberIdInput = $('#memberId');
    const idWarning = $('#join--idWarning');
    const idDupWarning = $('#join--dup--idWarning');
    const phoneInput = $('#join--phone');
    const ssn1Input = $('#join--ssn1');
    const ssn2Input = $('#join--ssn2');
    emailInput = $('#memberEmail');
    const emailDropdown = $('#emailDropdown');
    customDomainInput = $('#customDomainInput');
    const dropdownButton = $('#join--email--dropdown');
    const emailWarning = $('#join--email--warning');
    selectedDomain = ''; // 초기값 설정
    let emailForAuth = '';
    let phoneFocused = false;

        // 비밀번호 입력 필드의 최대 길이 제한 및 유효성 검사
        passwordInput.on('input', function() {
            const passwordLength = passwordInput.val().length;
            if (passwordLength === 0) {
       			passwordWarning.hide();
            } else if (passwordLength < minLength || passwordLength > maxLength) {
                passwordWarning.show();
            } else {
                passwordWarning.hide();
            }
        });
        
        // 비밀번호 확인과 일치 여부 확인
        passwordConfirm.on('input', function() {
        	if (passwordConfirm.val() === 0) {
       			confirmWarning.hide();
            } else if (passwordInput.val() !== passwordConfirm.val()) {
                confirmWarning.show();
            } else {
                confirmWarning.hide();
            }
        });
        
        // 아이디 글자수 검사
        memberIdInput.on('input', function() {
            const idValue = memberIdInput.val();
            const lengthValid = idValue.length >= idMinLength && idValue.length <= idMaxLength;
            const validChars = /^[a-zA-Z0-9]+$/.test(idValue);
             if (idValue.length === 0) {
       			idWarning.hide();
            } else if (!lengthValid || !validChars) {
                idWarning.show();
            } else {
                idWarning.hide();
            }
        });
        
        // 전화번호 입력 처리
        phoneInput.on('focus', function() {
            if (!phoneFocused) {
                phoneInput.val('010-');
                phoneFocused = true;
            }
        });

        phoneInput.on('input', function() {
            let phoneValue = phoneInput.val().replace(/[^0-9]/g, '');
            if (phoneValue.length > 11) {
                phoneValue = phoneValue.substring(0, 11);
            }

            if (phoneValue.length > 3 && phoneValue.length <= 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{1,4})/, '$1-$2');
            } else if (phoneValue.length > 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
            }

            phoneInput.val(phoneValue);
        });
        
        // 주민등록번호 입력 처리
        ssn1Input.on('input', function() {
            let ssn1Value = ssn1Input.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (ssn1Value.length > 6) {
                ssn1Value = ssn1Value.substring(0, 6);
            }

            ssn1Input.val(ssn1Value);

            if (ssn1Value.length === 6) {
                ssn2Input.focus();
            }
        });
        
        ssn2Input.on('input', function() {
            let ssn2Value = ssn2Input.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (ssn2Value.length > 7) {
                ssn2Value = ssn2Value.substring(0, 7);
            }
            ssn2Input.val(ssn2Value);
        });
        
        // 이메일 도메인 선택 처리
        emailDropdown.on('click', '.dropdown-item', function() {
             selectedDomain = $(this).data('domain');
            if (selectedDomain) {
                customDomainInput.val(selectedDomain);
                customDomainInput.prop('disabled', true);
                dropdownButton.text(selectedDomain);
            } else if (this.id === 'customEmail') {
                customDomainInput.val('');
                customDomainInput.prop('disabled', false);
                dropdownButton.text('직접 입력');
                selectedDomain = '';
            }
        });
        
        // 폼 제출 시 이메일 도메인 필드의 값을 emailInput 필드와 결합
    	$('form').on('submit', function(event) {
        	const emailDomain = customDomainInput.val();
        	if (emailDomain) {
        	    emailInput.val(emailInput.val() + '@' + emailDomain);
      	  }
  		  });
        
        // id 중복체크 ajax
        memberIdInput.on('input', function() {
        const idValue = memberIdInput.val();
    	const idLength = idValue.length;
        if(idLength>=4 && idLength<=12){
        	$.ajax({
        		type: 'post',
        		url: 'http://localhost:8090/cinema/idCheck',
        		data: { id : memberIdInput.val() },
        		dataType: 'json',
        		success: function(data){
        			if(data === 0){
        			idDupWarning.hide();
        			} else {
        			idDupWarning.show();
        			}
        		}
        	})
        	}else {
        		idDupWarning.hide();
    		}
        });
        
        // email 중복체크 ajax
    	customDomainInput.on('input', function() {
        	let totalEmail = emailInput.val() + '@' + customDomainInput.val();
        	emailForAuth = totalEmail;
        	$.ajax({
        		type: 'post',
        		url: 'http://localhost:8090/cinema/emailCheck',
        		data: { email : totalEmail },
        		dataType: 'json',
        		success: function(data){
        			if(data === 0){
        			emailWarning.hide();
        			} else {
        			emailWarning.show();
        			}
        		}
        	})
        	
    	});
    
    	// email 중복체크2 ajax
     	emailDropdown.on('click', function() {
        	let totalEmail = emailInput.val() + '@' + selectedDomain;
        	emailForAuth = totalEmail;
        	    $.ajax({
        		type: 'post',
        		url: 'http://localhost:8090/cinema/emailCheck',
        		data: { email : totalEmail },
        		dataType: 'json',
        		success: function(data){
        			if(data === 0){
        			emailWarning.hide();
        			} else {
        			emailWarning.show();
        			}
        		}
        	})
    	});
    	
    	
    	// 회원가입 버튼 클릭 시 조건 충족 확인
    $('#join--form').on('submit', function(event) {
        var hasVisibleWarning = false;
        var hasEmptyFields = false;
        var isEmailAuthCompleted = $('#join--emailAuth--ok').css('display') !== 'none';

        // 1. 빈 필드 검사
        var allInputsFilled = true;
        $('input').each(function() {
            var type = $(this).attr('type');
            var name = $(this).attr('name');
            var value = $(this).val().trim();

            // 이메일 관련 필드 제외
            if (name === 'email' || name === 'emailDomain') {
                return true;
            }

            // 라디오 버튼 그룹 체크
            if (type === 'radio') {
                var radioName = $(this).attr('name');
                if ($('input[name="' + radioName + '"]:checked').length === 0) {
                    allInputsFilled = false;
                    return false;
                }
            } else if (value === '' && type !== 'button' && type !== 'submit') {
                allInputsFilled = false;
                return false;
            }
        });

        // 2. 경고 메시지 검사
        if (allInputsFilled) {
            $('.join--warning').each(function() {
                if ($(this).css('display') !== 'none') {
                    hasVisibleWarning = true;
                    return false;
                }
            });
        } else {
            hasEmptyFields = true;
        }

        // 3. 이메일 인증 상태 확인
        if (hasEmptyFields) {
         //   alert('모든 필드를 채워주세요.');
         //   event.preventDefault();
        } else if (hasVisibleWarning) {
            alert('모든 경고 메시지를 확인해주세요.');
            event.preventDefault();
        } else if (!isEmailAuthCompleted) {
            alert('이메일 인증을 완료해주세요.');
            event.preventDefault();
        }
    });
    });
    
    	// email 메일인증
    function emailAuth(){
    
    const emailWarning = $('#join--email--warning');
    
    if(emailWarning.css('display') === 'inline'){
    	alert('사용할 수 없는 이메일입니다.');
    	return;
    } else {
    const emailWithSelectedDomain = emailInput.val() + '@' + selectedDomain;
    const emailWithCustomDomain = emailInput.val() + '@' + customDomainInput.val();
	const button = $('#join--emailAuth');


    let validEmail = '';

    if (selectedDomain && selectedDomain.trim() !== '') {
        validEmail = emailWithSelectedDomain;
    } else if (customDomainInput.val() && customDomainInput.val().trim() !== '') {
        validEmail = emailWithCustomDomain;
    }

    if (!validEmail || emailInput.val().trim() === '') {
        alert('이메일을 입력해주세요.');
        return;
    }

    const encodedEmail = encodeURIComponent(validEmail);
    const url = "emailAuth?email=" + encodedEmail;
    
    const buttonOffset = button.offset();
    const buttonWidth = button.outerWidth();
    const buttonHeight = button.outerHeight();
    
    const width = 500;
    const height = 300;
    const screenWidth = window.innerWidth;
    const screenHeight = window.innerHeight;
    const left = buttonOffset.left + (buttonWidth / 2) - (width / 2); //
    const top = buttonOffset.top - height;

    window.open(url, '_blank', `width=${width},height=${height},left=${left},top=${top}`);
    }
    }
    
