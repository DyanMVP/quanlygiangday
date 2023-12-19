<?php 
/*** Metaboxes class ***/
class Metaboxes{
	function __construct(){
		if( is_admin() ){
			add_action('add_meta_boxes', array($this, 'add_meta_boxes'));
			add_action('save_post', array($this, 'save_meta_boxes'));
		}
	}
	
	function add_meta_boxes(){
		$datas = array(
					array(
						'id'			=> 'career_options'
						,'label'		=> esc_html__('Career Information', 'mobio')
						,'post_type'	=> 'career'
					),
					array(
						'id'			=> 'page_options'
						,'label'		=> esc_html__('Page Options', 'mobio')
						,'post_type'	=> 'page'
					),
					array(
						'id'			=> 'post_options'
						,'label'		=> esc_html__('Post Options', 'mobio')
						,'post_type'	=> 'post'
					),
					array(
						'id'			=> 'customer_case_options'
						,'label'		=> esc_html__('Customer Use Case Options', 'mobio')
						,'post_type'	=> 'customer_case'
					)
				);
		$this->add_meta_box($datas);
	}
	
	function add_meta_box( $datas ){
		foreach( $datas as $data ){
			$context = 'normal';
			$priority = 'high';
			if( isset($data['context']) ){
				$context = $data['context'];
			}
			if( isset($data['priority']) ){
				$priority = $data['priority'];
			}
			add_meta_box($data['id'], $data['label'], array($this, 'meta_box_callback'), $data['post_type'], $context, $priority, array('file_name'=>$data['id']));
		}
	}
	
	function save_meta_boxes( $post_id ){
		if( defined('DOING_AUTOSAVE') && DOING_AUTOSAVE ){
			return;
		}
		
		if( wp_is_post_revision($post_id) ){
			return;
		}
		
		if( isset($_POST['post_type']) ){
			if ( 'page' == sanitize_text_field($_POST['post_type']) ) {
				if ( !current_user_can('edit_page', $post_id) ) {
					return $post_id;
				}
			} else {
				if ( !current_user_can('edit_post', $post_id) ) {
					return $post_id;
				}
			}
		}

		foreach( $_POST as $key => $value ){
			if( strpos($key, 'mo_') !== false ){
				update_post_meta($post_id, $key, $value);
			}
		}
	}
	
	function meta_box_callback( $post, $para ){
		$file_name = isset($para['args']['file_name'])?$para['args']['file_name']:'';
		$file = get_template_directory().'/inc/meta_box/'.$file_name.'.php';
		$options = array();
		if( file_exists($file) ){
			include $file;
			$options = apply_filters('mo_metabox_options_'.$file_name, $options);
			$this->generate_field_html($options);
		}
	}

