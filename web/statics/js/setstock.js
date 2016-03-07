

function del_stock(id){
	
	$.ajax({
		url : "/api/user/delStock/", // the endpoint
		type : "POST", // http method
		data : { 
			id: id
		}, // data sent with the post request
		// handle a successful response
		success : function(json) {
			
			alertify.logPosition("bottom right");
			if(json.error)
				alertify.error(json.error);
			else{
				alertify.success(json.result);
				get_stock();
			}
		},
		// handle a non-successful response
		error : function(xhr,errmsg,err) {
			alertify.logPosition("bottom right");
			alertify.log('Oops! We have encountered an error: '+errmsg);	
			console.log(xhr.status + ": " + xhr.responseText);
		}
	});
	
}

//get stock
function get_stock(){
	$.ajax({
			url : "/api/user/getStock", // the endpoint
			type : "GET", // http method
			success : function(json) {
				
				var sin = 0, sout = 0, s = "";
				
				var shead = "\
							<table class='table table-striped'>\
								<tr>\
								  <th style='width: 20px'>#</th>\
								  <th>類別</th>\
								  <th>股票代碼</th>\
								  <th>數量</th>\
								  <th>價金</th>\
								  <th>手續費</th>\
								  <th>交易稅</th>\
								  <th>淨付額</th>\
								  <th>淨收額</th>\
								  <th>日期</th>\
								  <th>刪除</th>\
								</tr>\
							";
							
				for(i=0;i<json.length;i++){
					
					var t;
					if(json[i].fields.type==1)
						t="買進";
					else if(json[i].fields.type==2)
						t="賣出";
					else
						t="股利";
					
					sin = sin + json[i].fields.fin;
					sout = sout +  json[i].fields.fout;
					
					s = s + "\
								<tr>\
								    <td style='width: 20px'>"+(i+1)+"</td>\
									<td>"+t+"</td>\
								    <td>"+json[i].fields.symbolid+"</td>\
								    <td>"+json[i].fields.num+"</td>\
								    <td>"+json[i].fields.price+"</td>\
								    <td>"+json[i].fields.hand+"</td>\
									<td>"+json[i].fields.tax+"</td>\
									<td>"+json[i].fields.fout+"</td>\
									<td>"+json[i].fields.fin+"</td>\
								    <td>"+json[i].fields.date+"</td>\
									<td><a onclick='del_stock("+json[i].fields.id+");' class='btn btn-danger btn-xs'>刪除</a></td>\
								</tr>";
				}
				
				s = "\
					<tr>\
						<td style='width: 20px'> </td>\
						<td>小計</td>\
						<td></td>\
						<td></td>\
						<td></td>\
						<td></td>\
						<td></td>\
						<td>"+sout+"</td>\
						<td>"+sin+"</td>\
						<td></td>\
					</tr>" + s;
				
				
				
				$('#mystock').html(shead + s +"</table>");
				
			},
			error : function(xhr,errmsg,err) {
				// Show an error
				alertify.logPosition("bottom right");
				alertify.log('Oops! Cannot get the data.');	
			}
		});
}

//tab
 $(function(){
	  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  var activeTab = $(e.target).text(); 
	  $('#toptop').html(activeTab);
   });
});

$('#post-form1').on('submit', function(event){
	event.preventDefault();
	create_stock(1);
});
$('#post-form2').on('submit', function(event){
	event.preventDefault();
	create_stock(2);
});
$('#post-form3').on('submit', function(event){
	event.preventDefault();
	create_stock(3);
});

function create_stock(type) {
	
	$.ajax({
		url : "/api/user/setStock/", // the endpoint
		type : "POST", // http method
		data : { 
		
			type: type,
			symbolid : $('#symbolid'+type).val(),
			num : $('#num'+type).val(),
			price : $('#price'+type).val(),
			date : $('#datepicker'+type).val(),
		
		}, // data sent with the post request

		// handle a successful response
		success : function(json) {
			
			alertify.logPosition("bottom right");
			if(json.error)
				alertify.error(json.error);
			else{
				$('#post-text').val(''); // remove the value from the input
				alertify.success(json.result);
				get_stock();
			}
		},
		// handle a non-successful response
		error : function(xhr,errmsg,err) {
			alertify.logPosition("bottom right");
			alertify.log('Oops! We have encountered an error: '+errmsg);	
			console.log(xhr.status + ": " + xhr.responseText);
		}
	});
};