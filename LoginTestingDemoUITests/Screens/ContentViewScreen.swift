//
//  ContentViewScreen.swift
//  LoginTestingDemo
//
//  Created by Allison Hoffman on 3/20/23.
//

import XCTest

class ContentViewScreen {
    
    static let app = XCUIApplication()
    
    static let title = app.staticTexts["ContentView_title_text"]
    static let emailIcon = app.images["ContentView_personIcon_image"]
    static let emailField = app.textFields["ContentView_email_textField"]
    static let passwordIcon = app.images["ContentView_lockIcon_image"]
    static let passwordField = app.secureTextFields["ContentView_password_secureTextField"]
    static let loginButton = app.buttons["ContentView_login_button"]
    
    func validateElements() {
        XCTAssertTrue(Self.title.exists)
        XCTAssertTrue(Self.emailIcon.exists)
        XCTAssertTrue(Self.emailField.exists && Self.emailField.isHittable)
        XCTAssertTrue(Self.passwordIcon.exists)
        XCTAssertTrue(Self.passwordField.exists && Self.passwordField.isHittable)
        XCTAssertTrue(Self.loginButton.exists && Self.loginButton.isHittable)
    }
    
    func enterValidEmail() {
        Self.emailField.tap()
        Self.emailField.typeText("email@domain.com")
    }
    
    func enterInvalidEmail() {
        Self.emailField.tap()
        Self.emailField.typeText("plainaddress")
    }
    
    func enterValidPassword() {
        Self.passwordField.tap()
        Self.passwordField.typeText("password")
    }
    
    func enterInvalidPassword() {
        Self.passwordField.tap()
        Self.passwordField.typeText("$%$$%$")
    }
    
    func selectLogin() -> LoginViewScreen {
        Self.loginButton.tap()
        return LoginViewScreen()
    }
    
}
