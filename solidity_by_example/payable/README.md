## Payable

Payable for functions: Allows them to receive Ether together with a call.

- Payable address can receive Ether

```sh
  address payable public owner;
```

- Payable constructor can receive Ether

```sh
  constructor() payable {
      owner = payable(msg.sender);
  }
```

- Payable function to deposit Ether into contract

```sh
  // Function to deposit Ether into this contract.
  // Call this function along with some Ether.
  // The balance of this contract will be automatically updated.
  
  function deposit() public payable {
      emit Deposit(msg.sender, msg.value, address(this).balance);
  }
```

- Payable with address `to` for transfering Ether from this contract to address from input

```sh
function transferTo(address payable _to, uint _amount) public onlyOwner {
    _to.transfer(_amount); // Note: _amount get from balance of this contract's address, NOT from owner (***)
    emit Transfer(_to, _amount, address(this).balance);
  }
```

Or

```sh
// Function to transfer Ether from this contract to address from input

  function transfer(address payable _to, uint256 _amount) public {
    (bool success, ) = _to.call{value: _amount}("");
    require(success, "Failed to send Ether");
  }
```

- notPayable() function

```sh
  // Call this function along with some Ether.
  // The function will throw an error since this function is not payable.
  
  function notPayable() public {}
```

- withdraw() function

```sh
  // Function to withdraw all Ether from this contract.

  function withdraw() public {
    // get the amount of Ether stored in this contract
    uint256 amount = address(this).balance;

    // send all Ether to owner
    // Owner can receive Ether since the address of owner is payable
    (bool success, ) = owner.call{value: amount}("");
    require(success, "Failed to send Ether");
  }
```

Or

```sh
  // Function to withdraw all Ether from this contract.
  
  function withdraw(uint _amount) public onlyOwner {
    owner.transfer(_amount);
    emit Withdraw(_amount, address(this).balance);
  }
```