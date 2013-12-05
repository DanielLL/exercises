Feature: Manage Users
  In order to create an agenda
  As a user
  I want to create and manage user's information

  Scenario: Users list
    Given I have a user with this information, "Daniel","Lopez", "daniel.lopez@tangosource.com", "123tamarindo"
    When I go to the list of users
    Then I should see "Daniel Lopez"
    And I should see "daniel.lopez@tangosource.com"

  Scenario: Create Valid User
    Given I have no users
    And I am on the list of users
    When I click on "New User"
    And I fill in "Name" with "Daniel"
    And I fill in "Last name" with "Lopez Lopez"
    And I fill in "Mail" with "daniel.lopez@tangosource.com"
    And I fill in "Password" with "123tamarindo"
    And I press "Create User"
    Then I should see "New user created."
    And I should see "Daniel Lopez Lopez"
    And I should see "daniel.lopez@tangosource.com"
    And I should have 1 user

  Scenario: Create an Invalid User
    Given I have no users
    And I am on the list of users
    When I click on "New User"
    And I fill in "Name" with "Daniel"
    And I fill in "Last name" with "Lopez Lopez"
    And I fill in "Password" with "123tamarindo"
    And I press "Create User"
    Then I should see "Your user was not created"
    And I should have 0 users

  Scenario: Update a User with the old password
    Given I have a user with this information, "test_name","test_last_name", "test_mail", "123tamarindo"
    And I am on the list of users
    When I click on "Edit"
    And I fill in "Name" with "Daniel"
    And I fill in "Last name" with "Lopez Lopez"
    And I fill in "Mail" with "daniel.lopez@tangosource.com"
    And I fill in "Old password" with "123tamarindo"
    And I fill in "Password" with "elmeneito"
    And I press "Update User"
    Then I should see "Your user was udpated"
    And I should see "Daniel Lopez Lopez"
    And I should see "daniel.lopez@tangosource.com"
    And The last user should have "elmeneito" as password

  Scenario: Update a User with the old password
    Given I have a user with this information, "test_name","test_last_name", "test_mail", "123tamarindo"
    And I am on the list of users
    When I click on "Edit"
    And I fill in "Name" with "Daniel"
    And I fill in "Last name" with "Lopez Lopez"
    And I fill in "Mail" with "daniel.lopez@tangosource.com"
    And I fill in "Old password" with "wrongpassword"
    And I fill in "Password" with "elmeneito"
    And I press "Update User"
    Then I should see "Your user was not udpated"
    And I should see "test_name"
    And I should see "test_last_name"
    And I should see "test_mail"
    And The last user should have "123tamarindo" as password
