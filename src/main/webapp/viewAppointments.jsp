<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Appointments</title>
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
<header class="w-full max-w-2xl mb-4">
    <h1 class="text-2xl font-bold text-center text-gray-800">Your Appointments</h1>
</header>

<!-- Main Content -->
<main class="glass-effect p-6 rounded-lg shadow-lg w-full max-w-2xl">
    <c:choose>
        <c:when test="${empty appointments}">
            <p class="text-center text-gray-600">No appointments found. Book one now!</p>
            <div class="text-center mt-4">
                <a href="/MedicalAppointmentApp/bookAppointment.jsp" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Book an Appointment</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white border border-gray-200">
                    <thead>
                    <tr class="bg-gray-100">
                        <th class="py-2 px-4 border-b">Doctor ID</th>
                        <th class="py-2 px-4 border-b">Date & Time</th>
                        <th class="py-2 px-4 border-b">Reason</th>
                        <th class="py-2 px-4 border-b">Status</th>
                        <th class="py-2 px-4 border-b">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                    <c:forEach var="appointment" items="${appointments}">
                        <tr>
                            <td class="py-2 px-4 border-b text-center">${appointment.doctorId}</td>
                            <td class="py-2 px-4 border-b text-center">${appointment.appointmentDate}</td>
                            <td class="py-2 px-4 border-b text-center">${appointment.reason}</td>
                            <td class="py-2 px-4 border-b text-center">${appointment.status}</td>
                            <td class="py-2 px-4 border-b text-center">
                                <c:if test="${appointment.status != 'Cancelled'}">
                                    <form action="/MedicalAppointmentApp/appointments" method="post" onsubmit="return confirm('Are you sure you want to cancel this appointment?');">
                                        <input type="hidden" name="action" value="cancel">
                                        <input type="hidden" name="appointmentId" value="${appointment.appointmentId}">
                                        <input type="hidden" name="patientId" value="${sessionScope.patientId}">
                                        <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">Cancel</button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<!-- Footer Navigation -->
<footer class="mt-6 flex justify-center space-x-4">
    <a href="/MedicalAppointmentApp/bookAppointment.jsp">
        <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Book Another</button>
    </a>
    <a href="/MedicalAppointmentApp/index.jsp">
        <button type="button" class="bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600">Back to Home</button>
    </a>
</footer>
</body>
</html>