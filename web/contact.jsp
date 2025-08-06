<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Contact Us - Online Billing System</title>
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
            --input-bg: #2d3748;
            --input-border: #4a5568;
        }

        /* Light Theme Variables */
        [data-bs-theme="light"] {
            --card-bg: #ffffff;
            --border-color: #e2e8f0;
            --glass-bg: rgba(255, 255, 255, 0.8);
            --input-bg: #ffffff;
            --input-border: #e2e8f0;
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
        .contact-section {
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

        /* Contact Form */
        .contact-form-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 3rem;
            box-shadow: var(--card-shadow-hover);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }

        .contact-form-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
        }

        .form-floating {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-control, .form-select {
            background: var(--input-bg);
            border: 2px solid var(--input-border);
            border-radius: 12px;
            padding: 1rem 1.25rem;
            font-size: 1rem;
            transition: var(--transition);
            color: var(--bs-body-color);
            height: auto;
        }

        .form-control:focus, .form-select:focus {
            background: var(--input-bg);
            border-color: var(--bs-primary);
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            color: var(--bs-body-color);
        }

        .form-label {
            font-weight: 500;
            color: var(--bs-body-color);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-control.with-icon {
            padding-left: 3rem;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--bs-secondary-color);
            z-index: 10;
            pointer-events: none;
        }

        .submit-btn {
            width: 100%;
            background: var(--primary-gradient);
            border: none;
            border-radius: 12px;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            font-weight: 600;
            color: white;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            margin-top: 1rem;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--card-shadow-hover);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .submit-btn.loading {
            pointer-events: none;
        }

        .submit-btn .spinner {
            display: none;
        }

        .submit-btn.loading .spinner {
            display: inline-block;
        }

        .submit-btn.loading .btn-text {
            display: none;
        }

        /* Contact Info Cards */
        .contact-info-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            transition: var(--transition);
            text-align: center;
            height: 100%;
        }

        .contact-info-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-shadow-hover);
        }

        .contact-info-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin: 0 auto 1.5rem;
            box-shadow: var(--card-shadow);
        }

        .contact-info-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--bs-body-color);
        }

        .contact-info-text {
            color: var(--bs-secondary-color);
            margin-bottom: 0.5rem;
        }

        /* Success Message */
        .success-message {
            display: none;
            background: var(--success-gradient);
            color: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            animation: slideInDown 0.5s ease-out;
        }

        .success-message.show {
            display: block;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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

            .contact-form-card {
                padding: 2rem;
            }
        }

        /* Loading animation */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .spinner-border-sm {
            width: 1rem;
            height: 1rem;
            border-width: 2px;
            animation: spin 0.75s linear infinite;
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
                <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link active" href="contact.jsp">Contact</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="contact-section">
    <div class="container">
        <!-- Hero Section -->
        <div class="hero-section fade-in-up">
            <div class="hero-icon">
                <i class="bi bi-envelope-heart"></i>
            </div>
            <h1 class="hero-title">Get in Touch</h1>
            <p class="hero-subtitle">
                Have questions or need support? We're here to help! Send us a message and our team will get back to you soon.
            </p>
        </div>

        <div class="row">
            <!-- Contact Form -->
            <div class="col-lg-8 mb-4">
                <div class="contact-form-card fade-in-up">
                    <!-- Success Message -->
                    <div class="success-message" id="successMessage">
                        <h4>
                            <i class="bi bi-check-circle me-2"></i>
                            Message Sent Successfully!
                        </h4>
                        <p class="mb-0">Thank you for contacting us. Our team will reach out to you within 24 hours.</p>
                    </div>

                    <h3 class="mb-4">
                        <i class="bi bi-chat-dots me-2"></i>
                        Send us a Message
                    </h3>

                    <form id="contactForm" onsubmit="return handleFormSubmit(event)">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">
                                    <i class="bi bi-person"></i>
                                    First Name
                                </label>
                                <div class="position-relative">
                                    <i class="bi bi-person input-icon"></i>
                                    <input 
                                        required 
                                        type="text" 
                                        class="form-control with-icon" 
                                        name="firstName" 
                                        id="firstName" 
                                        placeholder="Enter your first name"
                                    >
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName" class="form-label">
                                    <i class="bi bi-person"></i>
                                    Last Name
                                </label>
                                <div class="position-relative">
                                    <i class="bi bi-person input-icon"></i>
                                    <input 
                                        required 
                                        type="text" 
                                        class="form-control with-icon" 
                                        name="lastName" 
                                        id="lastName" 
                                        placeholder="Enter your last name"
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="email" class="form-label">
                                    <i class="bi bi-envelope"></i>
                                    Email Address
                                </label>
                                <div class="position-relative">
                                    <i class="bi bi-envelope input-icon"></i>
                                    <input 
                                        required 
                                        type="email" 
                                        class="form-control with-icon" 
                                        name="email" 
                                        id="email" 
                                        placeholder="Enter your email"
                                    >
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="phone" class="form-label">
                                    <i class="bi bi-telephone"></i>
                                    Phone Number
                                </label>
                                <div class="position-relative">
                                    <i class="bi bi-telephone input-icon"></i>
                                    <input 
                                        type="tel" 
                                        class="form-control with-icon" 
                                        name="phone" 
                                        id="phone" 
                                        placeholder="Enter your phone number"
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="company" class="form-label">
                                <i class="bi bi-building"></i>
                                Company/Organization (Optional)
                            </label>
                            <div class="position-relative">
                                <i class="bi bi-building input-icon"></i>
                                <input 
                                    type="text" 
                                    class="form-control with-icon" 
                                    name="company" 
                                    id="company" 
                                    placeholder="Enter your company name"
                                >
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="subject" class="form-label">
                                <i class="bi bi-tag"></i>
                                Subject
                            </label>
                            <select required class="form-select" name="subject" id="subject">
                                <option value="">Select a subject</option>
                                <option value="general">General Inquiry</option>
                                <option value="support">Technical Support</option>
                                <option value="billing">Billing Question</option>
                                <option value="feature">Feature Request</option>
                                <option value="bug">Bug Report</option>
                                <option value="partnership">Partnership</option>
                                <option value="other">Other</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label for="message" class="form-label">
                                <i class="bi bi-chat-text"></i>
                                Message
                            </label>
                            <textarea 
                                required 
                                class="form-control" 
                                name="message" 
                                id="message" 
                                rows="6" 
                                placeholder="Tell us how we can help you..."
                                style="resize: vertical;"
                            ></textarea>
                        </div>

                        <button type="submit" class="submit-btn" id="submitBtn">
                            <span class="btn-text">
                                <i class="bi bi-send me-2"></i>
                                Send Message
                            </span>
                            <span class="spinner">
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                Sending...
                            </span>
                        </button>
                    </form>
                </div>
            </div>

            <!-- Contact Information -->
            <div class="col-lg-4 mb-4">
                <div class="fade-in-up-delay">
                    <!-- Email -->
                    <div class="contact-info-card mb-3">
                        <div class="contact-info-icon" style="background: var(--info-gradient);">
                            <i class="bi bi-envelope"></i>
                        </div>
                        <h4 class="contact-info-title">Email Us</h4>
                        <p class="contact-info-text">support@billing.com</p>
                        <p class="contact-info-text">sales@billing.com</p>
                        <small class="text-muted">We typically respond within 24 hours</small>
                    </div>

                    <!-- Phone -->
                    <div class="contact-info-card mb-3">
                        <div class="contact-info-icon" style="background: var(--success-gradient);">
                            <i class="bi bi-telephone"></i>
                        </div>
                        <h4 class="contact-info-title">Call Us</h4>
                        <p class="contact-info-text">+44 98765 43210</p>
                        <p class="contact-info-text">+44 98765 43211</p>
                        <small class="text-muted">Mon-Fri: 9 AM - 6 PM IST</small>
                    </div>

                    <!-- Social Media -->
                    <div class="contact-info-card">
                        <div class="contact-info-icon" style="background: var(--secondary-gradient);">
                            <i class="bi bi-share"></i>
                        </div>
                        <h4 class="contact-info-title">Follow Us</h4>
                        <div class="d-flex justify-content-center gap-3 mt-3">
                            <a href="#" class="btn btn-outline-primary btn-sm rounded-pill">
                                <i class="bi bi-twitter"></i>
                            </a>
                            <a href="#" class="btn btn-outline-primary btn-sm rounded-pill">
                                <i class="bi bi-linkedin"></i>
                            </a>
                            <a href="#" class="btn btn-outline-primary btn-sm rounded-pill">
                                <i class="bi bi-facebook"></i>
                            </a>
                            <a href="#" class="btn btn-outline-primary btn-sm rounded-pill">
                                <i class="bi bi-instagram"></i>
                            </a>
                        </div>
                    </div>
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

    // Form submission handler
    function handleFormSubmit(event) {
        event.preventDefault();
        
        const submitBtn = document.getElementById('submitBtn');
        const successMessage = document.getElementById('successMessage');
        const form = document.getElementById('contactForm');
        
        // Show loading state
        submitBtn.classList.add('loading');
        submitBtn.disabled = true;
        
        // Hide success message if visible
        successMessage.classList.remove('show');
        
        // Simulate form submission (replace with actual form submission logic)
        setTimeout(() => {
            // Hide loading state
            submitBtn.classList.remove('loading');
            submitBtn.disabled = false;
            
            // Show success message
            successMessage.classList.add('show');
            
            // Clear form
            form.reset();
            
            // Scroll to success message
            successMessage.scrollIntoView({ 
                behavior: 'smooth', 
                block: 'center' 
            });
            
            // Remove success message after 10 seconds
            setTimeout(() => {
                successMessage.classList.remove('show');
            }, 10000);
            
        }, 2000); // Simulate 2 second processing time
        
        return false;
    }

    // Input validation and styling
    document.querySelectorAll('.form-control, .form-select').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
            
            // Add validation styling
            if (this.hasAttribute('required') && this.value.trim() === '') {
                this.classList.add('is-invalid');
            } else if (this.value.trim() !== '') {
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
            }
        });
        
        input.addEventListener('input', function() {
            if (this.classList.contains('is-invalid') && this.value.trim() !== '') {
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
            }
        });
    });

    // Email validation
    const emailInput = document.getElementById('email');
    emailInput.addEventListener('blur', function() {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (this.value && !emailRegex.test(this.value)) {
            this.classList.add('is-invalid');
            this.classList.remove('is-valid');
        }
    });

    // Phone number formatting
    const phoneInput = document.getElementById('phone');
    phoneInput.addEventListener('input', function() {
        // Remove all non-numeric characters
        let value = this.value.replace(/\D/g, '');
        
        // Limit to 10 digits for Indian phone numbers
        if (value.length > 10) {
            value = value.slice(0, 10);
        }
        
        // Format as XXX-XXX-XXXX
        if (value.length >= 6) {
            value = value.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        } else if (value.length >= 3) {
            value = value.replace(/(\d{3})(\d{0,3})/, '$1-$2');
        }
        
        this.value = value;
    });

    // Character count for message
    const messageTextarea = document.getElementById('message');
    const messageContainer = messageTextarea.parentElement;

    // Create character counter
    const charCounter = document.createElement('small');
    charCounter.className = 'text-muted mt-1';
    charCounter.style.display = 'block';
    charCounter.textContent = '0/500 characters';
    messageContainer.appendChild(charCounter);

    messageTextarea.addEventListener('input', function() {
        const currentLength = this.value.length;
        const maxLength = 500;
        
        charCounter.textContent = `${currentLength}/${maxLength} characters`;
        
        if (currentLength > maxLength) {
            this.value = this.value.substring(0, maxLength);
            charCounter.textContent = `${maxLength}/${maxLength} characters`;
            charCounter.className = 'text-danger mt-1';
        } else if (currentLength > maxLength * 0.9) {
            charCounter.className = 'text-warning mt-1';
        } else {
            charCounter.className = 'text-muted mt-1';
        }
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // Alt+T toggles theme
        if (e.altKey && e.key === 't') {
            e.preventDefault();
            themeToggle.click();
        }
        
        // Ctrl+Enter submits form
        if (e.ctrlKey && e.key === 'Enter') {
            e.preventDefault();
            document.getElementById('contactForm').requestSubmit();
        }
        
        // Alt+H goes to home
        if (e.altKey && e.key === 'h') {
            e.preventDefault();
            window.location.href = 'index.jsp';
        }
    });

    // Auto-focus first name field on page load
    window.addEventListener('load', () => {
        document.getElementById('firstName').focus();
    });

    // Add hover effects to contact info cards
    document.querySelectorAll('.contact-info-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });

    // Copy contact info to clipboard
    document.querySelectorAll('.contact-info-text').forEach(item => {
        item.style.cursor = 'pointer';
        item.addEventListener('click', function() {
            const text = this.textContent.trim();
            if (navigator.clipboard && (text.includes('@') || text.includes('+') || text.includes('302001'))) {
                navigator.clipboard.writeText(text).then(() => {
                    // Show temporary success indicator
                    const originalContent = this.innerHTML;
                    this.innerHTML = '<i class="bi bi-check text-success"></i> Copied!';
                    setTimeout(() => {
                        this.innerHTML = originalContent;
                    }, 2000);
                });
            }
        });
    });

    // Add ripple effect to submit button
    document.querySelector('.submit-btn').addEventListener('click', function(e) {
        const button = this;
        const ripple = document.createElement('span');
        const rect = button.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = e.clientX - rect.left - size / 2;
        const y = e.clientY - rect.top - size / 2;
        
        ripple.style.width = ripple.style.height = size + 'px';
        ripple.style.left = x + 'px';
        ripple.style.top = y + 'px';
        ripple.classList.add('ripple');
        
        button.appendChild(ripple);
        
        setTimeout(() => {
            ripple.remove();
        }, 600);
    });

    // Form validation on submit
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        let isValid = true;
        const requiredFields = this.querySelectorAll('[required]');
        
        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                field.classList.add('is-invalid');
                isValid = false;
            }
        });
        
        // Email validation
        const email = document.getElementById('email');
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email.value && !emailRegex.test(email.value)) {
            email.classList.add('is-invalid');
            isValid = false;
        }
        
        if (!isValid) {
            e.preventDefault();
            // Scroll to first invalid field
            const firstInvalid = this.querySelector('.is-invalid');
            if (firstInvalid) {
                firstInvalid.focus();
                firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
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

    // Observe contact info cards for scroll animations
    document.querySelectorAll('.contact-info-card').forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
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

    // Add CSS for ripple effect
    const style = document.createElement('style');
    style.textContent = `
        .submit-btn {
            position: relative;
            overflow: hidden;
        }
        
        .ripple {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.3);
            transform: scale(0);
            animation: ripple-animation 0.6s linear;
            pointer-events: none;
        }
        
        @keyframes ripple-animation {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        .form-control.is-invalid {
            border-color: #dc3545;
            box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.1);
        }
        
        .form-control.is-valid {
            border-color: #198754;
            box-shadow: 0 0 0 3px rgba(25, 135, 84, 0.1);
        }
        
        .form-select.is-invalid {
            border-color: #dc3545;
            box-shadow: 0 0 0 3px rgba(220, 53, 69, 0.1);
        }
        
        .form-select.is-valid {
            border-color: #198754;
            box-shadow: 0 0 0 3px rgba(25, 135, 84, 0.1);
        }
    `;
    document.head.appendChild(style);


</script>
</body>
</html>