//
//  ExpensesIntegrationTests.swift
//  Expenses TrackerTests
//
//  Created by mohammadreza on 8/2/22.
//

import XCTest
@testable import Expenses_Tracker

class ExpensesIntegrationTests: XCTestCase {

    var sut: ListViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = try SceneBuilder().build().expensesList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_expensesList_title() throws {
        XCTAssertEqual(sut.title, "Expenses")
    }
    
    func test_expensesList_callServiceLoadItems_when_viewWillAppear() {
        
        let mock = ItemsServiceMock()
        sut.service = mock
        
        sut.viewDidLoad()
        
        XCTAssertEqual(mock.isStarted, true)
    }

}


private extension ContainerViewControllerSpy {
    ///
    /// Provides ways of extracting the "Expenses" list view controller from the root tab bar
    /// without coupling the tests with internal implementation details, such as the tab item index.
    /// So we can later change those internal details easily without breaking the tests.
    ///
    func expensesList() throws -> ListViewController {
        let vc = try XCTUnwrap((rootTab(atIndex: 0) as UINavigationController).topViewController as? ListViewController, "couldn't find expenses list")
        vc.triggerLifecycleIfNeeded()
        return vc
    }
}
