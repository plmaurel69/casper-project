import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import { whenTransitionDone } from 'fullcalendar';


const setCalendarPropertyShow = () => {
  var calendarEl = document.getElementById('calendar-property-show');
  var calendar = new Calendar(calendarEl, {
    plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin],

    headerToolbar: {
    },
    themeSystem: 'bootstrap',
    aspectRatio: 5,
    height: 650,
    initialDate: '2022-02-09',
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
      {
        title: 'Plumber Flat #1',
        start: '2022-02-02',
        backgroundColor: '#081A51',
        borderColor: '#081A51',
      },
      {
        title: 'Plumber Flat #1',
        start: '2022-02-07',
        end: '2022-02-10',
        backgroundColor: '#081A51',
        borderColor: '#081A51',
      },
      {
        title: 'Pay Rent Day',
        start: '2022-02-23',
        backgroundColor: '#081A51',
        borderColor: '#081A51',
      },
      {
        title: 'Conference Landlords',
        start: '2022-02-25',
        backgroundColor: '#081A51',
        borderColor: '#081A51',
      },

      {
        title: 'Paintwork',
        start: '2022-03-07',
        end: '2022-03-10',
        backgroundColor: '#081A51',
        borderColor: '#081A51',
      },

      {
        title: 'Pay Rent Day',
        start: '2022-03-23',
        backgroundColor: '#081A51',
        borderColor: '#081A51',
      },
    ],
  });
  calendar.render();

};
export { setCalendarPropertyShow };
