# 🚀 Task-10: Blue/Green Deployment using ECS + CodeDeploy

## 📌 Overview

This project implements **Blue/Green Deployment** for a Strapi application running on **AWS ECS Fargate**, fully provisioned using **Terraform**.

The goal of this task is to achieve:

- ✅ Zero-downtime deployments
- ✅ Safe production releases
- ✅ Automatic rollback on failure
- ✅ Canary traffic shifting

---

# 🏗 Architecture

- Internet
          ↓
- Application Load Balancer (ALB)
          ↓

         | |
- Blue Target Group Green Target Group
         | |
- ECS Task Set (Blue) ECS Task Set (Green)



Deployment traffic shifting is controlled by **AWS CodeDeploy**.

---

# 🔵🟢 Deployment Strategy

We use the predefined configuration:


### How It Works

1. A new ECS task definition revision is created.
2. CodeDeploy launches a new **Green task set**.
3. 10% traffic is shifted to Green.
4. System waits 5 minutes.
5. If healthy → 100% traffic shifts to Green.
6. Blue tasks are terminated after 5 minutes.
7. If unhealthy → automatic rollback to Blue.

---

# 📂 Infrastructure Components

## 1️⃣ ECS (Fargate)

- Launch Type: FARGATE
- Deployment Controller: CODE_DEPLOY
- Task Definition includes:
  - CPU & Memory
  - Container Image
  - Environment Variables
  - Logging Configuration

---

## 2️⃣ Application Load Balancer

- Listener: Port 80 (HTTP)
- Two Target Groups:
  - Blue (Current Production)
  - Green (New Version)

The ALB listener is modified dynamically during deployment.

---

## 3️⃣ CodeDeploy Configuration

- Deployment Type: BLUE_GREEN
- Traffic Control: Enabled
- Canary Strategy: 10% for 5 minutes
- Auto Rollback: Enabled
- Blue termination delay: 5 minutes

---

## 🔁 End-to-End Deployment Flow

### Step 1: Image Update
A new Docker image is pushed to ECR.

### Step 2: Task Revision
ECS registers a new task definition revision.

### Step 3: Green Task Launch
CodeDeploy creates a new task set attached to the Green target group.

### Step 4: Canary Traffic Shift
Traffic distribution:
- 90% → Blue
- 10% → Green

### Step 5: Health Monitoring
ALB health checks validate application health.

### Step 6: Full Traffic Shift
If healthy:
- 100% → Green

### Step 7: Blue Termination
After wait time:
- Blue tasks are terminated
- Green becomes primary

---

# 🔄 Automatic Rollback

If deployment fails:

- Traffic shifts back to Blue
- Green tasks are stopped
- System remains stable
- No downtime occurs

Rollback triggers on:
- Failed health checks
- Deployment failure events
- Container crashes

---

# 🛠 Terraform Resources Used

- aws_ecs_cluster
- aws_ecs_service
- aws_lb
- aws_lb_listener
- aws_lb_target_group
- aws_codedeploy_app
- aws_codedeploy_deployment_group
- aws_iam_role

Infrastructure is written in **modular Terraform structure**.

---

# 🎯 Key Learning Outcomes

- Understanding Blue/Green deployments in ECS
- Traffic shifting using ALB listener rules
- Canary deployment strategies
- Automatic rollback handling
- Production-grade CI/CD design

---

# 🚀 Result

This setup ensures:

- Zero downtime deployments
- Safe production updates
- Controlled release strategy
- Enterprise-level DevOps implementation
