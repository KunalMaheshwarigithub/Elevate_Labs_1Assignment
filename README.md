# LinkedIn Schema Design – SQL Project

This repository contains the SQL schema design for a LinkedIn-like professional networking platform. The database structure has been designed and implemented using **MySQL Workbench** as the client interface and the data is managed and stored using the **MySQL Server**.

---

##  Overview

The objective of this SQL project is to simulate the core functionalities of LinkedIn by designing a normalized relational database schema. It supports features like user profiles, education, professional experience, connections, job postings, applications, skills, endorsements, notifications, messaging, likes, and comments on posts.

---

## Tools & Technologies Used

- **MySQL Workbench** – Used to design and execute SQL scripts.
- **MySQL Server** – Backend RDBMS to store and manage the schema and data.
- **SQL (Structured Query Language)** – For defining the schema using `CREATE TABLE`, `ALTER TABLE`, and constraints.

---

##  File Included

- `Linkedin_Schema_Design.sql`: Contains the complete SQL script to:
  - Create the `linkedin` database
  - Define tables
  - Set primary and foreign key constraints
- `Images_Assign1` : Folder that conatins two images of Entity Relationship Diagram and Reverse Engineering Diagram

---

## Database Structure & Table Descriptions

### `user`
Stores basic user profile information including name, email, password, headline, and location.

### `experience`
Stores users' professional experiences such as job title, company, and duration. Linked to `user` via `UserID`.

### `education`
Captures users’ educational background like institution, degree, and description. Also linked to `user`.

### `skills` and `User_Skills`
Defines a list of skills and a many-to-many relationship between users and skills.

### `endorse`
Allows users to endorse skills of other users. It links endorsers to skill owners via user IDs and skills.

### `connections`
Stores the connection requests and statuses between users (similar to LinkedIn’s connect feature).

### `post`
Captures the posts created by users including content, optional image URL, and the post date.

### `comment`
Stores comments on posts, linked to both `user` and `post`.

### `likes`
Tracks which users liked which posts.

### `message`
Stores private messages between users, including sender, receiver, message content, and timestamp.

### `company`
Captures companies’ information such as name, description, website, and location.

###  `job`
Contains job listings posted by companies.

###  `application`
Stores users’ applications to jobs, along with application date and status.

###  `notification`
Captures system-generated notifications for users with read/unread status and timestamps.

---

##  How to Use

1. Open **MySQL Workbench**.
2. Connect to your **MySQL Server**.
3. Open and execute `Linkedin_Schema_Design.sql`.
4. The `linkedin` database will be created with all necessary tables and constraints.

---

##  Author

**Kunal Maheshwari**  
Aspiring Data Engineer | SQL Enthusiast

---

## License

This project is open for educational and learning purposes. Feel free to fork and modify.

