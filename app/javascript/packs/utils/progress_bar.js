document.addEventListener('turbolinks:load', function() {
  const progress = document.querySelector('.js-test-passage-progress')

  if (progress) {
    const progressValue = progress.dataset.value
    const fillElement = progress.querySelector('.progress-bar')
    fillElement.style.width = `${progressValue}%`
  }
})
