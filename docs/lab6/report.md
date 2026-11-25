# SET 312 – Lab 6
## TDD, BDD and Refactoring

**Student Name:** Malak Mohamed Mahmoud Elmligy

---

## 1. Introduction

In this lab, I practiced three important software testing and development techniques: Test-Driven Development (TDD), Behavior-Driven Development (BDD), and Refactoring.

The main goal was to write tests before implementing code, describe system behavior using Gherkin scenarios, and improve the code structure without changing its behavior.

I used Python, Pytest, Behave, and other development tools to complete the tasks.

## 2. Test Methodology

### Part A: Test-Driven Development (TDD)

I used the Red-Green-Refactor cycle.

- **Red:** I wrote a test first and ran it to make sure it failed.
- **Green:** I implemented the minimum code needed to make the test pass.
- **Refactor:** I improved the code while keeping all tests passing.

I implemented a course registration system with the following rules:

1. A student can register for a course and its credit hours are added to the total.
2. The total registered credit hours must not exceed 18.
3. A student cannot register for the same course twice.
4. A student can drop a registered course.
5. A student cannot drop a course that is not registered.

I also added tests to check that invalid operations raise a `RegistrationError`.

### Part B: Behavior-Driven Development (BDD)

I used Behave and Gherkin to describe the expected behavior of the registration system.

The feature file contains scenarios for:

- Registering a course within the allowed credit-hour limit.
- Rejecting registration when the total exceeds 18 hours.
- Rejecting duplicate course registration.
- Testing different credit-hour values using a Scenario Outline.
- Dropping a registered course.

I also added a step for dropping a course that is already registered.

### Part C: Refactoring

I first wrote characterization tests for the legacy invoice code to understand and protect its existing behavior before changing its structure.

After that, I refactored the invoice code by separating the fee calculation into different policy classes and separating file writing into a `FileWriter` class.

This made the code easier to understand, test, and extend.

I also used dependency injection to allow passing a writer to the `make_invoice` function instead of depending directly on file operations.

### Adding SiblingPolicy Using TDD

I added a new `SiblingPolicy` using the TDD approach.

The new policy gives a 25% discount on the regular fee, which means the student pays 75% of the regular fee.

I first added a test for the new policy and ran it. The test failed because the sibling policy was not available yet.

Then I implemented `SiblingPolicy` and added it to the policy dictionary.

The test passed after the implementation.

I did not need to modify the `make_invoice` function to add this new policy.

## 3. Test Execution Summary

I used Pytest to execute the tests and check the code coverage.

### Registration Tests

The registration tests cover adding courses, checking the 18-hour limit, preventing duplicate registration, and dropping courses.

The coverage command was:

```bash
python -m pytest --cov=registration --cov-report=term-missing tests/test_registration.py
```

**Result:** 5 tests passed and 100% code coverage was achieved for `registration.py`.

### Invoice Tests

I ran the invoice characterization tests before and after refactoring.

I also tested the new SiblingPolicy separately.

**Result:** 5 invoice tests passed.

### Full Test Suite

I ran all Pytest tests using:

```bash
python -m pytest -q
```

**Result:** 10 tests passed.

### Code Coverage Question

Does 100% code coverage prove that the code is completely correct?

No, 100% code coverage does not prove that the code is completely correct. It only means that all executable lines were tested. There may still be errors or missing test cases.

## 4. Bug Report

During the testing and implementation process, I focused on checking both valid and invalid inputs.

The tests helped identify problems such as:

- Registering the same course more than once.
- Registering courses when the total credit hours exceed 18.
- Dropping a course that was never registered.
- Requesting an invoice policy that does not exist.

These cases were handled using validation and appropriate exceptions.

## 5. Code Smells

During the legacy invoice review, I focused on the following code smells and the improvements used during refactoring.

| Code Smell | Where It Appears | Principle It Breaks |
|---|---|---|
| Conditional logic for different invoice types | Legacy invoice calculation | Open/Closed Principle |
| Repeated fee calculation logic | Invoice calculation | Don't Repeat Yourself (DRY) |
| Magic numbers and hardcoded values | Fee and discount calculations | Maintainability |
| Direct file handling inside invoice logic | Invoice generation and file writing | Single Responsibility Principle |

The refactoring helped separate responsibilities and made it easier to add new invoice policies.

## 6. Tools Used in Development

I used the following tools during this lab:

- **Python:** To implement the registration and invoice systems.
- **Pytest:** To write and run unit tests.
- **Pytest-Cov:** To measure code coverage.
- **Behave:** To run BDD scenarios.
- **Gherkin:** To write features and scenarios in a readable format.
- **Ruff:** To check Python code quality.
- **VS Code:** To edit and organize project files.
- **Git:** To track code changes and commits.

## 7. Lesson Learned

Through this lab, I learned that writing tests before implementation helps me understand the requirements and find problems early.

I also learned how BDD can describe system behavior in a clear way that is easy to understand.

The refactoring part helped me understand the importance of separating responsibilities and writing maintainable code.

Finally, I learned that code coverage is useful for measuring which lines were executed, but it does not guarantee that the program is completely correct.

---

## 8. Conclusion

This lab gave me practical experience with TDD, BDD, unit testing, code coverage, and refactoring.

I practiced writing tests, implementing features, checking results, and improving code structure while keeping the existing behavior.

