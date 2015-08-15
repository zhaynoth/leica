# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#submit_contract", (ev, data) ->
	console.log data 
	if data.msaje is 'asigneed'
		contractRow  = "<tr id='#{data.id}'>
							<td>#{data.contract.contract_nombre}</td>
							<td>#{data.project.project_nombre}</td>
							<td>
								<form accept-charset='UTF-8' action='/workers/#{data.id}/contract_remove' 
              					class='btn btn-mini btn-danger' data-confirm='Are you sure?' 
             					data-remote='true' data-type='json' id='delete-contract' method='post'>
									<div style='display:none'>
										<input name='utf8' value='✓' type='hidden'>
										<input name='_method' value='contract_remove' type='hidden'>
										<input name='authenticity_token' value='QdPoCt29m8Yg97KRbJQQRTQaBJCCaZ/t6cwP8fIHkMY=' type='hidden'>
									</div>
	                				<input class='btn btn-mini btn-danger' name='commit' value='Quitar' type='submit'>
              					</form>
							</td>
						</tr>"
		$("#contracts-worker-list").append contractRow
		$("#notice").remove()
	else if data.msaje is 'no-asigneed'
		$("#notice").remove()		
		itemNotice = "<div id='notice' class='alert alert-warning'>
						<a href='' class='close' data-dismiss='alert'>×</a>
			    		<i class='icon-exclamation-sign'></i>
			    		El trabajador ya ha sido asignado a este contrato
					</div>"
		$("#content-notice").append itemNotice		
	

$(document).on "ajax:success", "form#delete-contract", (ev, data) ->
	console.log data
	$("#notice").remove();	
	document.getElementById(data.msaje).remove();


