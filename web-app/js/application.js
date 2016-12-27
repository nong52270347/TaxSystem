if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});

		$('.mk-datepicker').each(function () {
			$(this).datepicker({
				format: 'dd/mm/yyyy',
				todayBtn: true,
				todayHighlight: false,
				clearBtn: true,
				autoclose: true,
				language: 'th-th'
			});
		});
	})(jQuery);
}
