// SPDX-License-Identifier: GPL-3.0  

pragma solidity 0.8.24;  


contract CryptoBank {  

    uint256 public maxBalance;
    address public admin;
    mapping(address => uint256) public userBalance;

    event EtherDeposit(address _user, uint256 _etherAmount);
    event EtherWithdraw(address _user, uint256 _etherAmount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not Allowed");
        _;
    }

    constructor(uint256 _maxBalance, address _admin) {
        maxBalance = _maxBalance;
        admin = _admin;
    }

    function depositEther() external payable {
        require(userBalance[msg.sender] + msg.value <= maxBalance, "MaxBalance reached");
        userBalance[msg.sender] += msg.value;
        emit EtherDeposit(msg.sender, msg.value);
    }

    function withdrawEther(uint256 _amount) external {
        require(_amount <= userBalance[msg.sender] ,"Not enough ether");

        userBalance[msg.sender] -= _amount;

        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");

        emit EtherWithdraw(msg.sender, _amount);
    }

    function modifyMaxBalance(uint256 _newMaxBalance) external onlyAdmin{
        maxBalance = _newMaxBalance;
    }

}  
