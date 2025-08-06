<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
<head>
    <meta charset="UTF-8"/>
    <title>Dashboard - Online Billing System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --sidebar-width: 280px;
            --navbar-height: 70px;
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --card-shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --border-radius: 12px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        [data-bs-theme="dark"] {
            --bs-body-bg: #0f1419;
            --bs-body-color: #e2e8f0;
            --sidebar-bg: #1a202c;
            --card-bg: #2d3748;
            --border-color: #4a5568;
        }

        [data-bs-theme="light"] {
            --sidebar-bg: #ffffff;
            --card-bg: #ffffff;
            --border-color: #e2e8f0;
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

        /* Navbar */
        .navbar {
            height: var(--navbar-height);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--border-color);
            z-index: 1050;
            transition: var(--transition);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem 1rem;
            background: var(--card-bg);
            border-radius: 50px;
            border: 1px solid var(--border-color);
            transition: var(--transition);
        }

        .user-avatar {
            width: 32px;
            height: 32px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.875rem;
        }

        .theme-toggle {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 50px;
            padding: 0.5rem;
            transition: var(--transition);
            cursor: pointer;
        }

        .theme-toggle:hover {
            transform: scale(1.05);
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: var(--navbar-height);
            left: 0;
            width: var(--sidebar-width);
            height: calc(100vh - var(--navbar-height));
            background: var(--sidebar-bg);
            border-right: 1px solid var(--border-color);
            overflow-y: auto;
            z-index: 1040;
            transform: translateX(0);
            transition: var(--transition);
            backdrop-filter: blur(10px);
        }

        .sidebar.collapsed {
            transform: translateX(-100%);
        }

        .sidebar-nav {
            padding: 1.5rem 0;
        }

        .nav-item {
            margin: 0.25rem 1rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.875rem 1.25rem;
            color: var(--bs-body-color);
            text-decoration: none;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .nav-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 100%;
            background: var(--primary-gradient);
            transition: width 0.3s ease;
            z-index: -1;
        }

        .nav-link:hover::before,
        .nav-link.active::before {
            width: 100%;
        }

        .nav-link:hover,
        .nav-link.active {
            color: white;
            transform: translateX(4px);
        }

        .nav-icon {
            font-size: 1.125rem;
            width: 20px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            margin-left: var(--sidebar-width);
            padding-top: var(--navbar-height);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            transition: var(--transition);
        }

        .main-content.expanded {
            margin-left: 0;
        }

        /* Dashboard Header */
        .dashboard-header {
            padding: 2rem;
            background: var(--card-bg);
            border-bottom: 1px solid var(--border-color);
            margin-bottom: 0;
        }

        .dashboard-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .dashboard-subtitle {
            color: var(--bs-secondary-color);
            font-size: 1.125rem;
        }

        /* Summary Cards */
        .summary-cards {
            padding: 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 0;
        }

        .summary-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .summary-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: var(--primary-gradient);
        }

        .summary-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--card-shadow-hover);
        }

        .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1rem;
        }

        .card-title {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--bs-secondary-color);
            text-transform: uppercase;
            letter-spacing: 0.025em;
            margin-bottom: 0.5rem;
        }

        .card-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--bs-body-color);
        }

        /* Content Area */
        .content-area {
            flex: 1;
            padding: 0 2rem 2rem;
        }

        .iframe-container {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            overflow: hidden;
            height: calc(100vh - 400px);
            min-height: 500px;
        }

        .iframe-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        /* Footer */
        .footer {
            background: var(--card-bg);
            border-top: 1px solid var(--border-color);
            padding: 3rem 0 1.5rem;
            margin-top: auto;
        }

        .footer h6 {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--bs-body-color);
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 0.5rem;
        }

        .footer-links a {
            color: var(--bs-secondary-color);
            text-decoration: none;
            transition: var(--transition);
        }

        .footer-links a:hover {
            color: var(--bs-primary);
        }

        /* Mobile Styles */
        @media (max-width: 768px) {
            :root {
                --sidebar-width: 100%;
            }

            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.show {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .dashboard-header,
            .summary-cards,
            .content-area {
                padding: 1rem;
            }

            .summary-cards {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .iframe-container {
                height: calc(100vh - 300px);
            }

            .user-info span {
                display: none;
            }
        }

        @media (max-width: 576px) {
            .dashboard-title {
                font-size: 1.5rem;
            }

            .summary-card {
                padding: 1rem;
            }

            .card-value {
                font-size: 1.5rem;
            }
        }

        /* Loading Animation */
        .loading {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 200px;
            color: var(--bs-secondary-color);
        }

        .spinner-border {
            width: 2rem;
            height: 2rem;
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.6s ease-out;
        }

        /* Backdrop for mobile */
        .sidebar-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1039;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition);
        }

        .sidebar-backdrop.show {
            opacity: 1;
            visibility: visible;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
    <div class="container-fluid px-3">
        <div class="d-flex align-items-center">
            <button class="btn btn-link d-lg-none me-2 p-1" id="sidebarToggle">
                <i class="bi bi-list fs-4"></i>
            </button>
            <a class="navbar-brand fw-bold" href="#">
                <i class="bi bi-receipt-cutoff me-2"></i>BillingSystem
            </a>
        </div>
        
        <div class="d-flex align-items-center gap-3">
            <button class="theme-toggle btn p-2" id="themeToggle">
                <i class="bi bi-sun-fill" id="themeIcon"></i>
            </button>
            
            <div class="user-info">
                <div class="user-avatar">
                    <%= session.getAttribute("username").toString().substring(0, 1).toUpperCase() %>
                </div>
                <span class="fw-medium">Welcome, <%= session.getAttribute("username") %></span>
            </div>
            
            <a class="btn btn-outline-danger" href="LogoutServlet">
                <i class="bi bi-box-arrow-right me-1"></i>Logout
            </a>
        </div>
    </div>
</nav>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <nav class="sidebar-nav">
        <div class="nav-item">
            <a href="addCustomer.jsp" target="contentFrame" class="nav-link" data-page="add-customer">
                <i class="bi bi-person-plus-fill nav-icon"></i>
                <span>Add Customer</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="CustomerServlet" target="contentFrame" class="nav-link" data-page="view-customers">
                <i class="bi bi-people-fill nav-icon"></i>
                <span>View Customers</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="addItem.jsp" target="contentFrame" class="nav-link" data-page="add-item">
                <i class="bi bi-plus-square-fill nav-icon"></i>
                <span>Add Item</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="ItemServlet" target="contentFrame" class="nav-link" data-page="view-items">
                <i class="bi bi-card-list nav-icon"></i>
                <span>View Items</span>
            </a>
        </div>
        <div class="nav-item">
            <a href="BillingServlet" target="contentFrame" class="nav-link" data-page="calculate-bill">
                <i class="bi bi-calculator-fill nav-icon"></i>
                <span>Calculate Bill</span>
            </a>
        </div>
    </nav>
</div>

<!-- Sidebar Backdrop for Mobile -->
<div class="sidebar-backdrop" id="sidebarBackdrop"></div>

<!-- Main Content -->
<div class="main-content" id="mainContent">
    <!-- Dashboard Header -->
    <div class="dashboard-header fade-in-up">
        <h1 class="dashboard-title">Dashboard</h1>
        <p class="dashboard-subtitle">Manage your billing system efficiently</p>
    </div>

    <!-- Summary Cards -->
    <div class="summary-cards fade-in-up">
        <div class="summary-card">
            <div class="card-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                <i class="bi bi-people-fill"></i>
            </div>
            <div class="card-title">Total Customers</div>
            <div class="card-value">200</div>
        </div>
        
        <div class="summary-card">
            <div class="card-icon" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                <i class="bi bi-box-seam"></i>
            </div>
            <div class="card-title">Total Items</div>
            <div class="card-value">130</div>
        </div>
        
        <div class="summary-card">
            <div class="card-icon" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                <i class="bi bi-receipt"></i>
            </div>
            <div class="card-title">Bills Generated</div>
            <div class="card-value">199</div>
        </div>
        
        <div class="summary-card">
            <div class="card-icon" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);">
                <i class="bi bi-currency-dollar"></i>
            </div>
            <div class="card-title">Total Revenue</div>
            <div class="card-value">7185293</div>
        </div>
    </div>

    <!-- Content Area -->
    <div class="content-area">
        <div class="iframe-container">
            <iframe name="contentFrame" id="contentFrame">
                <div class="loading">
                    <div class="spinner-border me-3" role="status"></div>
                    <span>Loading content...</span>
                </div>
            </iframe>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4">
                    <h6>About BillingSystem</h6>
                    <p class="text-muted">A comprehensive online billing solution that helps you manage customers, items, and billing with ease and efficiency.</p>
                </div>
                <div class="col-lg-4">
                    <h6>Quick Links</h6>
                    <ul class="footer-links">
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="help.jsp" target="contentFrame">Help & Support</a></li>
                        <li><a href="contact.jsp" target="contentFrame">Contact Us</a></li>
                        <li><a href="#" onclick="showPrivacyPolicy()">Privacy Policy</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <h6>Contact Information</h6>
                    <p class="text-muted mb-1">
                        <i class="bi bi-envelope me-2"></i>support@billing.com
                    </p>
                    <p class="text-muted mb-1">
                        <i class="bi bi-telephone me-2"></i>+44 98765 43210
                    </p>
                    <p class="text-muted">
                        <i class="bi bi-geo-alt me-2"></i>Business District, Tech City
                    </p>
                </div>
            </div>
            <hr class="my-4">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="text-muted mb-0">&copy; 2025 Online Billing System. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <small class="text-muted">Made with <i class="bi bi-heart-fill text-danger"></i> for better business</small>
                </div>
            </div>
        </div>
    </footer>
