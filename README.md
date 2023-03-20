# Unit Tests vs Automated UI Tests

Here are two different types of automated tests: 

<b>Unit test:</b> block of code that tests another block of code, very fast   
<b>UI test:</b> block of code that tests the application from the user perspective, very slow

Let's look at how these two different types of tests should be used. 

<b>Scenario to test:</b> When attempting to sign in, I should not be able to use an invalid email address. 

I could test this with the UI, either manually or with UI automation. Manually, a person has to use the app to enter the following invalid emails to make sure none of them are accepted: 

email@123.123.123.123  
email@[123.123.123.123]  
"email"@domain.com  
plainaddress  
#@%^%#$@#$@#.com  
@domain.com  
Joe Smith \<email@domain.&#8203;com\>  
email.domain.com  
电子邮箱@domain.com  
email@domain.&#8203;com (Joe Smith)  
email@domain  
email@111.222.333.44444  
email@aa.&#8203;a  


With UI automation, a computer uses the app to enter the above emails to make sure none of them are accepted. 

Test code: TO-DO

The problem with this approach is that it takes an entire minute to run. Just to test ONE TEXT ENTRY FIELD. You can imagine how that will add up when we’re testing the entire app. 

<b>So what do we do?</b>

There are two things being tested, here:   
A) Does the app recognize when an email address is invalid?   
B) Does the app inform me that the email address is invalid and prompt me to enter it again? 

With the UI automation test, I’m testing both A and B at the same time. In fact, I’m testing B over and over and over and over every time I test A! 

So instead, I’m going to test A through the CODE instead of the UI. Then I can test B with just one input to make sure that the UI gives me the right output when I enter an invalid email address. And I’ll already know that under the hood, the app knows when an email address is valid or not, because I’ve already tested A!

<b>Test A (unit test): </b>

Unlike the UI automation test, which “manually” interacts with the app from a user’s perspective, this test will send the email addresses directly to the block of code in the app, called a function, that decides whether or not an email address is valid:    
`func isEmailValid(_ email: String?) -> Bool {                                  `  
`        guard let email = email,                                                 `   
`              !email.isEmpty else {                                              `   
`                return false                                                     `   
`        }                                                                        `   
`        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]{1,}\\.[A-Za-z]{2,}"    `   
`        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)`   
`        return emailPredicate.evaluate(with: email)                              `   
`}                                                                              `   

This function takes the email address as an input, and compares it to the pattern specified in the red text, which is a regular expression (aka regex) designed to only match valid email addresses. Then the function returns a boolean value as an output: true or false. If the email matches the pattern, it’ll return “true”, and the code that called this function will know that it can continue to the next step (which is probably to call a different function that checks if the password is valid). If it returns “false”, the code knows that the app needs to present the error message. 

So for Test A, I’ll simply send all the invalid emails to this function and check that I get “false” back for each one! 

Test code:     
`func testInvalidEmails() {                                                 `   
`    XCTAssertFalse(contentView.isEmailValid("email@123.123.123.123"))        `   
`    XCTAssertFalse(contentView.isEmailValid("email@[123.123.123.123]"))      `  
`    XCTAssertFalse(contentView.isEmailValid("\"email\"@domain.com"))         `   
`    XCTAssertFalse(contentView.isEmailValid("plainaddress"))                 `    
`    XCTAssertFalse(contentView.isEmailValid("#@%^%#$@#$@#.com"))             `      
`    XCTAssertFalse(contentView.isEmailValid("@domain.com"))                  `      
`   XCTAssertFalse(contentView.isEmailValid("Joe Smith <email@domain.com>"))`     
`    XCTAssertFalse(contentView.isEmailValid("email.domain.com"))             `      
`    XCTAssertFalse(contentView.isEmailValid("电子邮箱@domain.com"))           `   
`   XCTAssertFalse(contentView.isEmailValid("email@domain.com (Joe Smith)"))`     
`    XCTAssertFalse(contentView.isEmailValid("email@domain"))                 `    
`    XCTAssertFalse(contentView.isEmailValid("email@111.222.333.44444"))      `   
`    XCTAssertFalse(contentView.isEmailValid("email@aa.a"))                   `    
`}                                                                          `

This takes longer to push the start button than it takes to run the test (less than 1 second).

Now I can trim my automated UI test from earlier to make it enter just one invalid email address to verify that the error message appears, which covers Test B!

<b>Test B (UI test):</b>

Test code:  TO-DO

This one takes less than 10 seconds.

<b>So with Tests A and B, using both a unit test and a UI test, I’m testing the same thing in around 10 seconds that was taking 60 seconds using just a UI test! </b>

 

