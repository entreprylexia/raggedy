Feature: Editing
  In order to correct my mistakes
  As Stephanie
  I want to be able to edit the details of an item

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

 
