<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InvoSnap - User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/usermanagement.css">
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
                <a href="${pageContext.request.contextPath}admindashboard" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Dashboard</a>
                <a href="${pageContext.request.contextPath}/users" class="py-2 px-4 bg-blue-600 text-white rounded">Users</a>
                <a href="${pageContext.request.contextPath}/admin/invoices" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Invoices</a>
                <a href="${pageContext.request.contextPath}/admin/reports" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Reports</a>
                <a href="${pageContext.request.contextPath}/admin/settings" class="py-2 px-4 text-gray-700 hover:bg-blue-600 hover:text-white rounded">Settings</a>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="flex-1 p-6 overflow-auto">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">User Management</h2>
                <div class="flex items-center space-x-3">
                    <span class="text-gray-600">Welcome, Admin</span>
                    <button class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-700 transition">Logout</button>
                </div>
            </div>

            <!-- User Stats -->
            <div class="flex flex-wrap gap-4 mb-6">
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[150px]">
                    <h3 class="text-base font-medium text-gray-700">Total Users</h3>
                    <p class="text-2xl font-bold text-blue-600">1,234</p>
                    <p class="text-xs text-gray-500">+10% this month</p>
                </div>
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[150px]">
                    <h3 class="text-base font-medium text-gray-700">Active Users</h3>
                    <p class="text-2xl font-bold text-green-600">987</p>
                    <p class="text-xs text-gray-500">+5% this month</p>
                </div>
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[150px]">
                    <h3 class="text-base font-medium text-gray-700">Free Users</h3>
                    <p class="text-2xl font-bold text-yellow-600">778</p>
                    <p class="text-xs text-gray-500">+8% this month</p>
                </div>
                <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition flex-1 min-w-[150px]">
                    <h3 class="text-base font-medium text-gray-700">Pro Plan Users</h3>
                    <p class="text-2xl font-bold text-purple-600">456</p>
                    <p class="text-xs text-gray-500">+12% this month</p>
                </div>
            </div>

            <!-- User Activity Trend -->
            <div class="bg-white p-4 rounded shadow-md mb-6">
                <h3 class="text-base font-medium text-gray-700 mb-3">User Activity Trend</h3>
                <div class="w-full">
                    <canvas id="userActivityChart" class="chart-canvas"></canvas>
                </div>
            </div>

            <!-- Search and Filters -->
            <div class="bg-white p-4 rounded shadow-md mb-6">
                <div class="flex flex-wrap gap-4 items-center">
                    <div class="flex-1 min-w-[200px]">
                        <input type="text" placeholder="Search by name or email" class="w-full p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                    </div>
                    <div class="flex gap-2">
                        <select class="p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                            <option value="">All Status</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                        <select class="p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                            <option value="">All Roles</option>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                        <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition" onclick="document.getElementById('addUserModal').classList.remove('hidden')">Add User</button>
                    </div>
                </div>
            </div>

            <!-- User Table -->
            <div class="bg-white p-4 rounded shadow-md overflow-x-auto">
                <div class="flex items-center mb-4">
                    <input type="checkbox" id="selectAll" class="mr-2">
                    <label for="selectAll" class="text-sm text-gray-700">Select All</label>
                    <button class="ml-4 bg-green-600 text-white px-3 py-1 rounded hover:bg-green-700 transition disabled:opacity-50" disabled>Bulk Activate</button>
                    <button class="ml-2 bg-red-600 text-white px-3 py-1 rounded hover:bg-red-700 transition disabled:opacity-50" disabled>Bulk Deactivate</button>
                </div>
                <table class="w-full text-left">
                    <thead>
                        <tr class="bg-gray-50">
                            <th class="p-3 text-sm font-semibold text-gray-700"><input type="checkbox"></th>
                            <th class="p-3 text-sm font-semibold text-gray-700 cursor-pointer hover:text-blue-600">Name</th>
                            <th class="p-3 text-sm font-semibold text-gray-700 cursor-pointer hover:text-blue-600">Email</th>
                            <th class="p-3 text-sm font-semibold text-gray-700 cursor-pointer hover:text-blue-600">Status</th>
                            <th class="p-3 text-sm font-semibold text-gray-700 cursor-pointer hover:text-blue-600">Role</th>
                            <th class="p-3 text-sm font-semibold text-gray-700 cursor-pointer hover:text-blue-600">Last Login</th>
                            <th class="p-3 text-sm font-semibold text-gray-700 cursor-pointer hover:text-blue-600">Plan</th>
                            <th class="p-3 text-sm font-semibold text-gray-700">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="border-t hover:bg-gray-50 transition">
                            <td class="p-3"><input type="checkbox"></td>
                            <td class="p-3 text-gray-700">John Doe</td>
                            <td class="p-3 text-gray-700">john.doe@example.com</td>
                            <td class="p-3"><span class="bg-green-100 text-green-600 px-2 py-1 rounded text-xs">Active</span></td>
                            <td class="p-3 text-gray-700">User</td>
                            <td class="p-3 text-gray-700">Apr 28, 2025</td>
                            <td class="p-3 text-gray-700">Pro</td>
                            <td class="p-3 flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 012.828 0L19 4.586 15.414 8.172a2 2 0 01-2.828 0L11 5.414z"></path></svg>
                                </button>
                                <button class="text-red-600 hover:text-red-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-t hover:bg-gray-50 transition">
                            <td class="p-3"><input type="checkbox"></td>
                            <td class="p-3 text-gray-700">Jane Smith</td>
                            <td class="p-3 text-gray-700">jane.smith@example.com</td>
                            <td class="p-3"><span class="bg-red-100 text-red-600 px-2 py-1 rounded text-xs">Inactive</span></td>
                            <td class="p-3 text-gray-700">Admin</td>
                            <td class="p-3 text-gray-700">Apr 27, 2025</td>
                            <td class="p-3 text-gray-700">Basic</td>
                            <td class="p-3 flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 012.828 0L19 4.586 15.414 8.172a2 2 0 01-2.828 0L11 5.414z"></path></svg>
                                </button>
                                <button class="text-red-600 hover:text-red-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-t hover:bg-gray-50 transition">
                            <td class="p-3"><input type="checkbox"></td>
                            <td class="p-3 text-gray-700">Alice Johnson</td>
                            <td class="p-3 text-gray-700">alice.johnson@example.com</td>
                            <td class="p-3"><span class="bg-green-100 text-green-600 px-2 py-1 rounded text-xs">Active</span></td>
                            <td class="p-3 text-gray-700">User</td>
                            <td class="p-3 text-gray-700">Apr 26, 2025</td>
                            <td class="p-3 text-gray-700">Free</td>
                            <td class="p-3 flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 012.828 0L19 4.586 15.414 8.172a2 2 0 01-2.828 0L11 5.414z"></path></svg>
                                </button>
                                <button class="text-red-600 hover:text-red-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-t hover:bg-gray-50 transition">
                            <td class="p-3"><input type="checkbox"></td>
                            <td class="p-3 text-gray-700">Bob Williams</td>
                            <td class="p-3 text-gray-700">bob.williams@example.com</td>
                            <td class="p-3"><span class="bg-green-100 text-green-600 px-2 py-1 rounded text-xs">Active</span></td>
                            <td class="p-3 text-gray-700">User</td>
                            <td class="p-3 text-gray-700">Apr 25, 2025</td>
                            <td class="p-3 text-gray-700">Pro</td>
                            <td class="p-3 flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 012.828 0L19 4.586 15.414 8.172a2 2 0 01-2.828 0L11 5.414z"></path></svg>
                                </button>
                                <button class="text-red-600 hover:text-red-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </td>
                        </tr>
                        <tr class="border-t hover:bg-gray-50 transition">
                            <td class="p-3"><input type="checkbox"></td>
                            <td class="p-3 text-gray-700">Carol Brown</td>
                            <td class="p-3 text-gray-700">carol.brown@example.com</td>
                            <td class="p-3"><span class="bg-red-100 text-red-600 px-2 py-1 rounded text-xs">Inactive</span></td>
                            <td class="p-3 text-gray-700">User</td>
                            <td class="p-3 text-gray-700">Apr 24, 2025</td>
                            <td class="p-3 text-gray-700">Free</td>
                            <td class="p-3 flex space-x-2">
                                <button class="text-blue-600 hover:text-blue-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 012.828 0L19 4.586 15.414 8.172a2 2 0 01-2.828 0L11 5.414z"></path></svg>
                                </button>
                                <button class="text-red-600 hover:text-red-700">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Add User Modal -->
            <div id="addUserModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
                <div class="bg-white p-6 rounded shadow-lg w-full max-w-md">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Add New User</h3>
                    <div class="flex flex-col space-y-4">
                        <input type="text" placeholder="Full Name" class="p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ri
