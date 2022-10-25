## View and Pure Function

Funtion has `visibility` and `behavior`

![View and Pure Function!](./images/view_and_pure_function.png "View and Pure Function!")

- Visibility

1. public
2. private
3. external
4. internal

- Behavior

1. view
2. pure
3. payable

`View` function decleares that no state will be changed.

`Pure` function declares that no state variable will be changed or read.

The following statement considered modifying the state

![View and Pure Function!](./images/view_and_pure_functions.png "View and Pure Function!")

Test

![View and Pure Function!](./images/view_and_pure_functions_2.png "View and Pure Function!")

The following statement considered reading the state

![View and Pure Function!](./images/view_and_pure_functions_3.png "View and Pure Function!")

Sum up:

![View and Pure Function!](./images/view_and_pure_functions_4.png "View and Pure Function!")

If miss `view` or `pure` functions, Remix will warning

- View

```sh
Warning: Function state mutability can be restricted to view
 --> ViewAndPure.sol:7:3:
  |
7 |   function addToX(uint y) public returns (uint) {
  |   ^ (Relevant source part starts here and spans across multiple lines).
```

- Pure

```sh
Warning: Function state mutability can be restricted to pure
  --> ViewAndPure.sol:26:3:
   |
26 |   function add(uint i, uint j) public returns (uint) {
   |   ^ (Relevant source part starts here and spans across multiple lines).

```
