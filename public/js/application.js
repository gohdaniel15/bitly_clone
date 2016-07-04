$(document).ready(function() {
	$('.pull-me').click(function() {
		$('.panel').slideToggle('slow');
		$(this).toggleClass("flipped");
	});

	$("#form").on("submit",function(event){
		event.preventDefault();
		var input = $(this).serialize();
		$.ajax ({

			type: 'POST',
			url: '/urls',
			data: input,
			dataType: "json",
			success: function(msg) {
			if (msg["errors"]) {
					$('#resultBox').hide();
					$("#resultBox").html(msg["errors"].long_url[0]);
					$("#resultBox").addClass("showBox");
					$('#resultBox').slideToggle('slow');
				}
			else {
					$('#resultBox').hide();
					$("#resultBox").html("http://localhost:9393/" + msg.short_url);
					$("#resultBox").addClass("showBox");
					$("#resultBox").slideToggle('slow');
					$("#copyButton").css('display', 'none');
					$("#copyButton").slideToggle('slow');
				}	
			}
		});

	})

	function copyToClipboard(element) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(element).text()).select();
    document.execCommand("copy");
    $temp.remove();
  };

  $("#copyButton").on("click", function() {
    	copyToClipboard('#resultBox');
  });
 
});
