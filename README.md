# Nestjs Boilerplate

This boilerplate provides a robust foundation for building scalable and feature-rich NestJS applications with the following functionalities:

## **Core Features:**

- **Authentication & Authorization:** Secure your API endpoints using industry-standard JSON Web Tokens (JWT) for authentication and Context-Aware Security Level (CASL) for authorization.
- **Database Integration:** Utilize MySQL with TypeORM for efficient database interactions. Benefit from TypeORM's features like migrations for schema management.
- **Redis Caching:** Enhance application performance and reduce database load by leveraging Redis with `@nestjs/cache-manager`.
- **Elasticsearch Integration:** Streamline full-text search and data analysis capabilities by integrating Elasticsearch.
- **Environment Variable Validation:** Employ Joi for robust validation of environment variables, ensuring proper configuration for your application.
- **OpenAPI Documentation (Swagger):** Generate comprehensive API documentation using Swagger to facilitate developer interaction and understanding.
- **Dockerized Deployment:** Package your application in a Docker container, enabling easy deployment and scalability across environments.
- **Development Workflow:**
  - **Husky:** Enforce code linting and formatting with Husky, streamlining development processes.
  - **ESLint:** Maintain code quality and consistency using ESLint.
  - **Prettier:** Automatically format your code to adhere to defined style preferences.
  - **Commitlint:** Uphold a commit message style guide with Commitlint.
- **Error Handling:** Implement a centralized error handling mechanism for a consistent and informative user experience.

## Installation **(Direct Execution):**

**Create `.env` file:**

```bash
cp .env-example .env
```

```bash
npm run docker:dev
```

You can stop `api-dev` container then run cmd below

```bash
npm ci -f
```

```bash
npm run migrate:run
```

```bash
npm run start:dev
```

## Installation - docker

- Run project inside docker container (with hot reload)
- You may need create database for it
- You may need import database `init.sql` in `src/database/migrations/init.sql`

```bash
npm run docker:dev
```

## Contact

If you have any questions or require assistance with this boilerplate, feel free to reach out to me:

- Email: ncbinh01@gmail.com

## Give it a Star! ⭐

If you find this project useful, please consider giving it a star on GitHub. This helps others discover it and shows your appreciation.
