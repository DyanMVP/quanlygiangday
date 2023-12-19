<?php
$data_teacher = get_data_teacher_by_id($id);
$sex = $data_teacher['sex'];
$image = $data_teacher['image'];
$name = $data_teacher['full_name'];
$date = explode(' ',date("H:i d/m/Y", strtotime($data_teacher['date_of_birth'])))[1];
$position = $data_teacher['position'];
$description = $data_teacher['tieu_su'];
$email = $data_teacher['email'];
$address = $data_teacher['address'];

function get_image_default($sex){
    if($sex === 'Nam'){
        echo '<img src="'.get_template_directory_uri() .'/assets/images/images.png">';
        return;
    }
    echo '<img src="'.get_template_directory_uri() .'/assets/images/65581.png">';
}
?>
<div class="details-teacher w-100 pt-5 pb-5">
    <div class="details-top pb-5" style="border-bottom: 1px solid #ebebeb">
        <div class="d-flex align-items-center">
            <div class="image-teacher col-md-2">
                <?php 
                if($image){
                    echo '<img src="'.$data_teacher['image'].'">';
                } else{
                    get_image_default($sex); 
                }
                ?>
            </div>
            <div class="infomation-right col-md-10">
                <h2 class="name"><?php echo $name ?></h2>
                <p class="email mt-4"><span>Email: </span><?php echo $email ?></p>
                <p class="date_of_birth"><span>Ngày sinh: </span><?php echo $date ?></p>
                <p class="position"><span>Chức vụ: </span><?php echo $position ?></p>
                <p class="address"><span>Quê quán: </span><?php echo $address ?></p>
            </div>
        </div>
    </div>
    <div class="details-mid pt-4">
        <h3 class="pb-2">Tiểu sử công tác:</h3>
        <p class="description"><?php echo $description ?></p>
    </div>
</div>