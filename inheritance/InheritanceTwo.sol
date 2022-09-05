// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
  event Log(string message);

  function foo() public virtual {
    emit Log("A.foo was called");
  }

  function bar() public virtual {
    emit Log("A.bar was called");
  }
}

contract B is A {
  function foo() public virtual override {
    emit Log("B.foo was called");
    A.foo();
  }

  function bar() public virtual override  {
    emit Log("B.bar was called");
    super.bar();
  }
}

contract C is A {
  function foo() public virtual override {
    emit Log("C.foo was called");
    A.foo();
  }

  function bar() public virtual override  {
    emit Log("C.bar was called");
    super.bar();
  }
}

contract D is B, C {
  function foo() public override(B, C) {
      return super.foo();
  }

  function bar() public virtual override(B, C)  {
    emit Log("D.bar was called");
    super.bar();
  }
}