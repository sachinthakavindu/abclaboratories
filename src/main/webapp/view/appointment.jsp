<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .progress-circle {
            width: 40px;
            height: 40px;
            border: 3px solid #ccc;
            /* Border color */
            border-top: 3px solid #a048ff;
            /* Progress color */
            border-radius: 50%;
            /* Make it a circle */
            animation: spin 1s linear infinite;
            /* Animation to rotate */
            display: none;
            /* Initially hide it */
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>


</head>

<body>

    <section class="bg-gray-50 dark:bg-gray-900">
        <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
            <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
                <img class="w-8 h-8 mr-2" src="/img/abclabs_logo_lg.png" alt="logo">
                ABC Laboratories
            </a>
            <div
                class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <h1
                        class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                        Book Appointment
                    </h1>
                    <form id="appointmentForm" class="space-y-4 md:space-y-6" action="#">
                        <!-- Test Type Selector -->
                        <div>
                            <label for="testType"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Test Type</label>
                            <select id="testType" name="testType"
                                class="block w-full px-4 py-2 mt-1 text-sm border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                <option value="">Select</option>
                                <option value="1">Blood Test</option>
                                <option value="2">Urinalysis</option>
                                <option value="3">Cholesterol Test</option>
                                <!-- Add more test types here -->
                            </select>
                        </div>
                        <!-- Appointment Date Selector -->
                        <div>
                            <label for="appointmentDate"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Appointment
                                Date</label>
                            <input type="date" id="appointmentDate" name="appointmentDate"
                                class="block w-full px-4 py-2 mt-1 text-sm border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                required>
                        </div>
                        <!-- Nearest Branch Selector -->
                        <div>
                            <label for="nearestBranch"
                                class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nearest
                                Branch</label>
                            <select id="nearestBranch" name="nearestBranch"
                                class="block w-full px-4 py-2 mt-1 text-sm border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                <option value="">Select</option>
                                <option value="1">Colombo Branch</option>
                                <option value="2">Kandy Branch</option>
                                <option value="3">Galle Branch</option>
                                <option value="4">Jaffna Branch</option>
                                <!-- Add more branches here -->
                            </select>
                        </div>

                        <div class="flex justify-center items-center h-full">
                            <div id="progressCircle" class="progress-circle"></div>
                        </div>
                        <button id="bookAppointmentBtn"
                            class="bg-purple-600 w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Book
                            Appointment</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script>
        const progressCircle = document.getElementById('progressCircle');
        const appointmentForm = document.getElementById('appointmentForm');
        const bookAppointmentBtn = document.getElementById('bookAppointmentBtn');

        bookAppointmentBtn.addEventListener('click', function (event) {
            event.preventDefault();

            const testType = document.getElementById('testType').value;
            const appointmentDate = document.getElementById('appointmentDate').value;
            const nearestBranch = document.getElementById('nearestBranch').value;

            selectedDate = new Date(appointmentDate);
            currentDate = new Date();
            // Set the time components in current date to midnight
            currentDate.setHours(0, 0, 0, 0);

            if (testType == "") {
                alert('Please select a test type.');
            } else if (!appointmentDate) {
                alert('Please select an appointment date.');
            } else if (selectedDate < currentDate) {
                alert("Please select today or a date in the future.")
            } else if (!nearestBranch) {
                alert('Please select the nearest branch.');
            } else {
                // Show progress indicator
                progressCircle.style.display = 'block';

                // If all fields are filled, proceed with the fetch request
                fetch('/appointment', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        testTypeId: testType,
                        date: appointmentDate,
                        branchId: nearestBranch
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        // Hide progress indicator
                        progressCircle.style.display = 'none';

                        // Handle success response
                        console.log(data);
                        alert('Appointment booked successfully!');

                        appointmentForm.reset();
                    })
                    .catch(error => {
                        // Hide progress indicator
                        progressCircle.style.display = 'none';

                        // Handle error response
                        console.error('Error:', error);
                        alert('An error occurred. Please try again later.');
                    });
            }

        });
    </script>
</body>

</html>