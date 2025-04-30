<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoices - InvoSnap</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</head>
<body>
    <% 
        String username = (String) session.getAttribute("username");
        session.setAttribute("userName", username != null ? username : "Guest");
    %>
    <jsp:include page="header.jsp" />

    <% 
        String msg = (String) request.getAttribute("msg");
        String msgType = (String) request.getAttribute("msgType");
        if (msg != null) {
    %>
        <div class="message <%= msgType %>" role="alert"><%= msg %></div>
    <% } %>

    <div class="dashboard-container">
        <!-- Summary Cards -->
        <div class="summary-cards">
            <div class="card" aria-label="Total Invoices">
                <i class="fas fa-file-invoice"></i>
                <h3>Total Invoices</h3>
                <p><%= request.getAttribute("totalInvoices") != null ? request.getAttribute("totalInvoices") : "120" %></p>
            </div>
            <div class="card" aria-label="Paid Invoices">
                <i class="fas fa-check-circle"></i>
                <h3>Paid Invoices</h3>
                <p><%= request.getAttribute("paidInvoices") != null ? request.getAttribute("paidInvoices") : "80" %></p>
            </div>
            <div class="card" aria-label="Unpaid Invoices">
                <i class="fas fa-exclamation-circle"></i>
                <h3>Unpaid Invoices</h3>
                <p><%= request.getAttribute("unpaidInvoices") != null ? request.getAttribute("unpaidInvoices") : "30" %></p>
            </div>
            <div class="card" aria-label="Total Expenses">
                <i class="fas fa-dollar-sign"></i>
                <h3>Total Expenses</h3>
                <p>$<%= request.getAttribute("totalExpenses") != null ? request.getAttribute("totalExpenses") : "4500" %></p>
            </div>
        </div>

        <!-- Invoice Section -->
        <div class="invoice-section">
            <div class="invoice-header">
                <h2>Invoices</h2>
                <div class="invoice-controls">
                    <input type="text" id="searchInvoice" placeholder="Search by client..." aria-label="Search invoices">
                    <select id="statusFilter" aria-label="Filter by status">
                        <option value="all">All</option>
                        <option value="Paid">Paid</option>
                        <option value="Unpaid">Unpaid</option>
                        <option value="Overdue">Overdue</option>
                    </select>
                    <button class="add-invoice-btn" onclick="openAddInvoiceModal()">
                        <i class="fas fa-plus"></i> Add Invoice
                    </button>
                    <button class="export-btn" onclick="exportToCSV()">
                        <i class="fas fa-download"></i> Export CSV
                    </button>
                </div>
            </div>
            <div class="bulk-actions">
                <input type="checkbox" id="selectAll" aria-label="Select all invoices">
                <button class="bulk-btn" onclick="bulkMarkAsPaid()">Mark as Paid</button>
                <button class="bulk-btn delete" onclick="bulkDelete()">Delete Selected</button>
            </div>
            <table class="invoice-table" aria-label="Invoice list">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="headerCheckbox" aria-label="Select all invoices"></th>
                        <th data-label="Invoice ID">Invoice ID</th>
                        <th data-label="Client">Client</th>
                        <th class="sortable" data-sort="amount" data-label="Amount">Amount <i class="fas fa-sort"></i></th>
                        <th data-label="Status">Status</th>
                        <th class="sortable" data-sort="dueDate" data-label="Due Date">Due Date <i class="fas fa-sort"></i></th>
                        <th data-label="Tags">Tags</th>
                        <th data-label="Actions">Actions</th>
                    </tr>
                </thead>
                <tbody id="invoiceTableBody">
                    <tr>
                        <td><input type="checkbox" class="invoice-checkbox" value="INV001"></td>
                        <td>INV001</td>
                        <td>Acme Corp</td>
                        <td>$1500</td>
                        <td>
                            <select class="status-toggle" onchange="updateStatus('INV001', this.value)">
                                <option value="Paid" selected>Paid</option>
                                <option value="Unpaid">Unpaid</option>
                                <option value="Overdue">Overdue</option>
                            </select>
                        </td>
                        <td>2025-03-15</td>
                        <td><span class="tag urgent">Urgent</span></td>
                        <td>
                            <div class="action-group">
                                <button class="action-btn" onclick="previewInvoice('INV001')" aria-label="Preview invoice INV001" title="Preview"><i class="fas fa-eye"></i></button>
                                <button class="action-btn" onclick="editInvoice('INV001')" aria-label="Edit invoice INV001" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" onclick="sendReminder('INV001')" aria-label="Send reminder for invoice INV001" title="Send Reminder"><i class="fas fa-envelope"></i></button>
                                <button class="action-btn delete" onclick="deleteInvoice('INV001')" aria-label="Delete invoice INV001" title="Delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="invoice-checkbox" value="INV002"></td>
                        <td>INV002</td>
                        <td>Globex Inc</td>
                        <td>$3200</td>
                        <td>
                            <select class="status-toggle" onchange="updateStatus('INV002', this.value)">
                                <option value="Paid">Paid</option>
                                <option value="Unpaid" selected>Unpaid</option>
                                <option value="Overdue">Overdue</option>
                            </select>
                        </td>
                        <td>2025-04-10</td>
                        <td><span class="tag recurring">Recurring</span></td>
                        <td>
                            <div class="action-group">
                                <button class="action-btn" onclick="previewInvoice('INV002')" aria-label="Preview invoice INV002" title="Preview"><i class="fas fa-eye"></i></button>
                                <button class="action-btn" onclick="editInvoice('INV002')" aria-label="Edit invoice INV002" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" onclick="sendReminder('INV002')" aria-label="Send reminder for invoice INV002" title="Send Reminder"><i class="fas fa-envelope"></i></button>
                                <button class="action-btn delete" onclick="deleteInvoice('INV002')" aria-label="Delete invoice INV002" title="Delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="invoice-checkbox" value="INV003"></td>
                        <td>INV003</td>
                        <td>Stark Industries</td>
                        <td>$2500</td>
                        <td>
                            <select class="status-toggle" onchange="updateStatus('INV003', this.value)">
                                <option value="Paid">Paid</option>
                                <option value="Unpaid">Unpaid</option>
                                <option value="Overdue" selected>Overdue</option>
                            </select>
                        </td>
                        <td>2025-02-28</td>
                        <td><span class="tag high-priority">High Priority</span></td>
                        <td>
                            <div class="action-group">
                                <button class="action-btn" onclick="previewInvoice('INV003')" aria-label="Preview invoice INV003" title="Preview"><i class="fas fa-eye"></i></button>
                                <button class="action-btn" onclick="editInvoice('INV003')" aria-label="Edit invoice INV003" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" onclick="sendReminder('INV003')" aria-label="Send reminder for invoice INV003" title="Send Reminder"><i class="fas fa-envelope"></i></button>
                                <button class="action-btn delete" onclick="deleteInvoice('INV003')" aria-label="Delete invoice INV003" title="Delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="invoice-checkbox" value="INV004"></td>
                        <td>INV004</td>
                        <td>Wayne Enterprises</td>
                        <td>$1800</td>
                        <td>
                            <select class="status-toggle" onchange="updateStatus('INV004', this.value)">
                                <option value="Paid" selected>Paid</option>
                                <option value="Unpaid">Unpaid</option>
                                <option value="Overdue">Overdue</option>
                            </select>
                        </td>
                        <td>2025-03-20</td>
                        <td><span class="tag recurring">Recurring</span></td>
                        <td>
                            <div class="action-group">
                                <button class="action-btn" onclick="previewInvoice('INV004')" aria-label="Preview invoice INV004" title="Preview"><i class="fas fa-eye"></i></button>
                                <button class="action-btn" onclick="editInvoice('INV004')" aria-label="Edit invoice INV004" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" onclick="sendReminder('INV004')" aria-label="Send reminder for invoice INV004" title="Send Reminder"><i class="fas fa-envelope"></i></button>
                                <button class="action-btn delete" onclick="deleteInvoice('INV004')" aria-label="Delete invoice INV004" title="Delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="invoice-checkbox" value="INV005"></td>
                        <td>INV005</td>
                        <td>Cyberdyne Systems</td>
                        <td>$4000</td>
                        <td>
                            <select class="status-toggle" onchange="updateStatus('INV005', this.value)">
                                <option value="Paid">Paid</option>
                                <option value="Unpaid" selected>Unpaid</option>
                                <option value="Overdue">Overdue</option>
                            </select>
                        </td>
                        <td>2025-05-01</td>
                        <td><span class="tag urgent">Urgent</span></td>
                        <td>
                            <div class="action-group">
                                <button class="action-btn" onclick="previewInvoice('INV005')" aria-label="Preview invoice INV005" title="Preview"><i class="fas fa-eye"></i></button>
                                <button class="action-btn" onclick="editInvoice('INV005')" aria-label="Edit invoice INV005" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" onclick="sendReminder('INV005')" aria-label="Send reminder for invoice INV005" title="Send Reminder"><i class="fas fa-envelope"></i></button>
                                <button class="action-btn delete" onclick="deleteInvoice('INV005')" aria-label="Delete invoice INV005" title="Delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="invoice-checkbox" value="INV006"></td>
                        <td>INV006</td>
                        <td>Umbrella Corp</td>
                        <td>$2200</td>
                        <td>
                            <select class="status-toggle" onchange="updateStatus('INV006', this.value)">
                                <option value="Paid">Paid</option>
                                <option value="Unpaid">Unpaid</option>
                                <option value="Overdue" selected>Overdue</option>
                            </select>
                        </td>
                        <td>2025-03-10</td>
                        <td><span class="tag high-priority">High Priority</span></td>
                        <td>
                            <div class="action-group">
                                <button class="action-btn" onclick="previewInvoice('INV006')" aria-label="Preview invoice INV006" title="Preview"><i class="fas fa-eye"></i></button>
                                <button class="action-btn" onclick="editInvoice('INV006')" aria-label="Edit invoice INV006" title="Edit"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" onclick="sendReminder('INV006')" aria-label="Send reminder for invoice INV006" title="Send Reminder"><i class="fas fa-envelope"></i></button>
                                <button class="action-btn delete" onclick="deleteInvoice('INV006')" aria-label="Delete invoice INV006" title="Delete"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pagination">
                <button onclick="changePage(-1)" aria-label="Previous page"><i class="fas fa-chevron-left"></i></button>
                <span id="pageInfo">Page 1 of 2</span>
                <button onclick="changePage(1)" aria-label="Next page"><i class="fas fa-chevron-right"></i></button>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="charts-section">
            <div class="chart-card">
                <h2>Invoice Status Overview</h2>
                <canvas id="invoiceStatusChart" style="max-width: 350px; max-height: 350px;"></canvas>
            </div>
            <div class="chart-card">
                <h2>Invoice Process Flow</h2>
                <canvas id="invoiceFlowChart" style="max-width: 600px; max-height: 300px;"></canvas>
            </div>
        </div>
    </div>

    <!-- Invoice Modal (Add/Edit) -->
    <div id="invoiceModal" class="modal" role="dialog" aria-labelledby="modalTitle">
        <div class="modal-content">
            <span class="close" onclick="closeModal()" aria-label="Close modal">×</span>
            <h2 id="modalTitle">Add Invoice</h2>
            <form id="invoiceForm" action="InvoiceServlet" method="post" onsubmit="return validateForm()">
                <input type="hidden" id="invoiceId" name="invoiceId">
                <div class="form-group">
                    <label for="client">Client</label>
                    <input type="text" id="client" name="client" required aria-required="true">
                </div>
                <div class="form-group">
                    <label for="amount">Amount ($)</label>
                    <input type="number" id="amount" name="amount" step="0.01" min="0" required aria-required="true">
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required aria-required="true">
                        <option value="Paid">Paid</option>
                        <option value="Unpaid">Unpaid</option>
                        <option value="Overdue">Overdue</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dueDate">Due Date</label>
                    <input type="date" id="dueDate" name="dueDate" required aria-required="true">
                </div>
                <div class="form-group">
                    <label for="tags">Tags</label>
                    <select id="tags" name="tags" multiple aria-label="Select tags">
                        <option value="Urgent">Urgent</option>
                        <option value="Recurring">Recurring</option>
                        <option value="High Priority">High Priority</option>
                    </select>
                </div>
                <button type="submit" class="submit-btn">Save Invoice</button>
            </form>
        </div>
    </div>

    <!-- Preview Modal -->
    <div id="previewModal" class="modal" role="dialog" aria-labelledby="previewTitle">
        <div class="modal-content">
            <span class="close" onclick="closePreviewModal()" aria-label="Close preview">×</span>
            <h2 id="previewTitle">Invoice Preview</h2>
            <div id="previewContent">
                <p><strong>Invoice ID:</strong> <span id="previewId"></span></p>
                <p><strong>Client:</strong> <span id="previewClient"></span></p>
                <p><strong>Amount:</strong> <span id="previewAmount"></span></p>
                <p><strong>Status:</strong> <span id="previewStatus"></span></p>
                <p><strong>Due Date:</strong> <span id="previewDueDate"></span></p>
                <p><strong>Tags:</strong> <span id="previewTags"></span></p>
            </div>
        </div>
    </div>

    <script>
        // Chart: Invoice Status
        const statusCtx = document.getElementById('invoiceStatusChart').getContext('2d');
        const statusChart = new Chart(statusCtx, {
            type: 'doughnut',
            data: {
                labels: ['Paid', 'Unpaid', 'Overdue'],
                datasets: [{
                    data: [<%= request.getAttribute("paidInvoices") != null ? request.getAttribute("paidInvoices") : 80 %>, 
                           <%= request.getAttribute("unpaidInvoices") != null ? request.getAttribute("unpaidInvoices") : 30 %>, 
                           <%= request.getAttribute("overdueInvoices") != null ? request.getAttribute("overdueInvoices") : 10 %>],
                    backgroundColor: ['#10b981', '#ef4444', '#f59e0b'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom', labels: { font: { size: 14 } } }
                },
                onClick: (e, elements) => {
                    if (elements.length) {
                        const index = elements[0].index;
                        const status = statusChart.data.labels[index];
                        document.getElementById('statusFilter').value = status;
                        filterInvoices();
                    }
                }
            }
        });

        // Chart: Invoice Flow
        const flowCtx = document.getElementById('invoiceFlowChart').getContext('2d');
        new Chart(flowCtx, {
            type: 'line', // Using line to simulate flowchart with annotations
            data: {
                labels: ['Created', 'Sent', 'Paid/Overdue'],
                datasets: [{
                    label: 'Invoice Process',
                    data: [1, 2, 3],
                    borderColor: '#3b82f6',
                    backgroundColor: 'rgba(59, 130, 246, 0.2)',
                    fill: false,
                    pointRadius: 10,
                    pointBackgroundColor: ['#10b981', '#f59e0b', '#ef4444'],
                    tension: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: { title: { display: true, text: 'Process Stage' } },
                    y: { display: false }
                },
                plugins: {
                    legend: { display: false },
                    annotation: {
                        annotations: [
                            {
                                type: 'label',
                                xValue: 'Created',
                                yValue: 1,
                                content: ['Created'],
                                backgroundColor: 'rgba(0,0,0,0)',
                                color: '#10b981',
                                font: { size: 14 }
                            },
                            {
                                type: 'label',
                                xValue: 'Sent',
                                yValue: 2,
                                content: ['Sent'],
                                backgroundColor: 'rgba(0,0,0,0)',
                                color: '#f59e0b',
                                font: { size: 14 }
                            },
                            {
                                type: 'label',
                                xValue: 'Paid/Overdue',
                                yValue: 3,
                                content: ['Paid/Overdue'],
                                backgroundColor: 'rgba(0,0,0,0)',
                                color: '#ef4444',
                                font: { size: 14 }
                            }
                        ]
                    }
                }
            }
        });

        // Modal Functions
        function openAddInvoiceModal() {
            document.getElementById('modalTitle').textContent = 'Add Invoice';
            document.getElementById('invoiceForm').reset();
            document.getElementById('invoiceId').value = '';
            document.getElementById('invoiceModal').style.display = 'block';
        }

        function editInvoice(invoiceId) {
            document.getElementById('modalTitle').textContent = 'Edit Invoice';
            document.getElementById('invoiceId').value = invoiceId;
            const row = Array.from(document.querySelectorAll('#invoiceTableBody tr')).find(
                r => r.cells[1].textContent === invoiceId
            );
            if (row) {
                document.getElementById('client').value = row.cells[2].textContent;
                document.getElementById('amount').value = parseFloat(row.cells[3].textContent.replace('$', ''));
                document.getElementById('status').value = row.cells[4].querySelector('select').value;
                document.getElementById('dueDate').value = row.cells[5].textContent;
            }
            document.getElementById('invoiceModal').style.display = 'block';
        }

        function previewInvoice(invoiceId) {
            const row = Array.from(document.querySelectorAll('#invoiceTableBody tr')).find(
                r => r.cells[1].textContent === invoiceId
            );
            if (row) {
                document.getElementById('previewId').textContent = invoiceId;
                document.getElementById('previewClient').textContent = row.cells[2].textContent;
                document.getElementById('previewAmount').textContent = row.cells[3].textContent;
                document.getElementById('previewStatus').textContent = row.cells[4].querySelector('select').value;
                document.getElementById('previewDueDate').textContent = row.cells[5].textContent;
                document.getElementById('previewTags').textContent = row.cells[6].textContent || 'None';
            }
            document.getElementById('previewModal').style.display = 'block';
        }

        function deleteInvoice(invoiceId) {
            if (confirm(`Are you sure you want to delete invoice ${invoiceId}?`)) {
                const form = document.createElement('form');
                form.method = 'post';
                form.action = 'InvoiceServlet';
                form.innerHTML = `
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="invoiceId" value="${invoiceId}">
                `;
                document.body.appendChild(form);
                form.submit();
            }
        }

        function sendReminder(invoiceId) {
            alert(`Reminder sent for invoice ${invoiceId}!`);
        }

        function closeModal() {
            document.getElementById('invoiceModal').style.display = 'none';
        }

        function closePreviewModal() {
            document.getElementById('previewModal').style.display = 'none';
        }

        // Form Validation
        function validateForm() {
            const amount = document.getElementById('amount').value;
            if (amount <= 0) {
                alert('Amount must be greater than 0.');
                return false;
            }
            return true;
        }

        // Table Filtering
        function filterInvoices() {
            const search = document.getElementById('searchInvoice').value.toLowerCase();
            const status = document.getElementById('statusFilter').value;
            const rows = document.querySelectorAll('#invoiceTableBody tr');
            rows.forEach(row => {
                const client = row.cells[2].textContent.toLowerCase();
                const rowStatus = row.cells[4].querySelector('select').value;
                const matchesSearch = client.includes(search);
                const matchesStatus = status === 'all' || rowStatus === status;
                row.style.display = matchesSearch && matchesStatus ? '' : 'none';
            });
            updatePagination();
        }

        // Table Sorting
        function sortTable(column, type) {
            const tbody = document.getElementById('invoiceTableBody');
            const rows = Array.from(tbody.querySelectorAll('tr'));
            const sortDir = tbody.dataset.sortDir === 'asc' ? 'desc' : 'asc';
            tbody.dataset.sortDir = sortDir;
            rows.sort((a, b) => {
                let aValue, bValue;
                if (column === 'amount') {
                    aValue = parseFloat(a.cells[3].textContent.replace('$', ''));
                    bValue = parseFloat(b.cells[3].textContent.replace('$', ''));
                } else if (column === 'dueDate') {
                    aValue = new Date(a.cells[5].textContent);
                    bValue = new Date(b.cells[5].textContent);
                }
                return sortDir === 'asc' ? aValue - bValue : bValue - aValue;
            });
            tbody.innerHTML = '';
            rows.forEach(row => tbody.appendChild(row));
            updatePagination();
        }

        // Pagination
        let currentPage = 1;
        const rowsPerPage = 5;

        function updatePagination() {
            const rows = Array.from(document.querySelectorAll('#invoiceTableBody tr')).filter(
                row => row.style.display !== 'none'
            );
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            currentPage = Math.min(currentPage, totalPages) || 1;
            rows.forEach((row, index) => {
                row.style.display = (index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage) ? '' : 'none';
            });
            document.getElementById('pageInfo').textContent = `Page ${currentPage} of ${totalPages}`;
        }

        function changePage(delta) {
            const rows = Array.from(document.querySelectorAll('#invoiceTableBody tr')).filter(
                row => row.style.display !== 'none'
            );
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            currentPage = Math.max(1, Math.min(currentPage + delta, totalPages));
            updatePagination();
        }

        // Bulk Actions
        function bulkMarkAsPaid() {
            const selected = Array.from(document.querySelectorAll('.invoice-checkbox:checked')).map(cb => cb.value);
            if (selected.length === 0) {
                alert('No invoices selected.');
                return;
            }
            selected.forEach(id => {
                const row = Array.from(document.querySelectorAll('#invoiceTableBody tr')).find(
                    r => r.cells[1].textContent === id
                );
                if (row) {
                    row.cells[4].querySelector('select').value = 'Paid';
                }
            });
        }

        function bulkDelete() {
            const selected = Array.from(document.querySelectorAll('.invoice-checkbox:checked')).map(cb => cb.value);
            if (selected.length === 0) {
                alert('No invoices selected.');
                return;
            }
            if (confirm(`Are you sure you want to delete ${selected.length} invoices?`)) {
                alert(`Deleted invoices: ${selected.join(', ')}`);
            }
        }

        // Export to CSV
        function exportToCSV() {
            const rows = Array.from(document.querySelectorAll('#invoiceTableBody tr'));
            const data = rows.map(row => ({
                id: row.cells[1].textContent,
                client: row.cells[2].textContent,
                amount: row.cells[3].textContent,
                status: row.cells[4].querySelector('select').value,
                dueDate: row.cells[5].textContent,
                tags: row.cells[6].textContent || ''
            }));
            const csv = [
                'Invoice ID,Client,Amount,Status,Due Date,Tags',
                ...data.map(d => `${d.id},${d.client},${d.amount},${d.status},${d.dueDate},${d.tags}`)
            ].join('\n');
            const blob = new Blob([csv], { type: 'text/csv' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'invoices.csv';
            a.click();
            URL.revokeObjectURL(url);
        }

        // Event Listeners
        document.getElementById('searchInvoice').addEventListener('input', filterInvoices);
        document.getElementById('statusFilter').addEventListener('change', filterInvoices);
        document.getElementById('selectAll').addEventListener('change', () => {
            document.querySelectorAll('.invoice-checkbox').forEach(cb => {
                cb.checked = document.getElementById('selectAll').checked;
            });
        });
        document.getElementById('headerCheckbox').addEventListener('change', () => {
            document.getElementById('selectAll').checked = document.getElementById('headerCheckbox').checked;
            document.querySelectorAll('.invoice-checkbox').forEach(cb => {
                cb.checked = document.getElementById('headerCheckbox').checked;
            });
        });
        document.querySelectorAll('.sortable').forEach(th => {
            th.addEventListener('click', () => sortTable(th.dataset.sort));
        });
        window.onclick = event => {
            if (event.target.classList.contains('modal')) {
                closeModal();
                closePreviewModal();
            }
        };

        // Status Update
        function updateStatus(invoiceId, status) {
            console.log(`Updated ${invoiceId} to ${status}`);
        }

        // Initialize Pagination
        updatePagination();
    </script>
</body>
</html>