# Keycloak with Postgres and Static Webpage on Azure VM

## Overview
This project demonstrates how to deploy Keycloak for identity and access management, backed by a Postgres database, alongside a static web page protected by Keycloak authentication. Postgress database and Keycloak run inside containers on an Azure virtual machine configured per requirement, in minimal container environment. The static webpage access is secured by Keycloak via OpenID Connect integration.

### Architecture & Components

### Azure VM
Provides the base compute environment for container orchestration. Chosen for flexibility and ease of provisioning a minimal container host.

#### Docker Compose
Used to orchestrate multi-container deployment (Keycloak and Postgres).

#### Keycloak
An open-source identity and access management tool implementing OpenID Connect and OAuth2 standards.

#### Postgres
Used as Keycloak’s persistent user and configuration data store.

#### Nginx
Serves as a reverse proxy for Keycloak with SSL termination. Nginx was used for HTTPS termination and forwarding headers because Keycloak requires correct protocol headers (X-Forwarded-Proto) and Nginx provides flexible configuration for these.

#### Static Webpage
A minimal HTML page demonstrating protection with Keycloak authentication using the official Keycloak JavaScript adapter.

### Images Used

quay.io/keycloak/keycloak:24.0 — Official Keycloak image, stable, includes latest features and security patches.

postgres:15 — Official Postgres image, widely used, reliable, and compatible with Keycloak’s database requirements.

### Network Configuration
The Azure VM exposes ports 80 and 443 for HTTP and HTTPS access.

Nginx listens on 443 for SSL traffic, proxies requests to Keycloak running inside Docker on port 8080.
Docker Compose network connects Keycloak container with Postgres container internally using service names (e.g., postgres). Keycloak is configured with PROXY_ADDRESS_FORWARDING=true to properly handle reverse proxy headers for secure redirects and URL building. This setup allows for quick iteration and debugging and simplifies deployment automation using tools like Ansible.For a demo or small-scale deployment, this approach balances ease of use and sufficient production-grade features.

### Possible Project Extensions and Benefits

- Add Kubernetes orchestration for better scalability, rolling upgrades, and self-healing capabilities for production environments.
- Enable SSL certificates via Let’s Encrypt instead of self-signed
- Integrate a dynamic frontend application (React or Angular) to enrich user experience and more flexible client-side logic with secured Keycloak integration. 
- Add a centralized logging and monitoring stack
- Implement Role-Based Access Control (RBAC) in Keycloak
