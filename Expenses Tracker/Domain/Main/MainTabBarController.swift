//
//  MainTabBarController.swift
//  Expenses Tracker
//
//  Created by mohammadreza on 8/2/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = .white
    }
    
    private func setupViewController() {
        viewControllers = [
            expensesList().addNavigation(title: "Expenses", image: "creditcard"),
            friendsList().addNavigation(title: "Friends", image: "person.2")
        ]
    }
    
    private func expensesList() -> ListViewController {
        let expensesList = ListViewController()
        expensesList.title = "Expenses"
        expensesList.service = ExpensesAPIServiceAdapter(api: ExpensesAPI.shared)
        return expensesList
    }
    
    private func friendsList() -> ListViewController {
        let friendsList = ListViewController()
        friendsList.title = "Friends"
        friendsList.service = FriendsAPIItemServiceAdapter(api: FriendsAPI.shared)
        return friendsList
    }
}
