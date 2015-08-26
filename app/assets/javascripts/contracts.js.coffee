# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#new_contract", (ev, data) ->
	console.log data
	contractRow  = "<tr id='#{data.id}'>
						<td>#{data.nombre}</td>
						<td><a class='btn btn-mini btn-danger' 
								data-confirm='Are you sure?' 
								data-method='delete' 
								data-remote='true' 
								data-type='json' 
								href='/contracts/#{data.id}' 
								rel='nofollow'>Eliminar</a>
						</td>
					</tr>"
	$("#contracts-project-list").append contractRow

$(document).on "ajax:success", "tbody#contracts-project-list", (ev, data) ->
	console.log data
	document.getElementById(data.id).remove();


