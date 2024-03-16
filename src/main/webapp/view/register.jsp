<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Registration - ABC Laboratories</title>

    <!-- Tailwind CSS -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"> -->

    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body>

    <!-- Navigation Bar -->
    <nav class="bg-purple-600 p-6" role="navigation" aria-label="main navigation">
        <div class="flex items-center justify-between">
            <a class="text-white text-lg font-semibold" href="#">ABC Laboratories</a>
            <button class="text-white text-lg focus:outline-none lg:hidden" aria-label="menu" aria-expanded="false"
                onclick="toggleMenu()">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7">
                    </path>
                </svg>
            </button>
            <div id="navbarNav" class="hidden lg:flex lg:items-center">
                <a class="text-white hover:text-gray-300 ml-4" href="/">Home</a>
            </div>
        </div>
    </nav>

    <div class="container mx-auto mt-10 px-4 lg:px-0">

        <!-- Patient Registration Form -->
        <div class="bg-gray-100 p-6 rounded-lg">

            <h2 class="text-3xl font-bold text-center mb-8">User Registration</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                <!-- First Name -->
                <div>
                    <label for="firstName" class="block text-gray-700">First Name</label>
                    <input type="text" class="form-input mt-1 w-full" id="firstName" name="firstName" maxlength="45"
                        required>
                </div>

                <!-- Last Name -->
                <div>
                    <label for="lastName" class="block text-gray-700">Last Name</label>
                    <input type="text" class="form-input mt-1 w-full" id="lastName" name="lastName" maxlength="45"
                        required>
                </div>

            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">

                <!-- DOB -->
                <div>
                    <label for="dob" class="block text-gray-700">Date of Birth</label>
                    <input type="date" class="form-input mt-1 w-full" id="dob" name="dob" required>
                </div>

                <!-- Gender -->
                <div>
                    <label for="gender" class="block text-gray-700">Gender</label>
                    <select class="form-select mt-1 w-full" id="gender" name="gender" required>
                        <option value="" selected disabled>Select</option>
                        <option value="1">Male</option>
                        <option value="2">Female</option>
                        <option value="3">Other</option>
                    </select>
                </div>

            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">

                <!-- Address Line 1 -->
                <div>
                    <label for="addressLine1" class="block text-gray-700">Address Line 1</label>
                    <input type="text" class="form-input mt-1 w-full" id="addressLine1" name="addressLine1"
                        maxlength="45" required>
                </div>

                <!-- Address Line 2 -->
                <div>
                    <label for="addressLine2" class="block text-gray-700">Address Line 2</label>
                    <input type="text" class="form-input mt-1 w-full" id="addressLine2" name="addressLine2"
                        maxlength="45" required>
                </div>

            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">

                <!-- Mobile -->
                <div>
                    <label for="mobile" class="block text-gray-700">Mobile</label>
                    <input type="tel" class="form-input mt-1 w-full" id="mobile" name="mobile" maxlength="10"
                        pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number" required>
                </div>



            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
                <!-- Email -->
                <div>
                    <label for="email" class="block text-gray-700">Email</label>
                    <input type="email" class="form-input mt-1 w-full" id="email" name="email" maxlength="45" required>
                </div>
                <!-- password -->
                <div>
                    <label for="password" class="block text-gray-700">Password</label>
                    <input type="password" class="form-input mt-1 w-full" id="password" name="mobile" maxlength="10"
                        pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number" required>
                </div>

            </div>




        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <button onclick="register()" class="bg-purple-600 text-white font-bold py-2 px-4 rounded mt-6 inline-block"
                style="width: 30vw;">Register</button>
        </div>



    </div>

    <!-- JavaScript to toggle mobile menu -->
    <script>
        function toggleMenu() {
            var menu = document.getElementById('navbarNav');
            menu.classList.toggle('hidden');
        }

        function register() {
            // Get form data
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            const dob = document.getElementById('dob').value;
            var gender = document.getElementById('gender').value;
            const mobile = document.getElementById('mobile').value;
            const email = document.getElementById('email').value;
            const addressLine1 = document.getElementById('addressLine1').value;
            const addressLine2 = document.getElementById('addressLine2').value;
            const password = document.getElementById('password').value;

            const selectedDate = new Date(dob);

            if (firstName == "") {
                alert("Please enter your first name.")
            } else if (lastName == "") {
                alert("Please enter your last name.")
            } else if (dob == "") {
                alert("Please enter your Date of Birth.")
            } else if (selectedDate > new Date()) {
                alert("Date of birth cannot be a date in the future.")
            } else if (gender == "") {
                alert("Please select your gender.")
            } else if (mobile == "") {
                alert("Please enter your mobile number.")
            } else if (!/^[0-9]{10}$/.test(mobile)) {
                alert("Please enter a valid 10-digit mobile number.")
            } else if (email == "") {
                alert("Please enter your email address.")
            } else if (!/^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/.test(email)) {
                alert("Please enter a valid email address.")
            } else if (addressLine1 == "") {
                alert("Please enter your address line 1.")
            } else if (addressLine2 == "") {
                alert("Please enter your address line 2.")
            } else if (password == "") {
                alert("Please enter your password.")
            } else {
                if (gender == 1) {
                    gender = "MALE";
                } else if (gender == 2) {
                    gender = "FEMALE"
                } else {
                    gender = "OTHER"
                }

                // Create form data
                const formData = {
                    firstName: firstName,
                    lastName: lastName,
                    mobile: mobile,
                    dob: dob,
                    gender: gender,
                    email: email,
                    addressLine1: addressLine1,
                    addressLine2: addressLine2,
                    password:password
                };

                // Send POST request
                fetch('/user/register', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(formData)
                })
                    .then(response => response.json())
                    .then(data => {
                        if(data.message=="success"){
                            alert("Successfully Registered. Your Patient ID is " + data.id + ".");
                        console.log(data);
                        }else {
                            alert("Registration failed: " + data.message);
                        console.log(data);
                        }
              
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            }
        }
    </script>

</body>

</html>