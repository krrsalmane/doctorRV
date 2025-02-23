<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Appointment</title>
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
<!-- Header Section -->
<header class="w-full max-w-2xl mb-4 text-center">
    <h1 class="text-2xl font-bold text-gray-800">Cancel Appointment</h1>
</header>

<!-- Main Content -->
<main class="glass-effect p-6 rounded-lg shadow-lg w-full max-w-2xl">
    <c:choose>
        <c:when test="${empty appointment}">
            <p class="text-center text-gray-600">No appointment found to cancel.</p>
            <div class="text-center mt-4">
                <a href="/MedicalAppointmentApp/index.jsp" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Back to Home</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-gray-700 mb-6">
                <p><strong>Appointment ID:</strong> ${appointment.appointmentId}</p>
                <p><strong>Patient ID:</strong> ${appointment.patientId}</p>
                <p><strong>Doctor ID:</strong> ${appointment.doctorId}</p>
                <p><strong>Date & Time:</strong> ${appointment.appointmentDate}</p>
                <p><strong>Reason:</strong> ${appointment.reason}</p>
                <p><strong>Status:</strong> ${appointment.status}</p>
            </div>
            <c:if test="${appointment.status != 'Cancelled'}">
                <form action="/MedicalAppointmentApp/appointments" method="post" onsubmit="return confirm('Are you sure you want to cancel this appointment?');">
                    <input type="hidden" name="action" value="cancel">
                    <input type="hidden" name="appointmentId" value="${appointment.appointmentId}">
                    <!-- Include user context based on role -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.patientId}">
                            <input type="hidden" name="patientId" value="${sessionScope.patientId}">
                        </c:when>
                        <c:when test="${not empty sessionScope.doctorId}">
                            <input type="hidden" name="doctorId" value="${sessionScope.doctorId}">
                        </c:when>
                    </c:choose>
                    <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 w-full">Confirm Cancellation</button>
                </form>
            </c:if>
            <c:if test="${appointment.status == 'Cancelled'}">
                <p class="text-center text-red-600">This appointment has already been cancelled.</p>
            </c:if>
        </c:otherwise>
    </c:choose>
</main>

<!-- Footer Navigation -->
<footer class="mt-6 flex justify-center space-x-4">
    <c:choose>
        <c:when test="${not empty sessionScope.patientId}">
            <a href="/MedicalAppointmentApp/viewAppointments.jsp">
                <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Back to Appointments</button>
            </a>
        </c:when>
        <c:when test="${not empty sessionScope.doctorId}">
            <a href="/MedicalAppointmentApp/doctorDashboard.jsp">
                <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Back to Dashboard</button>
            </a>
        </c:when>
        <c:otherwise>
            <a href="/MedicalAppointmentApp/index.jsp">
                <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Back to Home</button>
            </a>
        </c:otherwise>
    </c:choose>
</footer>
</body>
</html>