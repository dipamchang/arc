$(document).ready(function() {

	$('#loader').hide();
	$('.tabular.menu .item').tab({
		history : false
	});
	$('#loginform').form({
		username : {
			identifier : 'username',
			rules : [ {
				type : 'empty',
				prompt : 'Please enter username'
			}, {
				type : 'length[12]',
				prompt : 'Your ID must be 12 characters'
			}, {
				type : 'contains[PS]',
				prompt : 'Incorrect ID'
			}, {
				type : 'contains[G]',
				prompt : 'Incorrect ID'
			} ]
		},
		password : {
			identifier : 'password',
			rules : [ {
				type : 'empty',
				prompt : 'Please enter your password'
			} ]
		}
	}, {
		inline : true,
		on : 'blur',
		transition : 'fade down',
		onSuccess : validationPassed
	});

	function getFieldValue(fieldId) {
		// 'get field' is part of Semantics form behavior API
		return $('.ui.form').form('get field', fieldId).val().trim();
	}

	function validationPassed() {
		var formData = {
				username : getFieldValue('username'),
				password : getFieldValue('password')
		};
		// alert(JSON.stringify(formData));
		$.ajax({
			type : 'POST',
			url : '/arc/Login',
			data : formData,
			success : onFormSubmitted
		});
	}

	// Handle post response
	function onFormSubmitted(response) {
		if (response === "OK") {
			document.location.href = '/arc/main.jsp';
		} else {
			alert(response);
		}
	}

	$('.ui.modal').modal();
	$('#register').hide();
	$(document).ready(function(e) {
		if ($("#refresh").val() == 'yes') {
			document.location.href = '/arc/main.jsp';
		} else {
			$('#refresh').val('yes');
		}
	});
});

var previous;

function getTT(combination) {
	$('html, body').animate({
        scrollTop: $("#sixbynine").offset().top
    }, 1000);
	$('#' + previous).removeClass("active");
	$('#' + combination).addClass("active");
	previous = combination;
	$('#loader').show();
	$('#detailsHeader').html("Section Details for - " + combination);
	$('#register').show();
	$('#hiddenMagic').html(combination);
	$('#' + combination).addClass("active");

	var formData = {
			comb : combination
	};
	var formData1 = {
			combName : combination
	};
	$.ajax({
		type : 'POST',
		url : '/arc/GetBlankSixbyNine',
		data : formData1,
		success : function(response) {
			$('#sixbynine').html(response);
		}
	});
	$.ajax({
		type : 'POST',
		url : '/arc/SixByNineData',
		data : formData1,
		success : function(response) {
			$.each(response, function(idx, obj) {

				$('#' + obj.id).html(obj.content);
			});
			$('#loader').hide();
		}
	});
	// $.ajax({ type: 'POST', url: '/arc/TTDetails', data: formData, success:
	// onTTResponse });
}

function onTTResponse(response) {
	$('#ttTable').html(response);
	$('#loader').hide();
}
function registerStudent() {
	var combination = {
			comb : $('#hiddenMagic').html()
	};

	$.ajax({
		type : 'POST',
		url : '/arc/StudentRegistration',
		data : combination,
		success : onStudentReg
	});
}

function onStudentReg(response) {
	if (response === "OK") {
		// alert("Success");
		var co = $('#hiddenMagic').html();
		document.location.href = '/arc/successRegistration.jsp?comb=' + co;
	} else {
		// alert("Ah ! the Capacity just got filled. Try Another Combination
		// after the page reloads.");
		$('#miss').modal('show');
		var delay = 5000; // Your delay in milliseconds
		setTimeout(function() {
			window.location = "/arc/main.jsp";
		}, delay);
		// document.location.href = '/arc/main.jsp';
	}
}

function showh() {
	$('#hurry').dimmer('show');
}

function getCombinationDataEG() {
	$('#combDataLoader').show();
	var combination = {
			combType : 'EG'
	};
	$.ajax({
		type : 'POST',
		url : '/arc/CapacityDetails',
		data : combination,
		success : onCombDataRetEG
	});
}

function onCombDataRetEG(response) {
	$('#EGCombData').html(response);
	$('#combDataLoader').hide();
}

function getCombinationDataWS() {
	$('#combDataLoader1').show();
	var combination = {
			combType : 'WS'
	};

	$.ajax({
		type : 'POST',
		url : '/arc/CapacityDetails',
		data : combination,
		success : onCombDataRetWS
	});
}

function onCombDataRetWS(response) {
	$('#WSCombData').html(response);
	$('#combDataLoader1').hide();
}

function updateCombData(combname) {
	$('#' + combname).addClass("loading");
	valnew = $('#' + combname).val();
	valold = $('#' + combname).attr("value");
	offset = valnew - valold;
	var combination = {
			combName : combname,
			capacity : offset
	};
	$.ajax({
		type : 'POST',
		url : '/arc/UpdateCombinationDetails',
		data : combination,
		success : function(response) {
			$('#' + combname).removeClass("loading");
			if (combname.indexOf("WS") != -1) {
				getCombinationDataWS();
			} else {
				getCombinationDataEG();
			}
		}
	});

}

function downloadData() {
	$('#downloadSegment').addClass("loading");
	$.ajax({
		type : 'GET',
		url : '/arc/DownloadData',
		success : function(response) {
			$('#downloadSegment').removeClass("loading");
			window.location.href = response;
		}
	});
}
