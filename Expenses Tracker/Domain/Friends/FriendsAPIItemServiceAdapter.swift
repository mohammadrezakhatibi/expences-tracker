//
//  FriendsAPIItemServiceAdapter.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/3/22.
//

import Foundation


class FriendsAPIItemServiceAdapter: ItemService {
    
    var api: FriendsService
    
    init(api: FriendsService) {
        self.api = api
    }
    
    func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        api.loadItems { result in
            DispatchQueue.mainAsyncIfNeeded {
                completion(result.map { items in
                    return items.map { item in
                        ItemsViewModel(friend: item)
                    }
                })
            }
        }
    }
    
}
