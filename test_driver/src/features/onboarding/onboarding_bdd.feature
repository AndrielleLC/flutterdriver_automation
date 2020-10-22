Feature: Onboarding steps

    Scenario: Validate fields on Onboarding Page
        Given I started the app
        Then I have the email field, password field and the login button


    Scenario: Login
        Given I started the app
        And I fill the email field and the password field
        When I tap the login button
        Then I see the product list called as "Products List"