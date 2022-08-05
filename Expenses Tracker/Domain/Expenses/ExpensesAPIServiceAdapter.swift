//
//  ExpensesAPIServiceAdapter.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/3/22.
//

import Foundation


class ExpensesAPIServiceAdapter: ItemService {
    
    var api: ExpensesService
    
    init(api: ExpensesService) {
        self.api = api
    }
    
    func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        api.loadExpenses { result in
            DispatchQueue.mainAsyncIfNeeded {
                completion(result.map { items in
                    return items.map { item in
                        ItemsViewModel(expense: item)
                    }
                })
            }
        }
    }
}
