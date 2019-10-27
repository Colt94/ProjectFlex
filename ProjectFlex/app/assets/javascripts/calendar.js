var initialize_calendar;
initialize_calendar = function() {
    $('.calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({});
    })
};
$(document).on('turbolinks:load', initialize_calendar);

function prepareNewEventForm() {
    $('#eventDetailsForm').trigger('reset');
    $('#eventDetailsFormSection').collapse('show');
}
