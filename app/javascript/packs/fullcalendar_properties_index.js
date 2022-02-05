import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import { whenTransitionDone } from 'fullcalendar';


const setCalendarPropertiesIndex = () => {
  var calendarEl = document.getElementById('calendar-properties-index');
  var calendar = new Calendar(calendarEl, {
    plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin],

    headerToolbar: {
      left: 'prev,next',
      center: 'title',
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
        start: '2022-02-09T16:00:00'
      },
      {
        groupId: 999,
        title: 'Repeating Event',
        start: '2022-14-02',

      },
      {
        title: 'Conference',
        start: '2022-02-15',
        end: '2022-02-09T16:00:00'
      },
      {
        title: 'Meeting',
        start: '2018-01-12T10:30:00',
        end: '2018-01-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2018-01-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2018-01-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2018-01-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2018-01-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2018-01-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2018-01-28',
      }
    ],
  });
  calendar.render();

};
export { setCalendarPropertiesIndex };
