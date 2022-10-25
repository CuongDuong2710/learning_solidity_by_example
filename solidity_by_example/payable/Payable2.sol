// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// payable for functions: Allows them to receive Ether together with a call.
contract Payable {
  // Example
  // - payable function
  // - payable address

  event Deposit(address sender, uint amount, uint balance);
  event Withdraw(uint amount, uint balance);
  event Transfer(address to, uint amount, uint balance);

    // if not 'payable' address owner
  // TypeError: "send" and "transfer" are only available for objects of type "address payable", not "address".
  // --> Payable2.sol:39:5:
  //  |
  //  |     owner.transfer(_amount);
  //  |     ^^^^^^^^^^^^^^

  // Payable address can receive Ether
  address payable public owner;

  // Payable constructor can receive Ether
  constructor() payable {
     //  TypeError: Type address is not implicitly convertible to expected type address payable.
    // --> Payable2.sol:26:15:
    //  |
    // |       owner = msg.sender;
    // |               ^^^^^^^^^^

      owner = payable(msg.sender);
  }

  modifier onlyOwner() {
      require(msg.sender == owner, "Not owner");
      _;
  }

  // Function to deposit Ether into this contract.
  // Call this function along with some Ether.
  // The balance of this contract will be automatically updated.
  function deposit() public payable {
      emit Deposit(msg.sender, msg.value, address(this).balance);
  }

  // Call this function along with some Ether.
  // The function will throw an error since this function is not payable.
  function notPayable() public {}

  // Function to withdraw all Ether from this contract.
  function withdraw(uint _amount) public onlyOwner {
    owner.transfer(_amount);
    emit Withdraw(_amount, address(this).balance);
  }

  // Function to transfer Ether from this contract to address from input
  function transferTo(address payable _to, uint _amount) public onlyOwner {
    // Note that "to" is declared as payable
    _to.transfer(_amount); // Note: _amount get from balance of this contract's address, NOT from owner (***)
    emit Transfer(_to, _amount, address(this).balance);
  }

  function getBalance() public view returns (uint) {
      return address(this).balance;
  }
}

// Test in Remix
// 1. Deploy with 100 wei value in Remix (because constructor is payable can receive Ether)
//
// 2. Deposit with 10 wei value
// [
	// {
		// "from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
		// "topic": "0x90890809c654f11d6e72a28fa60149770a0d11ec6c92319d6ceb2bb0a4ea1a15",
		// "event": "Deposit",
		// "args": {
		// 	"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
		// 	"1": "10",
		// 	"2": "110",
		// 	"sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
		// 	"amount": "10",
		// 	"balance": "110"
		// }
	// }
// ]
//
// 3. Test with notPayable function (input 1 wei value)
// transact to Payable.notPayable errored: VM error: revert.
//
// revert
// 	The transaction has been reverted to the initial state.
// Note: The called function should be payable if you send value and the value you send should be less than your current balance.
// Debug the transaction to get more information.
//
// 4. Test withdraw
// Deposit 1 ETH -> balance of wallet sender will subtract 1 ETH
//[
//	{
//		"from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
//		"topic": "0x90890809c654f11d6e72a28fa60149770a0d11ec6c92319d6ceb2bb0a4ea1a15",
//		"event": "Deposit",
//		"args": {
//			"0": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
//			"1": "1000000000000000000", // send 1 ETH from 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//			"2": "1000000000000000110", // balance of this address contract
//			"sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
//			"amount": "1000000000000000000",
//			"balance": "1000000000000000110"
//		}
//	}
// ]
// Withdraw 1 ETH (1000000000000000000 wei) -> balance of wallet sender will add 1 ETH
// [
//	{
//		"from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
//		"topic": "0x56ca301a9219608c91e7bcee90e083c19671d2cdcc96752c7af291cee5f9c8c8",
//		"event": "Withdraw",
//		"args": {
//			"0": "1000000000000000000", // value of withdraw
//			"1": "110", // balance of this address contract
//			"amount": "1000000000000000000",
//			"balance": "110"
//		}
//	}
// ]
//
// 5. Test Transfer
// transact to Payable.transfer errored: VM error: revert.
// 
// revert
// The transaction has been reverted to the initial state.
// Reason provided by the contract: "Not owner".
// Debug the transaction to get more information.
//
// Reason: balance of this contract's address not enough to transfer
// Solution: Deposit into this contract's address enough balance
// https://codeforgeek.com/solve-transaction-error-in-solidity/#:~:text=The%20Transaction%20Error%20in%20Solidity&text=The%20transaction%20has%20been%20reverted,of%20causes%20for%20this%20error.
//
// [
// 	{
// 		"from": "0x5FD6eB55D12E759a21C09eF703fe0CBa1DC9d88D",
// 		"topic": "0x7fa9aafeb8bb803d77de5d84bc2f2edbd842ca91b20cd5020aa21dfe26ab0be9",
// 		"event": "Transfer",
// 		"args": {
// 			"0": "0x17F6AD8Ef982297579C203069C1DbfFE4348c372",
// 			"1": "1000000000000000000",
// 			"2": "0",
// 			"to": "0x17F6AD8Ef982297579C203069C1DbfFE4348c372",
// 			"amount": "1000000000000000000",
// 			"balance": "0"
// 		}
// 	}
// ]