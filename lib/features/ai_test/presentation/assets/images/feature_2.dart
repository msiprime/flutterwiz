abstract class X {}

interface class Y {}

abstract interface class Z {}

class AxyZ extends X implements Y, Z {}

class B extends Y {}

class C extends B {}

interface class DummyInterface {
  void doSomething() {
    print("Doing something");
  }
}

abstract class DummyAbstract {
  void doSomethingElse();
  void doSomething() {
    print("Doing something");
  }
}

abstract interface class TrueAbstraction {}
