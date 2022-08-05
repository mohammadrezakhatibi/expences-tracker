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
    
    func test_expensesList_serviceShouldCalled_when_viewWillAppear() throws {

        let api = MockExpensesAPI()
        let adapter = ExpensesAPIServiceAdapter(api: api)
        sut.service = adapter
        
        sut.simulateLoadData()
        
        XCTAssertTrue(api.isCalled, "service hasn't called")
    }
    
    func test_expensesList_showErrorAlert_when_serviceLoadItemsFailed() throws {
        
        
        let exp1 = Expense(id: UUID(), title: "a expense", category: .food, price: 40 ,icon: "", date: "")
        let exp2 = Expense(id: UUID(), title: "a expense", category: .food, price: 20,icon: "", date: "")
        
        let api = MockExpensesAPI.success([exp1, exp2])
        sut.service = ExpensesAPIServiceAdapter(api: api)
        sut.simulateLoadData()
        
        XCTAssertEqual(sut.numberOfItems(at: 0), 2)
        XCTAssertEqual(sut.itemTitle(at: 0), exp1.title, "expense's title at row 0")
        XCTAssertEqual(sut.itemTitle(at: 1), exp2.title, "expense's title at row 1")
    }
    
    
    func test_friendsList_showCorrectTitleAndSubtitle_when_itemsLoaded() throws {
        
        // Given
        let exp1 = Expense(id: UUID(), title: "a expense", category: .food, price: 40 ,icon: "", date: "")
        let exp2 = Expense(id: UUID(), title: "a expense", category: .food, price: 20,icon: "", date: "")
        
        let api = MockExpensesAPI.success([exp1, exp2])
        sut.service = ExpensesAPIServiceAdapter(api: api)
        
        // When
        sut.simulateLoadData()
        
        // Then
        XCTAssertEqual(sut.numberOfItems(at: 0), 2)
        XCTAssertEqual(sut.itemTitle(at: 0), exp1.title, "expense's title at row 0")
        XCTAssertEqual(sut.itemDetail(at: 0), exp1.description, "expense's description at row 0")
    }
    
    func test_expensesList_emptyTableView_when_serviceFailed() throws {
        
        let api = MockExpensesAPI.never(NSError(localizedDescription: "a error message"))
        let mock = ExpensesAPIServiceAdapter(api: api)
        sut.service = mock
        sut.simulateLoadData()
        
        XCTAssertEqual(sut.numberOfItems(at: 0), 0)
        
    }
    
    func test_expensesList_showErrorAlert_when_serviceFailed() throws {
        
        let exp = expectation(forNotification: Notification.Name.AlertNotification,
                              object: sut,
                              handler: nil)
        
        let api = MockExpensesAPI.never(NSError(localizedDescription: "a error message"))
        let mock = ExpensesAPIServiceAdapter(api: api)
        sut.service = mock
        sut.simulateLoadData()
        
        wait(for: [exp], timeout: 1)
        
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
