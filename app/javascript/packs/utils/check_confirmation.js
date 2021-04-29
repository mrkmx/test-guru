document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.js-password-confirmation')
  if (control) { control.addEventListener('input', checkConfirmation) }
})

const checkConfirmation = () => {
  const password = document.querySelector('.js-password').value
  const passwordConfirm = document.querySelector('.js-password-confirmation').value
  const successIcon = document.querySelector('.octicon-check')
  const failureIcon = document.querySelector('.octicon-x')

  switch (passwordConfirm) {
    case "":
      successIcon.classList.add('hide')
      failureIcon.classList.add('hide')
      break
    case password:
      successIcon.classList.remove('hide')
      failureIcon.classList.add('hide')
      break
    default:
      successIcon.classList.add('hide')
      failureIcon.classList.remove('hide')
  } 
}
