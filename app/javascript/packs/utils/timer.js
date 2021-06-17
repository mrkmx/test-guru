document.addEventListener("turbolinks:load", function () {
  const timer = document.querySelector(".js-timer")
  if (!timer) return

  let testTime = timer.dataset.timeLeft
  const timeElem = document.querySelector(".js-time")
  const pageURL = window.location.href

  function runTimer() {
    setInterval(() => {
      let minutes = parseInt(testTime / 60, 10)
      let seconds = parseInt(testTime % 60, 10)

      // add leading zero
      minutes = minutes < 10 ? `0${minutes}` : minutes
      seconds = seconds < 10 ? `0${seconds}` : seconds

      timeElem.textContent = `${minutes}:${seconds}`

      if (--testTime < 0) {
        window.location.href = `${pageURL}/result`
      }
    }, 1000)
  }

  runTimer()
});
