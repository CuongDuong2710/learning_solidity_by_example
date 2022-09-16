# Visibility

Functions and state variables have to declare whether they are accessible by other contracts.

Functions can be declared as

- `public` - any contract and account can call
- `private` - only inside the contract that defines the function
- `internal`- only inside contract and child contracts
- `external` - only other contracts and accounts can call

State variables can be declared as `public`, `private`, or `internal` but not `external`.

![Visibility!](./images/visibility.png 'Visibility')

## Test

![Visibility!](./images/visibility_2.png 'Visibility')

