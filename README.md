# learning_solidity_by_example

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
