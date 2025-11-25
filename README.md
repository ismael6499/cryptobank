# 🏦 CryptoBank: State Management & Security Patterns

Continuing my **Master in Blockchain Development** at **Blockchain Accelerator Academy**, this project simulates a decentralized bank to explore advanced state management and security patterns in the EVM.

As a **Java Software Engineer**, creating a "Bank" class is a classic OOP exercise. However, in **Solidity**, the stakes are higher. This project isn't just about storing numbers; it's about protecting funds against Reentrancy attacks and optimizing gas usage for on-chain storage.

## 💡 Project Overview

**CryptoBank** allows users to deposit and withdraw Ether while enforcing business rules (like maximum balance limits) and restricting administrative functions.

### 🔍 Key Technical Features:

* **Checks-Effects-Interactions (CEI) Pattern:**
    * This is the core security feature. In the `withdrawEther` function, I strictly update the user's balance (Effect) *before* sending the Ether (Interaction). This prevents **Reentrancy attacks**, where a malicious contract could recursively call withdraw before the balance is updated.
* **Mappings for State:**
    * Used `mapping(address => uint256)` to efficiently track individual user balances. Unlike Java HashMaps, mappings in Solidity are not iterable, requiring different design patterns for data retrieval.
* **Access Control:**
    * Implemented a reusable `modifier onlyAdmin` to protect sensitive functions like `modifyMaxBalance`.
* **Gas Optimization:**
    * Replaced standard `require` strings with **Custom Errors** (`MaxBalanceReached`, `InsufficientBalance`) to minimize deployment and runtime costs.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Security:** CEI Pattern (Reentrancy protection).
* **Data Structures:**
