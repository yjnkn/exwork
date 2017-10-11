console.clear();

$(function(){
    // 日付入力
    $('.datepick').datetimepicker({
        timepicker: false,
        format: 'Y/m/d'
    });
    // 時間入力
    $('.timepick').datetimepicker({
        datepicker:false,
        format: 'H:i',
        allowTimes:[
            '00:00', '00:30',
            '01:00', '01:30',
            '02:00', '02:30',
            '03:00', '03:30',
            '04:00', '04:30',
            '05:00', '05:30',
            '06:00', '06:30',
            '07:00', '07:30',
            '08:00', '08:30',
            '09:00', '09:30',
            '10:00', '10:30',
            '11:00', '11:30',
        ]
    });
    // ナビゲーション
	$(".head_title").on('click', function(e) {
	    $('#navi').show();
	});
	$("#nav_apply").on('click', function(e) {
	    $('#navi').hide();
	    $('#applyDiv').show();
	    $('#listDiv').hide();
		$(".head_title").text('申請入力');
	});
	$("#nav_list").on('click', function(e) {
	    $('#navi').hide();
	    $('#applyDiv').hide();
	    $('#listDiv').show();
		$(".head_title").text('申請一覧');
	});
	// 実績
	$(".postData").on('click', function(e) {
	    // データ引き継ぎ
        $("#actid").attr('value', $(this).data("id"));
        $("#actDay").attr('value', $(this).children(".workday").text());
        $("#actTime").attr('value', $(this).children(".extime").text());
        $("#actType").val($(this).children(".extype").text());
        // div表示
        $('#actCover').show();
        $('#actModal').show();
	});
	$('.act_cancel').on('click', function(e) {
        $('#actCover').hide();
        $('#actModal').hide();
	});
    // csvダウンロード
    $("#getcsv").on('click', makeCsv);
    function makeCsv(e) {
        var $tabel;
        var $csv = "";
        var cnt;
        cnt = 0;
        $tabel = $("#worklist tr");
        $tabel.each(function() {
            var $row = $(this).children("td");
            if (0 < $row.length) {
                $row.each(function() {
                    $csv += ($(this).text());
                    if (cnt < 4) {
                        $csv += ",";
                        cnt++;
                    } else {
                        cnt = 0;
                        $csv += "\n";
                    }
                });
            }
        });
        var bom = new Uint8Array([0xEF, 0xBB, 0xBF]);
        var blob;
        var url;
        blob = new Blob([bom, $csv], { "type" : "text/csv" });
        url = (window.URL || window.webkitURL).createObjectURL(blob);
        $("#getcsv").attr("href", url);
        $("#getcsv").attr('download', 'exwork.csv');
    }
    
});