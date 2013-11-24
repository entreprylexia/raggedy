Feature: Adding stuff for sale
  In order to sell my old clothes
  As Stephanie
  I want to add stuff for sale

  Scenario: Adding a bag (no photo)
  	Given Stephanie has signed up
  	When Stephanie adds a bag to sell
  	Then the bag should have been added to the shop

  Scenario: Adding a bag with an original price of zitch, zero, nada
  	Given Stephanie has signed up
  	When Stephanie adds a bag to sell with an original price of 0
  	Then there will be an error while trying to add the bag

  # Bugs
  # ----
  #
  # Reported by Sam after testing our site for the first time.
  # Damn you Sam! ;)
  Scenario: Stephanie adds a bag with the price in usd
  	Given Stephanie has signed up
  	When Stephanie adds a bag to sell with prices in usd
  	Then there will be an error while trying to add the bag
