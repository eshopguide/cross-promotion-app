import { registerPolarisControllers } from "polaris-view-components"

import { Application } from "@hotwired/stimulus"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

registerPolarisControllers(Stimulus)
