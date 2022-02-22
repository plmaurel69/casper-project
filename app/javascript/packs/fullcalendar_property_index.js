import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import { whenTransitionDone } from 'fullcalendar';


const setCalendarPropertyIndex = () => {
  var calendarEl = document.getElementById('calendar-property-index');
  var calendar = new Calendar(calendarEl, {
    plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin],

    headerToolbar: {
    },
    themeSystem: 'bootstrap',
    aspectRatio: 5,
    height: 650,
    initialDate: '2022-02-09',
    // navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
      {
        title: 'All Day Event',
        start: '2022-02-02',
        backgroundColor: 'red',

      },
      {
        title: 'Long Event',
        start: '2022-02-07',
        end: '2022-02-10',
        backgroundColor: '#378006',
        borderColor: 'pink',
        textColor: 'white',
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2022-02-10T16:00:00'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2022-14-02',

      },
    ],
  });
  calendar.render();

};
export { setCalendarPropertyIndex };
