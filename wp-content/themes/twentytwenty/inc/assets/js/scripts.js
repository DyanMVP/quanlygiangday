jQuery(document).ready(function ($) {
    "use strict";
    var dataId = 0;
    $('.add_new_teacher_first').on('click', function(){
        setTimeout(()=>{
            tinymce.init({
            selector: 'textarea.editor_add',
            skin: 'bootstrap',
            plugins: 'lists, link, image, media',
            // toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
            menubar: false,
        });
        }, 10)
    });
    $('#addViewModal').each(function(){
        var element = $(this);
        element.find('.add_new_teacher').on('click', function(e){
            e.preventDefault();
            var fullName = element.find('input.full_name').val();
            var email = element.find('input.email').val();
            var date = element.find('input.date').val();
            var radios = element.find('input[name="optradio"]');
            let sex = 'Nam';
            radios.each(function(){
                var radio = $(this);
                if (radio.is(':checked')){
                    sex = radio.attr('sex');
                }
            })
            var address = element.find('textarea.address').val();
            var phone = element.find('input.phone').val();
            var position = element.find('input.position').val();
            var url_image = element.find('.image-view').attr('data-src')
            var maToMon = element.find('#select_to_mon').find(":selected").attr('value');

            var tieu_su = tinymce.activeEditor.getContent();
            console.log('Tieu su===', tieu_su);
            if(fullName.trim() === '' || email === '' || !date || address.trim() === '' || phone.trim() === '' || position.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'insert_data_action',
                teacher_id: 100,
                full_name: fullName,
                email: email,
                date_of_birth: date,
                sex: sex,
                address: address,
                phone: phone,
                position: position,
                image: url_image,
                ma_to_mon: maToMon,
                tieu_su: tieu_su,
                nonce: custom_ajax.nonce,
            };
            console.log('data===', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                if(response === 'exits'){
                    console.log('response==', response);
                    alert('Email đã được sử dụng. Vui lòng sử dụng một email khác!');
                    return;
                }
                console.log('response==', response);
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            });
        });

        element.find('.add_new_to_mon').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var number_teacher = element.find('input.so_giang_vien').val();
            if(name.trim() === '' || number_teacher.trim() === ''){
                console.log('validate error');
                alert('Vui lòng không để trống!');
                return;
            }
            var data = {
                action: 'insert_data_action_to_mon',
                ten_to_mon: name,
                so_giang_vien: number_teacher,
                ma_khoa: 'CNTT',
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            });
        });

        element.find('.add_new_mon_hoc').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var description = element.find('textarea.description').val();
            var time_start = element.find('input.time_start').val();
            var time_end = element.find('input.time_end').val();
            var link = element.find('input.link').val();
            var teacher_id = element.find('#select_mon_hoc').find(":selected").attr('value');

            if(name.trim() === '' ){
                console.log('validate error');
                return;
            }
            
            var data = {
                action: 'insert_data_action_mon_hoc',
                ten_mon_hoc: name,
                mo_ta: description,
                time_start: time_start,
                time_end: time_end,
                link: link,
                teacher_id: teacher_id,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            });
        });

        element.find('.add_new_khoa').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var description = element.find('textarea.description').val();
            var time_start = element.find('#dropdownYear').find(":selected").attr('value');
            if(name.trim() === '' || !time_start){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'insert_data_action_khoa',
                ten_khoa: name,
                mo_ta: description,
                start_year: time_start,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 200);
            });
        });

        element.find('.add_new_classes').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var id_khoa = element.find('#select_classes').find(":selected").attr('value');

            if(name.trim() === '' || id_khoa.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            var data = {
                action: 'insert_data_action_classes',
                ten_lop: name,
                ma_khoa: 'CNTT',
                id_khoa: id_khoa,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 200);
            });
        });

        element.find('.add_dang_ky').on('click', function(e){
            e.preventDefault();
            var id_teacher = element.find('#select_teacher').find(":selected").attr('value');
            var id_classes = element.find('#select_classes').find(":selected").attr('value');
            var id_mon_hoc = element.find('#select_mon_hoc').find(":selected").attr('value');
            // var time_start = element.find('input#time_start').val();
            var weekdays = element.find('#select_weekdays').val();
            var lesson_start = element.find('.select-lesson-start').val();
            var lesson_end = element.find('.select-lesson-end').val();
            var ghi_chu = element.find('textarea.note').val();
            var link = element.find('input.link').val();
            var hoc_ky = element.find('select#select_ky_hoc').val();
            var year = element.find('#select_year').val();

            if(link.trim() === ''){
                element.find('input.link').parent().find('.error-message').remove();
                element.find('input.link').parent().append('<div class="error-message" style="font-size: 13px;">Vui lòng không để trống</div>');
                return;
            }
            if(!isValidURL(link)){
                element.find('input.link').parent().find('.error-message').remove();
                element.find('input.link').parent().append('<div class="error-message" style="font-size: 13px;">URL không hợp lệ</div>');
                return;
            }

            if(id_teacher === '' || id_classes === '' || id_mon_hoc === '' || !lesson_start || !lesson_end || !hoc_ky){
                console.log('validate error');
                alert('Vui lòng nhập đầy đủ thông tin');
                return;
            }

            if(parseInt(lesson_end) < parseInt(lesson_start)){
                alert('Tiết học kết thúc không được nhỏ hơn tiết bắt đầu');
                return;
            }
            var data = {
                action: 'insert_data_action_dang_ky',
                teacher_id: id_teacher,
                id_lop: id_classes,
                id_mon: id_mon_hoc,
                hoc_ky: hoc_ky,
                ghi_chu: ghi_chu,
                time_start: '2023-09-09',
                lesson: `[${lesson_start}, ${lesson_end}]`,
                lesson_start: lesson_start,
                link: link,
                weekdays: weekdays,
                year: year,
                nonce: custom_ajax.nonce,
            };
            console.log('data===', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                if(response == 'error'){
                    alert('Tiết học đăng kí không hợp lệ');
                    return;
                }
                console.log('response===', response);
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 20);
            });
        });

        element.find('.add_history_lesson').on('click', function(e){
            e.preventDefault();
            var url = element.find('.url_detail').val();
            var id = $(this).attr('data-id');
            var time_created = element.find('.time_created').val();
            var note = element.find('.note').val();
            if(url === '' || !time_created){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            var data = {
                action: 'insert_data_action_history_lesson',
                id:id,
                url: url,
                time_created: time_created,
                note: note,
                nonce: custom_ajax.nonce,
            };
            console.log('data===', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                console.log('response===', response);
                alert('Thêm mới thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 20);
            });

        });

    });


    $('#editViewModal').each(function(){
        var element = $(this);
        element.find('.edit_teacher').on('click', function(e){
            e.preventDefault();
            var fullName = element.find('input.full_name').val();
            var date = element.find('input.date').val();
            var radios = element.find('input[name="optradio"]');
            let sex = 'Nam';
            radios.each(function(){
                var radio = $(this);
                if (radio.is(':checked')){
                    sex = radio.attr('sex');
                }
            })
            var address = element.find('textarea.address').val();
            var phone = element.find('input.phone').val();
            var position = element.find('input.position').val();
            var maToMon = element.find('#select_to_mon').find(":selected").attr('value');
            var tieu_su = tinymce.activeEditor.getContent();
            var url_image = element.find('.image-view').attr('data-src');
            console.log('Tieu su===', tieu_su);

            if(fullName.trim() === '' || !date || address.trim() === '' || phone.trim() === '' || position.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'edit_data_action',
                id: dataId,
                teacher_id: 100,
                full_name: fullName,
                date_of_birth: date,
                sex: sex,
                address: address,
                phone: phone,
                position: position,
                ma_to_mon: maToMon,
                tieu_su: tieu_su,
                image: url_image,
                nonce: custom_ajax.nonce,
            };
            console.log('data==', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Chỉnh sửa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            }).fail(function(jqXHR, textStatus, errorThrown) {
                console.log('AJAX Error:', errorThrown);
            });
        });

        element.find('.edit_to_mon').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            
            if(name.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'edit_data_action_to_mon',
                id: dataId,
                ten_to_mon: name,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Chỉnh sửa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            }).fail(function(jqXHR, textStatus, errorThrown) {
                console.log('AJAX Error:', errorThrown);
            });
        });

        element.find('.edit_khoa').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var description = element.find('textarea.description').val();
            var time_start = element.find('#dropdownYear').find(":selected").attr('value');
            if(name.trim() === '' || !time_start){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'edit_data_action_khoa',
                id: dataId,
                ten_khoa: name,
                mo_ta: description,
                start_year: time_start,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Chỉnh sửa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            }).fail(function(jqXHR, textStatus, errorThrown) {
                console.log('AJAX Error:', errorThrown);
            });
        });

        element.find('.edit_classes').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var id_khoa = element.find('#select_classes').find(":selected").attr('value');

            if(name.trim() === '' || id_khoa.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'edit_data_action_classes',
                id: dataId,
                ten_lop: name,
                ma_khoa: 'CNTT',
                id_khoa: id_khoa,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Chỉnh sửa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            })
        });

        element.find('.edit_mon_hoc').on('click', function(e){
            e.preventDefault();
            var name = element.find('input.full_name').val();
            var mo_ta = element.find('textarea.mo_ta').val();

            if(name.trim() === '' || mo_ta.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            
            var data = {
                action: 'edit_data_action_mon_hoc',
                id: dataId,
                ten_mon_hoc: name,
                mo_ta: mo_ta,
                nonce: custom_ajax.nonce,
            };
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Chỉnh sửa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 50);
            })
        });

        element.find('.edit_dang_ky').on('click', function(e){
            e.preventDefault();
            var url = element.find('input.url_detail').val();

            if(url.trim() === ''){
                console.log('validate error');
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }
            if(isYouTubeURL(url) || isMP4URL(url)){
                console.log('ok');
                var data = {
                    action: 'edit_data_action_dang_ky',
                    id: dataId,
                    url_detail: url,
                    nonce: custom_ajax.nonce,
                };
                $.post(custom_ajax.ajax_url, data, function(response) {
                    alert('Chỉnh sửa thành công!');
                    setTimeout(()=>{
                        window.location.reload();
                    }, 50);
                })
               
                return;
            }
            alert('Vui lòng nhập đúng định dạng url youtube hoặc mp4');
            return;
            
        });


    });

    //append data form edit

    $(document).on('click', '.table-responsive .edit_teacher', function(){
        dataId = $(this).attr('data-id');
        if($('textarea.editor').next().hasClass('tox-tinymce')){
            $('textarea.editor').next().remove();
        }
        var row = $(this).parent().parent();
        var formEdit = $('#editViewModal');
        console.log('vào đây', row, formEdit.find('input.full_name'), row.find('td:first-child'));
        formEdit.find('input.full_name').val(row.find('td:nth-child(2)').text());
        var currentDate = row.find('td:nth-child(3)').attr('data-date');
        var dateValue = new Date(currentDate.split(' ')[0]);
        // Format the date as YYYY-MM-DD (date only)
        var formattedDate = dateValue.toISOString().split('T')[0];
        formEdit.find('input.date').val(formattedDate);
        var currentSex = row.find('td:nth-child(4)').text();
        if(currentSex === 'Nam'){
            formEdit.find('[sex="Name"]').prop('checked', true);
        } else{
            formEdit.find('[sex="Nữ"]').prop('checked', true);
        }
        
        formEdit.find('textarea.address').val(row.find('td:nth-child(5)').text());
        formEdit.find('input.phone').val(row.find('td:nth-child(6)').text());
        formEdit.find('input.position').val(row.find('td:nth-child(7)').text());
        const tieu_su = row.find('td:nth-child(8)').html();
        const url_image = row.find('td:nth-child(9)').text();
        formEdit.find('.image-view img').remove();
        formEdit.find('.image-view').append(`<img src="${url_image}" width="100%" alt />`);
        console.log('Tieu su==', tieu_su, );
        formEdit.find('textarea.editor').val(tieu_su);
        setTimeout(()=>{
            tinymce.init({
            selector: 'textarea.editor',
            skin: 'bootstrap',
            plugins: 'lists, link, image, media',
            // toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
            menubar: false,
        });
        }, 200);
        
    });

    $('.table-responsive .edit_to_mon').on('click', function(){
        dataId = $(this).attr('data-id');
        var formEdit = $('#editViewModal');
        var row = $(this).parent().parent();
        formEdit.find('input.full_name').val(row.find('td:nth-child(2)').text());
    });

    $('.table-responsive .edit_khoa').on('click', function(){
        dataId = $(this).attr('data-id');
        var formEdit = $('#editViewModal');
        var row = $(this).parent().parent();
        formEdit.find('input.full_name').val(row.find('td:nth-child(2)').text());
        formEdit.find('textarea.description').val(row.find('td:nth-child(3)').text());
        const time_start = row.find('td:nth-child(4)').text();
        formEdit.find('#dropdownYear').val(time_start);
    });

    $('.table-responsive .edit_classes').on('click', function(){
        dataId = $(this).attr('data-id');
        var formEdit = $('#editViewModal');
        var row = $(this).parent().parent();
        formEdit.find('input.full_name').val(row.find('td:nth-child(2)').text());
        const id_khoa = $(this).attr('data-id_khoa');
        console.log('id_khoa==', id_khoa);
        formEdit.find('#select_classes').val(id_khoa);
    });

    $('.card-body .edit_dang_ky').on('click', function(e){
        dataId = $(this).attr('data-id');
        var formEdit = $('#editViewModal');
        var row = $(this).parent().parent();
        var url_detail = $(this).attr('data-url');
        formEdit.find('input.url_detail').val(url_detail);
    });

    $('.table-responsive .edit_mon_hoc').on('click', function(e){
        dataId = $(this).attr('data-id');
        var formEdit = $('#editViewModal');
        var row = $(this).parent().parent();
        formEdit.find('input.full_name').val(row.find('td:nth-child(2)').text());
        formEdit.find('textarea.mo_ta').val(row.find('td:nth-child(3)').text());
    })


    //remove teacher
    $('.table-responsive .delete, .card-body table .delete').on('click', function(){
        dataId = $(this).attr('data-id');
    });

    $('#deleteViewModal').each(function(){
        var element = $(this);
        var email = $('button-delete-form').attr('data-email');
        element.find('.delete_teacher').on('click', function(e){
            e.preventDefault();
            var data = {
                action: 'delete_data_action',
                id: dataId,
                email: email,
                nonce: custom_ajax.nonce,
            };
            console.log('data==', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Xóa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 100);
            }).fail(function(jqXHR, textStatus, errorThrown) {
                console.log('AJAX Error:', errorThrown);
            });
        });

        element.find('.delete_to_mon').on('click', function(e){
            e.preventDefault();
            var data = {
                action: 'delete_data_action_to_mon',
                id: dataId,
                nonce: custom_ajax.nonce,
            };
            console.log('data==', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Xóa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 100);
            })
        });

        element.find('.delete_khoa').on('click', function(e){
            e.preventDefault();
            var data = {
                action: 'delete_data_action_khoa',
                id: dataId,
                nonce: custom_ajax.nonce,
            };
            console.log('data==', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Xóa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 100);
            })
        });

        element.find('.delete_classes').on('click', function(e){
            e.preventDefault();
            var data = {
                action: 'delete_data_action_classes',
                id: dataId,
                nonce: custom_ajax.nonce,
            };
            console.log('data==', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Xóa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 100);
            })
        });
        element.find('.delete_mon_hoc').on('click', function(e){
            e.preventDefault();
            var data = {
                action: 'delete_data_action_mon_hoc',
                id: dataId,
                nonce: custom_ajax.nonce,
            };
            console.log('data==', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Xóa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 100);
            })
        })

        element.find('.delete_dang_ky').on('click', function(e){
            e.preventDefault();
            var data = {
                action: 'delete_data_action_dang_ky',
                id: dataId,
                nonce: custom_ajax.nonce,
            };
            console.log('data===', data);
            $.post(custom_ajax.ajax_url, data, function(response) {
                alert('Xóa thành công!');
                setTimeout(()=>{
                    window.location.reload();
                }, 100);
            })
        })

    });



    ///login

    $('#user-registration-form').on('submit', function(e) {
        e.preventDefault();

        // Serialize the form data
        var formData = $(this).serialize();

        // Send an AJAX request
        $.ajax({
            type: 'POST',
            url: custom_ajax.ajax_url, // WordPress AJAX URL
            data: {
                action: 'register_user', // Custom AJAX action
                formData: formData
            },
            success: function(response) {
                if(response === 'success'){
                    window.location.reload();
                }
                $('.notify-login').html(response);
            }
        });
    });
