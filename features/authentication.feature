Feature: Authentication

  In order to use the website
  As a user
  I should be able to sign up, sign in, sign out and reset my password

  Scenario: Signing up
    Given I visit the homepage
    When I click in the Sign Up link
    And I fill in the sign up form
    Then I should be redirected to user root url

  Scenario: Signing in
    Given I am a registered user
    And I visit the homepage
    When I click in the Sign In link
    And I fill in the sign in form
    Then I should be redirected to the dashboard

  Scenario: Sign out
    Given I am a registered user
    And I visit the homepage
    When I click in the Sign In link
    And I fill in the sign in form
    And I click on the sign out link
    Then I should be redirected to root url

  Scenario: Reset Password
    Given I am a registered user
    And I visit the homepage
    When I click in the Sign In link
    And I click on the forgot password link
    And I fill in the forgot password form
    And I receive an email to reset my password
    Then I should be redirected to a page to create a new password