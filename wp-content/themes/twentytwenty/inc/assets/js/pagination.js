jQuery(document).ready(function ($) {
    "use strict";
    $('.table-responsive.teacher_list').each(function(){
        var element = $(this);
        element.find('.page-item').on('click', function(e){
            e.preventDefault();
            var currentOffset = parseInt(element.find('li.active').attr('data-offset')) || 0;
            console.log('currentOffset==', currentOffset);
            var total = element.find('li').length - 2;
            console.log('total=', total);
            $(this).parent().find('li').removeClass('active');
            $(this).addClass('active');
            element.find('tbody').addClass('loading');
            var offset= parseInt($(this).attr('data-offset'));
            if($(this).hasClass('prev')){
                currentOffset = currentOffset - 1;
                offset = currentOffset - 1 <= 0 ? 1 : currentOffset - 1;
                $(this).removeClass('active');
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            if($(this).hasClass('next')){
                currentOffset = currentOffset + 1;
                offset = currentOffset + 1 > total ? total : currentOffset + 1;
                $(this).removeClass('active');
                console.log(' currentOffset==',  currentOffset);
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            $.ajax({
                url: custom_ajax.ajax_url, // WordPress AJAX handler URL
                type: "post",
                data: {
                    action: "load_pagination_teachers",
                    offset: offset,
                },
                success: function (response) {
                    // Append the new data to the existing list
                    element.find("tbody td").remove();
                    element.find('tbody').append(response);
                    element.find('tbody').removeClass('loading');
                },
            });
        })
    });


    $('.list_dang_ky').each(function(){
        var element = $(this);
        element.find('.page-item').on('click', function(e){
            e.preventDefault();
            var currentOffset = parseInt(element.find('li.active').attr('data-offset')) || 0;
            console.log('currentOffset==', currentOffset);
            var total = element.find('li').length - 2;
            console.log('total=', total);
            $(this).parent().find('li').removeClass('active');
            $(this).addClass('active');
            element.find('tbody').addClass('loading');
            var offset= parseInt($(this).attr('data-offset'));
            if($(this).hasClass('prev')){
                currentOffset = currentOffset - 1;
                offset = currentOffset - 1 <= 0 ? 1 : currentOffset - 1;
                $(this).removeClass('active');
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            if($(this).hasClass('next')){
                currentOffset = currentOffset + 1;
                offset = currentOffset + 1 > total ? total : currentOffset + 1;
                $(this).removeClass('active');
                console.log(' currentOffset==',  currentOffset);
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            $.ajax({
                url: custom_ajax.ajax_url, // WordPress AJAX handler URL
                type: "post",
                data: {
                    action: "load_pagination_dang_ky",
                    offset: offset,
                },
                success: function (response) {
                    // Append the new data to the existing list
                    element.find("tbody td").remove();
                    element.find('tbody').append(response);
                    element.find('tbody').removeClass('loading');
                },
            });
        })
    });

    $('.list_classes').each(function(){
        var element = $(this);
        element.find('.page-item').on('click', function(e){
            e.preventDefault();
            var currentOffset = parseInt(element.find('li.active').attr('data-offset')) || 0;
            console.log('currentOffset==', currentOffset);
            var total = element.find('li').length - 2;
            console.log('total=', total);
            $(this).parent().find('li').removeClass('active');
            $(this).addClass('active');
            element.find('tbody').addClass('loading');
            var offset= parseInt($(this).attr('data-offset'));
            if($(this).hasClass('prev')){
                currentOffset = currentOffset - 1;
                offset = currentOffset - 1 <= 0 ? 1 : currentOffset - 1;
                $(this).removeClass('active');
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            if($(this).hasClass('next')){
                offset = currentOffset + 1 > total ? total : currentOffset + 1;
                $(this).removeClass('active');
                console.log(' currentOffset==',  currentOffset);
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            $.ajax({
                url: custom_ajax.ajax_url, // WordPress AJAX handler URL
                type: "post",
                data: {
                    action: "load_pagination_classes",
                    offset: offset,
                },
                success: function (response) {
                    // Append the new data to the existing list
                    element.find("tbody td").remove();
                    element.find('tbody').append(response);
                    element.find('tbody').removeClass('loading');
                },
            });
        })
    });

    $('.mon_hoc_list').each(function(){
        var element = $(this);
        element.find('.page-item').on('click', function(e){
            e.preventDefault();
            var currentOffset = parseInt(element.find('li.active').attr('data-offset')) || 0;
            console.log('currentOffset==', currentOffset);
            var total = element.find('li').length - 2;
            console.log('total=', total);
            $(this).parent().find('li').removeClass('active');
            $(this).addClass('active');
            element.find('tbody').addClass('loading');
            var offset= parseInt($(this).attr('data-offset'));
            if($(this).hasClass('prev')){
                currentOffset = currentOffset - 1;
                offset = currentOffset - 1 <= 0 ? 1 : currentOffset - 1;
                $(this).removeClass('active');
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            if($(this).hasClass('next')){
                offset = currentOffset + 1 > total ? total : currentOffset + 1;
                $(this).removeClass('active');
                console.log(' currentOffset==',  currentOffset);
                element.find(`[data-offset="${offset}"]`).addClass('active');
            }
            $.ajax({
                url: custom_ajax.ajax_url, // WordPress AJAX handler URL
                type: "post",
                data: {
                    action: "load_pagination_mon_hoc",
                    offset: offset,
                },
                success: function (response) {
                    // Append the new data to the existing list
                    element.find("tbody td").remove();
                    element.find('tbody').append(response);
                    element.find('tbody').removeClass('loading');
                },
            });
        })
    });
})