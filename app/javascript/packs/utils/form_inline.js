document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.js-form-inline-link')
  if (!controls.length) return
  
  for (var i = 0; i < controls.length; i++) {
    controls[i].addEventListener('click', formInlineLinkHandler)
  }
  
  const errors = document.querySelector('.js-resource-errors')
  if (!errors) return
  const resourceId = errors.dataset.resourceId
  
  formInlinekHandler(resourceId)

  function formInlineLinkHandler(e) {
    e.preventDefault()
    const testId = this.dataset.testId
    formInlinekHandler(testId)
  }

  function formInlinekHandler(testId) {
    const link = document.querySelector(`.js-form-inline-link[data-test-id="${testId}"]`)
    const testTitle = document.querySelector(`.js-test-title[data-test-id="${testId}"]`)
    const formInline = document.querySelector(`.js-form-inline[data-test-id="${testId}"]`)

    if (formInline.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInline.classList.remove('hide')
      link.textContent = 'Cancel'
    } else {
      testTitle.classList.remove('hide')
      formInline.classList.add('hide')
      link.textContent = 'Edit'
    }
  }
})
