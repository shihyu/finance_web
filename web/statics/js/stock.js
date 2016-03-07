
function cal_percent(a,b){
	 s = ((a-b)/b) * 100;
	 return Math.round(s*100)/100;
}

function get_info(sid){
		
	$.ajax({
			url : "/api/getStockInfo", // the endpoint
			data : { sid : sid }, 
			type : "GET", // http method
			success : function(json) {
				$('#stock_symbol').html(json[0].fields.symbol);
				$('#stock_symbolid').html(sid);
				$('#stock_type').html(json[0].fields.type);
			},
			error : function(xhr,errmsg,err) {
				// Show an error
				alertify.logPosition("bottom right");
				alertify.log('Oops! Cannot get the data.');	
			}
		});
};

function get_info_now(sid){
		
	$.ajax({
			url : "/api/getStockInfoNow", // the endpoint
			data : { sid : sid }, 
			type : "GET", // http method
			success : function(json) {
				$('#stock_price').html(json.price);
				if(json.change < 0){
					$('#stock_price').addClass('text-green');
					$('#stock_change').addClass('text-green');
					$('#stock_percent').addClass('text-green');
					$('#stock_change').html("<i class='fa fa-caret-down'></i> " + (json.change)*(-1));
					$('#stock_percent').html( cal_percent(json.price,json.prev_close) +" %");				
				}else if(json.change > 0){
					$('#stock_price').addClass('text-red');
					$('#stock_change').addClass('text-red');
					$('#stock_percent').addClass('text-red');
					$('#stock_change').html("<i class='fa fa-caret-up'></i> " + (json.change));
					$('#stock_percent').html( cal_percent(json.price,json.prev_close) +" %");	
				}else{
					$('#stock_change').html(json.change);
					$('#stock_percent').html( cal_percent(json.price,json.prev_close) +" %");	
				}

			},
			error : function(xhr,errmsg,err) {
				// Show an error
				alertify.logPosition("bottom right");
				alertify.log('Oops! Cannot get the data.');	
			}
		});
};

