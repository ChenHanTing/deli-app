import { Controller } from "stimulus"

export default class extends Controller {
  initialize() {
    /* Data table with client side renderer */
    this.dataTable();
  }

  // dataTable
  dataTable() {
    return $('#users-table').dataTable({ ...dataTableConst });
  }
}