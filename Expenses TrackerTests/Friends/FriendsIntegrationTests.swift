//
//  ExpensesIntegrationTests.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import XCTest
@testable import Expenses_Tracker

class FriendsIntegrationTests: XCTestCase {
    
    var sut: ListViewController!

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
    
    func test_friendsList_serviceShouldCalled_when_viewWillAppear() {
        let api = MockFriendAPI()
        let adapter = FriendsAPIItemsServiceAdapterMock(api: api)
        
        sut.service = adapter
        sut.simulateLoadData()
        
        XCTAssertTrue(api.isCalled)
        XCTAssertTrue(adapter.isCalled)
    }
    
    
    func test_friendsList_reloadTableView_when_itemsLoaded() throws {
        
        let f1 = Friend(id: UUID(), name: "a name", email: "an email", number: "a number", icon: "a icon")
        let f2 = Friend(id: UUID(), name: "a name", email: "an email", number: "a number", icon: "a icon")
        sut.service = FriendsAPIItemsServiceAdapterMock(api: MockFriendAPI.success([f1, f2]))
        sut.simulateLoadData()
        
        XCTAssertEqual(sut.numberOfItems(at: 0), 2)
        XCTAssertEqual(sut.expensesTitle(at: 0), f1.name, "friend name at row 0")
        XCTAssertEqual(sut.expensesTitle(at: 1), f2.name, "friend name at row 1")
    }
    
    
    func test_friendsList_loadFailed_when_serviceFailed() throws {
        
        // Given
        let exp = expectation(
            forNotification: Notification.Name.AlertNotification,
            object: sut,
            handler: nil)
        
        let api = MockFriendAPI.never(NSError(localizedDescription: "an error message"))
        sut.service = FriendsAPIItemsServiceAdapterMock(api: api)
        
        // When
        sut.simulateLoadData()
        
        // Then
        XCTAssertEqual(sut.numberOfItems(at: 0), 0)
        wait(for: [exp], timeout: 1)
        
    }
}


private extension ContainerViewControllerSpy {
    
    func friendsList() throws -> ListViewController {
        let vc = try XCTUnwrap((rootTab(atIndex: 1) as UINavigationController).topViewController as? ListViewController, "couldn't find friends list")
        vc.triggerLifecycleIfNeeded()
        return vc
    }
}
