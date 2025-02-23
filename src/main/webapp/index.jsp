<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log-in</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .background-image {
            background-image: url('https://images.unsplash.com/photo-1576091160399-112ba8d25d1d');
            background-size: cover;
            background-position: center;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 8s ease-out;
        }
    </style>
</head>
<body class="background-image flex flex-col items-center justify-center h-screen text-center px-4">
<!-- Animated Quote -->
<h1 class="text-3xl md:text-4xl font-bold text-blue-500 mb-6 fade-in">
    "Medicine Cures Diseases, But Only Doctors Can Cure Patients."
</h1>

<!-- Glass Login Form -->
<div class="glass-effect p-6 rounded-lg shadow-lg w-full max-w-sm">
    <h2 class="text-xl font-semibold mb-4 text-gray-800">Login</h2>
    <form action="/medicare/AppointmentServlet" method="post">
        <div class="mb-4">
            <label for="role" class="block text-gray-700 text-sm font-medium mb-1">Select Role</label>
            <select id="role" name="role" class="w-full border rounded py-2 px-3 text-gray-700 text-sm leading-tight focus:outline-none focus:shadow-outline" required>
                <option value="">Choose your role</option>
                <option value="doctor">Doctor</option>
                <option value="patient">Patient</option>
            </select>
        </div>
        <div class="mb-4">
            <label for="username" class="block text-gray-700 text-sm font-medium mb-1">Username</label>
            <input id="username" name="username" type="text" placeholder="Enter your username" required
                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 text-sm leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div class="mb-4">
            <label for="email" class="block text-gray-700 text-sm font-medium mb-1">Email</label>
            <input id="email" name="email" type="email" placeholder="Enter your email" required
                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 text-sm leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div class="mb-4">
            <label for="password" class="block text-gray-700 text-sm font-medium mb-1">Password</label>
            <input id="password" name="password" type="password" placeholder="Enter your password" required
                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 text-sm leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div>
            <button type="submit"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded focus:outline-none focus:shadow-outline text-sm w-full">
                Login
            </button>
        </div>
    </form>
</div>
</body>
</html>