// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "fullcalendar"
import "chartkick/chart.js"


Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initChatroomCable } from '../channels/property_contract_channel';


document.addEventListener('turbolinks:load', () => {
  initChatroomCable();
  if (document.getElementById('calendar-property-show') != null) {
    setCalendarPropertyShow();
  }
  else if (document.getElementById('calendar-property-index') != null) {
    setCalendarPropertyIndex();
  }
  else if (document.getElementById('calendar-property-bordeaux') != null) {
    setCalendarPropertyBordeaux();
  }
});

import { setCalendarPropertyIndex } from '../packs/fullcalendar_property_index.js';
import { setCalendarPropertyShow } from '../packs/fullcalendar_property_show.js';
import { setCalendarPropertyBordeaux } from '../packs/fullcalendar_property_bordeaux.js';

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})

import "controllers"
