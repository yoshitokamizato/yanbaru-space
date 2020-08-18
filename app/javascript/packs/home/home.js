document.addEventListener("turbolinks:load", () => {
    const FormElement = document.getElementsByClassName('form-text');
    const BtnElement = document.querySelectorAll(".btn");
    const CardElement = document.getElementsByClassName("card")
    const DeleteElement = document.getElementsByClassName(".form-group p")

    BtnElement.forEach((item, i) => {
        item.addEventListener('click', (e) => {
          console.log(e.target.parentNode.querySelector('.user.card'))
            e.target.parentNode.querySelector('div.form-text').classList.remove('d-none')
            e.target.remove()
        })
    })


})
