# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "click", ".link", (ev) ->
	inputxt = "<div id='notice' class='alert alert-warning'>
						<a href='' class='close' data-dismiss='alert'>×</a>
						<textarea class=' form-box form-input' name='d'></textarea>
				</div>"
	$("#intxt").append inputxt

