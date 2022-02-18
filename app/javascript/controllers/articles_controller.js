import { Controller } from "stimulus";
import { dataTableConst } from "@/constant/datatable";

export default class extends Controller {
  initialize() {
    /* Data table with client side renderer */
    // this.dataTable();
  }

  // dataTable
  dataTable() {
    return $("#articles-table").DataTable({ ...dataTableConst });
  }

  // disconnect() {
  //   this.dataTable().clear()
  // }
}
