//
//  FriendsMock.swift
//  Expenses TrackerTests
//
//  Created by Mohammadreza on 8/4/22.
//

import Foundation
@testable import Expenses_Tracker

class FriendsAPIItemsServiceAdapterMock: FriendsAPIItemServiceAdapter {
    var isCalled = false
    override func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        isCalled = true
        super.loadItems(completion: completion)
    }
}

class MockFriendAPI: FriendsService {
    var isCalled = false
    func loadItems(completion: @escaping (Result<[Friend], Error>) -> ()) {
        isCalled = true
    }
}


extension MockFriendAPI {
    
    static func never(_ error: Error) -> FriendsService {
        results(.failure(error))
    }
    static func success(_ friends: [Friend]) -> FriendsService {
        results(.success(friends))
    }
    
    static func results(_ result: Result<[Friend], Error>) -> FriendsService {
        return resultBuilder { result }
    }
    
    static func resultBuilder(_ resultBuilder: @escaping () -> Result<[Friend], Error>) -> FriendsService {
        ItemServiceStub(resultBuilder: resultBuilder)
    }
    
    private class ItemServiceStub: FriendsService {
        private let nextResult: () -> Result<[Friend], Error>
        
        init(resultBuilder: @escaping () -> Result<[Friend], Error>) {
            nextResult = resultBuilder
        }
        
        func loadItems(completion: @escaping (Result<[Friend], Error>) -> Void) {
            completion(nextResult())
        }
    }
    
}
