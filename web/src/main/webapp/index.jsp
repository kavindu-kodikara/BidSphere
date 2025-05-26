<%--
  Created by IntelliJ IDEA.
  User: kv
  Date: 5/26/2025
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BidSphere - Online Bidding Platform</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #1cc88a;
            --dark-color: #5a5c69;
            --light-color: #f8f9fc;
        }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: var(--light-color);
        }

        .navbar-brand {
            font-weight: 800;
            font-size: 1.8rem;
        }

        .navbar-brand span {
            color: var(--primary-color);
        }

        .hero-section {
            background: url('https://i.postimg.cc/HkBBSX8w/2151896848.jpg') center/cover no-repeat;
            color: white;
            padding: 5rem 0;
            margin-bottom: 3rem;
            border-radius: 0 0 20px 20px;
            position: relative;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 1.5rem;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 2rem 0 rgba(58, 59, 69, 0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .badge-time {
            background-color: rgba(0, 0, 0, 0.7);
            font-size: 0.9rem;
            font-weight: 600;
        }

        .bid-btn {
            background-color: var(--primary-color);
            border: none;
            font-weight: 600;
        }

        .bid-btn:hover {
            background-color: #3a5bd9;
        }

        .price {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 1.2rem;
        }

        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 3rem 0;
            margin-top: 3rem;
        }

        .login-modal .modal-header {
            background-color: var(--primary-color);
            color: white;
        }

        .login-btn {
            background-color: var(--primary-color);
            border: none;
            padding: 0.5rem 1.5rem;
            font-weight: 600;
        }

        .login-btn:hover {
            background-color: #3a5bd9;
        }

        .countdown {
            font-size: 0.9rem;
            color: #e74a3b;
            font-weight: 600;
        }

        .category-filter {
            margin-bottom: 2rem;
        }

        .category-btn {
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
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
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">How It Works</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
            <div class="d-flex">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">
                    <i class="fas fa-sign-in-alt me-1"></i> Login
                </button>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container text-center">
        <h1 class="display-4 fw-bold mb-4">Discover Amazing Deals</h1>
        <p class="lead mb-5">Bid on exclusive items and win them at incredible prices</p>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="input-group mb-3">
                    <input type="text" class="form-control form-control-lg" placeholder="Search for items...">
                    <button class="btn btn-light btn-lg" type="button">
                        <i class="fas fa-search"></i> Search
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Main Content -->
<div class="container">
    <!-- Category Filter -->
    <div class="category-filter">
        <h5 class="mb-3">Filter by Category:</h5>
        <div>
            <button class="btn btn-outline-primary category-btn active">All</button>
            <button class="btn btn-outline-primary category-btn">Electronics</button>
            <button class="btn btn-outline-primary category-btn">Fashion</button>
            <button class="btn btn-outline-primary category-btn">Home & Garden</button>
            <button class="btn btn-outline-primary category-btn">Collectibles</button>
            <button class="btn btn-outline-primary category-btn">Sports</button>
            <button class="btn btn-outline-primary category-btn">Vehicles</button>
        </div>
    </div>

    <!-- Product Grid -->
    <div class="row">
        <!-- Product 1 -->
        <div class="col-md-3">
            <div class="card">
                <div class="position-relative">
                    <img src="https://i5.walmartimages.com/seo/Open-Box-Apple-iPhone-13-Pro-Max-AP-2484M-1024GB-Blue-US-Model-Factory-Unlocked-Cell-Phone_6ba1f90b-3b76-4e73-bb5c-8e353d988df0.de5842bcd17198be175ce2c6486b140c.jpeg" class="card-img-top" alt="Product Image">
                    <span class="badge badge-time position-absolute top-0 end-0 m-2">Ends in <span class="countdown" data-end="2023-12-31T23:59:59">2d 5h 12m</span></span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Apple iPhone 13 Pro Max</h5>
                    <p class="card-text text-black-50">Brand new sealed iPhone 13 Pro Max 256GB Sierra Blue with warranty.</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <span class="text-muted">Current Bid:</span>
                            <span class="price">$899</span>
                        </div>
                        <div>
                            <span class="text-muted">Bids:</span>
                            <span class="fw-bold">24</span>
                        </div>
                    </div>
                    <a href="product.html" class="btn btn-primary fw-bold w-100">Place Bid</a>
                </div>
            </div>
        </div>

        <!-- Product 2 -->
        <div class="col-md-3">
            <div class="card">
                <div class="position-relative">
                    <img src="https://diamondseast.com/cdn/shop/files/IMG_6384.jpg?v=1724780733" class="card-img-top" alt="Product Image">
                    <span class="badge badge-time position-absolute top-0 end-0 m-2">Ends in <span class="countdown" data-end="2023-12-25T18:00:00">1d 8h 45m</span></span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Rolex Submariner</h5>
                    <p class="card-text text-black-50">Vintage Rolex Submariner 16610 from 2003, excellent condition.</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <span class="text-muted">Current Bid:</span>
                            <span class="price">$7,500</span>
                        </div>
                        <div>
                            <span class="text-muted">Bids:</span>
                            <span class="fw-bold">12</span>
                        </div>
                    </div>
                    <a href="product.html" class="btn btn-primary fw-bold w-100">Place Bid</a>
                </div>
            </div>
        </div>

        <!-- Product 3 -->
        <div class="col-md-3">
            <div class="card">
                <div class="position-relative">
                    <img src="https://georgemillerart.com/cdn/shop/products/il_fullxfull.2240815375_9pzt.jpg?v=1699571350&width=1946" class="card-img-top" alt="Product Image">
                    <span class="badge badge-time position-absolute top-0 end-0 m-2">Ends in <span class="countdown" data-end="2023-12-28T12:00:00">4d 2h 30m</span></span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Original Landscape Painting</h5>
                    <p class="card-text text-black-50">Beautiful oil painting by contemporary artist, 24x36 inches.</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <span class="text-muted">Current Bid:</span>
                            <span class="price">$450</span>
                        </div>
                        <div>
                            <span class="text-muted">Bids:</span>
                            <span class="fw-bold">8</span>
                        </div>
                    </div>
                    <a href="product.html" class="btn btn-primary fw-bold w-100">Place Bid</a>
                </div>
            </div>
        </div>

        <!-- Product 4 -->
        <div class="col-md-3">
            <div class="card">
                <div class="position-relative">
                    <img src="https://www.dpreview.com/files/p/articles/7257804807/DSC09703.acr.jpeg" class="card-img-top" alt="Product Image">
                    <span class="badge badge-time position-absolute top-0 end-0 m-2">Ends in <span class="countdown" data-end="2023-12-22T15:30:00">12h 15m</span></span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Sony A7 IV Mirrorless Camera</h5>
                    <p class="card-text text-black-50">Like new condition with 3 lenses and accessories included.</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <span class="text-muted">Current Bid:</span>
                            <span class="price">$2,100</span>
                        </div>
                        <div>
                            <span class="text-muted">Bids:</span>
                            <span class="fw-bold">18</span>
                        </div>
                    </div>
                    <a href="product.html" class="btn btn-primary fw-bold w-100">Place Bid</a>
                </div>
            </div>
        </div>


    <!-- Pagination -->
    <nav aria-label="Page navigation" class="mt-5">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
            </li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>


<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login to BidSphere</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
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
                    <div class="text-center mb-3">
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                    <hr>
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
<!-- Countdown Timer Script -->
<script>
    // Simple countdown timer for demonstration
    function updateCountdowns() {
        const countdownElements = document.querySelectorAll('.countdown');
        const now = new Date();

        countdownElements.forEach(element => {
            const endDate = new Date(element.getAttribute('data-end'));
            const diff = endDate - now;

            if (diff <= 0) {
                element.textContent = 'Auction ended';
                return;
            }

            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));

            element.textContent = `${days}d ${hours}h ${minutes}m`;
        });
    }

    // Update countdowns every minute
    updateCountdowns();
    setInterval(updateCountdowns, 60000);
</script>
</body>
</html>
