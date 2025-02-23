<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .background-image {
            background-image: url('image/doctor-looking-at-clipboard.jpg');
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
<body class="background-image flex flex-col items-center justify-center min-h-screen p-4">
<!-- Header Section -->
<header class="w-full max-w-4xl mb-4 text-center">
    <h1 class="text-3xl font-bold text-gray-800">Doctor Dashboard</h1>
    <p class="text-lg text-gray-700 mt-2">Doctor ID: ${sessionScope.doctorId}</p>
</header>

<!-- Main Content -->
<main class="glass-effect p-6 rounded-lg shadow-lg w-full max-w-4xl">
    <c:choose>
        <c:when test="${empty appointments}">
            <p class="text-center text-gray-600">No upcoming appointments scheduled.</p>
        </c:when>
        <c:otherwise>
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white border border-gray-200">
                    <thead>
                    <tr class="bg-gray-100">
                        <th class="py-2 px-4 border-b">Patient ID</th>
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
                            <td class="py-2 px-4 border-b text-center">${appointment.patientId}</td>
                            <td class="py-2 px-4 border-b text-center">${appointment.appointmentDate}</td>
                            <td class="py-2 px-4 border-b text-center">${appointment.reason}</td>
                            <td class="py-2 px-4 border-b text-center">${appointment.status}</td>
                            <td class="py-2 px-4 border-b text-center flex justify-center space-x-2">
                                <c:if test="${appointment.status != 'Cancelled'}">
                                    <!-- Cancel Form -->
                                    <form action="/medicare/appointments" method="post" onsubmit="return confirm('Are you sure you want to cancel this appointment?');" class="inline">
                                        <input type="hidden" name="action" value="cancel">
                                        <input type="hidden" name="appointmentId" value="${appointment.appointmentId}">
                                        <input type="hidden" name="doctorId" value="${sessionScope.doctorId}">
                                        <button type="submit" class="bg-red-500 text-white px-4 py-1 rounded hover:bg-red-600">Cancel</button>
                                    </form>
                                    <!-- Reschedule Link -->
                                    <a href="/medicare/rescheduleAppointment.jsp?appointmentId=${appointment.appointmentId}" class="bg-yellow-500 text-white px-4 py-1 rounded hover:bg-yellow-600">Reschedule</a>
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
<footer class="mt-6 flex justify-center">
    <a href="/medicare/index.jsp">
        <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Back to Home</button>
    </a>
</footer>
</body>
</html>