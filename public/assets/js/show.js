$(function() {
    $('.container').find('.title').children('.click').click(function() {
        $(this).parent().parent().parent().animate({ right: 250 }, 320);
        $(this).css('display', 'none');
        $(this).parent().parent().parent().siblings('.side').animate({ right: 0 }, 300);
    })
    $('.click').mouseenter(function() {
        $(this).css('background-color', '#fff').css('color', '#000');

    }).mouseleave(function() {
        $(this).css('background-color', 'transparent').css('color', '#d0cdcb');
    })
    $('.right').click(function() {
        $('.sousuo').animate({ width: 0 }, 100);
        $('.no').html('');
        $(this).parent().parent().parent().animate({ right: -250 }, 300);
        $(this).parent().parent().parent().siblings('.container').find('.title').find('.click').css('display', 'block');
        $(this).parent().parent().parent().siblings('.container').animate({ right: 0 }, 280);
    })
    $('.main').mouseover(function() {
        $(this).css('color', '#fff');
    }).mouseout(function() {
        $(this).css('color', '#ddd');
    });
    $('.icon-xia').click(function() {
        /*var dist=$(this).parent().siblings('.content').offset().top;
        console.log(dist);
        $(this).parent().siblings('.content').animate({dist:0},2000);*/
        $(window).scrollTop(635);
    })
    $('.search').children('input').focus(function() {
        $(this).css('color', '#eee');
    }).blur(function() {
        $(this).css('color', '#555');
    })
})