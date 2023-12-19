<?php
$id_lop = $_GET['student'];
$name_class = get_data_table_by_id($id_lop, 'classes',  'ten_lop');
$ho = array('Tạ', 'Trần', 'Đỗ', 'Nguyễn', 'Phan', 'Trịnh', 'Lưu', 'Hoàng', 'Phạm');
$dem = array('Văn', 'Minh', 'Thị', 'Tuấn', 'Kim', 'Ngọc');
$ten = array('Ánh', 'Quân', 'Linh', 'Hưng', 'Hùng', 'Chung', 'Dũng', 'Hường', 'Tú', 'Mạnh', 'Lê', 'Tùng');
$address = array('Hà Nội', 'Thái Bình', 'Nam Định', 'Hà Nam', 'Vĩnh Phúc', 'Hải Phòng', 'Hải Dương', 'Tuyên Quang', 'Phú Thọ', 'Lai Châu', 'Điện Biên');
?>
<div class="container">
<h2 class="mb-5 mt-4 text-center">Danh sách sinh viên lớp <?php echo $name_class ?></h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>STT</th>
                <th>Họ và Tên</th>
                <th>Mã Sinh Viên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <?php
            for ($i = 1; $i <= 50; $i++) {
                $name = $ho[rand(0, 8)]. ' ' .$dem[rand(0, 5)]. ' ' .$ten[rand(0, 11)];
                echo "<tr>";
                echo "<td>$i</td>";
                echo "<td>".$name."</td>";
                echo "<td>" . substr($name_class, 0, 6) . rand(10000, 99999) . "</td>";
                echo "<td>" . rand(1, 30).'/'. rand(1, 12).'/' . rand(1992, 2005). "</td>";
                echo "<td>".$address[rand(0, 10)]."</td>";
                echo "<td>". strtolower(locdautiengviet(str_replace(' ', '', $name)).rand(1000, 9999).'@gmail.com')."</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>
<?php 
function locdautiengviet($str){
    $str = strtolower($str); //chuyển chữ hoa thành chữ thường
    $unicode = array(
    'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
    'd'=>'đ',
    'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
    'i'=>'í|ì|ỉ|ĩ|ị',
    'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
    'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
    'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
    'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
    'D'=>'Đ',
    'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
    'I'=>'Í|Ì|Ỉ|Ĩ|Ị',
    'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
    'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
     'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
     );
     foreach($unicode as $nonUnicode=>$uni){
            $str = preg_replace("/($uni)/i", $nonUnicode, $str);
     }
     $str = str_replace(' ','',$str);
     return $str;
}
?>