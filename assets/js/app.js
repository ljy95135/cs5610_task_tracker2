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

// TODO: response delete two time blocks and buttons?
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
  console.log("Do delete "+divID);
  $('.follow-button').each( (_, div) => {
    if (divID == $(div).data('div-id')) {
      console.log(div);
      $(div).remove();
    }
  });
}

// TODO: how to get the new time?
function update_time(time_id) {

}

// TODO: set end-time or begin a new time
function start_time(time_id){

}

function init_buttons() {
  if (!$('.delete-button')) {
    return;
  }

  $(".delete-button").click(delete_click);
}

$(init_buttons);
