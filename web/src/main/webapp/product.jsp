<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apple iPhone 13 Pro Max | BidSphere</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #eef2ff;
            --secondary: #10b981;
            --secondary-light: #ecfdf5;
            --danger: #ef4444;
            --dark: #1f2937;
            --gray: #6b7280;
            --light-gray: #f3f4f6;
            --border: #e5e7eb;
            --shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
            color: var(--dark);
            line-height: 1.6;
        }

        .navbar {
            box-shadow: var(--shadow);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
        }

        .navbar-brand span {
            color: var(--primary);
        }

        /* Main Layout */
        .auction-container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .auction-grid {
            display: grid;
            gap: 2rem;
        }

        @media (max-width: 992px) {
            .auction-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Product Card */
        .product-card {
            background: white;
            border-radius: 12px;
            box-shadow: var(--shadow-md);
            overflow: hidden;
            border: 1px solid var(--border);
        }

        .product-image-container {
            background-color: var(--light-gray);
            padding: 2rem;
            text-align: center;
            height: 350px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-image {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }

        .product-details {
            padding: 1.5rem 2rem 2rem;
        }

        .auction-timer {
            display: inline-flex;
            align-items: center;
            background-color: var(--danger);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .current-bid {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary);
            margin: 1rem 0;
        }

        .basePrice-info-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
            margin: 1.5rem 0;
        }

        .basePrice-info-item {
            background: var(--light-gray);
            border-radius: 8px;
            padding: 1rem;
            text-align: center;
        }

        .basePrice-info-label {
            font-size: 0.85rem;
            color: var(--gray);
            margin-bottom: 0.5rem;
        }

        .basePrice-info-value {
            font-weight: 600;
            font-size: 1.1rem;
        }

        /* Bidding History */
        .history-card {
            background: white;
            border-radius: 12px;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border);
            height: 350px;
            display: flex;
            flex-direction: column;
        }

        .history-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--border);
        }

        .bid-history {
            flex: 1;
            overflow-y: auto;
            padding: 0 2rem;
        }

        .bid-item {
            padding: 1rem 0;
            border-bottom: 1px solid var(--border);
        }

        .bid-item:last-child {
            border-bottom: none;
        }

        .bid-user {
            font-weight: 600;
            color: var(--primary);
        }

        .bid-amount {
            font-weight: 700;
        }

        .bid-time {
            font-size: 0.85rem;
            color: var(--gray);
        }

        /* Bidding Controls */
        .controls-card {
            background: white;
            border-radius: 12px;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border);
            margin-top: 2rem;
            grid-column: 1 / -1;
        }

        .controls-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--border);
        }

        .bid-options {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            padding: 2rem;
        }

        @media (max-width: 768px) {
            .bid-options {
                grid-template-columns: 1fr;
            }
        }

        .bid-option {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            border: 1px solid var(--border);
        }

        .bid-option-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .bid-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: white;
        }

        .manual-bid .bid-icon {
            background-color: var(--primary);
        }

        .auto-bid .bid-icon {
            background-color: var(--secondary);
        }

        .bid-title {
            font-weight: 600;
            margin: 0;
        }

        .bid-input-container {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .bid-input {
            padding-left: 2.5rem;
            height: 50px;
            border-radius: 8px;
            border: 1px solid var(--border);
        }

        .currency-symbol {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            font-weight: 600;
            color: var(--dark);
        }

        .btn-bid {
            background-color: var(--primary);
            border: none;
            font-weight: 600;
            padding: 0.75rem;
            border-radius: 8px;
            width: 100%;
            transition: all 0.2s;
        }

        .btn-bid:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
        }

        .btn-auto-bid {
            background-color: var(--secondary);
            border: none;
            font-weight: 600;
            padding: 0.75rem;
            border-radius: 8px;
            width: 100%;
            transition: all 0.2s;
        }

        .btn-auto-bid:hover {
            background-color: #0d9488;
            transform: translateY(-2px);
        }

        /* Custom scrollbar */
        .bid-history::-webkit-scrollbar {
            width: 6px;
        }

        .bid-history::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .bid-history::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            border-radius: 3px;
        }

        .bid-section {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--shadow-md);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .current-bid {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
        }

        .bid-form .input-group {
            margin-bottom: 1rem;
        }

        .autobid-toggle {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .autobid-badge {
            background-color: var(--secondary);
            color: white;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 600;
            margin-left: 0.5rem;
        }

        .btn-bid {
            background-color: var(--primary);
            border: none;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            transition: background-color 0.3s ease;
        }

        .btn-bid:hover {
            background-color: #4338ca; /* slightly darker than --primary */
        }

        .btn-outline-bid {
            border: 2px solid var(--primary);
            color: var(--primary);
            font-weight: 600;
            background-color: transparent;
            transition: all 0.3s ease;
        }

        .btn-outline-bid:hover {
            background-color: var(--primary);
            color: white;
        }

    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <span>Bid</span>Sphere
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">How It Works</a>
                </li>
            </ul>
            <div class="d-flex">
                <button class="btn btn-outline-light me-2" data-bs-toggle="modal" data-bs-target="#loginModal">
                    <i class="fas fa-sign-in-alt me-1"></i> Login
                </button>
                <button class="btn btn-primary">
                    <i class="fas fa-user-plus me-1"></i> Register
                </button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="auction-container">
    <div class="auction-grid">

        <div class="row">

            <div class="col-6">
                <!-- Product Details -->
                <div class="product-card">
                    <div class="product-image-container">
                        <img src="https://i5.walmartimages.com/seo/Open-Box-Apple-iPhone-13-Pro-Max-AP-2484M-1024GB-Blue-US-Model-Factory-Unlocked-Cell-Phone_6ba1f90b-3b76-4e73-bb5c-8e353d988df0.de5842bcd17198be175ce2c6486b140c.jpeg" class="product-image" alt="Apple iPhone 13 Pro Max">
                    </div>
                    <div class="product-details">
                        <div class="auction-timer">
                            <i class="fas fa-clock me-2"></i>
                            <span>Ends in 2d 5h 12m</span>
                        </div>
                        <h2>Apple iPhone 13 Pro Max 256GB</h2>
                        <div class="d-flex align-items-center my-3">
                            <span class="text-muted me-3">Seller: TechDealsOfficial</span>
                            <span class="badge bg-success">New</span>
                        </div>
                        <p class="mb-4">Brand new sealed iPhone 13 Pro Max in Sierra Blue with 1-year Apple warranty included. Never opened, original packaging with all accessories.</p>

                        <div class="current-bid">$899.00</div>

                        <div class="basePrice-info-grid">
                            <div class="basePrice-info-item">
                                <div class="basePrice-info-label">Starting Price</div>
                                <div class="basePrice-info-value">$799.00</div>
                            </div>
                            <div class="basePrice-info-item">
                                <div class="basePrice-info-label">Bid Increment</div>
                                <div class="basePrice-info-value">$10.00</div>
                            </div>
                            <div class="basePrice-info-item">
                                <div class="basePrice-info-label">Buy It Now</div>
                                <div class="basePrice-info-value">$1,099.00</div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center text-muted">
                            <i class="fas fa-eye me-2"></i>
                            <span class="me-3">12 people watching</span>
                            <i class="fas fa-gavel me-2"></i>
                            <span>24 bids placed</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6">
                <!-- Bidding History -->
                <div class=" history-card">
                    <div class="history-header">
                        <h5>Bidding Activity</h5>
                    </div>
                    <div class="bid-history">
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">Bidder123</span> bid <span class="bid-amount">$899.00</span></span>
                                <span class="bid-time">just now</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">TechLover</span> bid <span class="bid-amount">$889.00</span></span>
                                <span class="bid-time">2 minutes ago</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">Bidder123</span> bid <span class="bid-amount">$879.00</span></span>
                                <span class="bid-time">5 minutes ago</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">PhoneFanatic</span> bid <span class="bid-amount">$869.00</span></span>
                                <span class="bid-time">12 minutes ago</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">Bidder123</span> bid <span class="bid-amount">$859.00</span></span>
                                <span class="bid-time">18 minutes ago</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">GadgetGuru</span> bid <span class="bid-amount">$849.00</span></span>
                                <span class="bid-time">25 minutes ago</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">MobileExpert</span> bid <span class="bid-amount">$839.00</span></span>
                                <span class="bid-time">42 minutes ago</span>
                            </div>
                        </div>
                        <div class="bid-item">
                            <div class="d-flex justify-content-between">
                                <span><span class="bid-user">TechEnthusiast</span> bid <span class="bid-amount">$829.00</span></span>
                                <span class="bid-time">1 hour ago</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bidding Controls -->
                <div class=" col-12 mt-4">
                    <!-- Bid Section -->
                    <div class="bid-section" >
                        <div class="text-center mb-4">
                            <span class="text-muted">Current Bid:</span>
                            <div class="current-bid">$899.00</div>
                            <span class="text-muted">24 bids placed</span>
                        </div>

                        <div class="mb-4">
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted">Starting Price:</span>
                                <span>$799.00</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-muted">Bid Increment:</span>
                                <span>$10.00</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span class="text-muted">Buy It Now:</span>
                                <span>$1,099.00</span>
                            </div>
                        </div>

                        <div class="autobid-toggle">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" id="autobidToggle" checked>
                                <label class="form-check-label" for="autobidToggle">Enable Auto-Bid</label>
                            </div>
                            <span class="autobid-badge">PRO</span>
                        </div>

                        <div class="bid-form mb-4">
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control" placeholder="Enter your bid amount" id="bidAmount" min="909" step="10" value="909">
                                <span class="input-group-text">.00</span>
                            </div>
                            <small class="text-muted">Next minimum bid: $909.00</small>

                            <div class="mt-3" id="autobidSection">
                                <label for="maxBid" class="form-label">Set your maximum bid</label>
                                <div class="input-group mb-2">
                                    <span class="input-group-text">$</span>
                                    <input type="number" class="form-control" placeholder="Your max bid" id="maxBid" min="919" step="10" value="1000">
                                    <span class="input-group-text">.00</span>
                                </div>
                                <small class="text-muted">We'll automatically bid for you up to this amount</small>
                            </div>
                        </div>

                        <button class="btn btn-bid w-100 mb-3">
                            <i class="fas fa-gavel me-2"></i> Place Bid
                        </button>
                        <button class="btn btn-outline-bid w-100">
                            <i class="fas fa-shopping-cart me-2"></i> Buy It Now
                        </button>

                        <div class="text-center mt-3">
                            <a href="#" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#loginModal">
                                <i class="fas fa-sign-in-alt me-1"></i> Login to bid
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>






    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white py-4 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p class="mb-0">&copy; 2023 BidSphere. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#" class="text-white me-3">Privacy Policy</a>
                <a href="#" class="text-white">Terms of Service</a>
            </div>
        </div>
    </div>
</footer>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login to BidSphere</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="loginEmail" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="loginEmail" placeholder="name@example.com">
                    </div>
                    <div class="mb-3">
                        <label for="loginPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="loginPassword" placeholder="Enter your password">
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
                    <div class="text-center">
                        <p class="mb-0">Don't have an account? <a href="#" class="text-decoration-none fw-bold">Register here</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>