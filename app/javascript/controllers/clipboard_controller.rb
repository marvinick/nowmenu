import { Controller } from 'stimulus'

export defaults class extends Controller {

  static targets = ["source"]

  copy(){
    this.sourceTarget.select()
    document.execCommand("copy")
  }
}
