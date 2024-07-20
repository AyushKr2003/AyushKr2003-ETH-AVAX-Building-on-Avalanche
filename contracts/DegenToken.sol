// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    string items = "1.DEGEN NFT:10DGN  2.DEGEN T-shirt:50DGN  3.DEGEN Treasure Chest:100DGN";

    mapping(address => uint) public nftBalance;
    mapping(address => uint) public tshirtBalance;
    mapping(address => uint) public chestBalance;

    constructor() ERC20("Degen", "DGN"){}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals()override public view virtual returns (uint8) {
        return 0;
    }

    function RedeemToken(uint choice) public {
        require(choice >= 1 && choice <= 3, "Invalid choice. Choose an item from the list");

        if (choice == 1) {
            require(balanceOf(msg.sender) >= 10, "Insufficient balance to redeem NFT");
            _burn(msg.sender, 10);
            nftBalance[msg.sender] += 1;  
            }
        else if (choice == 2) {
            require(balanceOf(msg.sender) >= 50, "Insufficient balance to redeem T-shirt");
            _burn(msg.sender, 50);
            tshirtBalance[msg.sender] += 1;  
        }
        else if (choice == 3) {
            require(balanceOf(msg.sender) >= 100, "Insufficient balance to redeem Treasure Chest");
            _burn(msg.sender, 100);
            chestBalance[msg.sender] += 1;  
        }
    }

    function burn(uint _value) public {
        _burn(msg.sender, _value);
    }

    function burnFrom(address _from, uint256 _value) public {
        address spender = _msgSender();
        _spendAllowance(_from, spender, _value);
        _burn(_from, _value);
    }

    function showItems() external view returns(string memory){
        return items;
    }

    function getBalance() external view returns(uint){
        return this.balanceOf(msg.sender);
    }
}
