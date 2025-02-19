<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .background-image {
            background-image: url('doctor-looking-at-clipboard.jpg');
            background-size: cover;
            background-position: center;
        }

        .glass-effect {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
    </style>
</head>

<body class="background-image flex items-center justify-center min-h-screen p-4">

<div class="glass-effect p-6 rounded-lg shadow-lg w-full max-w-4xl text-center">
    <h1 class="text-3xl font-bold mb-4 text-gray-800">Doctor Dashboard</h1>
    <p class="text-lg text-gray-700 mb-4">Dr. John Smith - Cardiology Department</p>

    <div class="overflow-x-auto mt-4">
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
            <tr class="bg-gray-100">
                <th class="py-2 px-4 border-b">Patient Name</th>
                <th class="py-2 px-4 border-b">Date</th>
                <th class="py-2 px-4 border-b">Time</th>
                <th class="py-2 px-4 border-b">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="py-2 px-4 border-b">Jane Doe</td>
                <td class="py-2 px-4 border-b">2025-02-22</td>
                <td class="py-2 px-4 border-b">11:00 AM</td>
                <td class="py-2 px-4 border-b">
                    <button class="bg-red-500 text-white px-4 py-1 rounded hover:bg-red-600">Cancel</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <footer class="mt-6">
        <a href="log-in.jsp">
            <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Back</button>
        </a>
    </footer>
</div>

</body>

</html>
