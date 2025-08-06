<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Help & Support - Online Billing System</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            --info-gradient: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
            --warning-gradient: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --card-shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --border-radius: 12px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --navbar-height: 70px;
        }

        /* Dark Theme Variables */
        [data-bs-theme="dark"] {
            --bs-body-bg: #0f1419;
            --bs-body-color: #e2e8f0;
            --bs-primary: #667eea;
            --bs-secondary: #94a3b8;
            --card-bg: #1e293b;
            --border-color: #334155;
            --glass-bg: rgba(30, 41, 59, 0.8);
            --step-bg: #2d3748;
            --step-hover-bg: #374151;
        }

        /* Light Theme Variables */
        [data-bs-theme="light"] {
            --card-bg: #ffffff;
            --border-color: #e2e8f0;
            --glass-bg: rgba(255, 255, 255, 0.8);
            --step-bg: #f8fafc;
            --step-hover-bg: #f1f5f9;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            font-weight: 400;
            line-height: 1.6;
            overflow-x: hidden;
            transition: var(--transition);
            background: var(--bs-body-bg);
            color: var(--bs-body-color);
            min-height: 100vh;
            position: relative;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 50%, rgba(102, 126, 234, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(118, 75, 162, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 40% 80%, rgba(240, 147, 251, 0.1) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-20px) rotate(1deg); }
            66% { transform: translateY(10px) rotate(-1deg); }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: #cbd5e0;
            border-radius: 3px;
        }

        [data-bs-theme="dark"] ::-webkit-scrollbar-thumb {
            background: #4a5568;
        }

        /* Navbar Styling */
        .navbar {
            height: var(--navbar-height);
            backdrop-filter: blur(20px);
            background: var(--glass-bg) !important;
            border-bottom: 1px solid var(--border-color);
            transition: var(--transition);
            position: sticky;
            top: 0;
            z-index: 1050;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-link {
            font-weight: 500;
            transition: var(--transition);
            position: relative;
            color: var(--bs-body-color) !important;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--bs-primary) !important;
            transform: translateY(-1px);
        }

        .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 20px;
            height: 2px;
            background: var(--primary-gradient);
            border-radius: 1px;
        }

        .theme-toggle {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 50px;
            padding: 0.5rem;
            transition: var(--transition);
            cursor: pointer;
            color: var(--bs-body-color);
        }

        .theme-toggle:hover {
            transform: scale(1.05);
            color: var(--bs-primary);
        }

        /* Main Content */
        .help-section {
            min-height: calc(100vh - var(--navbar-height) - 200px);
            padding: 3rem 0;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 4rem;
            padding: 2rem 0;
        }

        .hero-icon {
            width: 100px;
            height: 100px;
            background: var(--info-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            color: white;
            font-size: 3rem;
            box-shadow: var(--card-shadow-hover);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            color: var(--bs-secondary-color);
            max-width: 600px;
            margin: 0 auto;
        }

        /* Help Cards */
        .help-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            backdrop-filter: blur(10px);
        }

        .help-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
        }

        .help-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-shadow-hover);
        }

        .help-card-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1.5rem;
            box-shadow: var(--card-shadow);
        }

        .help-card-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--bs-body-color);
        }

        .help-steps {
            list-style: none;
            padding: 0;
        }

        .help-step {
            background: var(--step-bg);
            border-radius: 8px;
            padding: 1rem 1.25rem;
            margin-bottom: 0.75rem;
            border: 1px solid var(--border-color);
            transition: var(--transition);
            display: flex;
            align-items: flex-start;
            gap: 1rem;
        }

        .help-step:hover {
            background: var(--step-hover-bg);
            transform: translateX(5px);
        }

        .step-number {
            background: var(--primary-gradient);
            color: white;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.875rem;
            font-weight: 600;
            flex-shrink: 0;
            margin-top: 0.125rem;
        }

        .step-content {
            flex: 1;
        }

        .step-title {
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--bs-body-color);
        }

        .step-description {
            color: var(--bs-secondary-color);
            font-size: 0.9rem;
        }

        /* Quick Links */
        .quick-links {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            margin-bottom: 2rem;
        }

        .quick-link {
            display: flex;
            align-items: center;
            padding: 1rem;
            border-radius: 8px;
            text-decoration: none;
            color: var(--bs-body-color);
            transition: var(--transition);
            border: 1px solid var(--border-color);
            margin-bottom: 0.75rem;
        }

        .quick-link:hover {
            background: var(--step-hover-bg);
            transform: translateX(5px);
            color: var(--bs-primary);
        }

        .quick-link:last-child {
            margin-bottom: 0;
        }

        .quick-link-icon {
            width: 40px;
            height: 40px;
            background: var(--primary-gradient);
            color: white;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        /* Contact Section */
        .contact-card {
            background: linear-gradient(135deg, var(--success-gradient));
            color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            margin-top: 3rem;
        }

        .contact-card h4 {
            margin-bottom: 1rem;
        }

        .contact-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
            margin-top: 1.5rem;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Footer */
        .footer {
            background: var(--card-bg);
            border-top: 1px solid var(--border-color);
            padding: 3rem 0 1.5rem;
            color: var(--bs-body-color);
            margin-top: 4rem;
        }

        .footer h5 {
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: var(--bs-body-color);
        }

        .footer p, .footer a {
            color: var(--bs-secondary-color);
            text-decoration: none;
            transition: var(--transition);
        }

        .footer a:hover {
            color: var(--bs-primary);
        }

        .footer .list-unstyled li {
            margin-bottom: 0.5rem;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.8s ease-out;
        }

        .fade-in-up-delay {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2rem;
            }

            .hero-icon {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }

            .help-card {
                padding: 1.5rem;
            }

            .contact-info {
                flex-direction: column;
                gap: 1rem;
            }
        }

        /* Reduced motion support */
        @media (prefers-reduced-motion: reduce) {
            *, *::before, *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="bi bi-receipt-cutoff"></i>
            BillingSystem
        </a>
        <div class="d-flex align-items-center">
            <button class="navbar-toggler border-0 me-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <button class="theme-toggle btn p-2 me-2" id="themeToggle" aria-label="Toggle theme">
                <i class="bi bi-sun-fill" id="themeIcon"></i>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <%
                    if (session.getAttribute("username") != null) {
                %>
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="addCustomer.jsp">Add Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="viewCustomers.jsp">View Customers</a></li>
                <li class="nav-item"><a class="nav-link" href="addItem.jsp">Add Item</a></li>
                <li class="nav-item"><a class="nav-link" href="viewItems.jsp">View Items</a></li>
                <li class="nav-item"><a class="nav-link" href="calculateBill.jsp">Calculate Bill</a></li>
                <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                <% } else { %>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link active" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="help-section">
    <div class="container">
        <!-- Hero Section -->
        <div class="hero-section fade-in-up">
            <div class="hero-icon">
                <i class="bi bi-question-circle"></i>
            </div>
            <h1 class="hero-title">Help & Support</h1>
            <p class="hero-subtitle">
                Learn how to use the Online Billing System effectively with our comprehensive guides and tutorials.
            </p>
        </div>

        <div class="row">
            <!-- Getting Started -->
            <div class="col-lg-6 mb-4">
                <div class="help-card fade-in-up">
                    <div class="help-card-icon" style="background: var(--info-gradient);">
                        <i class="bi bi-play-circle"></i>
                    </div>
                    <h3 class="help-card-title">Getting Started</h3>
                    <ul class="help-steps">
                        <li class="help-step">
                            <div class="step-number">1</div>
                            <div class="step-content">
                                <div class="step-title">Login to Your Account</div>
                                <div class="step-description">Navigate to the login page and enter your credentials to access the system.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">2</div>
                            <div class="step-content">
                                <div class="step-title">Explore the Dashboard</div>
                                <div class="step-description">Familiarize yourself with the main dashboard and available features.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">3</div>
                            <div class="step-content">
                                <div class="step-title">Set Up Your Data</div>
                                <div class="step-description">Add customers and items before generating your first bill.</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Customer Management -->
            <div class="col-lg-6 mb-4">
                <div class="help-card fade-in-up-delay">
                    <div class="help-card-icon" style="background: var(--success-gradient);">
                        <i class="bi bi-people"></i>
                    </div>
                    <h3 class="help-card-title">Customer Management</h3>
                    <ul class="help-steps">
                        <li class="help-step">
                            <div class="step-number">1</div>
                            <div class="step-content">
                                <div class="step-title">Add New Customers</div>
                                <div class="step-description">Go to "Add Customer" to register new customers with their details.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">2</div>
                            <div class="step-content">
                                <div class="step-title">View Customer List</div>
                                <div class="step-description">Use "View Customers" to see all registered customers and their information.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">3</div>
                            <div class="step-content">
                                <div class="step-title">Edit Customer Data</div>
                                <div class="step-description">Update customer information using the edit button in the customer list.</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Item Management -->
            <div class="col-lg-6 mb-4">
                <div class="help-card fade-in-up">
                    <div class="help-card-icon" style="background: var(--warning-gradient);">
                        <i class="bi bi-box"></i>
                    </div>
                    <h3 class="help-card-title">Item Management</h3>
                    <ul class="help-steps">
                        <li class="help-step">
                            <div class="step-number">1</div>
                            <div class="step-content">
                                <div class="step-title">Add Items/Services</div>
                                <div class="step-description">Navigate to "Add Item" to create new billable items or services.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">2</div>
                            <div class="step-content">
                                <div class="step-title">Set Pricing</div>
                                <div class="step-description">Define accurate prices for each item to ensure correct billing calculations.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">3</div>
                            <div class="step-content">
                                <div class="step-title">Manage Inventory</div>
                                <div class="step-description">Use "View Items" to manage your inventory and update item information.</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Bill Generation -->
            <div class="col-lg-6 mb-4">
                <div class="help-card fade-in-up-delay">
                    <div class="help-card-icon" style="background: var(--secondary-gradient);">
                        <i class="bi bi-receipt"></i>
                    </div>
                    <h3 class="help-card-title">Bill Generation</h3>
                    <ul class="help-steps">
                        <li class="help-step">
                            <div class="step-number">1</div>
                            <div class="step-content">
                                <div class="step-title">Select Customer</div>
                                <div class="step-description">Go to "Calculate Bill" and choose the customer for billing.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">2</div>
                            <div class="step-content">
                                <div class="step-title">Enter Usage Data</div>
                                <div class="step-description">Input the units consumed or services used by the customer.</div>
                            </div>
                        </li>
                        <li class="help-step">
                            <div class="step-number">3</div>
                            <div class="step-content">
                                <div class="step-title">Generate & Save</div>
                                <div class="step-description">The system will calculate the total and save the bill automatically.</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Quick Links -->
        <div class="quick-links fade-in-up">
            <h3 class="mb-4">
                <i class="bi bi-lightning me-2"></i>
                Quick Access
            </h3>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <a href="dashboard.jsp" class="quick-link">
                        <div class="quick-link-icon">
                            <i class="bi bi-speedometer2"></i>
                        </div>
                        <div>
                            <strong>Dashboard</strong>
                            <br><small class="text-muted">Overview of your system</small>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mb-3">
                    <a href="addCustomer.jsp" class="quick-link">
                        <div class="quick-link-icon">
                            <i class="bi bi-person-plus"></i>
                        </div>
                        <div>
                            <strong>Add Customer</strong>
                            <br><small class="text-muted">Register new customers</small>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mb-3">
                    <a href="addItem.jsp" class="quick-link">
                        <div class="quick-link-icon">
                            <i class="bi bi-plus-circle"></i>
                        </div>
                        <div>
                            <strong>Add Item</strong>
                            <br><small class="text-muted">Create new billable items</small>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mb-3">
                    <a href="calculateBill.jsp" class="quick-link">
                        <div class="quick-link-icon">
                            <i class="bi bi-calculator"></i>
                        </div>
                        <div>
                            <strong>Calculate Bill</strong>
                            <br><small class="text-muted">Generate customer bills</small>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <!-- Contact Support -->
        <div class="contact-card fade-in-up">
            <h4>
                <i class="bi bi-headset me-2"></i>
                Need Additional Help?
            </h4>
            <p>Our support team is here to assist you with any questions or issues you may encounter.</p>
            <div class="contact-info">
                <div class="contact-item">
                    <i class="bi bi-envelope"></i>
                    <span>support@billing.com</span>
                </div>
                <div class="contact-item">
                    <i class="bi bi-telephone"></i>
                    <span>+44 98765 43210</span>
                </div>
                <div class="contact-item">
                    <i class="bi bi-clock"></i>
                    <span>9 AM - 6 PM (Mon-Fri)</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <h5>About BillingSystem</h5>
                <p>Online Billing System is a comprehensive, lightweight, and efficient solution for managing your billing needs with modern technology.</p>
            </div>
            <div class="col-lg-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="help.jsp">Help & Support</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="#" onclick="showPrivacy()">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h5>Contact Information</h5>
                <p><i class="bi bi-envelope me-2"></i>support@billing.com</p>
                <p><i class="bi bi-telephone me-2"></i>+44 98765 43210</p>
                <p><i class="bi bi-geo-alt me-2"></i>Business District, Tech City</p>
            </div>
        </div>
        <hr class="my-4" />
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="mb-0">&copy; 2025 Online Billing System. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <small>Made with <i class="bi bi-heart-fill text-danger"></i> for better business</small>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Theme Management
    const themeToggle = document.getElementById('themeToggle');
    const themeIcon = document.getElementById('themeIcon');
    const html = document.documentElement;

    // Load saved theme or default to light
    const savedTheme = localStorage.getItem('theme') || 'light';
    html.setAttribute('data-bs-theme', savedTheme);
    updateThemeIcon(savedTheme);

    themeToggle.addEventListener('click', () => {
        const currentTheme = html.getAttribute('data-bs-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        
        html.setAttribute('data-bs-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        updateThemeIcon(newTheme);
    });

    function updateThemeIcon(theme) {
        themeIcon.className = theme === 'light' ? 'bi bi-moon-fill' : 'bi bi-sun-fill';
    }

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Add hover effects to help steps
    document.querySelectorAll('.help-step').forEach(step => {
        step.addEventListener('mouseenter', function() {
            this.style.transform = 'translateX(10px)';
        });
        
        step.addEventListener('mouseleave', function() {
            this.style.transform = 'translateX(0)';
        });
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // Alt+T toggles theme
        if (e.altKey && e.key === 't') {
            e.preventDefault();
            themeToggle.click();
        }
        
        // Alt+H goes to home
        if (e.altKey && e.key === 'h') {
            e.preventDefault();
            window.location.href = 'index.jsp';
        }
        
        // Alt+D goes to dashboard (if logged in)
        if (e.altKey && e.key === 'd') {
            e.preventDefault();
            const dashboardLink = document.querySelector('a[href="dashboard.jsp"]');
            if (dashboardLink) {
                window.location.href = 'dashboard.jsp';
            }
        }
    });

    // Add intersection observer for animation triggers
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Observe all help cards for scroll animations
    document.querySelectorAll('.help-card').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });

    // Add search functionality for help content
    function createSearchBox() {
        const searchContainer = document.createElement('div');
        searchContainer.className = 'search-container mb-4';
        searchContainer.innerHTML = `
            <div class="input-group">
                <span class="input-group-text bg-transparent border-end-0">
                    <i class="bi bi-search"></i>
                </span>
                <input type="text" class="form-control border-start-0" 
                       placeholder="Search help topics..." 
                       id="helpSearch">
            </div>
        `;
        
        const heroSection = document.querySelector('.hero-section');
        heroSection.appendChild(searchContainer);
        
        // Add search functionality
        const searchInput = document.getElementById('helpSearch');
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const helpCards = document.querySelectorAll('.help-card');
            
            helpCards.forEach(card => {
                const content = card.textContent.toLowerCase();
                if (content.includes(searchTerm) || searchTerm === '') {
                    card.style.display = 'block';
                    card.style.opacity = '1';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }

    // Initialize search after page load
    window.addEventListener('load', () => {
        createSearchBox();
    });

    // Placeholder function for privacy policy
    function showPrivacy() {
        const modal = document.createElement('div');
        modal.className = 'modal fade';
        modal.innerHTML = `
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Privacy Policy</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>This is a placeholder for the privacy policy. In a real application, this would contain the actual privacy policy content including:</p>
                        <ul>
                            <li>Data collection practices</li>
                            <li>How user information is used</li>
                            <li>Security measures</li>
                            <li>User rights and choices</li>
                            <li>Contact information</li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        `;
        
        document.body.appendChild(modal);
        const bsModal = new bootstrap.Modal(modal);
        bsModal.show();
        
        modal.addEventListener('hidden.bs.modal', () => {
            modal.remove();
        });
    }

    // Add tooltips to icons
    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(element => {
        new bootstrap.Tooltip(element);
    });

    // Add copy to clipboard functionality for contact info
    document.querySelectorAll('.contact-item').forEach(item => {
        item.style.cursor = 'pointer';
        item.addEventListener('click', function() {
            const text = this.textContent.trim();
            if (navigator.clipboard) {
                navigator.clipboard.writeText(text).then(() => {
                    // Show temporary success message
                    const originalContent = this.innerHTML;
                    this.innerHTML = '<i class="bi bi-check"></i> Copied!';
                    setTimeout(() => {
                        this.innerHTML = originalContent;
                    }, 2000);
                });
            }
        });
    });
</script>
</body>
</html>