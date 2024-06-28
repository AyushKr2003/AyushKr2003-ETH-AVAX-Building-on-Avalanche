// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    string items = "1.DEGEN NFT  2.DEGEN T-shirt 3.DEGEN Treasure Chest";

    constructor() ERC20("Degen", "DGN"){}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals()override public view virtual returns (uint8) {
        return 0;
    }

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
