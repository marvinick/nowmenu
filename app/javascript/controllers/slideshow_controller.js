import { Controller } from "stimulus"

export default class extends Controller {

  static targets = [ "slide" ]

  initialize() {
    // const index = parseInt(this.element.getAttribute("data-slideshow-index"))
    //stimulus API for to work with data atttributes on controller elements
    // const index = parseInt(this.data.get("index"))
    this.showCurrentSlide()
  }

  next() {
    this.index++
  }

  previous() {
    this.index--
  }

  showCurrentSlide() {
    this.slideTargets.forEach((el, i) => {
      el.classList.toggle("slide--current", this.index == i)
    })
  }

  get index() {
    return parseInt(this.data.get("index"))
  }

  set index(value) {
    this.data.set("index", value)
    this.showCurrentSlide()
  }

  // showSlide(index) {
  //   this.index = index
  //   this.slideTargets.forEach((el, i) => {
  //     el.classList.toggle("slide--current", index == i)
  //   })
  // }
}
