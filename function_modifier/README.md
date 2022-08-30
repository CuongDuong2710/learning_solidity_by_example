# Function modifier

Modifier are code that can be run before and/ or the function call.

![Function modifier!](./images/function_modifer.png "Function modifier")

Modifiers can be used to:

- Restrict access
- Validate inputs
- Guard against reentrancy hack

Underscore `_;` is a special character only used inside a function modifier and `it tells Solidity to execute the rest of the code`.

Infinitie contract B call function f() of contract A => lost of money

![Function modifier!](./images/function_modifer_2.png "Function modifier")

Examples

- Without modifier `noReentrancy`

![Function modifier!](./images/function_modifer_3.png "Function modifier")

![Function modifier!](./images/function_modifer_4.png "Function modifier")

- With modifier `noReentrancy`

![Function modifier!](./images/function_modifer_5.png "Function modifier")

Test

![Function modifier!](./images/function_modifer_6.png "Function modifier")

![Function modifier!](./images/function_modifer_7.png "Function modifier")