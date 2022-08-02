//
//  ItemServiceMock.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import Foundation
@testable import Expenses_Tracker


class ItemsServiceMock: ItemService {
    private(set) var isStarted: Bool = false
    func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void) {
        isStarted = true
    }
}

