//ignore_for_file: avoid_print
//ignore_for_file: public_member_api_docs
//ignore_for_file: dangling_library_doc_comment

// what is the Interface Segregation Principle (ISP)?
//
//  Core Idea: Clients (like widgets in Flutter) should not be forced to depend
//  on methods they don't use.
//  In simpler terms: Break down large interfaces into smaller, more specific ones.
//  This prevents classes from being burdened with unnecessary methods.

abstract interface class Worker {
  void develop();
  void test();
}

/// Wrong way -> Developer do not need to test
// class Developer implements Worker {
//   @override
//   void develop() {
//     print('Developing...');
//   }
//
//   @override
//   void test() {
//     print('Testing...');
//   }
// }

/// Wrong way -> Tester do not need to develop
// class Tester implements Worker {
//   @override
//   void develop() {
//     throw UnimplementedError();
//   }
//
//   @override
//   void test() {
//     print('Testing...');
//   }
// }

/// Correct way -> Implementing the Interface Segregation Principle
///
/// The Worker interface is broken down into two smaller interfaces: Developer and Tester.

abstract interface class Developer {
  void develop();
}

abstract interface class Tester {
  void test();
}

class DeveloperImpl implements Developer {
  @override
  void develop() {
    print('Developing...');
  }
}

class TesterImpl implements Tester {
  @override
  void test() {
    print('Testing...');
  }
}

// benefits of ISP
// Reduced Complexity: Smaller interfaces are easier to understand, maintain, and test.
// Increased Flexibility: Classes become more adaptable to change. If you need
// to modify an interface, you only need to change the specific interfaces that are affected, rather than a large, monolithic interface.
// Improved Code Reusability: Smaller, focused interfaces can be more easily
// reused in different parts of your application.
// Better Testability: Smaller interfaces are easier to test in isolation,
// leading to more robust and reliable code.
