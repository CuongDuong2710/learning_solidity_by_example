# learning_solidity_by_example

# Visibility and Getters

### State Variable Visibility
> public

Public state variables differ from internal ones only in that the compiler automatically generates getter functions for them, which allows other contracts to read their values. When used within the same contract, the external access **(e.g. this.x)** invokes the getter while internal access **(e.g. x)** gets the variable value directly from storage.

> internal

Internal state variables can only be accessed from within the contract they are defined in and in derived contracts. They cannot be accessed externally. This is the default visibility level for state variables.

> private

Private state variables are like internal ones but they are not visible in derived contracts.

### Function Visibility

Solidity knows two kinds of function calls: external ones that do create an actual EVM message call and internal ones that do not. Furthermore, internal functions can be made inaccessible to derived contracts. This gives rise to four types of visibility for functions.

> external

External functions are part of the contract interface, which means they can be called from other contracts and via transactions. An external function **f** cannot be called internally **(i.e. f()** does not work, but **this.f()** works).

> public

Public functions are part of the contract interface and can be either called internally or via message calls.

> internal

Internal functions can only be accessed from within the current contract or contracts deriving from it. They cannot be accessed externally

> private

Private functions are like internal ones but they are not visible in derived contracts.

- [Function Visibility Example](https://remix.ethereum.org/?#language=solidity&version=0.8.15&code=Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0zLjAKcHJhZ21hIHNvbGlkaXR5ID49MC40LjE2IDwwLjkuMDsKCmNvbnRyYWN0IEMgewogICAgdWludCBwcml2YXRlIGRhdGE7CgogICAgZnVuY3Rpb24gZih1aW50IGEpIHByaXZhdGUgcHVyZSByZXR1cm5zKHVpbnQgYikgeyByZXR1cm4gYSArIDE7IH0KICAgIGZ1bmN0aW9uIHNldERhdGEodWludCBhKSBwdWJsaWMgeyBkYXRhID0gYTsgfQogICAgZnVuY3Rpb24gZ2V0RGF0YSgpIHB1YmxpYyB2aWV3IHJldHVybnModWludCkgeyByZXR1cm4gZGF0YTsgfQogICAgZnVuY3Rpb24gY29tcHV0ZSh1aW50IGEsIHVpbnQgYikgaW50ZXJuYWwgcHVyZSByZXR1cm5zICh1aW50KSB7IHJldHVybiBhICsgYjsgfQp9CgovLyBUaGlzIHdpbGwgbm90IGNvbXBpbGUKY29udHJhY3QgRCB7CiAgICBmdW5jdGlvbiByZWFkRGF0YSgpIHB1YmxpYyB7CiAgICAgICAgQyBjID0gbmV3IEMoKTsKICAgICAgICB1aW50IGxvY2FsID0gYy5mKDcpOyAvLyBlcnJvcjogbWVtYmVyIGBmYCBpcyBub3QgdmlzaWJsZQogICAgICAgIGMuc2V0RGF0YSgzKTsKICAgICAgICBsb2NhbCA9IGMuZ2V0RGF0YSgpOwogICAgICAgIGxvY2FsID0gYy5jb21wdXRlKDMsIDUpOyAvLyBlcnJvcjogbWVtYmVyIGBjb21wdXRlYCBpcyBub3QgdmlzaWJsZQogICAgfQp9Cgpjb250cmFjdCBFIGlzIEMgewogICAgZnVuY3Rpb24gZygpIHB1YmxpYyB7CiAgICAgICAgQyBjID0gbmV3IEMoKTsKICAgICAgICB1aW50IHZhbCA9IGNvbXB1dGUoMywgNSk7IC8vIGFjY2VzcyB0byBpbnRlcm5hbCBtZW1iZXIgKGZyb20gZGVyaXZlZCB0byBwYXJlbnQgY29udHJhY3QpCiAgICB9Cn0&optimize=false&runs=200&evmVersion=null)

### Getter Functions

The compiler automatically creates getter functions for all **public** state variables. For the contract given below, the compiler will generate a function called **data** that does not take any arguments and returns a **uin**t, the value of the state variable **data**. State variables can be initialized when they are declared.

- [Contract Example](https://remix.ethereum.org/?#language=solidity&version=0.8.15&code=Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0zLjAKcHJhZ21hIHNvbGlkaXR5ID49MC40LjE2IDwwLjkuMDsKCmNvbnRyYWN0IEMgewogICAgdWludCBwdWJsaWMgZGF0YSA9IDQyOwp9Cgpjb250cmFjdCBDYWxsZXIgewogICAgQyBjID0gbmV3IEMoKTsKICAgIGZ1bmN0aW9uIGYoKSBwdWJsaWMgdmlldyByZXR1cm5zICh1aW50KSB7CiAgICAgICAgcmV0dXJuIGMuZGF0YSgpOwogICAgfQp9&optimize=false&runs=200&evmVersion=null)

The getter functions have external visibility. If the symbol is accessed internally (i.e. without **this.**), it evaluates to a state variable. If it is accessed externally (i.e. with **this.**), it evaluates to a function.

- [Contract Example](https://remix.ethereum.org/?#language=solidity&version=0.8.15&code=Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0zLjAKcHJhZ21hIHNvbGlkaXR5ID49MC40LjAgPDAuOS4wOwoKY29udHJhY3QgQyB7CiAgICB1aW50IHB1YmxpYyBkYXRhOwogICAgZnVuY3Rpb24geCgpIHB1YmxpYyByZXR1cm5zICh1aW50KSB7CiAgICAgICAgZGF0YSA9IDM7IC8vIGludGVybmFsIGFjY2VzcwogICAgICAgIHJldHVybiB0aGlzLmRhdGEoKTsgLy8gZXh0ZXJuYWwgYWNjZXNzCiAgICB9Cn0=)

If you have a **publi**c state variable of array type, then you can only retrieve single elements of the array via the generated getter function. This mechanism exists to avoid high gas costs when returning an entire array.

- [Array Example](https://remix.ethereum.org/?#language=solidity&version=0.8.15&code=Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0zLjAKcHJhZ21hIHNvbGlkaXR5ID49MC40LjE2IDwwLjkuMDsKCmNvbnRyYWN0IGFycmF5RXhhbXBsZSB7CiAgICAvLyBwdWJsaWMgc3RhdGUgdmFyaWFibGUKICAgIHVpbnRbXSBwdWJsaWMgbXlBcnJheTsKCiAgICAvLyBHZXR0ZXIgZnVuY3Rpb24gZ2VuZXJhdGVkIGJ5IHRoZSBjb21waWxlcgogICAgLyoKICAgIGZ1bmN0aW9uIG15QXJyYXkodWludCBpKSBwdWJsaWMgdmlldyByZXR1cm5zICh1aW50KSB7CiAgICAgICAgcmV0dXJuIG15QXJyYXlbaV07CiAgICB9CiAgICAqLwoKICAgIC8vIGZ1bmN0aW9uIHRoYXQgcmV0dXJucyBlbnRpcmUgYXJyYXkKICAgIGZ1bmN0aW9uIGdldEFycmF5KCkgcHVibGljIHZpZXcgcmV0dXJucyAodWludFtdIG1lbW9yeSkgewogICAgICAgIHJldHVybiBteUFycmF5OwogICAgfQp9&optimize=false&runs=200&evmVersion=null)

---

# Function Visibility Specifiers

> function myFunction() **visibility_specifier** returns (bool) {
>    return true;
> }

**public**: visible externally and internally (creates a getter function for storage/state variables)

**private**: only visible in the current contract

**external**: only visible externally (only for functions) - i.e. can only be message-called (via this.func)

**internal**: only visible internally

# Modifiers

**pure** for functions: Disallows modification or access of state.

**view** for functions: Disallows modification of state.

**payable** for functions: Allows them to receive Ether together with a call.

**constant** for state variables: Disallows assignment (except initialisation), does not occupy storage slot.

**immutable** for state variables: Allows exactly one assignment at construction time and is constant afterwards. Is stored in code.

**anonymous** for events: Does not store event signature as topic.

**indexed** for event parameters: Stores the parameter as topic.

**virtual** for functions and modifiers: Allows the function’s or modifier’s behaviour to be changed in derived contracts.

**override**: States that this function, modifier or public state variable changes the behaviour of a function or modifier in a base contract.

