
$(document).on("click", "#monBoutonDetail", function () {
    var myNodeId = $(this).data('id');
    
    $(".item").removeClass("active");
    $("#" + myNodeId).addClass("active");
});