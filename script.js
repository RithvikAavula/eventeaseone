// Register and login link toggling
const wrapper = document.querySelector('.wrapper');
const registerLink = document.querySelector('.register-link');
const loginLink = document.querySelector('.login-link');

if (registerLink) {
  registerLink.onclick = () => wrapper.classList.add('active');
}
if (loginLink) {
  loginLink.onclick = () => wrapper.classList.remove('active');
}

// DOM Elements
let usernameRef = document.getElementById("username");
let passwordRef = document.getElementById("password");
let loginBtn = document.querySelector("button");

// Sample credentials
const credentials = {
  admin: { username: "admin", password: "password123" },
  admin2: { username: "admin2", password: "password123" },
  admin3: { username: "admin3", password: "password123" },
  admin4: { username: "admin4", password: "password123" },
  admin5: { username: "admin5", password: "password123" },
  admin6: { username: "admin6", password: "password123" },
  user: { username: "user", password: "user123" }
};

// Function to check login credentials
function loginUser() {
    let enteredUsername = usernameRef.value;
    let enteredPassword = passwordRef.value;
  
    if (enteredUsername === credentials.admin.username && enteredPassword === credentials.admin.password) {
      localStorage.setItem("loggedIn", "true");
      localStorage.setItem("role", "admin"); // Store role
      alert("Admin Login Successful!");
      window.location.href = "admin.html"; // Redirect to admin page
    }
    else if (enteredUsername === credentials.admin2.username && enteredPassword === credentials.admin2.password) {
        localStorage.setItem("loggedIn", "true");
        localStorage.setItem("role", "admin2"); // Store role
        alert("Admin Login Successful!");
        window.location.href = "admin2.html"; // Redirect to admin2 page
      }
      else if (enteredUsername === credentials.admin3.username && enteredPassword === credentials.admin3.password) {
        localStorage.setItem("loggedIn", "true");
        localStorage.setItem("role", "admin3"); // Store role
        alert("Admin Login Successful!");
        window.location.href = "admin3.html"; // Redirect to admin3 page
      }
      else if (enteredUsername === credentials.admin4.username && enteredPassword === credentials.admin4.password) {
        localStorage.setItem("loggedIn", "true");
        localStorage.setItem("role", "admin4"); // Store role
        alert("Admin Login Successful!");
        window.location.href = "admin4.html"; // Redirect to admin4 page
      }
      else if (enteredUsername === credentials.admin5.username && enteredPassword === credentials.admin5.password) {
        localStorage.setItem("loggedIn", "true");
        localStorage.setItem("role", "admin5"); // Store role
        alert("Admin Login Successful!");
        window.location.href = "admin5.html"; // Redirect to admin5 page
      }
      else if (enteredUsername === credentials.admin6.username && enteredPassword === credentials.admin6.password) {
        localStorage.setItem("loggedIn", "true");
        localStorage.setItem("role", "admin6"); // Store role
        alert("Admin Login Successful!");
        window.location.href = "admin6.html"; // Redirect to admin6 page
      }
    else if (enteredUsername === credentials.user.username && enteredPassword === credentials.user.password) {
        localStorage.setItem("loggedIn", "true");
        localStorage.setItem("role", "user"); // Store role
        alert("User Login Successful!");
        window.location.href = "index.html"; // Redirect to user page
      } 
      else {
        alert("Invalid username or password. Please try again.");
      }
}

// Attach login event listener
if (loginBtn) {
  loginBtn.addEventListener("click", (e) => {
    e.preventDefault();
    loginUser();
  });
}

// Logout function
function logoutUser() {
  localStorage.removeItem("loggedIn");
  localStorage.removeItem("role");
  alert("You have been logged out.");
  window.location.href = "login.html";
}

// Check Login Status - Fixing Flickering Issue
function checkLoginStatus() {
    const isLoggedIn = localStorage.getItem("loggedIn");
    const userRole = localStorage.getItem("role");
  
    if (!isLoggedIn && !window.location.href.includes("login.html")) {
      window.location.href = "login.html";
    }
  
    if (isLoggedIn) {
      if (userRole === "admin" && window.location.pathname.includes("index.html")) {
        window.location.href = "admin.html";
      } else if (userRole === "user" && window.location.pathname.includes("admin.html")) {
        window.location.href = "index.html";
      }
    }
  }

// Ensure it runs once on load
window.addEventListener("load", checkLoginStatus);