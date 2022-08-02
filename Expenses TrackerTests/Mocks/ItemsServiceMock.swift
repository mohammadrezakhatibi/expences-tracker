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
class ItemsServiceMock: ItemService {
    
    private(set) var isCalled: Bool = false
    var items: [ItemsViewModel] = []
    
    func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        isCalled = true
        callMockAPI { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(items):
                completion(.success(items))
            }
            
        }
        
    }
    
    func callMockAPI(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        completion(.success(self.items))
    }
    
    private class ItemServiceStub: ItemsServiceMock {
        private let nextResult: () -> Result<[ItemsViewModel], Error>
        
        init(resultBuilder: @escaping () -> Result<[ItemsViewModel], Error>) {
            nextResult = resultBuilder
        }
        
        override func callMockAPI(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
            completion(nextResult())
            isCalled = false
        }
    }
    
    
    static func results(_ results: [Result<[ItemsViewModel], Error>]) -> ItemsServiceMock {
        var results = results
        return resultBuilder { results.removeFirst() }
    }
    
    static func resultBuilder(_ resultBuilder: @escaping () -> Result<[ItemsViewModel], Error>) -> ItemsServiceMock {
        ItemServiceStub(resultBuilder: resultBuilder)
    }
}

