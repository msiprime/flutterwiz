// Single Responsibility Principle (SRP)
// A class should only have one reason to change, and should only have one job.

/// Wrong cause -> violates SRP
/// UserManager class has multiple responsibilities.
/// It should be split into multiple classes.
class UserManager {
  void login() {}

  void logout() {}

  void register() {}

  void updateUser() {}

  void deleteUser() {}
}

class AuthManager {
  void login() {}

  void logout() {}

  void register() {}
}

class ProfileManager {
  void updateUser() {}

  void deleteUser() {}
}

class UserManager2 {
  AuthManager authManager;
  ProfileManager profileManager;

  UserManager2(this.authManager, this.profileManager);

  void login() {
    authManager.login();
  }

  void logout() {
    authManager.logout();
  }

  void register() {
    authManager.register();
  }

  void updateUser() {
    profileManager.updateUser();
  }

  void deleteUser() {
    profileManager.deleteUser();
  }
}

/// Benefits
/// 1. Easier to maintain
/// 2. Easier to test
/// 3. Easier to understand
/// 4. Less code duplication
/// 5. More reusable
/// 6. More flexible
/// 7. More scalable
/// 8. More readable
/// 9. More maintainable
/// 10. More testable
/// 11. More reliable
/// 12. More secure
/// 13. More efficient
/// 14. More robust
/// 15. More stable
/// 16. More consistent
/// 17. More predictable
/// 18. More productive
/// 19. More valuable
/// 20. More quality
/// 21. More performance
