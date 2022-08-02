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
