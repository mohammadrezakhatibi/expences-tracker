//
//  ExpencesIntegrationTests.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import XCTest
@testable import Expenses_Tracker

class FriendsIntegrationTests: XCTestCase {
    
    var sut: UIViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = try SceneBuilder().build().friendsList()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_friendsList_title() throws {
        XCTAssertEqual(sut.title, "Friends")
    }

}


private extension ContainerViewControllerSpy {
    
    func friendsList() throws -> UIViewController {
        let vc = try XCTUnwrap((rootTab(atIndex: 1) as UINavigationController).topViewController, "couldn't find friends list")
        vc.triggerLifecycleIfNeeded()
        return vc
    }
}
