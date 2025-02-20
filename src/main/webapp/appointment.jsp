<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Appointment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .background-image {
            background-image: url('image/nurse-helping-patient.jpg');

            background-size: cover;
            background-position: center;
        }

        .glass-effect {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
    </style>
</head>


<body class="background-image flex items-center justify-center min-h-screen p-4">
<div class="glass-effect p-6 rounded-2xl shadow-2xl w-full max-w-md">
    <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Request Appointment</h2>
    <form>
        <div class="space-y-4">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Name*</label>
                <input type="text" id="name" placeholder="Your Name" required class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>


            <div>
                <label for="phone" class="block text-sm font-medium text-gray-700">Phone*</label>
                <input type="tel" id="phone" placeholder="Your Phone Number" required class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>


            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email*</label>
                <input type="email" id="email" placeholder="Your Email" required class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>


            <div>
                <label for="date" class="block text-sm font-medium text-gray-700">Date*</label>
                <input type="date" id="date" required class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>


            <div>
                <label for="department" class="block text-sm font-medium text-gray-700">Department</label>
                <select id="department" class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
                    <option>Select Department</option>
                    <option>Cardiology</option>
                    <option>Neurology</option>
                    <option>Orthopedics</option>
                </select>
            </div>


            <div>
                <label for="doctor" class="block text-sm font-medium text-gray-700">Doctor</label>
                <select id="doctor" class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
                    <option>Select Doctor</option>
                    <option>Dr. Smith</option>
                    <option>Dr. Johnson</option>
                    <option>Dr. Williams</option>
                </select>
            </div>





            <div class="pt-2">
                <a href="patient-list.jsp" class="w-full block bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium py-2 rounded-lg shadow-lg text-center transition duration-300">
                    Submit
                </a>
            </div>

        </div>
    </form>
</div>
</body>


</html>



