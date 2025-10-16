Subscriba Smart Contract

**Subscriba** is a decentralized subscription management smart contract built on the **Stacks blockchain**, secured by **Bitcoin**.  
It allows service providers, creators, and platforms to automate recurring payments and manage subscriber access using **trustless on-chain logic** powered by **Clarity**.

---

Overview

The **Subscriba Smart Contract** enables users to subscribe to services or content using **STX tokens**.  
Providers can create subscription plans, define durations and prices, and allow users to join or renew plans seamlessly.  
This eliminates the need for intermediaries, ensuring transparent and secure subscription operations.

---

Core Functionalities

- **Create Subscription Plans:**  
  Service providers can define plans with specific durations and payment amounts.

- **User Subscription Payments:**  
  Subscribers can pay with STX and gain access for the plan duration.

- **Renew or Extend Subscriptions:**  
  Automatic or manual renewal ensures continuous service access.

- **Cancel Subscriptions:**  
  Both providers and users can cancel subscriptions at any time.

- **On-Chain Verification:**  
  Public functions allow verification of plan details and subscription status.

---

Smart Contract Logic

- Built using **Clarity** — a predictable, non-Turing complete language.  
- Deployed on the **Stacks Blockchain**, inheriting Bitcoin’s security.  
- Handles **STX transfers**, **access verification**, and **time-based logic** for subscription validity.

---

Testing and Deployment

Prerequisites
- [Clarinet](https://docs.hiro.so/get-started/clarinet) installed on your system.  
- Node.js ≥ 16.x (optional for Clarinet environment setup).

Commands

```bash
# Clone the repository
git clone https://github.com/<your-username>/subscriba-contract.git

# Enter project directory
cd subscriba-contract

# Run tests
clarinet test

# Check contract structure and cost analysis
clarinet check
