<!DOCTYPE html>
<%@page import="com.kavisoft.web.abclaboratories.model.Branch"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ABC Laboratories</title>

    <!-- Tailwind CSS -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />

    <!-- AOS Library -->
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>

    <script src="https://cdn.tailwindcss.com"></script>

    <style type="text/css">
        .make-appointment-card {
            background-image: url("home.jpg");
            height: 500px;
            width: 100vw;
            background-size: cover;
        }

        .text-appointment-today {
            padding-top: 360px;
        }

        .card-1 {
            height: 100vh;
            background-image: url("img/home1.jpg");
            height: 500px;
            width: 100vw;
            background-size: cover;
        }
        .card-2 {
            height: 100vh;
            background-image: url("img/home2.jpg");
            height: 500px;
            width: 100vw;
            background-size: cover;
        }
        .card-3 {
            height: 100vh;
            background-image: url("img/home3.jpg");
            height: 500px;
            width: 100vw;
            background-size: cover;
        }
        .card-4 {
            height: 300px;
            background: linear-gradient(to bottom right, #8e44ad, #3498db);
        }

        .section {
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
}
    </style>
</head>

<body class="font-sans">

    <section>
    <div class="bg-white">
        <header class="absolute inset-x-0 top-0 z-50">
          <nav class="flex items-center justify-between p-6 lg:px-8" aria-label="Global">
            <div class="flex lg:flex-1">
              <a href="#" class="-m-1.5 p-1.5">
                <div class="row-auto">
                    <div class="col-end-1">
                        <span class="text-sm font-semibold leading-6 text-gray-900">ABC Laboratories</span>                
                    </div>                   
                </div>
              </a>
            </div>
            <div class="flex lg:hidden">
              <button type="button" class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700">
                <span class="sr-only">Open main menu</span>
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                </svg>
              </button>
            </div>
            <div class="hidden lg:flex lg:gap-x-12">
              <a href="#home" class="text-sm font-semibold leading-6 text-gray-900">Home</a>
              <a href="#services" class="text-sm font-semibold leading-6 text-gray-900">Services</a>
              <a href="#branches" class="text-sm font-semibold leading-6 text-gray-900">Branches</a>
              <a href="#contact" class="text-sm font-semibold leading-6 text-gray-900">Contact</a>
            </div>


            <div class="hidden lg:flex lg:flex-1 lg:justify-end">
              <%
              String email=(String) session.getAttribute("email");
              if(email!=null){
            	  
            	  %>
                  <a href="#" class="mr-4 text-sm font-semibold leading-6 text-gray-900"><%= email%></span></a>
                  <a href="#" onclick="signout()" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Signout</a>
                  <%
              }else{
            	  %>
            	                <a href="/user/login" class="text-sm font-semibold leading-6 text-gray-900">Log in <span aria-hidden="true">&rarr;</span></a>            	 
            	  <%
              }
              %>
            </div>
          </nav>
          <!-- Mobile menu, show/hide based on menu open state. -->
          <div class="lg:hidden" role="dialog" aria-modal="true">
            <!-- Background backdrop, show/hide based on slide-over state. -->
            <div class="fixed inset-0 z-50"></div>
            <div class="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
              <div class="flex items-center justify-between">
                <a href="#" class="-m-1.5 p-1.5">
                  <span class="text-sm font-semibold leading-6 text-gray-900">ABC Laboratories</span>                
                </a>
                <button type="button" class="-m-2.5 rounded-md p-2.5 text-gray-700">
                  <span class="sr-only">Close menu</span>
                  <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
              <div class="mt-6 flow-root">
                <div class="-my-6 divide-y divide-gray-500/10">
                  <div class="space-y-2 py-6">
                    <a href="#home" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Home</a>
                    <a href="#services" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Services</a>
                    <a href="#branches" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Branches</a>
                    <a href="#contact" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Contact</a>                
                  </div>
                  <div class="py-6">
                    <a href="/user/login" class="-mx-3 block rounded-lg px-3 py-2.5 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Log in</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
      
        <div class="relative isolate px-6 pt-14 lg:px-8">
          <div class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80" aria-hidden="true">
            <div class="relative left-[calc(50%-11rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-30rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
          </div>
          <div class="mx-auto max-w-2xl py-32 sm:py-48 lg:py-56">
            <!-- <div class="hidden sm:mb-8 sm:flex sm:justify-center">
              <div class="relative rounded-full px-3 py-1 text-sm leading-6 text-gray-600 ring-1 ring-gray-900/10 hover:ring-gray-900/20">
                Announcing our next round of funding. <a href="#" class="font-semibold text-indigo-600"><span class="absolute inset-0" aria-hidden="true"></span>Read more <span aria-hidden="true">&rarr;</span></a>
              </div>
            </div> -->
            <div class="text-center">
              <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">Welcome to ABC Laboratories.</h1>
              <p class="mt-6 text-lg leading-8 text-gray-600">Welcome to ABC Laboratories, your gateway to exceptional healthcare. From booking your appointment to receiving your results, our dedicated team is here to support you every step of the way.</p>
              <div class="mt-10 flex items-center justify-center gap-x-6">
                <a href="/appointment" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Book Appointment</a>
              </div>
            </div>
          </div>
          <div class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]" aria-hidden="true">
            <div class="relative left-[calc(50%+3rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%+36rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)"></div>
          </div>
        </div>
      </div>
    </section>      


    <!-- Services Section -->
    <section id="services" class="section card-1" data-aos="fade-up">
        <div class="container">
            <h2 class="has-text-centered text-2xl mb-4 text-gray- has-text-weight-bold">Our Services</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

                <div class="card bg-gray-200 p-6 rounded-lg">
                    <p class="text-2xl font-bold mb-4">Blood Test</p>
                    <p class="text-gray-700">Comprehensive blood tests to evaluate your overall health status and identify any potential issues.</p>
                </div>
                
                <div class="card bg-gray-200 p-6 rounded-lg">
                    <p class="text-2xl font-bold mb-4">Urinalysis</p>
                    <p class="text-gray-700">Thorough analysis of urine samples to detect abnormalities and assess kidney function, among other health indicators.</p>
                </div>
                
                <div class="card bg-gray-200 p-6 rounded-lg">
                    <p class="text-2xl font-bold mb-4">Cholesterol Test</p>
                    <p class="text-gray-700">Accurate measurement of cholesterol levels to gauge cardiovascular health and identify potential risks of heart disease.</p>
                </div>
                
            </div>
        </div>
    </section>

    <!-- Why Choose ABC Laboratories Section -->
    <section class="section card-2" data-aos="fade-up">
        <div class="container">
    <h2 class="has-text-centered text-2xl mb-4 text-gray- has-text-weight-bold">Why every medical proffesional suggest ABC Laboratories?</h2>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="card bg-white p-6 rounded-lg">
            <p class="text-xl font-bold mb-4">Comprehensive Services</p>
            <p class="text-gray-700">From routine tests to specialized diagnostics, ABC Laboratories offers a wide range of services to meet all your healthcare needs under one roof.</p>
        </div>
        <div class="card bg-white p-6 rounded-lg">
            <p class="text-xl font-bold mb-4">Expert Care</p>
            <p class="text-gray-700">Our team of experienced healthcare professionals is dedicated to providing personalized care and accurate results, ensuring peace of mind for you and your loved ones.</p>
        </div>
        <div class="card bg-white p-6 rounded-lg">
            <p class="text-xl font-bold mb-4">Convenient Solutions</p>
            <p class="text-gray-700">With user-friendly online booking, quick turnaround times, and easy access to reports, ABC Laboratories offers convenient solutions to streamline your healthcare journey.</p>
        </div>
    </div>
