<%-- 
    Document   : login
    Created on : Sep 23, 2024, 11:02:51 PM
    Author     : khucx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="CSS/style.css" />
        <link rel="stylesheet" href="./index.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@600&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Avenir:wght@400&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    </head>
    <body>
        <div class="login">
            <div class="login-child">
            </div>
            <a href="landing.jsp" class="login-item bg-white flex hover:bg-slate-200 duration-200">
                <svg class="ml-[14px] mt-[14px]" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M4 12H20" stroke="black" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round"/>
                <path d="M11.0325 4.33936L4.45961 10.9122C4.31606 11.0546 4.20206 11.224 4.12432 11.4108C4.04646 11.5975 4.00641 11.7977 4.00641 12C4.00641 12.2023 4.04646 12.4025 4.12432 12.5892C4.20206 12.776 4.31606 12.9454 4.45961 13.0877L11.0325 19.6606" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <div class="back m-auto">Return</div>
            </a>
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/ISP392/LoginGoogleHandler&response_type=code&client_id=908761159429-oj4kmle09u34799p1mdell9jbi8hq89f.apps.googleusercontent.com&approval_prompt=force" class="social-media-signuploginvari hover:bg-slate-50 duration-200">
                <div class="social-media-logo-parent">
                    <svg class="mb-1" width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M22.501 12.7332C22.501 11.8699 22.4296 11.2399 22.2748 10.5865H12.2153V14.4832H18.12C18.001 15.4515 17.3582 16.9099 15.9296 17.8898L15.9096 18.0203L19.0902 20.435L19.3106 20.4565C21.3343 18.6249 22.501 15.9298 22.501 12.7332Z" fill="#4285F4"/>
                    <path d="M12.214 23.0001C15.1068 23.0001 17.5353 22.0667 19.3092 20.4567L15.9282 17.89C15.0235 18.5083 13.8092 18.94 12.214 18.94C9.38069 18.94 6.97596 17.1083 6.11874 14.5767L5.99309 14.5871L2.68583 17.0955L2.64258 17.2133C4.40446 20.6433 8.0235 23.0001 12.214 23.0001Z" fill="#34A853"/>
                    <path d="M6.12046 14.5767C5.89428 13.9234 5.76337 13.2233 5.76337 12.5C5.76337 11.7767 5.89428 11.0767 6.10856 10.4234L6.10257 10.2842L2.75386 7.7356L2.64429 7.78667C1.91814 9.21002 1.50146 10.8084 1.50146 12.5C1.50146 14.1917 1.91814 15.79 2.64429 17.2133L6.12046 14.5767Z" fill="#FBBC05"/>
                    <path d="M12.2141 6.05997C14.2259 6.05997 15.583 6.91163 16.3569 7.62335L19.3807 4.73C17.5236 3.03834 15.1069 2 12.2141 2C8.02353 2 4.40447 4.35665 2.64258 7.78662L6.10686 10.4233C6.97598 7.89166 9.38073 6.05997 12.2141 6.05997Z" fill="#EB4335"/>
                    </svg>

                    <div class="continue-with-google">Continue with Google</div>
                </div>
            </a>
            <div class="text-field">
                <form action="LoginController" method="post" class="">
                    <div class="property-1generic-text-field">
                        <div class="label-parent">
                            <div class="label">Username</div>
                        </div>
                        <input class="pl-2 text-field1" type="text" name="username">
                        <img class="icons" alt="" src="Icons.svg">
                        <div class="error-message hidden">Error message</div>
                    </div>
                    <div class="property-1phone-number">
                        <div class="continue-with-google">Password</div>
                        <div class="">
                            <input class="pl-2 text-field2" type="password" name="password">
                        </div>
                    </div>
                    <a href="" class="property-1have-an-account-log">
                        <div class="forgot-password hover:underline">Forgot password?</div>
                    </a>                   
                    <button type="submit" class="border-2 bg-[#4294d8] w-[138px] h-[40px] absolute mt-[248px] ml-[149px] rounded-xl text-white text-center leading-[36px] hover:bg-white hover:text-[#4294d8] duration-200 cursor-pointer">
                        Login
                    </button>
                </form>
            </div>        
            <div class="absolute top-40 left-[830px] text-red-500 font-thin" id="errormessage">${sessionScope.loginfail}</div>
            <div class="university-academic-portal">University Academic Portal</div>
        </div>

    </body>
    <script>
        window.onload = function () {
            if (performance.navigation.type === 1) {  // If it's a page reload
                document.getElementById("errormessage").innerHTML = "";  // Clear the message
            }
        }
    </script>
</html>
