<h1 align="center">Welcome to TodoListWeb3 👋</h1>

>  This project is an introduction to Web3 development on Ethereum blockchain, we can create Tasks and change their status by interacting with a smart contract through a basic react webapp
## Prerequisite
### HardHat tuto
#### Step1: Run ETH Node locally
  ```sh
    $> npx hardhat node
  ```
#### Step2: deploy our smart contract
  ```sh
    $> npx hardhat run --network localhost scripts/deploy.js
  ```
#### Step3: add the private key of the new account on Metamask
  * click on `import account` on Metamask
#### Step4: add hardhat network on metamask
  * click on `add network` on Metamask

## Notes:

* We used Hardhat framework https://hardhat.org/ in order to run our smart contract locally
* We used ReactJS with ethers package in order to interact with our smart contract