</div>

    </section>

    <!-- Branches Section -->
    <section id="branches" class="section card-3" data-aos="fade-up" style="height: max-content;padding: 30px;">
        <div class="container">
            <h2 class="has-text-centered text-2xl mb-4 text-gray- has-text-weight-bold">Island-Wide Excellence: Your Premier Healthcare Choice.</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                 <% // Access the list of appointments from the model
																		List<Branch> branches = (List<Branch>) request.getAttribute("branches");
																			
																			for (Branch branch : branches) {
																			%>
                
                <div>
                    <p class="text-xl font-bold"><%=branch.getCity() %> Branch</p>
                    <p><%=branch.getAddress() %></p>
                </div>
                
                <%} %>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="section card-4" data-aos="fade-up">
        <div class="container" style="color: white;">
            <h2 class="has-text-centered text-2xl mb-4 text-gray- has-text-weight-bold">Get in Touch</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div>
                    <p>For inquiries or appointments, please feel free to reach out to us using the following contact details:</p>
                    <ul>
                        <li>Email: contact@abclabs.com</li>
                        <li>Phone: +94 (0)11 987 6543</li>
                        <li>Address: 456 Wellness Street, Colombo, Sri Lanka</li>
                    </ul>
                    <p>We look forward to assisting you with your healthcare needs with our island-wide professional service.</p>
                </div>
                <div>
                </div>
            </div>
        </div>
    </section>

    <!-- Initialize AOS -->
    <script>
        AOS.init({
            offset: 200, // Adjust the offset as needed
            duration: 800, // Set the duration of the animation
        });


    function signout(){
    // Make a GET request to sign out the user
        fetch('/user/signout', {
            method: 'GET',
            credentials: 'same-origin' // Include cookies in the request if any
        })
        .then(response => response.text())
                .then(data => {
                    if(data=="success"){
                      console.log('Success:', data);
                      alert('Successfully Signed out.', data);
                        window.location.reload();
                    }else{
                        console.log('Signout in Failed:', data);
                        alert('Signout Failed: '+data);
                    }
                })
        .catch(error => {
            console.error('Error:', error);
        });
}
        
    </script>

</body>

</html>