</div>

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

    // Sidebar Management
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('sidebar');
    const sidebarBackdrop = document.getElementById('sidebarBackdrop');
    const mainContent = document.getElementById('mainContent');

    sidebarToggle?.addEventListener('click', toggleSidebar);
    sidebarBackdrop.addEventListener('click', closeSidebar);

    function toggleSidebar() {
        sidebar.classList.toggle('show');
        sidebarBackdrop.classList.toggle('show');
        document.body.style.overflow = sidebar.classList.contains('show') ? 'hidden' : '';
    }

    function closeSidebar() {
        sidebar.classList.remove('show');
        sidebarBackdrop.classList.remove('show');
        document.body.style.overflow = '';
    }

    // Navigation Management
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Remove active class from all links
            navLinks.forEach(l => l.classList.remove('active'));
            // Add active class to clicked link
            this.classList.add('active');
            
            // Close sidebar on mobile after selecting
            if (window.innerWidth <= 768) {
                setTimeout(closeSidebar, 150);
            }
        });
    });

    // Handle window resize
    window.addEventListener('resize', () => {
        if (window.innerWidth > 768) {
            closeSidebar();
        }
    });

    // Content loading management
    const contentFrame = document.getElementById('contentFrame');
    
    contentFrame.addEventListener('load', function() {
        // Could add loading states or analytics here
        console.log('Content loaded successfully');
    });

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

    // Add loading animation when iframe content changes
    function showLoading() {
        const loadingHtml = `
            <div class="loading">
                <div class="spinner-border me-3" role="status"></div>
                <span>Loading content...</span>
            </div>
        `;
        // This would typically be implemented differently for iframe content
    }

    // Initialize tooltips if needed
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize Bootstrap tooltips
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });

    // Privacy policy function (placeholder)
    function showPrivacyPolicy() {
        alert('Privacy Policy would be displayed here. This is a placeholder function.');
    }

    // Add some interactive feedback
    document.querySelectorAll('.summary-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-8px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(-4px)';
        });
    });

    // Keyboard navigation support
    document.addEventListener('keydown', function(e) {
        // ESC key closes sidebar on mobile
        if (e.key === 'Escape' && window.innerWidth <= 768) {
            closeSidebar();
        }
        
        // Alt+T toggles theme
        if (e.altKey && e.key === 't') {
            e.preventDefault();
            themeToggle.click();
        }
    });
</script>
</body>
</html>