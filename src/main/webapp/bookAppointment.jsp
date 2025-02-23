<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment</title>
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
<!-- Centered Content -->
<div class="glass-effect p-6 rounded-2xl shadow-2xl w-full max-w-md text-center">
    <h2 class="text-2xl font-bold text-gray-800 mb-6">Request Appointment</h2>
    <form action="/MedicalAppointmentApp/AppointmentServlet" method="post">
        <input type="hidden" name="action" value="book">
        <div class="space-y-4">
            <div>
                <label for="patientId" class="block text-sm font-medium text-gray-700 text-left">Patient ID*</label>
                <input type="number" id="patientId" name="patientId" value="${sessionScope.patientId}" required
                       class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2" readonly>
            </div>
            <div>
                <label for="doctorId" class="block text-sm font-medium text-gray-700 text-left">Doctor ID*</label>
                <input type="number" id="doctorId" name="doctorId" placeholder="Enter Doctor ID" required
                       class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>
            <div>
                <label for="appointmentDate" class="block text-sm font-medium text-gray-700 text-left">Date & Time*</label>
                <input type="datetime-local" id="appointmentDate" name="appointmentDate" required
                       class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>
            <div>
                <label for="reason" class="block text-sm font-medium text-gray-700 text-left">Reason for Visit*</label>
                <input type="text" id="reason" name="reason" placeholder="e.g., Checkup" required
                       class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 text-sm p-2">
            </div>
            <div class="pt-4">
                <button type="submit"
                        class="w-full bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium py-2 rounded-lg shadow-lg transition duration-300">
                    Submit
                </button>
            </div>
        </div>
    </form>
</div>
</body>
</html>