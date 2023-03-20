//
//  LoginTestingDemoUITests.swift
//  LoginTestingDemoUITests
//
//  Created by Allison Hoffman on 3/20/23.
//

import XCTest

final class LoginTestingDemoUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        if let failureCount = testRun?.failureCount, failureCount > 0 {
            let screenshot = XCUIScreen.main.screenshot()
            let attach = XCTAttachment(screenshot: screenshot)
            add(attach)
        }
        super.tearDown()
    }
    
    func testUIElements() {
        let contentView = ContentViewScreen()
        contentView.validateElements()
    }
    
    func testValidEmail() {
        let contentView = ContentViewScreen()
        contentView.enterValidEmail()
        contentView.enterValidPassword()
        let loginView = contentView.selectLogin()
        loginView.validateElements()
    }
    
    func testInvalidEmail() {
        let contentView = ContentViewScreen()
        contentView.enterEmail("")
    }


}
