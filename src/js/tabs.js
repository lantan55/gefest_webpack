import '@popperjs/core'
import { Tab } from 'bootstrap'

const triggerTabList = [].slice.call(document.querySelectorAll('#pills-tab a'))
triggerTabList.forEach(function (triggerEl) {
  const tabTrigger = new Tab(triggerEl)

  triggerEl.addEventListener('click', function (event) {
    event.preventDefault()
    tabTrigger.show()
  })
})