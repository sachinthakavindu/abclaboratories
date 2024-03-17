<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - ABC Laboratories</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gradient-to-tr from-[#8DFAFB] to-[#FC964E] h-screen justify-center items-center">
    <div class="w-full mt-36 flex justify-center items-center">
        <h1 class="title text-5xl">ABC Laboratories</h1>
    </div>

    <div class="w-full flex justify-center items-center mt-10">
        <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 flex flex-col w-80">
            <h1 class="title font-bold text-2xl mb-4">Admin Login</h1>
            <div class="mb-6">
                <label for="username" class="block text-gray-700 text-sm font-bold mb-2">Username:</label>
                <input id="username" type="text" placeholder="Enter your username"
                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                <p id="usernameError" class="text-red-500 text-xs italic hidden">Please enter your username.</p>
            </div>
            <div class="mb-6">
                <label for="password" class="block text-gray-700 text-sm font-bold mb-2">Password:</label>
                <input id="password" type="password" placeholder="Enter your password"
                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
                <p id="passwordError" class="text-red-500 text-xs italic hidden">Please enter your password.</p>
            </div>
            <button id="loginButton"
                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Login</button>
        </div>
    </div>


    <script>
        document.getElementById('loginButton').addEventListener('click', function () {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();

            if (!username) {
                document.getElementById('usernameError').classList.remove('hidden');
            } else {
                document.getElementById('usernameError').classList.add('hidden');
            }

            if (!password) {
                document.getElementById('passwordError').classList.remove('hidden');
            } else {
                document.getElementById('passwordError').classList.add('hidden');
            }

            if (username && password) {
                // Perform fetch request
                fetch('/admin/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        username: username,
                        password: password
                    })
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        return response.text();
                    })
                    .then(data => {
                        if (data == "success") {
                            window.location.href = "/admin/dashboard";
                        } else {
                            alert("Login Failed: "+ data);
                            console.log(data);
                        }
                    })
                    .catch(error => {
                        // Handle error response
                        console.error('Error:', error);
                        alert('An error occurred. Please try again later.');
                    });
            }
        });
    </script>
</body>

</html>