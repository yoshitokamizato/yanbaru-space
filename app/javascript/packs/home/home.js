const FormElement = document.getElementById('form-text');
const BtnElement = document.querySelectorAll(".btn");
const CardElement = document.getElementsByClassName("card")
const DeleteElement = document.getElementsByClassName(".form-group p")
console.log(DeleteElement);



document.addEventListener("DOMContentLoaded", function(){
  BtnElement.forEach((item, i) => {
    item.addEventListener('click',function(){
        this.remove();
        FormElement.style.display = 'block';
    },false);
  });
},false);
