//-------------------------------------------DATE CONVERTER---------------------
		$('#englishDate').change(function(){
			$('#nepaliDate').val(AD2BS($('#englishDate').val()));
		});

		$('#nepaliDate').change(function(){
			$('#englishDate').val(BS2AD($('#nepaliDate').val()));
		});
		$('#billDateEnglish').change(function(){
			$('#billDateNepali').val(AD2BS($('#billDateEnglish').val()));
		});

		$('#billDateNepali').change(function(){
			$('#billDateEnglish').val(BS2AD($('#billDateNepali').val()));
		});
		$('#billDateEnglish1').change(function(){
			$('#billDateNepali1').val(AD2BS($('#billDateEnglish1').val()));
		});

		$('#billDateNepali1').change(function(){
			$('#billDateEnglish1').val(BS2AD($('#billDateNepali1').val()));
		});
//---------------------------------------AUTO - ON DATE TYPING------------------------
		