//open select media
    $('.img-upload').each(function(){
        var element = $(this);
        element.on('click', function(){
            var el = $(this);
            var upload = wp.media({
            title:'Choose Image', //Title for Media Box
            multiple:false //For limiting multiple image
            })
            .on('select', function(){
                var select = upload.state().get('selection');
                var attach = select.first().toJSON();
                console.log(attach.id); //the attachment id of image
                console.log(attach.url); //url of image
                el.closest('.d-flex').find('.image-view').attr('data-src', attach.url);
                el.closest('.d-flex').find('.image-view').find('img').remove();
                el.closest('.d-flex').find('.image-view').append(`<img src="${attach.url}" width="100%" alt>`);
            })
        .open();
    });
    })


    // $('.meta-box-sortables').sortable({
    //     disabled: true
    // });

    // $('.postbox .hndle').css('cursor', 'pointer');

    $('.slider.owl-carousel').owlCarousel({
        "margin": 30,
    });

    $(".post-list.owl-carousel").owlCarousel({
		items: 1,
		loop: true,
		nav: true,
		dots: true,
		navText: [,],
		navSpeed: 1000,
		slideBy: 1,
		rtl: $("body").hasClass("rtl"),
		margin: 40,
		navRewind: false,
		autoplay: true,
		autoplayHoverPause: true,
		autoplaySpeed: 2000,
		autoplayTimeout:6000,
		autoHeight: true,
		responsive: {
		  0: {
			items: 1
		  }
		}
	  });

      var isYouTubeURL = function(url){
        var youtubeRegex = /^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/watch\?v=[A-Za-z0-9_-]+/;
        return youtubeRegex.test(url);
      }

      var isMP4URL = function(url){
        var mp4Regex = /\.(mp4)$/i;
        return mp4Regex.test(url);
      }

      //append video
      $('.url_video_detail').on('click', function(e){
        e.preventDefault();
        let typeVideo;
        let html = '';
        const url = $(this).attr('data-url');
        const modalVideo = $('.modal-video');
        const modalOverlay = $('.modal-overlay-video');
        $('body').css('overflow', 'hidden');
        modalVideo.removeClass('d-none');
        modalOverlay.removeClass('d-none');
        modalVideo.find('iframe').remove();
        modalVideo.find('video').remove();
        if(isYouTubeURL(url)){
            typeVideo = 'youtube';
            var regex = /(?:\?v=|\/embed\/|\/\d\/|\/v\/|\/e\/|watch\?v=|youtu\.be\/)([A-Za-z0-9_-]+)/;
            var match = url.match(regex);
            const videoId = match[1];
            html = `<iframe width="100%" height="100%" src="https://www.youtube.com/embed/${videoId}" frameborder="0" allowfullscreen></iframe>`;
        }
        if(isMP4URL(url)){
            html = `<video width="100%" height="100%" controls>
            <source src="${url}" type="video/mp4">
          </video>`
        }
        console.log('html ====', html);
        modalVideo.append(html);
      });

      $('.modal-overlay-video').on('click', function(){
        $(this).addClass('d-none');
        $('.modal-video').addClass('d-none');
        $('.modal-video *').remove();
        $('body').css('overflow', '');
      })

      function isValidURL(url) {
        // Regular expression for validating an URL
        var urlRegex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,}(:\d{1,5})?(\/\S*)?$/;
        return urlRegex.test(url);
        }

});

