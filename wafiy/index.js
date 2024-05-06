form.addEventListener("submit", (e) => {
  e.preventDefault();

  validateInputs();
});

//explain what the function setError do
//When we validate, the input and get error, they will pass the input and message to this function, then this fuction
//will turn the box form to red and
//display the message, if the user has got correct before and they make change and error, it will change the green to red and display the message
const setError = (element, message) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(".error");

  errorDisplay.innerText = message;
  inputControl.classList.add("error");
  inputControl.classList.remove("success");
};
//explain what the function setSuccess do
//When we validate, the input is right, they will pass the input to this function, then this function will change the box form to green.
//If the user put wrong input before and change it to the right input, this function will remove the red display and message and display the box form in green
const setSuccess = (element) => {
  //Error 3:no bracket
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(".error");

  errorDisplay.innerText = "";
  inputControl.classList.add("success");
  inputControl.classList.remove("error");
};
//what example of error will trigger isValidEmail, list the error(s)
//1. no @ in the input
//2. before @ no text
//3. no domain after @ like gmail/iium
//4. no . and after . only one letter or no text
//5 eg: w@gmail.e,@gmail.edu,@gmail.edu,wagmail.com,wa@gmail,wafi131415
const isValidEmail = (email) => {
  const re =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
};

const validateInputs = () => {
  const usernameValue = document.getElementById("username").value.trim();
  const emailValue = document.getElementById("email").value.trim(); //Error 4 & 5: Not declare the elements from HTML
  const passwordValue = document.getElementById("password").value.trim();
  const password2Value = document.getElementById("password2").value.trim();

  if (usernameValue === "") {
    //set the errormessages
    setError(username, "this field must not be blank");
  } else if (usernameValue.length < 4) {
    setError(username, "username must have more than 4 characters "); //Error 2: No semicolon
  } else {
    setSuccess(username);
  }

  if (emailValue === "") {
    setError(email, "this field must not be blank");
  } else if (!isValidEmail(emailValue)) {
    setError(email, "email must be in appropriate format");
  } else {
    setSuccess(email);
  }

  if (passwordValue === "") {
    setError(password, "this field must not be blank");
  } else if (passwordValue.length < 8) {
    setError(password, "password must have more than 8 characters"); //Error 1:no semicolon
  } else {
    setSuccess(password);
  }

  if (password2Value === "") {
    setError(password2, "this field must not be blank");
  } else if (password2Value !== passwordValue) {
    setError(password2, "password not same"); //Error:double quote
  } else {
    setSuccess(password2);
  }
};
