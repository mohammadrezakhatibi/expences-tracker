//
//  ExpencesIntegrationTests.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import XCTest
@testable import Expenses_Tracker

class ExpencesIntegrationTests: XCTestCase {

    var sut: ListViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = try SceneBuilder().build().expencesList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_expencesList_title() throws {
        XCTAssertEqual(sut.title, "Expenses")
    }
    
    func test_expencesList_callServiceLoadItems_when_viewWillApear() {
        
        let mock = ItemsServiceMock()
        sut.service = mock
        
        sut.viewDidLoad()
        
        XCTAssertEqual(mock.isStarted, true)
    }

}


private extension ContainerViewControllerSpy {
    ///
    /// Provides ways of extracting the "Expences" list view controller from the root tab bar
    /// without coupling the tests with internal implementation details, such as the tab item index.
    /// So we can later change those internal details easily without breaking the tests.
    ///
    func expencesList() throws -> ListViewController {
        let vc = try XCTUnwrap((rootTab(atIndex: 0) as UINavigationController).topViewController as? ListViewController, "couldn't find expences list")
        vc.triggerLifecycleIfNeeded()
        return vc
    }
}
