# DegenToken Contract README

## Introduction

Welcome to the **DegenToken** project! This Solidity smart contract implements a simple ERC20 token with additional features such as minting, burning, and token redemption for specific items. The contract is deployed on the Avalanche Fuji Testnet.

## Contract Overview

### Key Features

- **Token Name:** Degen
- **Token Symbol:** DGN
- **Decimals:** 0 (Each token is indivisible)
- **Minting:** Only the contract owner can mint new tokens.
- **Burning:** Tokens can be burned by the owner or users.
- **Redemption:** Users can redeem tokens for specific items.
- **Transfer:** User can send/transfer their token to another account.

### Available Items

1. DEGEN NFT
2. DEGEN T-shirt
3. DEGEN Treasure Chest

## Contract Details

### Functions

#### Constructor

```solidity
constructor() ERC20("Degen", "DGN") {}
```
Initializes the token with the name "Degen" and symbol "DGN".

### Mint
```solidity
function mint(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
```
Mints new tokens to a specified address. This function can only be called by the contract owner.

### Decimals
```solidity
function decimals() override public view virtual returns (uint8) {
    return 0;
}
```
Overrides the default decimals to 0, making each token indivisible.

### RedeemToken
```solidity
function RedeemToken(uint choice) public {
    require(choice<=3 || choice>0, "Choose an item from the list");
    if(choice==1){
        _burn(msg.sender, 10);
    }
    else if(choice==2){
        _burn(msg.sender, 50);
    }
    else if(choice==3){
        _burn(msg.sender, 100);
    }
}
```
Allows users to redeem tokens for items. The number of tokens burned depends on the selected item:

10 tokens for DEGEN NFT
50 tokens for DEGEN T-shirt
100 tokens for DEGEN Treasure Chest

### Burn
```solidity
function burn(uint _value) public {
    _burn(msg.sender, _value);
}
```
Allows users to burn their tokens.

### BurnFrom
```solidity
function burnFrom(address _from, uint256 _value) public {
    address spender = _msgSender();
    _spendAllowance(_from, spender, _value);
    _burn(_from, _value);
}
```
Allows approved spenders to burn tokens from another address.

### ShowItems
```solidity
function showItems() external view returns(string memory){
    return items;
}
```
Displays the list of items available for redemption.

### GetBalance
```solidity
function getBalance() external view returns(uint){
    return this.balanceOf(msg.sender);
}
```
Returns the token balance of the caller.

## Deployment
The contract is deployed on the Avalanche Fuji Testnet. Make sure you have a compatible wallet and some test AVAX to interact with the contract.

### Deployment using Remix

1. Open [Remix](https://remix.ethereum.org/).
2. Create a new file and paste the DegenToken contract code from `contracts\DegenToken.sol`.
3. Compile the contract using the Solidity compiler.
4. Switch to the "Deploy & Run Transactions" tab.
5. Select "Injected Web3" as the environment to connect to your MetaMask wallet.
6. Ensure your wallet is set to the Avalanche Fuji Testnet.
7. Deploy the contract by selecting `DegenToken` from the contract dropdown and clicking "Deploy".
8. Confirm the transaction in MetaMask.

### Deployment from command line using `deploy.js` script

1. Ensure you have [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed.
2. Clone this repository in navigate inside the folder:
    ```bash
    git clone https://github.com/AyushKr2003/AyushKr2003-ETH-AVAX-Building-on-Avalanche.git
    cd ETH-AVAX-Building-on-Avalanche
    ```
3. Install the necessary dependencies:
    ```bash
    npm i
    ```
4. Compile the contracts:
    ```bash
    npx hardhat compile
    ```
5. Add your private keys to a .env file:
    ```plaintext
    PRIVATE WALLET_PRIVATE_KEY = 
    PRIVATE SNOWTRACE_API_KEY = 
    ```
6. Run the deployment script:
    ```bash
    npx hardhat run scripts/deploy.js --network fuji
    ```

## Usage
### Minting Tokens
Only the contract owner can mint tokens. Use the mint function:

```solidity
mint(address to, uint256 amount);
```
### Redeeming Tokens
Users can redeem tokens for items using the RedeemToken function:

```solidity
RedeemToken(uint choice);
```
### Burning Tokens
Users can burn their tokens using the `burn` function:

```solidity
burn(uint _value);
```
Approved spenders can burn tokens from another address using the `burnFrom` function:

```solidit
burnFrom(address _from, uint256 _value);
```
### Viewing Items and Balance
To view the list of redeemable items, use the showItems function:

```solidity
showItems();
```
To check your token balance, use the getBalance function:

```solidity
getBalance();
```
## License
This project is licensed under the MIT License.