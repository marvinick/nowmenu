import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"];

  launchDemo(event) {
     let modalController = this.application.getControllerForElementAndIdentifier(this.modalTarget, "modal");
     let coHostModalController = this.application.getControllerForElementAndIdentifier(this.modalTarget, "co-host-modal");
     coHostModalController.setCoHostContent(event.currentTarget.dataset);
     modalController.open();
     console.log(event.currentTarget.dataset);
  }
}
