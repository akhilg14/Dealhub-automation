Feature: Create Admin

  Background:
    Given I am on the admin login page

   Scenario Outline: Create an admin
   When I click on create new admin
   Then I should be on Add new admin page
   When I enter name with <name> and email with <email>
   And I click on Create Admin
   Then I should get a success message of that <name>
   And I logout

   Examples:
  | name                 | email             |
  | tester123             | tester123@abc.com  |
  | was123                | was123@abc.com     |