// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// In Remix, deploy contract and then use 'Transact' button in 'Low level interactions' to deposit ether into deployed contract 
// (remember input amount in 'Value' box)
contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "caller is not owner");

        // use 'msg.sender' in memory is saving more gas than 'owner' (state variable)
        payable(msg.sender).transfer(_amount);

        /* bool(sent,) = payable(msg.sender).call{value: _amount}("");
    require(sent, "Failed to withdraw"); */
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
