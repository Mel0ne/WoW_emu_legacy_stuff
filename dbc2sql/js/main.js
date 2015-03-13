function getInfo(i){ // +
	new Ajax.Request('ajax.php',{
		method: 'POST',
		encoding: 'UTF-8',
		parameters: { 
			action: 'getInfo',
			file: files[i]
		},
		onSuccess: function(result){
			$('file_info_'+i+'').update(result.responseText);
			$('ajax_request_'+i+'').update('запись данных...<span id="row_count_'+i+'"></span>');
			$('status_icon_'+i+'').update('<div class="loading"></div>');
			FetchData(i);
		}	
	});
	return;
}

function getRows(i,breaked){ // +
	if(breaked) return;

	new Ajax.Request('ajax.php',{
		method: 'POST',
		encoding: 'UTF-8',
		parameters: { 
			action: 'getRows',
			file: files[i]
		},
		onSuccess: function(result){
			//alert(result.responseText+' записей');
			$('row_count_'+i+'').update(result.responseText+' записей');
			setTimeout('getRows('+i+',false)', 2000);
		}
	});
}

function FetchData(i){ // +
	$('row_count_'+i+'').update('0 записей');

	new Ajax.Request('ajax.php',{
		method: 'POST',
		encoding: 'UTF-8',
		parameters: { 
			action: 'fetchData',
			file: files[i]
		},
		onLoading: function(){
			setTimeout('getRows('+i+',false)', 1000);
		},
		onSuccess: function(result){
			getRows(i,true);
			if(result.responseText == 'OK'){
				$('ajax_request_'+i+'').update('OK');
				$('status_icon_'+i+'').update('<div class="updated"></div>');
				$('file_info_'+i).toggle();
			}else{
				$('ajax_request_'+i+'').update('ошибка: '+result.responseText);
				$('status_icon_'+i+'').update('<div class="conflict"></div>');
			}
			if($('full').checked && i+1 < files.length)
				fetch(i+1);
		}	
	});

}

function truncate(i){ // +
	$('ajax_request_'+i+'').update('удаление данных');
	new Ajax.Request('ajax.php',{
		method: 'POST',
		encoding: 'UTF-8',
		parameters: { 
			action: 'truncate',
			file: files[i]
		},
		onSuccess: function(result){
			if(result.responseText == 'OK'){
				$('status_icon_'+i+'').update('<div class="updated"></div>');
				setTimeout('hide_info('+i+')',500);
			}else
				$('status_icon_'+i+'').update('<div class="conflict"></div>');
			$('ajax_request_'+i+'').update(result.responseText);
			if(i+1 < files.length)
				fetch(i+1);
		}	
	});
}

function support(i){ // +
	$('ajax_request_'+i+'').update('тестирование');
	new Ajax.Request('ajax.php',{
		method: 'POST',
		encoding: 'UTF-8',
		parameters: { 
			action: 'support',
			file: files[i]
		},
		onSuccess: function(result){
			if(result.responseText == 'OK'){
				$('ajax_request_'+i+'').update('OK');
				$('status_icon_'+i+'').update('<div class="updated"></div>');
				setTimeout('hide_info('+i+')',500);
			}else{
				$('ajax_request_'+i+'').update(result.responseText);
				$('status_icon_'+i+'').update('<div class="conflict"></div>');
			}

			if(i+1 < files.length)
				fetch(i+1);
			else
				clean(false);
		}	
	});
}


var key = false;
var i = -1;
function fetch(i){ // +
	
	if(($('full').checked || $('truncate').checked || $('support').checked) && !key){ // +
		i = 0;
		key = true;
	}

	$('info').innerHTML += ''+
	'<span id="file_'+i+'" onClick="$(\'file_info_'+i+'\').toggle();" style=\"cursor: pointer;\">'+
		'<span id="status_icon_'+i+'"></span>'+
		'<span id="file_name_'+i+'">'+files[i]+'</span>...'+
		'<span id="ajax_request_'+i+'"></span><br />'+
		'<span id="file_info_'+i+'"></span>'+
	'</span>';
	$('status_icon_'+i+'').update('<div class="loading"></div>');

	if($('truncate').checked){
		truncate(i);
		return;
	}
	
	if($('support').checked){
		support(i);
		return;
	}

	getInfo(i);

	return;
}

function hide_info(i){
	var hidden = $('hide_correct').checked ? true : false;
	if(hidden) $('file_'+i+'').toggle();
}

function selectFile(fid){
	if(fid == -1){
		$('id').value = '-1' ;
		//$('writeData').disabled = true;
		//$('writeData').checked = false;
		return;
	}

	//$('writeData').disabled = false;
	return;
}

function clean(clean_all){
	i = -1;
	key = false;
	var hidden = $('hide_correct').checked ? true : false;
	selectFile(-1);
	if(clean_all)
		$('info').update('');
	return;
}

document.observe("dom:loaded", function() {
	$('parser').observe('click', function(){
		var new_id = $('id').value;
		if(new_id > -1 || $('full').checked || $('truncate').checked || $('support').checked){
			clean(true);
			fetch(new_id);
		}else{
			alert('не выбрано действие');
			location.reload();
		}
	});
});