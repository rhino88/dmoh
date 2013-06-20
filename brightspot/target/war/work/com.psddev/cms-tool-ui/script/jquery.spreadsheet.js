(function($, win, undef) {

$.plugin2('spreadsheet', {
    '_create': function(table) {
        var $table = $(table),
                inputName = $table.attr('data-input-name'),
                data = [ ],
                $spreadsheet,
                $jsonInput;

        $table.find('tr').each(function() {
            var row = [ ];

            data.push(row);

            $(this).find('td').each(function() {
                row.push($(this).text());
            });
        });

        if (data.length === 0) {
            data.push([ '' ]);
        }

        $spreadsheet = $('<div/>', {
        });

        $jsonInput = $('<input/>', {
            'type': 'hidden',
            'name': inputName + '.json'
        });

        $table.after($spreadsheet);
        $table.after($jsonInput);
        $table.remove();

        $spreadsheet.handsontable({
            'data': data,
            'rowHeaders': true,
            'colHeaders': true,
            'minSpareRows': 1,
            'minSpareCols': 1,
            'fillHandle': false,
            'contextMenu': true,
            'onChange': function() {
                $jsonInput.val(JSON.stringify(data));
            }
        });
    }
});

})(jQuery, window);
