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
        title: 'Pay Rent Day',
        start: '2022-02-14',
        backgroundColor: '#30D986',
      },
      {
        title: 'Submit Tax',
        start: '2022-03-04',
        backgroundColor: '#30D986',
      },
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
      {
        title: 'Plumber Flat',
        start: '2022-02-02',
        backgroundColor: '#037EFA',
      },
      {
        title: 'Plumber Flat',
        start: '2022-02-07',
        end: '2022-02-10',
        backgroundColor: '#037EFA',
      },
      {
        title: 'Pay Rent Day',
        start: '2022-02-23',
        backgroundColor: '#037EFA',
      },
      {
        title: 'Landlords meeting',
        start: '2022-02-25',
        backgroundColor: '#037EFA',
      },

      {
        title: 'Paintwork',
        start: '2022-03-07',
        end: '2022-03-10',
        backgroundColor: '#037EFA',
      },

      {
        title: 'Pay Rent Day',
        start: '2022-03-23',
        backgroundColor: '#037EFA',
      },
    ],
  });
  calendar.render();

};
export { setCalendarPropertyIndex };
