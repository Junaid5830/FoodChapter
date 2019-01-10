
if ( $(window).width() > 481){
    $(document).ready(function(){
	
	
		   
  $(".slider-img1").animate({
    top: '364px',
  }, 1500);
   $(".slider-img2").animate({
    top: '360px',
  }, 1800);
   $(".slider-img3").animate({
    top: '350px',
  }, 2100);
   $(".slider-img4").animate({
    top: '480px',
  }, 2400);
   $(".slider-img5").animate({
    top: '457px',
  }, 2600);
   $(".slider-img6").animate({
    top: '380px',
  }, 2800);
   $(".slider-img7").animate({
    top: '320px',
  }, 1500, function(){doAnimation();
  });
  
});

$(document).ready(function(){

  $('.next').click(function(){
	  $('.slideshow-container img').css('top', '0');
  	
	$(".slider-img1").animate({
    top: '364px',
  }, 1500);
   $(".slider-img2").animate({
    top: '360px',
  }, 1800);
   $(".slider-img3").animate({
    top: '350px',
  }, 2100);
   $(".slider-img4").animate({
    top: '480px',
  }, 2400);
   $(".slider-img5").animate({
    top: '457px',
  }, 2600);
   $(".slider-img6").animate({
    top: '480px',
  }, 2800);
   $(".slider-img7").animate({
    top: '320px',
  }, 1500);
  });
});
  


$(document).ready(function(){
	
  
  $('.prev').click(function(){
	  $('.slideshow-container img').css('top', '0');
  	
	$(".slider-img1").animate({
    top: '364px',
  }, 1500);
   $(".slider-img2").animate({
    top: '360px',
  }, 1800);
   $(".slider-img3").animate({
    top: '350px',
  }, 2100);
   $(".slider-img4").animate({
    top: '480px',
  }, 2400);
   $(".slider-img5").animate({
    top: '457px',
  }, 2600);
   $(".slider-img6").animate({
    top: '480px',
  }, 2800);
   $(".slider-img7").animate({
    top: '320px',
  }, 1500);
  });
});
}  
  else{
  
$(document).ready(function(){

	
	$(".rslide").attr("src","images/bannertest.png");
	
		   
  $(".slider-img1").animate({
    top: '223px',width:"20%"
  }, 1500);
   $(".slider-img2").animate({
    top: '293px', width: "10%",left: "24px"
  }, 1800);
   $(".slider-img3").animate({
    top: '262px',    width: '10%'
  }, 2100);
   $(".slider-img4").animate({
    top: '227px',
  }, 2400);
   $(".slider-img5").animate({
    top: '284px',    width: '12%'
  }, 2600);
   $(".slider-img6").animate({
    top: '245px',    width: '15%'
  }, 2800);
   $(".slider-img7").animate({
    top: '370px',
  }, 1500, function(){doAnimation();
  });
  
});

$(document).ready(function(){

  $('.next').click(function(){
	  $('.slideshow-container img').css('top', '0');
  	
	$(".slider-img1").animate({
    top: '420px',
  }, 1500);
   $(".slider-img2").animate({
    top: '400px',
  }, 1800);
   $(".slider-img3").animate({
    top: '430px',
  }, 2100);
   $(".slider-img4").animate({
    top: '480px',
  }, 2400);
   $(".slider-img5").animate({
    top: '510px',
  }, 2600);
   $(".slider-img6").animate({
    top: '545px',
  }, 2800);
   $(".slider-img7").animate({
    top: '370px',
  }, 1500);
  });
});
  


$(document).ready(function(){
	
  
  $('.prev').click(function(){
	  $('.slideshow-container img').css('top', '0');
  	
	$(".slider-img1").animate({
    top: '420px',
  }, 1500);
   $(".slider-img2").animate({
    top: '400px',
  }, 1800);
   $(".slider-img3").animate({
    top: '430px',
  }, 2100);
   $(".slider-img4").animate({
    top: '480px',
  }, 2400);
   $(".slider-img5").animate({
    top: '510px',
  }, 2600);
   $(".slider-img6").animate({
    top: '545px',
  }, 2800);
   $(".slider-img7").animate({
    top: '370px',
  }, 1500);
  });
});
  
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
            $('#imagePreview').hide();
            $('#imagePreview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#imageUpload").change(function() {
    readURL(this);
});