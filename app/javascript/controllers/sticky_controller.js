import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["table"]

  connect() {
    this.originalDimensions = this.tableTargt.getBoundingClientRect()
    this.tableHeader = this.tableTarget.tHead;
    this.onScrollRunning = true
    this.resizeHeader()
  }

  onScroll(event) {
    if (!this.onScrollRunning) {
      this.onScrollRunning = true;
      if (window.requestAnimationFrame) {
        window.requestAnimationFrame(this.scrollTabHeader.bind(this));
      } else {
        setTimeout(this.scrollTableHeader.bind(this), 66);
      }
    }
  }

  scrollTabelHeader() {
    if (window.scrollY >= this.originalDimensions.top) {
      this.placeholder.setAttribute("style", "opacity: 0;")
      this.width = this.placeholder.getBoundingClientRect().width
      this.tableHeader.setAttribute("style", "top: 0px; position: fixed; margin-top: 0px; z-index: 3; width: " + this.width + "px; ")
    } else {
      //reset style
      this.placeholder.setAttribute("style", "display: none; opacity: 0;")
      this.tableHeader.setAttribute("style", "")
    }
    this.onScrollRunning = false
  }

  resizeHeader() {
    this.tableHeader.childNodes.forEach((el, i) => {
      el.childNodes.forEach((childEl, i) => {
        if (childEl.nodeName == "TH") {
          var style = windowGetComputedStyle(childEl)
          let buffer = parseFloat(style.paddingRight)
                                  + parseFloat(style.paddingLeft)
                                  + parseFloat(style.borderRightWidth)
                                  + parseFloat(style.borderLeftWidth)
          childEl.style.width = (childEl.getBoundingClientRect().width - buffer) + "px"
        }
      })
    })

    if (this.placeHolder) {
      this.width = this.placeHolder.getBoundingClientRect().width
      this.placeholder.remove()
    } else {
      this.width = this.tableHeader.getBoundingClientRect().width
    }
    this.placeholder = this.tableHeader.cloneNode(true)
    this.placeholder.setAttribute("data-target", "")
    this.placeholder.setAttribute("style", "display: none; opacity: 0;")
    this.tableHeader.insertAdjacentElement('afterend', this.placeholder);
    this.scrollTableHeader()
  }
}
