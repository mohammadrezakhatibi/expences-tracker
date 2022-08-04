//
//  UIVIewController+showAlert.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/2/22.
//

import UIKit

extension UIViewController {
    func show(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        postNotification()
        presenterVC.present(alert, animated: true)
    }
    
    func postNotification() {
        let notification = Notification(name: Notification.Name.AlertNotification, object: self)
        NotificationCenter.default.post(notification)
        
    }
}
extension Notification.Name {
    static let AlertNotification = Notification.Name("purchaseDidFinish")
}
extension UIViewController {
    var presenterVC: UIViewController {
        parent?.presenterVC ?? parent ?? self
    }
}
