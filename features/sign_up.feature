Feature: Sign up
  In order to get access to protected sections of the site
  As person wanting to sell stuff
  I want to be able to sign up

  Scenario: Stephanie signs up
    Given Stephanie wants to sell stuff on Raggedy
    When Stephanie signs up
    Then Stephanie should be able to sell items
	
  Scenario: Nina tries to sign up
    Given Nina wants to sell stuff on Raggedy
    When Nina signs up with a short password
    Then Nina should not be able to sign up

  Scenario: Nina tries to sign up as Stephanie
    Given Stephanie has signed up
    When Nina wants to sign up using Stephanies details
    Then Nina should not be able to sign up