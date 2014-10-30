Feature: Login

  Background:
    Given I am on the admin login page

  Scenario Outline: Successful login
    When I enter email with <email> and password with <password>
    And I click on the login button
    Then I am on the admin user page
    And I logout


  Examples:
  | email                 | password     |
  | admin@dealhub.com     | admin123     |


Scenario Outline: Unsuccessful login
    When I enter email with <email> and password with <password>
    And I click on the login button
    Then I get an error message

  Examples:
  | email                 | password     |
  | admin1@dealhub.com     | Admin123     |
  | abc@abc.com           | akkaa        |