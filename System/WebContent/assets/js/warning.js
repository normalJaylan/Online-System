$.ajax({
	type:"get",
	url:"askWarning.jsp?name="+name,
	success : function(data){
		console.log(data);
		var warning = JSON.parse(data);
		var warning_td = "";
		for(var i in warning){
			warning_td +=   "<tr>\
								<td scope=\"col\">"+warning[i]["name"]+"</td>\
								<td scope=\"col\">"+warning[i]["age"]+"</td>\
								<td scope=\"col\">"+warning[i]["sex"]+"</td>\
								<td scope=\"col\">"+warning[i]["profession"]+"</td>\
								<td scope=\"col\">"+warning[i]["phone"]+"</td>\
								<td scope=\"col\">"+warning[i]["table"]+"</td>\
								<td scope=\"col\">"+warning[i]["record"]+"</td>\
							</tr>"
		}
		$("#hor-minimalist-client tbody").append(warning_td);
	}
});
