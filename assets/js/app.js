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

function start_click(ev) {
  let btn = $(ev.target);
  let task_id = btn.data('task-id');
  let start = btn.data('start-item')

  if (start == "") {
    // make a start at btn.data-start-item
    let date = new Date();
    // 2018-02-27T00:04:57.887Z
    let x = new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString();
    x = x.slice(0, -4);
    x = x + '000000'; // 018-02-27T00:04:57.000000
    $(btn).text("end");
    $(btn).data('start-item', x);
    $(btn).attr("data-start-item", x);
  }
  else {
    let d = new Date();
    let end = d.toISOString(); // 2018-02-27T00:04:57.887Z
    end = end.slice(0, -4);
    end = end + '000000'; // 018-02-27T00:04:57.000000
    // $("#div-blocks-task-16")
    let div_id = '#div-blocks-task-' + task_id;
    insert_time(start, end, task_id, div_id);
    $(btn).text("start");
    $(btn).attr("data-start-item", "");
  }
}

function insert_time(start, end, task_id, div_id) {
  // need to add something in this task (in my task)
  let text = JSON.stringify({
    time_block: {
      task_id: task_id,
      start: start,
      end: end
    },
  });

  $.ajax(time_path, {
    method: "post",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => {
      // Add to the time block block div
      // resp.data:
      // { start: "2018-02-27T00:28:36.000000", id: 10, end: "2018-02-27T00:28:41.000000" }
      // $("#div-blocks-task-16") div_id == "#div-blocks-task-16"
      let start_date = resp.data.start.slice(0, 10);
      let start_time = resp.data.start.slice(11, 20);
      let end_date = resp.data.end.slice(0, 10);
      let end_time = resp.data.end.slice(11, 20);
      let time_block_id = resp.data.id;

      let myDiv = $(div_id);
      let newTimeBlock = '<p>New Time Block Added!</p>' +
        '<p>start: '+ start_date + ' ' + start_time + '</p>' +
        '<p>end: '+ end_date + ' ' + end_time + '</p>';

      myDiv.append(newTimeBlock);
    },
    error: (resp) => {
      console.log("No!")
    },
  });
}

function update_click(ev) {
  let btn = $(ev.target);
  let time_id = btn.data('update-id');
  let task_id = btn.data('task-id');

  let start_date = $('#input-start-date-' + time_id).val();
  let start_time = $('#input-start-time-' + time_id).val();
  let end_date = $('#input-end-date-' + time_id).val();
  let end_time = $('#input-end-time-' + time_id).val();

  let start = start_date + 'T' + start_time + '.000000';
  let end = end_date + 'T' + end_time + '.000000';

  update_time(time_id, start, end, task_id);
}

function update_time(time_id, startDT, endDT, task_id) {
  let time_id_int = parseInt(time_id);

  let text = JSON.stringify({
    id: time_id_int,
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
    success: (resp) => {
      console.log(resp)
    },
    error: (resp) => {
      console.log(resp)
    },
  });
}

function delete_time(time_id) {
  $.ajax(time_path + "/" + time_id, {
    method: "delete",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: "",
    success: () => {
      delete_div("div" + time_id)
    },
  });
}

function delete_div(divID) {
  $('.div-time-block').each((_, div) => {
    if (divID == $(div).data('div-id')) {
      $(div).remove();
    }
  });
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