	function generate_field_html( $options ){
		global $post;
		$defaults = array(
							'id'			=> ''
							,'label' 		=> ''
							,'desc'			=> ''
							,'type'			=> 'text'
							,'options'		=> array() /* Use for select box */
							,'default'		=> ''
							,'place_holder' => '' 
							);
		foreach( $options as $option ){
			$option = wp_parse_args($option, $defaults);
			
			if( $option['id'] == '' )
				continue;
			
			$post_meta_value = get_post_meta($post->ID, 'mo_'.$option['id'], true);
			$place_holder    = get_post_meta($post->ID, 'mo_'.$option['place_holder'], true);
			if( $post_meta_value == '' )
				$post_meta_value = $option['default'];
		    if($place_holder  == '')
			    $place_holder = $option['place_holder'];
			$html = '';
			
			switch( $option['type'] ){
				case 'text':
					$html .= '<div class="mo-meta-box-field">';
						$html .= '<label for="mo_'.$option['id'].'">'.$option['label'].'</label>';
						$html .= '<div class="field">';
							$html .= '<input type="text" name="mo_'.$option['id'].'" id="mo_'.$option['id'].'" value="'.$post_meta_value.'" placeholder="'.$place_holder.'" />';
							if( strlen($option['desc']) > 0 ){
								$html .= '<p class="description">'.$option['desc'].'</p>';
							}
						$html .= '</div>';
					$html .= '</div>';
				break;
				
				case 'select':
					$html .= '<div class="mo-meta-box-field">';
						$html .= '<label for="mo_'.$option['id'].'">'.$option['label'].'</label>';
						$html .= '<div class="field">';
							$html .= '<select name="mo_'.$option['id'].'" id="mo_'.$option['id'].'">';
							foreach( $option['options'] as $key => $value ){
								$html .= '<option value="'.$key.'" '.selected($key, $post_meta_value, false).'>'.$value.'</option>';
							}
							$html .= '</select>';
							if( strlen($option['desc']) > 0 ){
								$html .= '<p class="description">'.$option['desc'].'</p>';
							}
						$html .= '</div>';
					$html .= '</div>';
				break;
				
				case 'textarea':
					$html .= '<div class="mo-meta-box-field">';
						$html .= '<label for="mo_'.$option['id'].'">'.$option['label'].'</label>';
						$html .= '<div class="field">';
							$html .= '<textarea name="mo_'.$option['id'].'" id="mo_'.$option['id'].'">'.$post_meta_value.'</textarea>';
						if( strlen($option['desc']) > 0 ){
							$html .= '<p class="description">'.$option['desc'].'</p>';
						}
						$html .= '</div>';
					$html .= '</div>';
				break;
				
				case 'upload':
					$post_meta_value = trim($post_meta_value);
					$html .= '<div class="mo-meta-box-field">';
						$html .= '<label for="mo_'.$option['id'].'">'.$option['label'].'</label>';
						$html .= '<div class="field">';
							$html .= '<input type="text" class="upload_field" name="mo_'.$option['id'].'" id="mo_'.$option['id'].'" value="'.$post_meta_value.'" />';
							$html .= '<input type="button" class="mo_meta_box_upload_button" value="'.esc_html__('Select Image', 'mobio').'" />';
							$html .= '<input type="button" class="mo_meta_box_clear_image_button" value="'.esc_html__('Clear Image', 'mobio').'" '.($post_meta_value?'':'disabled').' />';
						if( strlen($option['desc']) > 0 ){
							$html .= '<p class="description">'.$option['desc'].'</p>';
						}
						if( $post_meta_value ){
							$html .= '<img class="preview-image" src="'.$post_meta_value.'" />';
						}
						$html .= '</div>';
					$html .= '</div>';
				break;
				
				case 'heading':
					$html .= '<div class="mo-meta-box-field mo-heading-box">';
						$html .= '<h2 class="mo-meta-box-heading">'.$option['label'].'</h2>';
						if( strlen($option['desc']) > 0 ){
							$html .= '<p class="description">'.$option['desc'].'</p>';
						}
					$html .= '</div>';
				break;
				
				case 'gallery':
					$attachment_ids = array();
					if( $post_meta_value != '' ){
						$attachment_ids = explode(',', $post_meta_value);
					}
					
					$html .= '<div class="mo-meta-box-field mo-gallery-box">';
						$html .= '<ul class="images">';
							foreach( $attachment_ids as $attachment_id ){
							$html .= '<li class="image">';
								$html .= '<span class="del-image"></span>';
								$html .= wp_get_attachment_image( $attachment_id, 'thumbnail', false, array('data-id'=> $attachment_id) );
							$html .= '</li>';
							}
						$html .= '</ul>';
						$html .= '<input type="hidden" class="meta-value" name="mo_'.$option['id'].'" id="mo_'.$option['id'].'" value="'.$post_meta_value.'" />';
						$html .= '<a href="#" class="add-image">'.esc_html__('Add Images', 'mobio').'</a>';
					$html .= '</div>';
				break;
				
				case 'colorpicker':
					$html .= '<div class="mo-meta-box-field">';
						$html .= '<label for="mo_'.$option['id'].'">'.$option['label'].'</label>';
						$html .= '<div class="field">';
							$html .= '<input type="text" class="colorpicker" name="mo_'.$option['id'].'" id="mo_'.$option['id'].'" value="'.$post_meta_value.'" />';
							if( strlen($option['desc']) > 0 ){
								$html .= '<p class="description">'.$option['desc'].'</p>';
							}
						$html .= '</div>';
					$html .= '</div>';
				break;
				case 'datetime':
					$html .= '<div class="mo-meta-box-field">';
						$html .= '<label for="mo_'.$option['id'].'">'.$option['label'].'</label>';
						$html .= '<div class="field">';
							$html .= '<input type="date" class="datetime" name="mo_'.$option['id'].'" id="mo_'.$option['id'].'" value="'.$post_meta_value.'" />';
							if( strlen($option['desc']) > 0 ){
								$html .= '<p class="description">'.$option['desc'].'</p>';
							}
						$html .= '</div>';
					$html .= '</div>';
				break;
                
				
				default:
				break;
			}
			
			echo trim($html);
		}
	}	
}

new Metaboxes();
?>