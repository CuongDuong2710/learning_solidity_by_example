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


