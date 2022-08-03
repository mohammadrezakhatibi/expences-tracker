//
//  ItemServiceMock.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import Foundation
@testable import Expenses_Tracker

private enum MockError: String, Error {
    case failure = "failure"
}

extension ExpensesAPI {
    
    static func once(_ expenses: [Expense]) -> ExpensesAPI {
        results([.success(expenses)])
    }
    
    static func results(_ results: [Result<[Expense], Error>]) -> ExpensesAPI {
        var results = results
        return resultBuilder { results.removeFirst() }
    }
    
    static func resultBuilder(_ resultBuilder: @escaping () -> Result<[Expense], Error>) -> ExpensesAPI {
        ItemServiceStub(resultBuilder: resultBuilder)
    }
    
    private class ItemServiceStub: ExpensesAPI {
        private let nextResult: () -> Result<[Expense], Error>
        
        init(resultBuilder: @escaping () -> Result<[Expense], Error>) {
            nextResult = resultBuilder
        }
        
        override func loadExpenses(compeltion: @escaping (Result<[Expense], Error>) -> Void) {
            compeltion(nextResult())
        }
    }
    
}

class ExpensesAPIServiceAdapterMock: ExpensesAPIServiceAdapter {
    var isCalled: Bool = false
    
    override func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        isCalled = true
        super.loadItems(completion: completion)
    }
}
