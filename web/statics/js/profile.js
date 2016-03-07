

function drawDialog(){

    $(document).ready(function () {

		$('#container').highcharts({
			chart: {
				type: 'area'
			},
			title: {
				text: '資金歷史紀錄'
			},
			subtitle: {
				text: 'Source: <a href="http://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf">' +
					'thebulletin.metapress.com</a>'
			},
			xAxis: {
				allowDecimals: false,
				labels: {
					formatter: function () {
						return this.value; // clean, unformatted number for year
					}
				}
			},
			yAxis: {
				title: {
					text: 'Nuclear weapon states'
				},
				labels: {
					formatter: function () {
						return this.value / 1000 + 'k';
					}
				}
			},
			tooltip: {
				pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
			},
			plotOptions: {
				area: {
					pointStart: 1940,
					marker: {
						enabled: false,
						symbol: 'circle',
						radius: 2,
						states: {
							hover: {
								enabled: true
							}
						}
					}
				}
			},
			series: [{
				name: '我的資金',
				data: [null, null, null, null, null, 6, 11, 32, 110, 235, 369, 640,
					1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
					27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
					26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
					24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
					22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
					10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104]
			}]
		});
	
	
        // Build the chart
        $('#container2').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: '資金分布圖'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                name: '比例',
                colorByPoint: true,
                data: [{
                    name: '利奇',
                    y: 56.33
                }, {
                    name: '永豐金',
                    y: 24.03
                }, {
                    name: '我的庫存',
                    y: 10.38
                }]
            }]
        });
    });
};