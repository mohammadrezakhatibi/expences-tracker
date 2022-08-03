//
//  ListViewContoller+TestHelpers.swift
//  Expenses TrackerTests
//
//  Created by Mohammadreza on 8/2/22.
//

import Foundation
import UIKit
@testable import Expenses_Tracker


extension ListViewController {
    func errorMessage() -> String? {
        presentedAlertView()?.message
    }
    
    func hideError() {
        presenterVC.dismiss(animated: false, completion: nil)
    }
    
    private func presentedAlertView() -> UIAlertController? {
        presenterVC.presentedViewController as? UIAlertController
    }
    
    func numberOfItems(at section: Int) -> Int {
        return tableView.numberOfRows(inSection: section)
    }
}

extension ListViewController {
    
    private var expensesSection: Int { 0 }
    
    func expensesTitle(at row: Int) -> String? {
        title(at: IndexPath(row: row, section: expensesSection))
    }
    
    func title(at indexPath: IndexPath) -> String? {
        cell(at: indexPath)?.textLabel?.text
    }
    
    func cell(at indexPath: IndexPath) -> UITableViewCell? {
        guard numberOfRows(atSection: indexPath.section) > indexPath.row else { return nil }
        
        return tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func numberOfRows(atSection section: Int) -> Int {
        tableView.numberOfSections > section ? tableView.numberOfRows(inSection: section) : 0
    }
    
    func simulateLoadData() {
        loadItems()
    }
    
}
