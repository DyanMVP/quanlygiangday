jQuery(document).ready(function ($) {
  "use strict";
  var pushNotify = function(){
    let isLoaded = true;
    const history = window.localStorage.getItem('qlgd_notify');
    if(history){
      const timeClick =  Math.floor(parseInt(history) / 1000);
      const dateNow = Math.floor(Date.now() / 1000);
      console.log('ateNow===', dateNow);
      if(dateNow - timeClick < 6*60*60){   //6 hour 
        isLoaded = false;
        return
      }
      isLoaded = true;
      window.localStorage.removeItem('qlgd_notify');
      return;
    }
    if(!isLoaded){
      return;
    }
    $.ajax({
      url: custom_ajax.ajax_url, // WordPress AJAX handler URL
      type: "post",
      data: {
          action: "push_notify_lesson",
      },
      success: function (response) {
        if(!response){
          return;
        }
        let html = ''; 
        html += `<div class="position-fixed d-flex align-items-center justify-content-between" style="color: #fff; width: 330px; right: 10px; z-index: 99999; padding: 10px 20px; margin-bottom: 10px; background: #213fd5 !important; top: 60px;">`;
        html += `<p style="font-size:14px; margin: 0">Các tiết dạy của bạn trong hôm nay</p>`;
        html += `<svg xmlns="http://www.w3.org/2000/svg" class="close-notify" width="25px" height="25px" viewBox="0 0 24 24" fill="none">
        <g id="Menu / Close_SM">
        <path id="Vector" d="M16 16L12 12M12 12L8 8M12 12L16 8M12 12L8 16" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </g>
        </svg>`;
        html += `</div>`;
        html += `<div class="hidden-notify position-fixed" style="color: #FFF; right: 10px; z-index: 99999; padding: 5px 20px; margin-bottom: 10px; background: #b13339; text-align: right; font-size: 11px; cursor: pointer; top: 15px; border-radius: 20px;">Không hiển thị lại lần sau</div>`;
  
        html += `<div class="item-notify position-relative" style="margin-top:120px">`;
        html += response;
        html += '</div>';

        $("#notify-lesson").append(html);
        $("#notify-lesson").css('opacity', '1');
        $("#notify-lesson").css('visibility', 'visible');
      },
  });
  }

  $(document).on('click', '.close-notify', function(){
    $("#notify-lesson").remove();
  })
  $(document).on('click', '.hidden-notify', function(){
    const time = new Date().getTime();
    window.localStorage.setItem('qlgd_notify', `${time}`);
    $("#notify-lesson").remove();
  })
  pushNotify();
})