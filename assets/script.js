$(document).ready(function(){
  $(".section_toggle").click(function() {
    var section = $(this).attr("section_id");
    toggle_section( section );
  });
});

function displayAds( isPro ) {
	
	$("#wikidroid-ad").css('display', isPro ? "none" : "block");
}

function toggle_section( section_id ) {
  $("h2#section_" + section_id).children("button.show").toggle();
  $("h2#section_" + section_id).children("button.hide").toggle();

  $("div#content_" + section_id).toggle();
}