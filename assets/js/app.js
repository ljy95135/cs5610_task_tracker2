// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";
import $ from "jquery";
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
function delete_click(ev) {
  let btn = $(ev.target);
  let time_id = btn.data('delete-id');

  delete_time(time_id);
}

function start_click(ev){
  let btn = $(ev.target);
}

function update_click(ev) {
  let btn = $(ev.target);
  let time_id = btn.data('update-id');
  let task_id = btn.data('task-id');

  let start_date = $('#input-start-date-'+time_id).val();
  let start_time = $('#input-start-time-'+time_id).val();
  let end_date = $('#input-end-date-'+time_id).val();
  let end_time = $('#input-end-time-'+time_id).val();

  let start = start_date + 'T' + start_time + '.000000';
  let end = end_date + 'T' + end_time + '.000000';

  update_time(time_id, start, end, task_id);
}

function update_time(time_id, startDT, endDT, task_id){
  let time_id_int = parseInt(time_id);

  let text = JSON.stringify({
    id : time_id_int,
    time_block: {
        start: startDT,
        end: endDT
      },
  });

  $.ajax(time_path + "/" + time_id, {
    method: "patch",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => { console.log(resp) },
    error: (resp) => { console.log(resp)},
  });
}

function delete_time(time_id) {
  $.ajax(time_path + "/" + time_id, {
    method: "delete",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: "",
    success: () => { delete_div("div"+time_id) },
  });
}

function delete_div(divID){
  $('.div-time-block').each( (_, div) => {
    if (divID == $(div).data('div-id')) {
      console.log(div);
      $(div).remove();
    }
  });
}


function start_time(time_id){

}

function init_buttons() {
  $(".start-button").click(start_click);
  if ($('.delete-button')) {
    $(".delete-button").click(delete_click);
  }
  if ($('.update-button')) {
    $(".update-button").click(update_click);
  }


}

$(init_buttons);
