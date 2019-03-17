import { Controller } from "stimulus"

const LEAVING_PAGE_MESSAGES = "You have attempted to leave this page. If you have made any changes to the fields without clicking the save button, your changes will be lost. Are you sure you want to exit this page?"

export default class extends Controller {

  formIsChanged(event) {
    this.setChanged("true")
  }

  leavingPage(event) {
    if (this.isFormChanged()) {
      if (event.type == "turbolinks:before-visit") {
        if (!window.confirm(LEAVING_PAGE_MESSAGES)) {
          event.preventDefault()
        }
      } else {
        event.returnValue = LEAVING_PAGE_MESSAGES;
        return event.returnValue;
      }
    }
  }

  allowFormSubmission(event) {
    this.setChanged("false")
  }

  setChanged(changed) {
    this.data.set("changed", changed)
  }

  isFormChanged() {
    return this.data.get("changed") == "true";
  }
}
