import { Application } from "@hotwired/stimulus"
import ToastController from "controllers/toast_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register("toast", ToastController)

export { application }
