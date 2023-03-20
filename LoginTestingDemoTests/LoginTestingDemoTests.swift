//
//  LoginTestingDemoTests.swift
//  LoginTestingDemoTests
//
//  Created by Allison Hoffman on 3/20/23.
//

import XCTest
@testable import LoginTestingDemo

final class LoginTestingDemoTests: XCTestCase {
    
    private lazy var contentView: ContentView = {
        ContentView()
    }()

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidEmails() throws {
        XCTAssert(contentView.isEmailValid("a@aa.aa"))
        XCTAssert(contentView.isEmailValid("email@aa.aa"))
        XCTAssert(contentView.isEmailValid("email@domain.com"))
        XCTAssert(contentView.isEmailValid("firstname.lastname@domain.com"))
        XCTAssert(contentView.isEmailValid("email@subdomain.domain.com"))
        XCTAssert(contentView.isEmailValid("firstname+lastname@domain.com"))
        XCTAssert(contentView.isEmailValid("1234567890@domain.com"))
        XCTAssert(contentView.isEmailValid("email@domain-one.com"))
        XCTAssert(contentView.isEmailValid("_______@domain.com"))
        XCTAssert(contentView.isEmailValid("email@domain.name"))
        XCTAssert(contentView.isEmailValid("email@domain.com.cn"))
        XCTAssert(contentView.isEmailValid("email@domain.first.last.com.cn"))
        XCTAssert(contentView.isEmailValid("firstname-lastname@domain.com"))
        let superlongEmail = "1234567890123456789012345678901234567890123456789012345678901234567890@abcdefchijklmnopqrstuvwxyzabcdefchijklmnopqrstuvwxyzabcdefchijklmnopqrstuvwxyz.abcdefchijklmnopqrstuvwxyzabcdefchijklmnopqrstuvwxyzabcdefchijklmnopqrstuvwxyz"
        XCTAssert(contentView.isEmailValid(superlongEmail))
        XCTAssert(contentView.isEmailValid("123abc@domain.com"))
        XCTAssert(contentView.isEmailValid("1234567890@domain.com"))
    }
    
    func testInvalidEmails() {
        XCTAssertFalse(contentView.isEmailValid("email@123.123.123.123"))
        XCTAssertFalse(contentView.isEmailValid("email@[123.123.123.123]"))
        XCTAssertFalse(contentView.isEmailValid("\"email\"@domain.com"))
        XCTAssertFalse(contentView.isEmailValid("plainaddress"))
        XCTAssertFalse(contentView.isEmailValid("#@%^%#$@#$@#.com"))
        XCTAssertFalse(contentView.isEmailValid("@domain.com"))
        XCTAssertFalse(contentView.isEmailValid("Joe Smith <email@domain.com>"))
        XCTAssertFalse(contentView.isEmailValid("email.domain.com"))
        XCTAssertFalse(contentView.isEmailValid("电子邮箱@domain.com"))
        XCTAssertFalse(contentView.isEmailValid("email@domain.com (Joe Smith)"))
        XCTAssertFalse(contentView.isEmailValid("email@domain"))
        XCTAssertFalse(contentView.isEmailValid("email@111.222.333.44444"))
        XCTAssertFalse(contentView.isEmailValid("email@aa.a"))
    }
    
    
    func testPasswordValidator() throws {
        XCTAssertFalse(contentView.isPasswordValid(""))
        XCTAssertFalse(contentView.isPasswordValid("????"))
        XCTAssertTrue(contentView.isPasswordValid("thisisapassword"))
        XCTAssertTrue(contentView.isPasswordValid("2345346134134"))
        XCTAssertFalse(contentView.isPasswordValid("$%$$%$"))
    }
    



}
