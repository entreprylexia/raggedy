Feature: Editing
  In order to correct my mistakes
  As Stephanie
  I want to be able to edit the details of an item

  Scenario: Changing the Title 
    Given Stephanie has signed up
    And Stephanie adds a bag to sell
    When she decides to change the Title to "Chanel Bag 22"
    Then the Title should have changed to "Chanel Bag 22"

  Scenario: Changing the Category 
    Given Stephanie has signed up
    And Stephanie adds a bag to sell
    When she decides to change the Category from "Shoulder Bags" to "Dresses"
    Then the Category should have changed to "Dresses"

  Scenario: Changing the Size
    Given Stephanie has signed up
    And Stephanie adds a dress to sell
    When she decides to change the dress size to "M"
    Then the Size should have changed to "S" 

  Scenario: Changing the Description 
    Given Stephanie has signed up
    And Stephanie adds a bag to sell
    When she decides to change the Description to "Brand New"
    Then the Description should have changed to "Brand New"

  Scenario: Changing the asking price
  	Given Stephanie has signed up
  	And Stephanie adds a bag to sell
  	When she decides to change the "Asking price" to "22.00"
  	Then the Asking price should have changed to "22.00" 

  Scenario: Changing the original price
	Given Stephanie has signed up
  	And Stephanie adds a bag to sell
  	When she decides to change the "Original price" to "66.07"
  	Then the Original price should have changed to "66.07"   

 