function get_history(sid){
		
	$.ajax({
			url : "/api/getStockHistory", // the endpoint
			data : { sid : sid }, 
			type : "GET", // http method
			success : function(json) {
					
				var 	ohlc = [],
						volume = [],
						line5 = [],
						line20 = [],
						line60 = [],
						lineK = [],
						lineD = [],
						groupingUnits = [[
							'week',                         // unit name
							[1]                             // allowed multiples
						], [
							'month',
							[1, 2, 3, 4, 6]
						]];
				
				for(i=json.length-1;i>=0;i--){

						ohlc.push([
							parseFloat(Date.parse(json[i].fields.date)), // the date
							parseFloat(json[i].fields.open), // open
							parseFloat(json[i].fields.high), // high
							parseFloat(json[i].fields.low), // low
							parseFloat(json[i].fields.close) // close
						]);
						
						volume.push([
							parseFloat(Date.parse(json[i].fields.date)), // the date
							parseFloat(json[i].fields.volume) // the volume
						]);
						
						lineK.push([Date.parse(json[i].fields.date),
							json[i].fields.k,
						]);
						lineD.push([Date.parse(json[i].fields.date),
							json[i].fields.d,
						]);
						
						var avgNum = 5;
						var sum = 0;
						if(i<json.length-avgNum){
							for(j=1;j<=avgNum;j++)
								sum+=parseFloat(json[i+j].fields.close);
							sum = sum/parseFloat(avgNum);
							line5.push([Date.parse(json[i].fields.date),Math.round(sum*100)/100]);
						}
						avgNum = 20;
						sum = 0;
						if(i<json.length-avgNum){
							for(j=1;j<=avgNum;j++)
								sum+=parseFloat(json[i+j].fields.close);
							sum = sum/parseFloat(avgNum);
							line20.push([Date.parse(json[i].fields.date),Math.round(sum*100)/100]);
						}
						avgNum = 60;
						sum = 0;
						if(i<json.length-avgNum){
							for(j=1;j<=avgNum;j++)
								sum+=parseFloat(json[i+j].fields.close);
							sum = sum/parseFloat(avgNum);
							line60.push([Date.parse(json[i].fields.date),Math.round(sum*100)/100]);
						}
						
				}
				
				// create the chart
				$('#container').highcharts('StockChart', {
					tooltip: {
						positioner: function () {
							return { x: 0, y: 40 };
						},
						shadow: false,
						borderWidth: 0,
						backgroundColor: 'rgba(255,255,255,0.8)',
						useHTML: true,
						formatter: function() {
						  var s = ' ';
						    $.each(this.points, function(i, series) {
							  for (i = 0; i < json.length; i++) {
								if (ohlc[i][0] == series.point.x)
								{
								  s = '開: <span style="font-weight:bold">' + ohlc[i][1] 
									+ '</span> 收: <span style="font-weight:bold">' + ohlc[i][4] 
									+ '</span> 高: <span style="font-weight:bold">' + ohlc[i][2] 
									+ '</span> 低: <span style="font-weight:bold">' + ohlc[i][3]
									+ '</span> 量: <span style="font-weight:bold">' + parseInt(volume[i][1])/1000
									+ '<br></span> 5MA: <span style="font-weight:bold">' + line5[i-5][1]
									+ '</span> 20MA: <span style="font-weight:bold">' + line20[i-20][1]
									+ '</span> 60MA: <span style="font-weight:bold">' + line60[i-60][1]
									+ '</span> K: <span style="font-weight:bold">' + lineK[i][1]
									+ '</span> D: <span style="font-weight:bold">' + lineD[i][1]
									+ '</span>';
								  break;
								}
							  }
							});

							
							date = new Date(this.x);
							s = (date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear() + " " + s ;
						  return s;
						}
						
					},
					legend: {
						enabled: true,
						align: 'left',
						borderColor: 'black',
						y: 0,
						shadow: true
					},
					rangeSelector : {
						allButtonsEnabled: true,
						buttons: [{
							type: 'month',
							count: 3,
							text: '日線',
							dataGrouping: {
								forced: true,
								units: [['day', [1]]]
							}
						}, {
							type: 'year',
							count: 1,
							text: '周線',
							dataGrouping: {
								forced: true,
								units: [['week', [1]]]
							}
						}, {
							type: 'all',
							text: '月線',
							dataGrouping: {
								forced: true,
								units: [['month', [1]]]
							}
						}],
						buttonTheme: {
							width: 60
						},
						selected: 0
					},
					
					colors: ["#f45b5b", "#8085e9", "#8d4654", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
					  "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
					credits: {
						enabled: false
					},
					yAxis: [{
						labels: {
							align: 'right',
							x: -3
						},
						title: {
							text: 'OHLC'
						},
						height: 300,
						lineWidth: 2
					}, {
						labels: {
							align: 'right',
							x: -3
						},
						title: {
							text: 'Volume'
						},
						top: 330,
						height: 60,
						offset: 0,
						lineWidth: 2
					}, {
						title: {
							text: 'KD'
						},
						top: 400,
						height: 150,
						offset: 0,
						lineWidth: 2,
						plotLines: [{
							color: '#008000',
							width: 2,
							value: 80
						},{
							color: '#FF0000',
							width: 2,
							value: 20
						}]
					}],
					
					plotOptions: {
						candlestick: {
								color: 'green',
								upColor: 'red'
							}
					},

					series: [{
						type: 'candlestick',
						name: 'K線',
						data: ohlc,
						dataGrouping: {
							units: groupingUnits
						}
					}, {
						type: 'column',
						name: '成交量',
						data: volume,
						yAxis: 1,
						dataGrouping: {
							units: groupingUnits
						}
					}, {
						type: 'line',
						name: 'K',
						data: lineK,
						yAxis: 2,
						dataGrouping: {
							units: groupingUnits
						}
					}, {
						type: 'line',
						name: 'D',
						data: lineD,
						yAxis: 2,
						dataGrouping: {
							units: groupingUnits
						}
					}
					
					]
				});

				var chart = $('#container').highcharts();
				chart.addSeries({
						name: '5MA',
						data: line5
				});
				chart.addSeries({
						name: '20MA',
						data: line20
				});
				chart.addSeries({
						name: '60MA',
						data: line60
				});
				
				var $button = $('#button');
				$button.click(function () {
					var series = chart.series[3];
					if (series.visible) {
						series.hide();
						$button.html('Show series');
					} else {
						series.show();
						$button.html('Hide series');
					}
				});
	
	
			},
			error : function(xhr,errmsg,err) {
				// Show an error
				alertify.logPosition("bottom right");
				alertify.log('Oops! Cannot get the data.');	
			}
		});

};




	