jQuery(document).ready(function ($) {
    "use strict";
    var offsetRecord =  parseInt($("#load-more-button").attr('data-offset'));
    $("#load-more-button").on("click", function () {
        var $offs = parseInt($(this).attr('data-offset'));
        console.log('click');
        $.ajax({
            url: custom_ajax.ajax_url, // WordPress AJAX handler URL
            type: "post",
            data: {
                action: "load_more_teachers",
                offset: offsetRecord,
            },
            success: function (response) {
                // Append the new data to the existing list
                $("#teacher-list").append(response);

                // Update the offset
                offsetRecord += $offs;
            },
        });
    });


    //ajax search

    $('input.search-field').on('change keyup', function(){
        const value = $(this).val();
        let url = window.location.href;
        if(value.trim().length < 3){      
            return;
        }
        $(this).parent().addClass('loading');
        $.ajax({
            url: custom_ajax.ajax_url, // WordPress AJAX handler URL
            type: "post",
            data: {
                action: "search_teachers_home",
                value: value 
            },
            success: function (response) {
                $('.search-result .result-search').remove();
                console.log(response);
                $('.search-form label').removeClass('loading');
                const res = JSON.parse(response);
                if(!res.length){
                    $('.search-result').append('<p class="result-search text-center pt-3 pb-3 bg-dark" style="font-size: 15px; color: #c13838; margin: 0;">Không có kết quả</p>');
                    return;
                }
                let html = '<ul class="result-search section-inner" style="max-width: 100%; padding: 15px 0; margin-bottom: -1px;">';
                res.forEach(item => {
                    html += `<li class="item-search"><a href="${url+'?id='+item['id']}">`;
                    html += item['full_name'];
                    html += '</a></li>';
                });
                html += '</ul>';
                $('.search-result').append(html);
            },
        });
    });
    $('input#search_teacher').on('change keyup', function(){
        const value = $(this).val();
        if(value.trim().length < 3){
            $('.search-result .result-search').remove();
            return;
        }
        $(this).parent().addClass('loading');
        var url = window.location.href;
        $.ajax({
            url: custom_ajax.ajax_url, // WordPress AJAX handler URL
            type: "post",
            data: {
                action: "search_dang_ky",
                value: value 
            },
            success: function (response) {
                $('.search-result .result-search').remove();
                console.log(response);
                $('.search-form label').removeClass('loading');
                const res = JSON.parse(response);
                if(!res.length){
                    $('.search-result').append('<p class="result-search text-center pt-3 pb-3 bg-dark" style="font-size: 15px; color: #c13838; margin: 0;">Không có kết quả</p>');
                    return;
                }
                let html = '<ul class="result-search section-inner" style="max-width: 100%; padding: 15px 0; margin-bottom: -1px;">';
                let ids = [];
                console.log('res===', res);
                for(let i=0; i<res.length; i++){
                    ids.push(res[i]['id']);
                };
                
                $.ajax({
                    url: custom_ajax.ajax_url, // WordPress AJAX handler URL
                    type: "post",
                    data: {
                        action: "search_dang_ky_last",
                        ids: ids.toString()
                    },
                    success: function (response_new) {
                        $('.search-result .result-search .all-result').remove();
                        $('.result-search').append(response_new);
                    }
                });
                html += '</ul>';
                $('.search-result').append(html);
            },
        });
    });

    $(document).on('click', 'header .login i', function(){
        var element = $(this);
        $('.overlay-full').css('display','block');
        $('body .body-login').removeClass('d-none');
        $('body').css('overflow', 'hidden');
    });

    $(document).on('click', '.overlay-full', function(){
        $(this).css('display','none');
        $('body .body-login').addClass('d-none');
        $('body').css('overflow', '');
    })

    $(document).ready(function() {
        // Select the element you want to monitor for scrolling
        var elementToScroll = $('#teacher-list'); // Replace with the actual ID or selector
    
        elementToScroll.on('scroll', function() {
            var $this = $(this);
            console.log('scrollling');
            // Check if you have reached the end of scrolling
            if ($this.scrollTop() + $this.innerHeight() >= $this[0].scrollHeight) {
                // You have reached the end of scrolling for the element
                console.log('Reached the end of scrolling');
                // $('#load-more-button').trigger('click');
            }
        });
    });

    $(".filter .dropdown-menu a").click(function(){
        var selText = $(this).text();
        var weekdays = $(this).attr('data');
        $(".filter .dropdown-menu a").removeClass('active');
        $(this).addClass('active');
        $(this).parents().parent().find('.dropdown-toggle').html(selText+' <span class="carets"></span>');
        $('.list-dang-ky-home').addClass('ajax-loading');
        $.ajax({
            url: custom_ajax.ajax_url, // WordPress AJAX handler URL
            type: "post",
            data: {
                action: "ajax_filter_dang_ky_by_weekdays",
                weekdays: weekdays.trim(),
                hoc_ky: $('.dropdown-menu-hoc_ky').val()
            },
            success: function (response) {
                console.log('response=', response);
                $('.list-dang-ky-home .list-dang-ky').remove();
                $('.list-dang-ky-home .result').remove();
                $('.list-dang-ky-home').removeClass('ajax-loading');
                if(!response){
                    $('.list-dang-ky-home').append(`<div class="result text-center f-14 bg-dark pt-3 pb-3 mt-3 text-white">Không có kết quả</div>`)
                    return;
                }
                $('.list-dang-ky-home').append(response);
            }
        });
      });

      $("select.dropdown-menu-hoc_ky").on('change', function(){
        var hoc_ky = $(this).val();
        var weekdays = $(".filter .dropdown-menu a.active").attr('data');
        console.log('dataFilter==', hoc_ky, weekdays);
        $('.list-dang-ky-home').addClass('ajax-loading');
        $.ajax({
            url: custom_ajax.ajax_url, // WordPress AJAX handler URL
            type: "post",
            data: {
                action: "ajax_filter_dang_ky_by_weekdays",
                weekdays: weekdays,
                hoc_ky: hoc_ky
            },
            success: function (response) {
                console.log('response=', response);
                $('.list-dang-ky-home .list-dang-ky').remove();
                $('.list-dang-ky-home .result').remove();
                $('.list-dang-ky-home').removeClass('ajax-loading');
                if(!response){
                    $('.list-dang-ky-home').append(`<div class="result text-center f-14 bg-dark pt-3 pb-3 mt-3 text-white">Không có kết quả</div>`)
                    return;
                }
                $('.list-dang-ky-home').append(response);
            }
        });
      });


      //input search classes

      $('input.search-by-classes').on('blur', function(){
        // var search = $(this).val();
        // window.location.href = '?search='+search;
      });

      $('input.search-by-classes').on('keyup', function(e){
        if (e.key === 'Enter' || e.keyCode === 13) {
            const value = $(this).val();
            if(value.trim() === ''){
                alert('Vui lòng nhập từ khóa tìm kiếm!')
                return;
            }
            var type = $('.form-check-input:checked').attr('value');
            var search = value;
            window.location.href = '?search='+search+'&type='+type;
        }
      });

      $('input.search-by-classes').next().on('click', function(){
        window.location.href = window.location.origin + window.location.pathname;
      })
   
});

