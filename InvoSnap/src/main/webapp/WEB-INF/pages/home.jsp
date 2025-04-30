<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invosnap - Dashboard</title>
    <!-- Stylesheets with version to prevent caching -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css?v=1" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css?v=1" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css?v=6" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css?v=1" />
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <!-- Chart.js for graphs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="main-body">
        <!-- Hero Section -->
        <section class="hero-section animate-fade-in">
            <div class="hero-overlay"></div>
            <h1>
                <i class="fas fa-lightbulb hero-icon"></i>
                Empower Your Finances with <span class="invosnap-text">Invosnap</span>
            </h1>
            <p>Streamline invoicing, manage clients, and grow your business with our intuitive SaaS platform.</p>
            <div class="cta-buttons">
                <a href="/register" class="btn primary" aria-label="Start Invoicing Now">Start Invoicing</a>
                <a href="/pricing" class="btn secondary" aria-label="View Pricing Plans">View Plans</a>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section animate-fade-in">
            <h2>Unlock Your Business Potential</h2>
            <div class="features-grid">
                <div class="feature-card" role="article" aria-label="Effortless Invoicing">
                    <div class="icon">📄</div>
                    <h3>Effortless Invoicing</h3>
                    <p>Create professional invoices in seconds with customizable templates.</p>
                </div>
                <div class="feature-card" role="article" aria-label="Client Management">
                    <div class="icon">🤝</div>
                    <h3>Client Management</h3>
                    <p>Organize client details, track interactions, and view payment history.</p>
                </div>
                <div class="feature-card" role="article" aria-label="Payment Reminders">
                    <div class="icon">⏰</div>
                    <h3>Payment Reminders</h3>
                    <p>Automated, polite reminders ensure timely payments.</p>
                </div>
                <div class="feature-card" role="article" aria-label="Secure Platform">
                    <div class="icon">🔒</div>
                    <h3>Secure Platform</h3>
                    <p>Bank-grade encryption protects your sensitive data.</p>
                </div>
            </div>
        </section>

        <!-- Quick Actions Section -->
        <section class="quick-actions-section animate-fade-in">
            <h2>Take Control of Your Invoicing</h2>
            <p>Jump into essential tasks with a single click.</p>
            <div class="actions-grid">
                <div class="action-card" role="article" aria-label="New Invoice">
                    <div class="action-icon">➕</div>
                    <h3>New Invoice</h3>
                    <p>Create a professional invoice in under a minute.</p>
                    <a href="/register" class="action-btn" aria-label="Create New Invoice">Create Now</a>
                </div>
                <div class="action-card" role="article" aria-label="Client Overview">
                    <div class="action-icon">📋</div>
                    <h3>Client Overview</h3>
                    <p>View and manage all your client details.</p>
                    <a href="/clients" class="action-btn" aria-label="View Client Overview">View Clients</a>
                </div>
                <div class="action-card" role="article" aria-label="Track Payments">
                    <div class="action-icon">💸</div>
                    <h3>Track Payments</h3>
                    <p>Monitor paid and pending invoices instantly.</p>
                    <a href="/payments" class="action-btn" aria-label="Track Payments">Track Now</a>
                </div>
            </div>
        </section>

        <!-- Graphs Section -->
        <section class="graphs-section animate-fade-in">
            <h2>Insightful Analytics</h2>
            <p>Track your business performance with clear, concise visuals.</p>
            <div class="graphs-grid">
                <div class="graph-card" role="article" aria-label="Invoice Status">
                    <h3>Invoice Status</h3>
                    <canvas id="invoiceStatusChart" style="max-height: 200px;"></canvas>
                </div>
                <div class="graph-card" role="article" aria-label="Revenue Distribution">
                    <h3>Revenue Distribution</h3>
                    <canvas id="revenueDistributionChart" style="max-height: 200px;"></canvas>
                </div>
                <div class="graph-card" role="article" aria-label="Monthly Invoice Trends">
                    <h3>Monthly Invoice Trends</h3>
                    <canvas id="monthlyInvoiceTrendsChart" style="max-height: 200px;"></canvas>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="testimonials-section animate-fade-in">
            <h2>What Our Users Say</h2>
            <p>Hear from businesses thriving with Invosnap.</p>
            <div class="testimonials-grid">
                <div class="testimonial-card" role="article" aria-label="Testimonial from Sarah Johnson">
                    <p>"Invosnap transformed our invoicing process. It's fast, intuitive, and saves us hours every week!"</p>
                    <div class="user-info">
                        <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=40&h=40&q=80" alt="Sarah Johnson Avatar" class="user-avatar">
                        <div>
                            <h4>Sarah Johnson</h4>
                            <p>Freelance Designer</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card" role="article" aria-label="Testimonial from Michael Chen">
                    <p>"The analytics dashboard gives us clear insights into our cash flow. Highly recommend!"</p>
                    <div class="user-info">
                        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=40&h=40&q=80" alt="Michael Chen Avatar" class="user-avatar">
                        <div>
                            <h4>Michael Chen</h4>
                            <p>Small Business Owner</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card" role="article" aria-label="Testimonial from Emily Rodriguez">
                    <p>"Client management is a breeze with Invosnap. It's like having an extra team member."</p>
                    <div class="user-info">
                        <img src="https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&auto=format&fit=crop&w=40&h=40&q=80" alt="Emily Rodriguez Avatar" class="user-avatar">
                        <div>
                            <h4>Emily Rodriguez</h4>
                            <p>Consultant</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Subscription Plans Section -->
        <section class="subscription-section animate-fade-in">
            <h2>Find Your Perfect Plan</h2>
            <p>Choose a plan that scales with your business needs, backed by powerful features.</p>
            <div class="plans-grid">
                <div class="plan-card">
                    <div class="plan-header starter">
                        <i class="fas fa-seedling plan-icon"></i>
                        <h3>Starter</h3>
                    </div>
                    <p class="price">Free</p>
                    <ul>
                        <li>Up to 5 invoices/month</li>
                        <li>Basic client management</li>
                        <li>Email support</li>
                        <li>Basic analytics</li>
                    </ul>
                    <a href="/signup" class="btn primary" aria-label="Sign Up for Starter Plan">Get Started</a>
                </div>
                <div class="plan-card popular">
                    <div class="plan-header pro">
                        <i class="fas fa-rocket plan-icon"></i>
                        <h3>Pro</h3>
                    </div>
                    <p class="price">$19/month</p>
                    <ul>
                        <li>Unlimited invoices</li>
                        <li>Advanced client management</li>
                        <li>Priority support</li>
                        <li>Automated reminders</li>
                        <li>Advanced analytics</li>
                    </ul>
                    <a href="/pricing" class="btn primary" aria-label="Choose Pro Plan">Choose Pro</a>
                </div>
                <div class="plan-card">
                    <div class="plan-header enterprise">
                        <i class="fas fa-building plan-icon"></i>
                        <h3>Enterprise</h3>
                    </div>
                    <p class="price">Custom</p>
                    <ul>
                        <li>Unlimited invoices</li>
                        <li>Custom integrations</li>
                        <li>Dedicated support</li>
                        <li>API access</li>
                        <li>Custom analytics</li>
                    </ul>
                    <a href="/contact" class="btn primary" aria-label="Contact Sales for Enterprise Plan">Contact Sales</a>
                </div>
            </div>
        </section>

        <!-- Call to Action Section -->
        <section class="cta-section animate-fade-in">
            <h2>Transform Your Workflow Today</h2>
            <p>Join thousands of businesses simplifying their finances with Invosnap.</p>
            <a href="/signup" class="btn primary" aria-label="Start Invosnap for Free">Start for Free</a>
        </section>
    </div>

    <jsp:include page="footer.jsp" />

    <!-- Chart.js Script for Graphs -->
    <script>
        // Invoice Status Bar Chart
        const invoiceStatusCtx = document.getElementById('invoiceStatusChart').getContext('2d');
        new Chart(invoiceStatusCtx, {
            type: 'bar',
            data: {
                labels: ['Paid', 'Pending', 'Overdue'],
                datasets: [{
                    label: 'Invoices',
                    data: [50, 30, 20],
                    backgroundColor: ['#2563eb', '#93c5fd', '#dc2626'],
                    borderRadius: 4,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: { enabled: true }
                },
                scales: {
                    y: { beginAtZero: true, max: 60 }
                }
            }
        });

        // Revenue Distribution Pie Chart
        const revenueDistributionCtx = document.getElementById('revenueDistributionChart').getContext('2d');
        new Chart(revenueDistributionCtx, {
            type: 'pie',
            data: {
                labels: ['Services', 'Products', 'Subscriptions'],
                datasets: [{
                    data: [40, 35, 25],
                    backgroundColor: ['#2563eb', '#93c5fd', '#1e40af'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom', labels: { font: { size: 12 } } },
                    tooltip: { enabled: true }
                }
            }
        });

        // Monthly Invoice Trends Line Chart
        const monthlyInvoiceTrendsCtx = document.getElementById('monthlyInvoiceTrendsChart').getContext('2d');
        new Chart(monthlyInvoiceTrendsCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Invoices Issued',
                    data: [20, 25, 30, 28, 35, 40],
                    borderColor: '#2563eb',
                    backgroundColor: 'rgba(37, 99, 235, 0.1)',
                    fill: true,
                    tension: 0.4,
                    pointBackgroundColor: '#2563eb',
                    pointBorderColor: '#fff',
                    pointHoverBackgroundColor: '#fff',
                    pointHoverBorderColor: '#2563eb'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: { enabled: true }
                },
                scales: {
                    y: { beginAtZero: true, max: 50 }
                }
            }
        });
    </script>
</body>
</html>