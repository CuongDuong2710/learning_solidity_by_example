# learning_solidity_by_example
Learning Solidity code

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





