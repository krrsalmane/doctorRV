<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .background-image {
            background-image: url('image/doctors-medical-gear.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .glass-effect {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
    </style>
</head>

<body class="background-image flex flex-col items-center justify-center min-h-screen p-4">

<div class="glass-effect p-6 rounded-lg shadow-lg w-full max-w-2xl">
    <h1 class="text-2xl font-bold text-center mb-6 text-gray-800"> Your Appointment </h1>

    <div class="overflow-x-auto">
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
            <tr class="bg-gray-100">
                <th class="py-2 px-4 border-b">Patient Name</th>
                <th class="py-2 px-4 border-b">Date</th>
                <th class="py-2 px-4 border-b">Actions</th>
            </tr>
            </thead>
            <tbody>
            <!-- Example row -->
            <tr>
                <td class="py-2 px-4 border-b text-center">John Doe</td>
                <td class="py-2 px-4 border-b text-center">2025-02-20</td>
                <td class="py-2 px-4 border-b text-center">
                    <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">Cancel</button>
                </td>
            </tr>
            <!-- More rows can go here -->
            </tbody>
        </table>
    </div>
</div>

<footer class="mt-4">
    <a href="log-in.jsp" class="inline-block">
        <button type="button" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">Back</button>
    </a>
</footer>
</body>

</html>
