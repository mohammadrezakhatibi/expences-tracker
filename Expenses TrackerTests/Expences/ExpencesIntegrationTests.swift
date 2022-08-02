//
//  ExpencesIntegrationTests.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import XCTest

class ExpencesIntegrationTests: XCTestCase {

    func test_expencesList_title() throws {
        let expencesList = try SceneBuilder().build().expencesList()
        XCTAssertEqual(expencesList.title, "Expenses")
    }

}


private extension ContainerViewControllerSpy {
    ///
    /// Provides ways of extracting the "Expences" list view controller from the root tab bar
    /// without coupling the tests with internal implementation details, such as the tab item index.
    /// So we can later change those internal details easily without breaking the tests.
    ///
    func expencesList() throws -> UIViewController {
        let vc = try XCTUnwrap((rootTab(atIndex: 0) as UINavigationController).topViewController, "couldn't find expences list")
        vc.triggerLifecycleIfNeeded()
        return vc
    }
}
