# Auth Express API

A robust, production-ready RESTful API built with Node.js and Express, focusing on secure user authentication and authorization.

## 🚀 Overview

This project provides a comprehensive authentication system including sign-up, sign-in, and sign-out functionalities. It leverages a layered architecture to separate concerns, ensuring the codebase remains modular, testable, and easy to scale.

## Core Features

*   **User Registration**: Secure sign-up with password hashing.
*   **Authentication**: JWT-based login with HTTP-only cookies.
*   **Security**: Middleware integration for CORS, secure headers, and data validation.
*   **Database Management**: Serverless PostgreSQL integration using Drizzle ORM.

## 🛠️ Tech Stack

| Layer | Technology |
| :--- | :--- |
| **Runtime** | Node.js |
| **Framework** | Express.js |
| **Database** | Neon (Serverless Postgres) |
| **ORM** | Drizzle ORM |
| **Validation** | Zod |
| **Security**| Helmet, bcrypt, JSON Web Tokens (JWT) |
| **Logging** | Winston, Morgan |

## 📂 Project Structure

The codebase follows a modular directory structure to maintain a clear separation of concerns:

```
src/
├── config/         # Database (Neon/Drizzle) and logger configurations.
├── controllers/    # Request handlers; manages HTTP responses.
├── models/         # Data schemas and table definitions.
├── routes/         # API endpoint definitions and mapping.
├── services/       # Core business logic (e.g., hashing, token generation).
├── validations/    # Zod schemas for incoming data validation.
├── utils/          # Global helper functions (e.g., JWT signing).
├── app.js          # App middleware and route initialization.
└── server.js       # Server entry point and listener.
```

## 🔄 Request Flow

To ensure consistency and security, every request follows a predictable lifecycle:

1.  **Route**: An HTTP request hits an endpoint (e.g., `/api/auth/sign-up`).
2.  **Controller**: The specific controller is invoked.
3.  **Validation**: Request data is validated against Zod schemas.
4.  **Service**: The controller delegates business logic to a service.
5.  **Database**: The service interacts with Neon via Drizzle ORM.
6.  **Response**: The service returns data to the controller, which sends the final HTTP response.

## 🔐 Security & Implementation Details

### Authentication Flow (Sign-Up Example)

1.  The client sends a `POST` request with user credentials.
2.  The `auth.service.js` hashes the password using `bcrypt`.
3.  A new user record is stored in the database.
4.  A JWT is generated and sent back to the client via an HTTP-only cookie to prevent XSS-based token theft.

### Middleware

*   **Helmet**: Sets secure HTTP headers to protect against common web vulnerabilities.
*   **CORS**: Configured for secure cross-origin resource sharing.
*   **Cookie-Parser**: Enables secure handling of authentication cookies.

## ⚖️ Tradeoffs & Future Roadmap

While the project provides a solid foundation, there are recognized areas for growth:

*   **Rate Limiting**: Currently, the API does not limit requests. Implementing rate limiting is a priority to prevent brute-force attacks.
*   **Error Handling**: The current error-handling logic is functional but basic. Future updates will include a global error-handling middleware for more granular, user-friendly responses.

## 🚥 Getting Started

1.  Clone the repository.
2.  Install dependencies:
    ```bash
    npm install
    ```
3.  **Configure Environment**: Create a `.env` file with your Neon DB connection string and JWT secrets.
4.  **Run Migrations**: Push your Drizzle schemas to the Neon database.
5.  **Start the server**:
    ```bash
    npm start
    ```
