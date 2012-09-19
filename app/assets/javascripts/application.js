// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.draggable
//= require jquery.ui.position
//= require jquery.ui.resizable
//= require jquery.ui.dialog
//= require_tree .
$(function(){
  $('#frmMulti').dialog({autoOpen: false, modal: true});
});

var col = '';

function editMultiple(colName,title){
  var dialog = $('#frmMulti');
  $('#txtMulti').val("");
  $('[name=chkEmps]').each(function(){ this.checked = false; });
  col = colName;
  dialog.dialog({title: "Select multiple employees for " + title + ":"});
  dialog.dialog('open');
}

function doMultiInput(){
  var checked = $('[name=chkEmps]').filter(function(){ return this.checked; });
  var newVal = $('#txtMulti').val();
  var inputs = $('[name*=' + col + ']');
  for(var i = 0; i < checked.length; i++){
    inputs[checked[i].value].value = newVal;
  }
  $('#frmMulti').dialog('close');
}
