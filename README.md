# Wellmum – Automated AWS Infrastructure

[![Terraform](https://img.shields.io/badge/Terraform-~1.9-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazon-aws)](https://aws.amazon.com/)
[![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-2088FF?logo=github-actions)](https://github.com/features/actions)
[![YouTube](https://img.shields.io/badge/Demo-YouTube-FF0000?logo=youtube)](https://www.youtube.com/watch?v=9DtVrCLJL_M&list=PLWL9Oy30PVmVUCJ74cRK57wmRrugK1-VI)

Complete AWS infrastructure automation for Wellmum client using **Terraform Cloud** and **GitHub Actions**. This repository shares the experience and implementation of a production-grade cloud infrastructure project.

> 🎥 **[Watch the demo playlist on YouTube](https://www.youtube.com/watch?v=9DtVrCLJL_M&list=PLWL9Oy30PVmVUCJ74cRK57wmRrugK1-VI)**

> 🇫🇷 **[Version française disponible ici](README.fr.md)**

---

## 📋 Table of Contents

- [Project Context](#-project-context)
- [Architecture](#-architecture)
- [Repository Structure](#-repository-structure)
- [Prerequisites](#-prerequisites)
- [Initial Setup](#-initial-setup)
- [Infrastructure Deployment](#-infrastructure-deployment)
- [CI/CD Workflows](#-cicd-workflows)
- [Infrastructure Updates](#-infrastructure-updates)
- [Applications](#-applications)
- [Infrastructure Organization](#-infrastructure-organization)
- [Best Practices](#-best-practices)

---

## 🎯 Project Context

### The Client: Wellmum

Wellmum needed a production-ready AWS infrastructure with:

- ✅ **High availability**: Multi-AZ, load balancing, auto-scaling
- 🔒 **Security**: IAM, Security Groups, secrets management
- 📈 **Scalability**: Modular and scalable architecture
- 🤖 **Fully codified**: Infrastructure as Code with Terraform
- 🚀 **Continuous deployment**: CI/CD via GitHub Actions

### The Mission

Design, validate, and implement a complete AWS architecture, then automate its provisioning and application deployment through robust CI/CD pipelines.

### ⚠️ Important Note About Applications

The applications in this repository (**wellmum-ai**, **wellmum-api**, **wellmum-landing**) are **simplified clones** based on the same technologies as the original client applications. The actual source code is not included for **confidentiality** reasons.

These clones allow us to:
- Demonstrate the complete architecture
- Test deployment pipelines
- Illustrate real-world multi-service project organization

This experience is shared through the DevCloud Challenge initiative for educational purposes.

---

## 🏗️ Architecture

### Application Architecture

The Wellmum application consists of three main services:

![Wellmum Application Architecture](architecture%20applicative%20wellmum.drawio.png)

### Deployed Infrastructure

The AWS infrastructure is organized in multiple layers:

#### **Frontend (Landing Page)**
![Frontend Infrastructure](image.png)

#### **Backend (API + AI Services)**
![Backend Infrastructure](image%20(1).png)

### Provisioning Workflow

The automated deployment process follows a precise sequence:

![Provisioning Workflow](Worflow%20provisioning.png)

---

## 📁 Repository Structure

```
wellmum/
│
├── .github/
│   └── workflows/              # GitHub Actions CI/CD pipelines
│       ├── rex-deploy-terraform.yml    # Infrastructure deployment
│       ├── rex-deploy-api.yml          # API deployment
│       ├── rex-deploy-*.yml            # AI services deployment
│       └── rex-destroy-*.yml           # Environment destruction
│
├── wellmum-infra/              # 🏗️ Infrastructure as Code (Terraform)
│   ├── wellmum-network/        # VPC, Subnets, NAT, Internet Gateway
│   ├── wellmum-security/       # IAM, Roles, Secrets Manager, KMS
│   ├── wellmum-stockage/       # EFS, S3, persistent volumes
│   ├── wellmum-cluster/        # ECS Cluster, ECR
│   ├── wellmum-landing/        # Amplify infrastructure (Frontend)
│   │   ├── dev/                # Development environment
│   │   ├── prod/               # Production environment
│   │   └── modules/            # Reusable modules
│   ├── wellmum-api/            # ECS + ALB + RDS infrastructure (API)
│   │   ├── dev/
│   │   ├── prod/
│   │   └── modules/
│   └── wellmum-ai/             # ECS Services infrastructure (AI)
│       ├── dev/
│       ├── prod/
│       └── modules/
│
├── wellmum-api/                # 🔧 API Application (NestJS clone)
│   ├── src/
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── wellmum-ai/                 # 🤖 AI Microservices (FastAPI clones)
│   ├── chat/                   # AI chat service
│   ├── food_detector/          # Food detection + calories
│   ├── nutrition/              # Personalized nutrition plans
│   ├── routines/               # Exercise routines
│   └── social/                 # Social moderation AI
│
└── wellmum-landing/            # 🌐 Frontend Application (Next.js clone)
    ├── app/
    ├── components/
    └── next.config.ts
```

---

## 🔧 Prerequisites

Before starting, ensure you have:

- ✅ An **AWS** account with necessary permissions
- ✅ A configured **Terraform Cloud** account
- ✅ A **GitHub** account with repository access
- ✅ **Terraform CLI** version ~1.9 installed locally (optional)
- ✅ **Git** installed

---

## ⚙️ Initial Setup

### Step 1: Terraform Cloud Configuration

1. **Create an organization** in Terraform Cloud:
   - Suggested name: `REX-WELLMUM-Services-Infrastructure`

2. **Create the following workspaces**:
   ```
   wellmum-network
   wellmum-security
   wellmum-stockage
   wellmum-cluster
   wellmum-landing-dev
   wellmum-landing-prod
   wellmum-api-dev
   wellmum-api-prod
   wellmum-ai-dev
   wellmum-ai-prod
   ```

3. **Generate an API Token**:
   - Go to User Settings → Tokens
   - Create a new token and copy it

### Step 2: GitHub Secrets Configuration

In your GitHub repository, go to **Settings → Secrets and variables → Actions** and add:

| Secret | Description | Example |
|--------|-------------|---------|
| `TF_API_TOKEN` | Terraform Cloud API Token | `xxxxxxxxxxxxx.atlasv1.xxxxx` |
| `AWS_ACCESS_KEY_ID` | AWS Access Key (for application deployment workflows) | `AKIAXXXXXXXXXXXXXXXX` |
| `AWS_SECRET_ACCESS_KEY` | AWS Secret Key | `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` |

### Step 3: Configure Terraform Cloud Variables

For each workspace, configure the following variables:

**AWS Variables (for all workspaces):**
- `AWS_ACCESS_KEY_ID` (Environment variable, sensitive)
- `AWS_SECRET_ACCESS_KEY` (Environment variable, sensitive)
- `AWS_DEFAULT_REGION` (Environment variable) = `us-east-1` (or your region)

**Specific variables (depending on workspace):**
- Network configuration variables (CIDR, etc.)
- Security variables (secret names, etc.)
- Application variables (instance sizes, etc.)

---

## 🚀 Infrastructure Deployment

### Initial Deployment (Provisioning)

The initial infrastructure deployment is done automatically via **GitHub Actions** following this order:

1. **Trigger the workflow**:
   ```bash
   # Option 1: Push to main branch (production deployment)
   git push origin main
   
   # Option 2: Push to test branch (dev deployment with auto-approve)
   git push origin test
   
   # Option 3: Manual trigger
   # Go to Actions → Terraform Infrastructure Deploy → Run workflow
   ```

2. **Automatic deployment sequence**:

   The workflow [.github/workflows/rex-deploy-terraform.yml](.github/workflows/rex-deploy-terraform.yml) deploys infrastructure in this order:

   ```
   1️⃣ Network     (VPC, Subnets, NAT Gateway, Internet Gateway)
          ↓
   2️⃣ Security    (IAM Roles, Security Groups, Secrets Manager)
          ↓
   3️⃣ Stockage    (EFS, S3 Buckets)
          ↓
   4️⃣ Landing     (AWS Amplify for frontend)
          ↓
   5️⃣ Cluster     (ECS Cluster + ECR Repositories)
          ↓
   6️⃣ AI Services (ECS Services for AI microservices)
          ↓
   7️⃣ API         (ECS Service + ALB + RDS for API)
   ```

3. **Environments**:
   - **Branch `test`** → Automatic deployment to **dev** environment
   - **Branch `main`** → Deployment to **prod** environment (requires manual approval)

---

## 🔄 CI/CD Workflows

### Main Workflow: Infrastructure

**File**: [.github/workflows/rex-deploy-terraform.yml](.github/workflows/rex-deploy-terraform.yml)

**Triggers**:
- Push to `main` or `test` with changes in `wellmum-infra/**`
- Pull Request to `main` or `test`
- Manual trigger (`workflow_dispatch`)

**Features**:
- ✅ Intelligent change detection (deploys only modified modules)
- ✅ Sequential deployment respecting dependencies
- ✅ Auto-approve on `test` branch (dev environment)
- ✅ Manual approval on `main` branch (prod environment)
- ✅ GitHub environments management (production/testment)

### Application Deployment Workflows

Each service has its own workflow for building and deploying Docker images:

- `rex-deploy-api.yml`: Build and push API image to ECR
- `rex-deploy-chat.yml`: AI chat service
- `rex-deploy-food-detector.yml`: Food detection service
- `rex-deploy-nutrition.yml`: Nutrition service
- `rex-deploy-routines.yml`: Routines service
- `rex-deploy-social.yml`: Social service

### Destruction Workflows

To remove environments:

- `rex-destroy-dev.yml`: Complete dev environment destruction
- `rex-destroy-prod.yml`: Complete prod environment destruction
- `rex-destroy-shared.yml`: Shared infrastructure destruction (network, security, etc.)

---

## 🔄 Infrastructure Updates

### Infrastructure Modifications

1. **Modify Terraform code** in the relevant folder:
   ```bash
   # Example: network modification
   cd wellmum-infra/wellmum-network
   # Edit .tf files
   ```

2. **Commit and push**:
   ```bash
   git add .
   git commit -m "feat: update network configuration"
   git push origin test  # Test in dev first
   ```

3. **The workflow automatically detects changes** and deploys only modified modules.

4. **After validation in dev**, merge to `main` to deploy to production.

### Why This Modular Organization?

Check [wellmum-infra/structure-dossier.md](wellmum-infra/structure-dossier.md) for detailed understanding:

- ✅ **Core/Application separation**: Base infrastructure vs application infrastructure
- ✅ **Reusability**: Core modules shared across applications
- ✅ **Easier maintenance**: Targeted modifications without global impact
- ✅ **Scalability**: Easy addition of new services
- ✅ **Multiple environments**: Isolated Dev and Prod with same codebase

---

## 📦 Applications

### Wellmum API

**Technology**: NestJS (Node.js/TypeScript)  
**Port**: 3000  
**Services**: REST API + Swagger UI  

```bash
cd wellmum-api
docker-compose up --build
```

Endpoints:
- Health Check: `GET /api/healthcheck`
- Documentation: `/api/docs`

### Wellmum AI Services

**Technology**: FastAPI (Python 3.11)  
**Services**:

| Service | Port | Description |
|---------|------|-------------|
| Chat | 8002 | AI chat interactions |
| Food Detector | 8003 | Food detection and calorie estimation |
| Nutrition | 8004 | Personalized nutrition plans |
| Routines | 8005 | Exercise routine generation |
| Social | 8006 | Social interaction moderation |

Each service exposes a `/healthz` endpoint for health checks.

```bash
cd wellmum-ai/chat
docker-compose up --build
```

### Wellmum Landing

**Technology**: Next.js (React/TypeScript)  
**Port**: 3000  

```bash
cd wellmum-landing
npm install
npm run dev
```

---

## 🏗️ Infrastructure Organization

### Core Infrastructure (Shared)

These components are **independent of applications** and form the foundation:

| Module | Responsibility |
|--------|----------------|
| **wellmum-network** | VPC, Subnets (public/private), NAT Gateway, Internet Gateway, Routes, ACL |
| **wellmum-security** | IAM Roles, Policies, Security Groups, Secrets Manager, KMS |
| **wellmum-stockage** | EFS (shared storage), S3 Buckets, volume configurations |
| **wellmum-cluster** | ECS Cluster, ECR Repositories, cluster configuration |

### Application Infrastructure (Specific)

These modules **consume the Core** and add the necessary infrastructure for each application:

| Module | Structure | Responsibility |
|--------|-----------|----------------|
| **wellmum-landing** | `dev/`, `prod/`, `modules/` | AWS Amplify, frontend configuration |
| **wellmum-api** | `dev/`, `prod/`, `modules/` | ECS Services, ALB, Target Groups, RDS (PostgreSQL) |
| **wellmum-ai** | `dev/`, `prod/`, `modules/` | ECS Services for 5 AI microservices |

### Deployment Flow

```
Core Infrastructure (1-4)
         ↓
Application Infrastructure (5-7)
         ↓
Application Deployment (Docker Images)
```

---

## ✅ Best Practices

### Infrastructure as Code

- ✅ **Modular code**: Maximum reusability via Terraform modules
- ✅ **Remote state**: Terraform Cloud for state management
- ✅ **Workspaces**: Dev/prod isolation
- ✅ **Variables**: Externalized and secured configuration

### CI/CD

- ✅ **Incremental deployments**: Change detection to optimize builds
- ✅ **Manual validation**: Production protection
- ✅ **Auto-approve**: Development acceleration
- ✅ **Rollback**: Destruction workflows to clean environments

### Security

- ✅ **Managed secrets**: AWS Secrets Manager + GitHub Secrets
- ✅ **IAM Roles**: Least privilege principle
- ✅ **Security Groups**: Strict network segmentation
- ✅ **Encryption**: KMS for sensitive data

### Observability

- ✅ **Health Checks**: All services expose health endpoints
- ✅ **Logs**: CloudWatch Logs for monitoring
- ✅ **Metrics**: CloudWatch Metrics + Auto Scaling

---

## 🎓 What You'll Learn

By exploring this repository, you'll master:

1. **Cloud architecture design** adapted to business needs
2. **Infrastructure as Code** with Terraform and best practices
3. **Terraform Cloud**: workspaces, remote state, collaboration
4. **CI/CD** with GitHub Actions for infrastructure and applications
5. **Project organization**: Core/Application separation, reusable modules
6. **AWS Security**: IAM, Security Groups, Secrets Management
7. **Containerization**: Docker, ECS, ECR
8. **Multi-environments**: Dev/Prod management with same codebase

---

## 🎥 Demo Videos

Watch the complete demonstration playlist showcasing the deployment and architecture:

**[▶️ Wellmum Infrastructure Demo Playlist](https://www.youtube.com/watch?v=9DtVrCLJL_M&list=PLWL9Oy30PVmVUCJ74cRK57wmRrugK1-VI)**

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Real-world client project for Wellmum. This experience is shared through the DevCloud Challenge initiative for educational and knowledge-sharing purposes.

---

**⚠️ Reminder**: The applications included are educational clones. The actual client source code is not included for confidentiality reasons.
