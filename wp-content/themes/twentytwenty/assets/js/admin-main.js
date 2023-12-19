/** Advance Options **/
jQuery(document).ready(function($){
	"use strict";
	
	$('.mo_meta_box_upload_button').on('click',function() {
		var button = $(this);
		var clear_button = $(this).siblings('.mo_meta_box_clear_image_button');
		var input_field = $(this).siblings('input.upload_field');   
		wp.media.editor.send.attachment = function(props, attachment){
			var attachment_url = '';
			attachment_url = attachment.sizes[props.size].url;
			input_field.val(attachment_url);
			if( input_field.siblings('.preview-image').length > 0 ){
				input_field.siblings('.preview-image').attr('src', attachment_url);
			}
			else{
				var img_html = '<img class="preview-image" src="' + attachment_url + '" />';
				input_field.parent().append(img_html);
			}
			clear_button.attr('disabled', false);
		}
		wp.media.editor.open(button);
	}); 
	
	$('.mo_meta_box_clear_image_button').on('click', function(){
		var button = $(this);
		button.attr('disabled', true);
		button.siblings('input.upload_field').val('');
		button.siblings('.preview-image').fadeOut(250, function(){
			button.siblings('.preview-image').remove();
		});
	});
	
	$('.mo-meta-box-field .upload_field').on('change', function(){
		var input_field = $(this);
		var input_value = input_field.val().trim();
		if( input_value == '' ){
			input_field.siblings('.mo_meta_box_clear_image_button').trigger('click');
		}
		else{
			if( input_field.siblings('.preview-image').length > 0 ){
				input_field.siblings('.preview-image').attr('src', input_value);
			}
			else{
				var img_html = '<img class="preview-image" src="' + input_value + '" />';
				input_field.parent().append(img_html);
			}
			input_field.siblings('.mo_meta_box_clear_image_button').attr('disabled', false);
		}
	});
	
	/* Gallery */
	var file_frame;
	var _add_img_button;
	$('.mo-gallery-box .add-image').on('click', function(event){
		event.preventDefault();
		_add_img_button = jQuery(this);
        
        if ( file_frame ) {
            file_frame.open();
            return;
        }

        var _states = [new wp.media.controller.Library({
            filterable: 'uploaded',
            title: 'Select Images',
            multiple: true,
            priority:  20
        })];
			 
        file_frame = wp.media.frames.file_frame = wp.media({
            states: _states,
            button: {
                text: 'Insert URL'
            }
        });

        file_frame.on( 'select', function() {
			var object = file_frame.state().get('selection').toJSON();
			
			var img_html = '';
			if( object.length > 0 ){
				for( var i = 0; i < object.length; i++ ){
					var image_url = object[i].url;
					if( typeof object[i].sizes.thumbnail != "undefined" ){
						image_url = object[i].sizes.thumbnail.url;
					}
					img_html += '<li class="image"><span class="del-image"></span><img src="'+image_url+'" alt="" data-id="'+object[i].id+'"/></li>';
				}
			}
			
			_add_img_button.siblings('ul.images').append(img_html);
			
			var arr_ids = new Array();
			_add_img_button.siblings('ul.images').find('li img').each(function(index, ele){
				arr_ids.push( $(ele).data('id') );
			});
			
			_add_img_button.siblings('.meta-value').val(arr_ids.join(','));
        });
		 
        file_frame.open();
	});
	
	jQuery('.mo-gallery-box .del-image').on('click', function(){
		var image = jQuery(this).parent('.image');
		var container = jQuery(this).parents('.mo-gallery-box');
		image.fadeOut(300, function(){
			image.remove();
			var arr_ids = new Array();
			container.find('.images img').each(function(index, ele){
				arr_ids.push( $(ele).data('id') );
			});
			container.find('.meta-value').val(arr_ids.join(','));
		});
	});
	
	/* Colorpicker */
	if( typeof $.fn.wpColorPicker == 'function' ){
		$('.mo-meta-box-field .colorpicker').wpColorPicker();
	}
	
});
/** End Advance Options **/

/** Page Template - Page Options **/
jQuery(document).ready(function($){
	"use strict";
	
	if( $('select#page_template').length > 0 ){
		$('select#page_template').on('change', function(){
			var template = $(this).val();
			$('#page_options .mo-meta-box-field').show();
			$('#mo_left_right_padding').parents('.mo-meta-box-field').hide();
			if( template == 'page-templates/fullwidth-template.php' ){
				$('#mo_page_layout, #mo_left_sidebar, #mo_right_sidebar').parents('.mo-meta-box-field').hide();
				$('#mo_left_right_padding').parents('.mo-meta-box-field').show();
			}
			if( template == 'page-templates/blank-page-template.php' ){
				$('#page_options').addClass('mo-hidden');
			}
			else{
				$('#page_options').removeClass('mo-hidden');
			}
		});
		$('select#page_template').trigger('change');
	}
	
	$('.mo-meta-box-field #mo_header_layout').on('change', function(){
		var val = $(this).val();
		if( val == 'v3' || val == 'v5' ){
			$('#mo_header_transparent').parents('.mo-meta-box-field').show();
			$('#mo_header_text_color').parents('.mo-meta-box-field').show();
		}
		else{
			$('#mo_header_transparent').parents('.mo-meta-box-field').hide();
			$('#mo_header_text_color').parents('.mo-meta-box-field').hide();
			$('#mo_header_transparent').val('0');
		}
	});
	$('.mo-meta-box-field #mo_header_layout').trigger('change');
});
/** End Page Template **/

/** Category Help center */

jQuery(document).ready(function($){
	"use strict";
	
	/* Only show the "remove image" button when needed */
	$('.mobio-help-cat-upload-field').each(function(){
		if( ! $(this).find('.value-field').val() ){
			$(this).find('.remove-button').hide();
		}
	});

	/* Uploading files */
	var file_frame;
	var upload_button;

	$( document ).on( 'click', '.mobio-help-cat-upload-field .upload-button', function( event ) {

		event.preventDefault();
		
		upload_button = $(this);

		/* If the media frame already exists, reopen it. */
		if ( file_frame ) {
			file_frame.open();
			return;
		}

		/* Create the media frame. */
		file_frame = wp.media.frames.downloadable_file = wp.media({
			title: 'Choose an image',
			button: {
				text: 'Use image'
			},
			multiple: false
		});

		/* When an image is selected, run a callback. */
		file_frame.on( 'select', function() {
			var attachment = file_frame.state().get( 'selection' ).first().toJSON();
			var thumb_url = attachment.url;
			if( typeof attachment.sizes.thumbnail != 'undefined' ){
				thumb_url = attachment.sizes.thumbnail.url;
			}

			upload_button.siblings('.value-field').val( attachment.id );
			upload_button.parents('.mobio-help-cat-upload-field').find('.preview-image img').attr( {'src': thumb_url, 'width': '', 'height': ''} );
			upload_button.siblings('.remove-button').show();
		});

		/* Finally, open the modal. */
		file_frame.open();
	});

	$( document ).on( 'click', '.mobio-help-cat-upload-field .remove-button', function() {
		var button = $(this);
		button.parents('.mobio-help-cat-upload-field').find('.preview-image img').remove();
		button.parents('.mobio-help-cat-upload-field').find('.preview-image').append( '<img src="' + button.siblings('.placeholder-image-url').val() + '" class="woocommerce-placeholder wp-post-image" width="60" height="60" alt="Placeholder" />' );
		button.siblings('.value-field').val('');
		button.hide();
		return false;
	});
	

});