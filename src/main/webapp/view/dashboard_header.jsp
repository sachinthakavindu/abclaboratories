<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Dashboard</title>

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
<!-- <header class="absolute inset-x-0 top-0 z-50"> -->
    <header class="fixed inset-x-0 top-0 z-50 bg-white shadow-lg">
    <nav class="flex items-center justify-between p-6 lg:px-8" aria-label="Global">
      <div class="flex lg:flex-1">
        <a href="#" class="-m-1.5 p-1.5">
          <div class="row-auto">
              <div class="col-end-1">
                  <span class="text-sm font-semibold leading-6 text-gray-900">Admin Dashboard</span>                
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
        <a href="/admin/dashboard" class="text-sm font-semibold leading-6 text-gray-900">Appointments</a>
        <a href="/admin/patients" class="text-sm font-semibold leading-6 text-gray-900">Patients</a>
        <a href="/admin/branches" class="text-sm font-semibold leading-6 text-gray-900">Branches</a>
        <a href="/admin/doctors" class="text-sm font-semibold leading-6 text-gray-900">Doctors</a>
        <a href="/admin/technicians" class="text-sm font-semibold leading-6 text-gray-900">Technicians</a>
      </div>


      <div class="hidden lg:flex lg:flex-1 lg:justify-end">
        <%
        String username=(String) session.getAttribute("username");
        if(username!=null){
            
            %>
            <a href="#" class="mr-4 text-sm font-semibold leading-6 text-gray-900"><%= username%></a>
            <a href="#" onclick="signout()" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Signout</a>
            <%
        }else{
            %>
    		response.sendRedirect("/admin/login");
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
              <a href="/admin/dashboard" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Appointments</a>
              <a href="/admin/patients" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Patients</a>
              <a href="/admin/branches" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Branches</a>
              <a href="/admin/doctors" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Doctors</a>
              <a href="/admin/technicians" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Technicians</a>
            </div>
            <div class="py-6">
 <%       
        if(username!=null){
            
            %>
            <a href="#" class="text-sm font-semibold leading-6 text-gray-900"><%= username%><span aria-hidden="true">&rarr;</span></a>
            <a href="#" onclick="signout()" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Signout</a>
            <%
        }
            %>            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  
  <script>
        // Fetch request to log out
        function logout() {
            fetch('/admin/signout', {
                method: 'GET',
                credentials: 'same-origin',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                if(data=="success"){
                    console.log('Successfully Logged out.', data);
                    alert('Successfully Logged out.', data);

                    window.location.reload();

                }else{
                    alert('Logout failed', data);
                }                
                
            })
            .catch(error => {
                console.error('Error during logout:', error);
            });
        }

        document.getElementById('logoutButton').addEventListener('click', logout);
    </script>

</body>

</html>