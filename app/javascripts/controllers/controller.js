import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timer"]

  connect() {
    this.time = 25 * 60
    this.updateDisplay()
    this.interval = null
  }

  start() {
    if (this.interval) return
    this.interval = setInterval(() => { 
      this.time -= 1
      this.updateDisplay()
      if (this.time <= 0) this.stop()
    }, 1000)
  }

  stop() {
    clearInterval(this.interval)
    this.interval = null
    alert("Pomodoro finalizado!")
  }

  updateDisplay() {
    const minutes = Math.floor(this.time / 60)
    const seconds = this.time % 60
    this.timerTarget.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`
  }
}