ng-blue-600">
                        <input type="email" placeholder="Email Address" class="p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                        <select class="p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                        </select>
                        <select class="p-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                            <option value="free">Free Plan</option>
                            <option value="pro">Pro Plan</option>
                        </select>
                        <div class="flex justify-end space-x-2">
                            <button class="bg-gray-600 text-white px-4 py-2 rounded hover:bg-gray-700 transition" onclick="document.getElementById('addUserModal').classList.add('hidden')">Cancel</button>
                            <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">Add User</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Chart.js Script -->
    <script>
        // User Activity Chart
        const userActivityCtx = document.getElementById('userActivityChart').getContext('2d');
        new Chart(userActivityCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'User Logins',
                    data: [300, 450, 400, 600, 550, 700],
                    borderColor: '#007BFF',
                    backgroundColor: 'rgba(0, 123, 255, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            font: {
                                size: 10
                            }
                        }
                    },
                    x: {
                        ticks: {
                            font: {
                                size: 10
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        labels: {
                            font: {
                                size: 10
                            }
                        }
                    }
                }
            }
        });

        // Select All Checkbox Logic
        const selectAll = document.getElementById('selectAll');
        const checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
        const bulkActivate = document.querySelector('button.bg-green-600');
        const bulkDeactivate = document.querySelector('button.bg-red-600');

        selectAll.addEventListener('change', () => {
            checkboxes.forEach(checkbox => checkbox.checked = selectAll.checked);
            toggleBulkButtons();
        });

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', toggleBulkButtons);
        });

        function toggleBulkButtons() {
            const anyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
            bulkActivate.disabled = !anyChecked;
            bulkDeactivate.disabled = !anyChecked;
        }
    </script>
</body>
</html>