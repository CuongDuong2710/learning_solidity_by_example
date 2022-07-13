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








