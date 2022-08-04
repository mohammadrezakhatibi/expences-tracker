//
//  FriendModelTests.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/3/22.
//

import XCTest
@testable import Expenses_Tracker

class FriendModelTests: XCTestCase {
    
    var sut: Friend!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Friend(id: UUID(), name: "a friend", email: "an email", number: "a number", icon: "an icon")
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_model_title_when_created() {
        XCTAssertEqual(sut.name, "a friend", "titles should be the same")
    }
    
    func test_model_email_when_created() {
        XCTAssertEqual(sut.email, "an email", "emails should be the same")
    }
    
    func test_model_number_when_created() {
        XCTAssertEqual(sut.number, "a number", "emails should be the same")
    }
    
    func test_model_icon_when_created() {
        XCTAssertEqual(sut.icon, "an icon", "emails should be the same")
    }
}
