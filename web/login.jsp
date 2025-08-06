<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login - Online Billing System</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
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

        /* Login Container */
        .login-section {
            min-height: calc(100vh - var(--navbar-height));
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .login-container {
            max-width: 480px;
            width: 100%;
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow-hover);
            border: 1px solid var(--border-color);
            overflow: hidden;
            position: relative;
            backdrop-filter: blur(10px);
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
        }

        .login-header {
            padding: 2.5rem 2rem 1rem;
            text-align: center;
            position: relative;
        }

        .login-icon {
            width: 80px;
            height: 80px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 2rem;
            box-shadow: var(--card-shadow);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .login-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .login-subtitle {
            color: var(--bs-secondary-color);
            font-size: 1rem;
            margin-bottom: 0;
        }

        .login-form {
            padding: 0 2rem 2.5rem;
        }

        .form-floating {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-control {
            background: var(--input-bg);
            border: 2px solid var(--input-border);
            border-radius: 12px;
            padding: 1rem 1.25rem;
            font-size: 1rem;
            transition: var(--transition);
            color: var(--bs-body-color);
            height: auto;
        }

        .form-control:focus {
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

        .input-group {
            position: relative;
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

        .form-control.with-icon {
            padding-left: 3rem;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--bs-secondary-color);
            cursor: pointer;
            z-index: 10;
            padding: 0.25rem;
            border-radius: 4px;
            transition: var(--transition);
        }

        .password-toggle:hover {
            color: var(--bs-primary);
            background: rgba(102, 126, 234, 0.1);
        }

        .login-btn {
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
            margin-bottom: 1.5rem;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--card-shadow-hover);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        .login-btn.loading {
            pointer-events: none;
        }

        .login-btn .spinner {
            display: none;
        }

        .login-btn.loading .spinner {
            display: inline-block;
        }

        .login-btn.loading .btn-text {
            display: none;
        }

        .alert {
            border-radius: 12px;
            border: none;
            padding: 1rem 1.25rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 500;
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(220, 38, 38, 0.1) 0%, rgba(185, 28, 28, 0.1) 100%);
            color: #dc2626;
            border: 1px solid rgba(220, 38, 38, 0.2);
        }

        .alert-success {
            background: linear-gradient(135deg, rgba(5, 150, 105, 0.1) 0%, rgba(4, 120, 87, 0.1) 100%);
            color: #059669;
            border: 1px solid rgba(5, 150, 105, 0.2);
        }

        .login-footer {
            text-align: center;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
            margin-top: 1rem;
        }

        .forgot-password {
            color: var(--bs-secondary-color);
            text-decoration: none;
            font-size: 0.9rem;
            transition: var(--transition);
        }

        .forgot-password:hover {
            color: var(--bs-primary);
        }

        /* Footer */
        .footer {
            background: var(--card-bg);
            border-top: 1px solid var(--border-color);
            padding: 3rem 0 1.5rem;
            color: var(--bs-body-color);
            margin-top: auto;
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

        /* Responsive Design */
        @media (max-width: 576px) {
            .login-container {
                margin: 1rem;
                border-radius: 16px;
            }

            .login-header {
                padding: 2rem 1.5rem 1rem;
            }

            .login-form {
                padding: 0 1.5rem 2rem;
            }

            .login-title {
                font-size: 1.75rem;
            }

            .login-icon {
                width: 70px;
                height: 70px;
                font-size: 1.75rem;
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

        /* Focus styles for accessibility */
        .form-control:focus,
        .login-btn:focus,
        .theme-toggle:focus {
            outline: 2px solid var(--bs-primary);
            outline-offset: 2px;
        }

        /* High contrast mode support */
        @media (prefers-contrast: high) {
            .form-control {
                border-width: 3px;
            }
            
            .login-btn {
                border: 2px solid white;
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
                <li class="nav-item"><a class="nav-link active" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="help.jsp">Help</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Login Section -->
<section class="login-section">
    <div class="login-container fade-in-up">
        <!-- Login Header -->
        <div class="login-header">
            <div class="login-icon">
                <i class="bi bi-person-circle"></i>
            </div>
            <h1 class="login-title">Welcome Back</h1>
            <p class="login-subtitle">Sign in to your account to continue</p>
        </div>

        <!-- Login Form -->
        <div class="login-form">
            <form action="LoginServlet" method="post" id="loginForm">
                <% String error = (String) request.getAttribute("error"); 
                   if (error != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                        <%= error %>
                    </div>
                <% } %>

                <% String success = (String) request.getAttribute("success"); 
                   if (success != null) { %>
                    <div class="alert alert-success" role="alert">
                        <i class="bi bi-check-circle-fill"></i>
                        <%= success %>
                    </div>
                <% } %>

                <div class="mb-3">
                    <label for="username" class="form-label">
                        <i class="bi bi-person"></i>
                        Username
                    </label>
                    <div class="input-group">
                        <i class="bi bi-person input-icon"></i>
                        <input 
                            required 
                            type="text" 
                            class="form-control with-icon" 
                            name="username" 
                            id="username" 
                            placeholder="Enter your username"
                            autocomplete="username"
                            aria-describedby="usernameHelp"
                        >
                    </div>
                </div>

                <div class="mb-4">
                    <label for="password" class="form-label">
                        <i class="bi bi-lock"></i>
                        Password
                    </label>
                    <div class="input-group">
                        <i class="bi bi-lock input-icon"></i>
                        <input 
                            required 
                            type="password" 
                            class="form-control with-icon" 
                            name="password" 
                            id="password" 
                            placeholder="Enter your password"
                            autocomplete="current-password"
                            aria-describedby="passwordHelp"
                        >
                        <button type="button" class="password-toggle" onclick="togglePassword()" aria-label="Toggle password visibility">
                            <i class="bi bi-eye" id="passwordToggleIcon"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" class="login-btn" id="loginBtn">
                    <span class="btn-text">
                        <i class="bi bi-box-arrow-in-right me-2"></i>
                        Sign In
                    </span>
                    <span class="spinner">
                        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        Signing in...
                    </span>
                </button>

                <div class="login-footer">
                    <a href="#" class="forgot-password" onclick="showForgotPassword()">
                        <i class="bi bi-question-circle me-1"></i>
                        Forgot your password?
                    </a>
                </div>
            </form>
        </div>
    </div>
</section>

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

    // Password toggle functionality
    function togglePassword() {
        const passwordInput = document.getElementById('password');
        const passwordToggleIcon = document.getElementById('passwordToggleIcon');
        
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            passwordToggleIcon.className = 'bi bi-eye-slash';
        } else {
            passwordInput.type = 'password';
            passwordToggleIcon.className = 'bi bi-eye';
        }
    }

    // Form submission with loading state
    document.getElementById('loginForm').addEventListener('submit', function() {
        const loginBtn = document.getElementById('loginBtn');
        loginBtn.classList.add('loading');
        
        // Prevent double submission
        loginBtn.disabled = true;
        
        // Re-enable after 5 seconds as fallback
        setTimeout(() => {
            loginBtn.classList.remove('loading');
            loginBtn.disabled = false;
        }, 5000);
    });

    // Input validation and styling
    document.querySelectorAll('.form-control').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
            
            // Add validation styling
            if (this.value.trim() === '') {
                this.classList.add('is-invalid');
            } else {
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

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // Alt+T toggles theme
        if (e.altKey && e.key === 't') {
            e.preventDefault();
            themeToggle.click();
        }
        
        // Enter key submits form when focused on inputs
        if (e.key === 'Enter' && document.activeElement.classList.contains('form-control')) {
            document.getElementById('loginForm').requestSubmit();
        }
    });

    // Auto-focus username field on page load
    window.addEventListener('load', () => {
        document.getElementById('username').focus();
    });

    // Placeholder functions
    function showForgotPassword() {
        alert('Forgot Password\n\nPlease contact your system administrator to reset your password.\n\nEmail: support@billing.com\nPhone: +44 98765 43210');
    }

    function showPrivacy() {
        alert('Privacy Policy\n\nThis is a placeholder for the privacy policy. In a real application, this would display the actual privacy policy content.');
    }

    // Add ripple effect to login button
    document.querySelector('.login-btn').addEventListener('click', function(e) {
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

    // Add CSS for ripple effect
    const style = document.createElement('style');
    style.textContent = `
        .login-btn {
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
    `;
    document.head.appendChild(style);

    // Console welcome message
    console.log(`
    🔐 Login Page Ready!
    
    Theme: Use Alt+T to toggle theme
    Shortcuts: Enter to submit, Tab to navigate
    
    Built with ❤️ for secure access
    `);
</script>
</body>
</html>