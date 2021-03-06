// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap/dist/css/bootstrap'
import 'stylesheets/application'
import 'bootstrap/dist/js/bootstrap'

/* jquery */
var $ = require("jquery")
window.jQuery = $;
window.$ = $;

/* datatables */
require('datatables.net')
require('datatables.net-bs5')
require('datatables.net-bs5/css/dataTables.bootstrap5.min.css')

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
