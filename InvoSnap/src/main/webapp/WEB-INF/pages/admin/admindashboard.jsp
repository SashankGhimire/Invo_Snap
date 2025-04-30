<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InvoSnap - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admindashboard.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</head>
<body class="bg-gray-100 font-sans flex flex-col min-h-screen">
    <div class="flex flex-1">
        <!-- Sidebar -->
        <div class="w-48 bg-white shadow-md flex flex-col">
            <div class="p-4">
                <h1 class="text-xl font-bold text-blue-600">InvoSnap</h1>
            </div>
            <nav class="flex-1 flex flex-col space-y-2 p-4">
                <a href="${pageContext.request.contextPath}/pages/admindashbord" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Dashboard</a>
                <a href="${pageContext.request.contextPath}/pages/usermanagement" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Users</a>
                <a href="#" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Invoices</a>
                <a href="#" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Reports</a>
                <a href="#" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Settings</a>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="flex-1 p-6 overflow-auto">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Admin Dashboard</h2>
                <div class="flex items-center space-x-3">
                    <span class="text-gray-600">Welcome, Admin</span>
                    <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 transition">Logout</button>
                </div>
            </div>

            <!-- Quick Stats -->
            <div class="flex flex-wrap gap-4 mb-6">
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[200px]">
                    <h3 class="text-base font-medium text-gray-700">Total Users</h3>
                    <p class="text-2xl font-bold text-blue-600">1,234</p>
                    <p class="text-xs text-gray-500">+12% this month</p>
                </div>
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[200px]">
                    <h3 class="text-base font-medium text-gray-700">Active Users</h3>
                    <p class="text-2xl font-bold text-blue-600">987</p>
                    <p class="text-xs text-gray-500">+8% this month</p>
                </div>
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[200px]">
                    <h3 class="text-base font-medium text-gray-700">Subscription Revenue</h3>
                    <p class="text-2xl font-bold text-blue-600">$45,678</p>
                    <p class="text-xs text-gray-500">+15% this month</p>
                </div>
            </div>

            <!-- System Health Metrics -->
            <div class="bg-white p-4 rounded shadow-md mb-6">
                <h3 class="text-base font-medium text-gray-700 mb-3">System Health</h3>
                <div class="flex flex-wrap gap-4">
                    <div class="flex-1 min-w-[150px] p-3 bg-green-100 rounded text-center">
                        <p class="text-sm font-semibold text-gray-700">API Uptime</p>
                        <p class="text-xl font-bold text-green-600">99.9%</p>
                    </div>
                    <div class="flex-1 min-w-[150px] p-3 bg-blue-100 rounded text-center">
                        <p class="text-sm font-semibold text-gray-700">Invoice Processing</p>
                        <p class="text-xl font-bold text-blue-600">1.2s</p>
                    </div>
                    <div class="flex-1 min-w-[150px] p-3 bg-yellow-100 rounded text-center">
                        <p class="text-sm font-semibold text-gray-700">Active Sessions</p>
                        <p class="text-xl font-bold text-yellow-600">245</p>
                    </div>
                </div>
            </div>

            <!-- Graphs -->
            <div class="flex flex-wrap gap-4 mb-6">
                <div class="bg-white p-4 rounded shadow-md flex-1 min-w-[300px]">
                    <h3 class="text-base font-medium text-gray-700 mb-3">Cash Flow</h3>
                    <canvas id="cashFlowChart"></canvas>
                </div>
                <div class="bg-white p-4 rounded shadow-md flex-1 min-w-[300px]">
                    <h3 class="text-base font-medium text-gray-700 mb-3">Profit Trends</h3>
                    <canvas id="profitChart"></canvas>
                </div>
                <div class="bg-white p-4 rounded shadow-md flex-1 min-w-[300px]">
                    <h3 class="text-base font-medium text-gray-700 mb-3">Customer Growth</h3>
                    <canvas id="customerGrowthChart"></canvas>
                </div>
            </div>

            <!-- Pending Approvals -->
            <div class="bg-white p-4 rounded shadow-md mb-6">
                <h3 class="text-base font-medium text-gray-700 mb-3">Pending Approvals</h3>
                <ul class="space-y-3">
                    <li class="flex items-center justify-between p-2 bg-gray-50 rounded hover:bg-gray-100 transition">
                        <div class="flex items-center space-x-3">
                            <div class="bg-yellow-100 p-1.5 rounded-full">
                                <svg class="w-5 h-5 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            </div>
                            <div>
                                <p class="text-gray-700">Invoice #7890 from <span class="font-semibold">Globex Inc</span> awaits approval</p>
                                <p class="text-xs text-gray-500">Due: Apr 30, 2025</p>
                            </div>
                        </div>
                        <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 transition">Review</button>
                    </li>
                    <li class="flex items-center justify-between p-2 bg-gray-50 rounded hover:bg-gray-100 transition">
                        <div class="flex items-center space-x-3">
                            <div class="bg-yellow-100 p-1.5 rounded-full">
                                <svg class="w-5 h-5 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            </div>
                            <div>
                                <p class="text-gray-700">User <span class="font-semibold">Jane Smith</span> requests account upgrade</p>
                                <p class="text-xs text-gray-500">Submitted: Apr 28, 2025</p>
                            </div>
                        </div>
                        <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 transition">Review</button>
                    </li>
                </ul>
            </div>

            <!-- Recent Activities -->
            <div class="bg-white p-4 rounded shadow-md">
                <h3 class="text-base font-medium text-gray-700 mb-3">Recent Activities</h3>
                <ul class="space-y-3">
                    <li class="flex items-center space-x-3 hover:bg-gray-50 p-2 rounded transition">
                        <div class="bg-blue-100 p-1.5 rounded-full">
                            <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        </div>
                        <div>
                            <p class="text-gray-700">New user <span class="font-semibold">John Doe</span> subscribed to Pro plan</p>
                            <p class="text-xs text-gray-500">2 hours ago</p>
                        </div>
                    </li>
                    <li class="flex items-center space-x-3 hover:bg-gray-50 p-2 rounded transition">
                        <div class="bg-blue-100 p-1.5 rounded-full">
                            <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 1.343-3 3s1.343 3 3 3 3-1.343 3-3-1.343-3-3-3zm0-4c-4.418 0-8 3.582-8 8s3.582 8 8 8 8-3.582 8-8-3.582-8-8-8z"></path></svg>
                        </div>
                        <div>
                            <p class="text-gray-700">Invoice #1234 paid by <span class="font-semibold">Acme Corp</span></p>
                            <p class="text-xs text-gray-500">5 hours ago</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Chart.js Scripts -->
    <script>
        // Cash Flow Chart
        const cashFlowCtx = document.getElementById('cashFlowChart').getContext('2d');
        new Chart(cashFlowCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Cash Flow ($)',
                    data: [12000, 19000, 15000, 22000, 18000, 25000],
                    borderColor: '#007BFF',
                    backgroundColor: 'rgba(0, 123, 255, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // Profit Chart
        const profitCtx = document.getElementById('profitChart').getContext('2d');
        new Chart(profitCtx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Profit ($)',
                    data: [5000, 8000, 6000, 10000, 7000, 12000],
                    backgroundColor: '#007BFF',
                    borderColor: '#007BFF',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // Customer Growth Chart
        const customerGrowthCtx = document.getElementById('customerGrowthChart').getContext('2d');
        new Chart(customerGrowthCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'New Customers',
                    data: [50, 75, 60, 90, 80, 110],
                    borderColor: '#28A745',
                    backgroundColor: 'rgba(40, 167, 69, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>