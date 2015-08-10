/*x = 0;
$(document).ready(function(){
    $("div").scroll(function(){
        $("span").text( x+= 1);
    });
    $("button").click(function(){
        $("div").scroll();
    });
});*/

/*---Start DateTimePicker---*/
$(function () {
    $('#attention_dateinc').datetimepicker({
         icons: {
            time: "icon-time",
            date: "icon-calendar",
            up: "icon-caret-up",
            down: "icon-caret-down",
            previous: 'icon-chevron-sign-left',
            next: 'icon-chevron-sign-right'
        }       
    });

    $('#attention_datefin').datetimepicker({
        icons: {
            time: "icon-time",
            date: "icon-calendar",
            up: "icon-caret-up",
            down: "icon-caret-down",
            previous: 'icon-chevron-sign-left',
            next: 'icon-chevron-sign-right'
        },   
        useCurrent: false //Important! See issue #1075
    });


    $("#attention_dateinc").on("dp.change", function (e) {
            $('#attention_datefin').data("DateTimePicker").minDate(e.date);
    });

    $("#attention_datefin").on("dp.change", function (e) {
        $('#attention_dateinc').data("DateTimePicker").maxDate(e.date);
    });

});

/*---End DateTimePicker---*/

/*---Start Data Validations---*/
$(document).ready(function() {
    $('#notEmptyForm').formValidation();
});
/*---End Data Validations---*/

/*---Start Chosen---*/
$(document).ready(function() {
    $('#chosenForm')
        .find('[name="colors"]')
            .chosen({
                width: '100%'
            })
            // Revalidate the color when it is changed
            .change(function(e) {
                $('#chosenForm').formValidation('revalidateField', 'colors');
            })
            .end()
        .formValidation({
            framework: 'bootstrap',
            excluded: ':disabled',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                colors: {
                    validators: {
                        callback: {
                            message: 'Please choose 2-4 color you like most',
                            callback: function(value, validator, $field) {
                                // Get the selected options
                                var options = validator.getFieldElements('colors').val();
                                return (options != null && options.length >= 2 && options.length <= 4);
                            }
                        }
                    }
                }
            }
        });
});
/*---End Chosen---*/
