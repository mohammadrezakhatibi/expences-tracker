//
//  ItemServiceMock.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import Foundation
@testable import Expenses_Tracker

extension MockExpensesAPI {
    
    static func never(_ error: Error) -> ExpensesService {
        results(.failure(error))
    }
    
    static func success(_ expenses: [Expense]) -> ExpensesService {
        results(.success(expenses))
    }
    
    static func results(_ results: Result<[Expense], Error>) -> ExpensesService {
        return resultBuilder { results }
    }
    
    static func resultBuilder(_ resultBuilder: @escaping () -> Result<[Expense], Error>) -> ExpensesService {
        ItemServiceStub(resultBuilder: resultBuilder)
    }
    
    private class ItemServiceStub: ExpensesService {
        private let nextResult: () -> Result<[Expense], Error>
        
        init(resultBuilder: @escaping () -> Result<[Expense], Error>) {
            nextResult = resultBuilder
        }
        
        func loadExpenses(completion: @escaping (Result<[Expense], Error>) -> Void) {
            completion(nextResult())
        }
    }
    
}

class MockExpensesAPI: ExpensesService {
    
    var isCalled: Bool = false

    func loadExpenses(completion: @escaping (Result<[Expense], Error>) -> Void) {
        isCalled = true
    }
}
