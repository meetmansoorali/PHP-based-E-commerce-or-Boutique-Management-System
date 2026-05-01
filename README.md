# Closet Baddie - Full-Stack E-Commerce System

Closet Baddie is a complete PHP-based e-commerce solution designed for fashion boutiques. It bridges the gap between a stylish, user-friendly shopping experience for customers and a data-driven management suite for administrators[cite: 1].

---

## 🏗️ System Overview

The project is divided into two primary environments:

### 1. The Boutique (Frontend)
The customer-facing side focuses on conversion and user experience.
*   **Product Discovery:** Dynamic shop pages (`shop.php`) and detailed product views (`view_products.php`)[cite: 1].
*   **User Accounts:** Secure registration and login systems for customers to track their history[cite: 1].
*   **Shopping Logic:** Integrated cart and wishlist functionality to manage items before purchase[cite: 1].
*   **Checkout Pipeline:** A streamlined flow to capture shipping details and finalize orders[cite: 1].

### 2. The Command Center (Backend)
The `/admin` directory houses the management tools required to run the business.
*   **Business Intelligence:** A dedicated dashboard for tracking sales, revenue, and growth metrics[cite: 1].
*   **Inventory Control:** Tools to add, edit, or remove products and manage stock levels[cite: 1].
*   **Order Fulfillment:** A centralized interface to monitor new orders and update shipping statuses[cite: 1].
*   **Marketing & Staff:** Manage newsletter subscribers and administrative staff accounts[cite: 1].

---

## 📂 Directory Structure



*   `/admin`: All administrative logic, analytics, and management scripts[cite: 1].
*   `/assets`: 
    *   `/css`: Centralized stylesheets for both frontend and backend modules[cite: 1].
    *   `/img`: Product photography and system icons[cite: 1].
*   `/root`: Customer-facing pages (Home, Shop, Cart, Checkout, Profile)[cite: 1].

---

## 🛠️ Technical Stack

*   **Language:** PHP (Server-side logic)[cite: 1].
*   **Database:** MySQL (Relational data storage for products, orders, and users)[cite: 1].
*   **Frontend:** HTML5, CSS3, and JavaScript[cite: 1].
*   **Security:** Role-based access control (RBAC) and session-based authentication[cite: 1].

---

## 🚀 Getting Started

### Prerequisites
*   A local or remote server (XAMPP, WAMP, or Nginx).
*   PHP 7.4+ and MySQL.

### Installation
1.  **Database Setup:** Import the provided SQL schema into your MySQL instance.
2.  **Configuration:** Update your database connection strings in the core config files.
3.  **Permissions:** Ensure the `/assets/img` directory has write permissions for product uploads.
4.  **Admin Access:** Use the `auth_admin.php` logic to set up your primary administrative account[cite: 1].

---

## 🛡️ Security Features
*   **Access Guards:** Unauthorized users are automatically redirected via `blocked.php` if they attempt to access sensitive admin files[cite: 1].
*   **Session Management:** Secure logout and session destruction to protect user and admin data[cite: 1].
