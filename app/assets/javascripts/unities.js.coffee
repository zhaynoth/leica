# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#new_unity", (ev, data) ->
	console.log data 
	equipmentRow  = "<tr id='#{data.id}'>
						<td>#{data.unity}</td>
						<td>#{data.project.project_nombre}</td>
						<td><a class='btn btn-mini btn-danger'
							data-confirm='Are you sure?' 
							data-method='delete' 
							data-remote='true' 
							data-type='json' 
							href='/unities/#{data.id}' 
							rel='nofollow'>Eliminar</a>
						</td>
					</tr>"
	$("#equipment-list").append equipmentRow

$(document).on "ajax:success", "tbody#equipment-list", (ev, data) ->
	console.log data
	document.getElementById(data.id).remove();