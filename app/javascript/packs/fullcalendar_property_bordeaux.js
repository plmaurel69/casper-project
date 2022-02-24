import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import { whenTransitionDone } from 'fullcalendar';


const setCalendarPropertyBordeaux = () => {
  var calendarEl = document.getElementById('calendar-property-bordeaux');
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
        title: 'Tenant leave',
        start: '2022-02-01',
        backgroundColor: '#FD209B',
      },
      {
        title: 'Potential entry',
        start: '2022-02-28',
        backgroundColor: '#FD209B',
      },
      {
        title: 'Clean Flat',
        start: '2022-02-19',
        backgroundColor: '#FD209B',
      },
    ],
  });
  calendar.render();

};
export { setCalendarPropertyBordeaux };
