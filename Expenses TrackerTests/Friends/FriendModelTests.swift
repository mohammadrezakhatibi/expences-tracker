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
        sut = Friend(id: UUID(), name: "a friend", email: "a email", number: "a number", icon: "")
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_model_title_when_created() {
        XCTAssertEqual(sut.name, "a friend", "titles should be the same")
    }
    
    func test_model_email_when_created() {
        XCTAssertEqual(sut.email, "a email", "emails should be the same")
    }

}
