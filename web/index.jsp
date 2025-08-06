<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Billing System</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Custom Styling -->
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            --warning-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
        }

        /* Light Theme Variables */
        [data-bs-theme="light"] {
            --card-bg: #ffffff;
            --border-color: #e2e8f0;
            --glass-bg: rgba(255, 255, 255, 0.8);
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

        .nav-link:hover {
            color: var(--bs-primary) !important;
            transform: translateY(-1px);
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

        /* Hero Section */
        .hero {
            min-height: calc(100vh - var(--navbar-height));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 4rem 2rem;
            position: relative;
            background: var(--bs-body-bg);
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 20% 50%, rgba(102, 126, 234, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(118, 75, 162, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 40% 80%, rgba(240, 147, 251, 0.1) 0%, transparent 50%);
            pointer-events: none;
        }

        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            line-height: 1.2;
        }

        .hero .lead {
            font-size: 1.5rem;
            margin-bottom: 2rem;
            color: var(--bs-secondary-color);
            font-weight: 400;
        }

        .hero-cta {
            background: var(--primary-gradient);
            color: white;
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 50px;
            font-size: 1.125rem;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            box-shadow: var(--card-shadow);
        }

        .hero-cta:hover {
            transform: translateY(-2px);
            box-shadow: var(--card-shadow-hover);
            color: white;
        }

        .hero-image {
            margin-top: 3rem;
            max-width: 100%;
            height: auto;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow-hover);
            overflow: hidden;
        }

        .hero-image img {
            width: 100%;
            height: auto;
            transition: var(--transition);
        }

        .hero-image:hover img {
            transform: scale(1.02);
        }

        /* Features Section */
        .features {
            padding: 5rem 0;
            background: var(--bs-body-bg);
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--primary-gradient);
            border-radius: 2px;
        }

        .feature-card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            overflow: hidden;
            transition: var(--transition);
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--card-shadow-hover);
        }

        .feature-card .card-img-top {
            height: 220px;
            object-fit: cover;
            transition: var(--transition);
        }

        .feature-card:hover .card-img-top {
            transform: scale(1.05);
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin: 0 auto 1.5rem;
            transition: var(--transition);
        }

        .feature-card:hover .feature-icon {
            transform: scale(1.1) rotate(5deg);
        }

        .feature-card .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--bs-body-color);
        }

        .feature-card .card-text {
            color: var(--bs-secondary-color);
            font-size: 1rem;
            line-height: 1.6;
        }

        /* Testimonials Section */
        .testimonials {
            padding: 5rem 0;
            background: var(--bs-body-bg);
        }

        .testimonial-card {
            background: var(--card-bg);
            padding: 2rem;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            height: 100%;
            transition: var(--transition);
            text-align: center;
            position: relative;
        }

        .testimonial-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
            border-radius: var(--border-radius) var(--border-radius) 0 0;
        }

        .testimonial-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-shadow-hover);
        }

        .testimonial-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 1.5rem;
            border: 3px solid transparent;
            background: var(--primary-gradient);
            padding: 2px;
        }

        .testimonial-avatar img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }

        .stars {
            color: #ffc107;
            margin-bottom: 1.5rem;
            font-size: 1.1rem;
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 1.5rem;
            color: var(--bs-body-color);
            font-size: 1rem;
            line-height: 1.6;
        }

        .testimonial-author {
            font-weight: 600;
            color: var(--bs-body-color);
            margin-bottom: 0.25rem;
        }

        .testimonial-role {
            color: var(--bs-secondary-color);
            font-size: 0.875rem;
        }

        /* Footer */
        .footer {
            background: var(--card-bg);
            border-top: 1px solid var(--border-color);
            padding: 3rem 0 1.5rem;
            color: var(--bs-body-color);
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

        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease-out;
        }

        .animate-on-scroll.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero .lead {
                font-size: 1.25rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .testimonial-card {
                padding: 1.5rem;
            }

            .feature-card .card-body {
                padding: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            .hero {
                padding: 2rem 1rem;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .hero .lead {
                font-size: 1.125rem;
            }

            .features, .testimonials {
                padding: 3rem 0;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <%@ page session="true" %>
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
                <button class="theme-toggle btn p-2 me-2" id="themeToggle">
                    <i class="bi bi-sun-fill" id="themeIcon"></i>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <%
                        // Check if user is logged in
                        if (session.getAttribute("user") != null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addCustomer.jsp">Add Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewCustomers.jsp">View Customers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addItem.jsp">Add Item</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewItems.jsp">View Items</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="calculateBill.jsp">Calculate Bill</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content fade-in-up">
            <h1>Welcome to Online Billing System</h1>
            <p class="lead">A modern and intuitive system for managing customers, items, and bills with powerful automation.</p>
            <a href="login.jsp" class="hero-cta">
                <i class="bi bi-arrow-right-circle-fill"></i>
                Get Started
            </a>
            <div class="hero-image">
                <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2015&q=80" alt="Billing System Dashboard" class="img-fluid" />
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2 class="section-title animate-on-scroll">Key Features</h2>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="feature-card card h-100 animate-on-scroll">
                        <img src="https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="Customer Management" class="card-img-top">
                        <div class="card-body text-center">
                            <div class="feature-icon" style="background: var(--primary-gradient);">
                                <i class="bi bi-people-fill"></i>
                            </div>
                            <h5 class="card-title">Customer Management</h5>
                            <p class="card-text">Easily add, view, and update customer details with our intuitive interface and advanced search capabilities.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="feature-card card h-100 animate-on-scroll">
                        <img src="https://images.unsplash.com/photo-1586953208448-b95a79798f07?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="Item Management" class="card-img-top">
                        <div class="card-body text-center">
                            <div class="feature-icon" style="background: var(--secondary-gradient);">
                                <i class="bi bi-box-seam"></i>
                            </div>
                            <h5 class="card-title">Item Management</h5>
                            <p class="card-text">Manage your item inventory with real-time price updates, stock tracking, and comprehensive analytics.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="feature-card card h-100 animate-on-scroll">
                        <img src="https://images.unsplash.com/photo-1554224155-6726b3ff858f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="Automated Billing" class="card-img-top">
                        <div class="card-body text-center">
                            <div class="feature-icon" style="background: var(--success-gradient);">
                                <i class="bi bi-receipt"></i>
                            </div>
                            <h5 class="card-title">Automated Billing</h5>
                            <p class="card-text">Generate bills instantly with intelligent automation, custom templates, and seamless integration.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials">
        <div class="container">
            <h2 class="section-title animate-on-scroll">What Our Users Say</h2>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="testimonial-card animate-on-scroll">
                        <div class="testimonial-avatar">
                            <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="Olivia Brown">
                        </div>
                        <div class="stars">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <p class="testimonial-text">"This billing system has completely transformed our business operations. The interface is intuitive and the automation saves us hours every day!"</p>
                        <div class="testimonial-author">Olivia Brown</div>
                        <div class="testimonial-role">Small Business Owner</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="testimonial-card animate-on-scroll">
                        <div class="testimonial-avatar">
                            <img src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="James Smith">
                        </div>
                        <div class="stars">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <p class="testimonial-text">"Excellent customer support and the automated features are game-changers. Our restaurant operations run much smoother now!"</p>
                        <div class="testimonial-author">James Smith</div>
                        <div class="testimonial-role">Restaurant Owner</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="testimonial-card animate-on-scroll">
                        <div class="testimonial-avatar">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="George Wilson">
                        </div>
                        <div class="stars">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star"></i>
                        </div>
                        <p class="testimonial-text">"The interface is beautiful and functional. The reporting features help us track our business growth effectively!"</p>
                        <div class="testimonial-author">George Wilson</div>
                        <div class="testimonial-role">Retail Store Manager</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="testimonial-card animate-on-scroll">
                        <div class="testimonial-avatar">
                            <img src="https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80" alt="Emily Taylor">
                        </div>
                        <div class="stars">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <p class="testimonial-text">"Perfect for our accounting needs. The system is incredibly stable and processes bills with lightning speed!"</p>
                        <div class="testimonial-author">Emily Taylor</div>
                        <div class="testimonial-role">Freelance Consultant</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4">
                    <h5>About BillingSystem</h5>
                    <p>Online Billing System is a comprehensive, lightweight, and efficient solution for managing your billing needs with modern technology and intuitive design.</p>
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
        // Theme Management (same as dashboard)
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

        // Scroll Animation
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, observerOptions);

        // Observe all elements with animate-on-scroll class
        document.querySelectorAll('.animate-on-scroll').forEach(el => {
            observer.observe(el);
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

        // Add parallax effect to hero section
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const heroContent = document.querySelector('.hero-content');
            const heroImage = document.querySelector('.hero-image');
            
            if (heroContent && heroImage) {
                heroContent.style.transform = `translateY(${scrolled * 0.1}px)`;
                heroImage.style.transform = `translateY(${scrolled * 0.05}px)`;
            }
        });

        // Add loading animation for images
        document.querySelectorAll('img').forEach(img => {
            img.addEventListener('load', function() {
                this.style.opacity = '1';
            });
        });

        // Enhanced hover effects for cards
        document.querySelectorAll('.feature-card, .testimonial-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-12px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Navbar background change on scroll
        window.addEventListener('scroll', () => {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.style.background = 'rgba(var(--glass-bg), 0.95)';
                navbar.style.backdropFilter = 'blur(20px)';
            } else {
                navbar.style.background = 'var(--glass-bg)';
                navbar.style.backdropFilter = 'blur(20px)';
            }
        });

        // Keyboard navigation support
        document.addEventListener('keydown', function(e) {
            // ESC key closes mobile menu
            if (e.key === 'Escape') {
                const navbarCollapse = document.querySelector('.navbar-collapse');
                if (navbarCollapse.classList.contains('show')) {
                    bootstrap.Collapse.getInstance(navbarCollapse).hide();
                }
            }
            
            // Alt+T toggles theme
            if (e.altKey && e.key === 't') {
                e.preventDefault();
                themeToggle.click();
            }
        });

        // Add ripple effect to buttons
        document.querySelectorAll('.hero-cta, .theme-toggle').forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = x + 'px';
                ripple.style.top = y + 'px';
                ripple.classList.add('ripple');
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Add CSS for ripple effect
        const style = document.createElement('style');
        style.textContent = `
            .hero-cta, .theme-toggle {
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

        // Performance optimization: lazy load images
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src || img.src;
                        img.classList.remove('lazy');
                        imageObserver.unobserve(img);
                    }
                });
            });

            document.querySelectorAll('img[data-src]').forEach(img => {
                imageObserver.observe(img);
            });
        }

        // Initialize tooltips
        document.addEventListener('DOMContentLoaded', function() {
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });

        // Privacy policy placeholder function
        function showPrivacy() {
            alert('Privacy Policy\n\nThis is a placeholder for the privacy policy. In a real application, this would display the actual privacy policy content.');
        }

        // Add scroll-to-top functionality
        window.addEventListener('scroll', () => {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            // Show scroll-to-top button after scrolling 500px
            if (scrollTop > 500) {
                if (!document.querySelector('.scroll-top')) {
                    const scrollTopBtn = document.createElement('button');
                    scrollTopBtn.className = 'scroll-top btn btn-primary position-fixed';
                    scrollTopBtn.style.cssText = `
                        bottom: 20px; 
                        right: 20px; 
                        z-index: 1000; 
                        border-radius: 50%; 
                        width: 50px; 
                        height: 50px; 
                        opacity: 0.8;
                        transition: var(--transition);
                    `;
                    scrollTopBtn.innerHTML = '<i class="bi bi-arrow-up"></i>';
                    scrollTopBtn.addEventListener('click', () => {
                        window.scrollTo({ top: 0, behavior: 'smooth' });
                    });
                    document.body.appendChild(scrollTopBtn);
                }
            } else {
                const scrollTopBtn = document.querySelector('.scroll-top');
                if (scrollTopBtn) {
                    scrollTopBtn.remove();
                }
            }
        });

        // Add focus management for accessibility
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Tab') {
                document.body.classList.add('using-keyboard');
            }
        });

        document.addEventListener('mousedown', function() {
            document.body.classList.remove('using-keyboard');
        });

    </script>
</body>
</html>