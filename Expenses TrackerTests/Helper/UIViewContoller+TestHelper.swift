//
//  UIViewContoller+TestHelper.swift
//  Expenses TrackerTests
//
//  Created by mohammdreza on 8/2/22.
//

import UIKit

///
/// This `UIViewController` test helper extension provides a fast and reliable way of
/// triggering lifecycle events programatically (viewDidLoad, viewWillAppear, and viewDidAppear)
/// to ensure the view controller is ready for testing.
///
extension UIViewController {
    func triggerLifecycleIfNeeded() {
        guard !isViewLoaded else { return }
        
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
}
