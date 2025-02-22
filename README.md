# Project Management App

A simple yet powerful project management tool that enables users to create projects, track their status, and add comments. Built with Ruby on Rails, this app leverages **Devise** for authentication and **Active Record** for data management.

## ✨ Features

- **Project Tracking** – Create projects and update their statuses.
- **Commenting System** – Leave comments on projects for better collaboration.
- **Status History** – Automatically records changes in project status.
- **User Authentication** – Secure login and account management via Devise.

## 📌 Models & Associations

### 🔹 Project
- Attributes:
  - `name` (string) – The project title.
  - `status` (enum) – Tracks project progress (`not_started`, `in_progress`, `on_hold`, `completed`, `cancelled`).
- Associations:
  - `has_many :comments`
  - `has_many :status_histories`

### 🔹 Comment
- Attributes:
  - `content` (text) – User-generated comments.
- Associations:
  - `belongs_to :project`
  - `belongs_to :user`

### 🔹 StatusHistory
- Attributes:
  - `old_status` (enum) – Previous project status.
  - `new_status` (enum) – Updated project status.
- Associations:
  - `belongs_to :project`
  - `belongs_to :user`

### 🔹 User
- Attributes:
  - `name` (string) – User’s full name.
  - `email` (string, unique) – User’s login email.
- Associations:
  - `has_many :comments`
  - `has_many :status_histories`
- Authentication: Managed through **Devise**.

---

## 🚀 Getting Started

### Prerequisites
Ensure your system meets the following requirements:
- Ruby **2.x** or later
- Rails **5.0.7**
- PostgreSQL database

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/project-management.git
   cd project-management
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Database setup**
   ```bash
   rake db:create
   rake db:migrate
   rake db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```
   The app will be available at [http://localhost:3000](http://localhost:3000).

---

## 🛠 Running Tests

This application uses **Minitest** for unit testing. To run the test suite:

1. **Run all tests**
   ```bash
   rails test
   ```

2. **Run tests for specific models**
   ```bash
   rails test test/models/project_test.rb
   rails test test/models/comment_test.rb
   rails test test/models/status_history_test.rb
   rails test test/models/user_test.rb
   ```

---

## 📂 Test Fixtures

Predefined test data is provided in the `test/fixtures/` directory for easier testing:

- `comments.yml` – Sample comment data.
- `projects.yml` – Sample project data.
- `status_histories.yml` – Sample status history data.
- `users.yml` – Sample user data.

Ensure these files exist in `test/fixtures/` to run tests properly.

---

### 🎯 Wrap-Up

This project management app provides a streamlined way to track projects, monitor progress, and collaborate through comments. Whether you're managing a small team or a solo project, this tool ensures efficient workflow tracking.

Want to contribute or improve the project? Fork the repository and submit a pull request! 🚀
