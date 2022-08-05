//
//  ItemsViewModel.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/2/22.
//

import Foundation

struct ItemsViewModel {
    var title: String
    var detail: String
    var icon: String
}

extension ItemsViewModel {
    
    init(expense: Expense) {
        title = expense.title
        detail = expense.description
        icon = expense.icon
    }
    
    init(friend: Friend) {
        title = friend.name
        detail = friend.email
        icon = friend.icon
    }
}
