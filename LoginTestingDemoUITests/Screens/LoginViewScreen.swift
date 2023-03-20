//
//  LoginViewScreen.swift
//  LoginTestingDemo
//
//  Created by Allison Hoffman on 3/20/23.
//

import XCTest

class LoginViewScreen {
    
    static let app = XCUIApplication()
    
    static let title = app.staticTexts["LoginView_title_text"]
    
    func validateElements() {
        
        print(Self.app.debugDescription)
        
        XCTAssertTrue(Self.title.exists && Self.title.isHittable)
    }
    
}
