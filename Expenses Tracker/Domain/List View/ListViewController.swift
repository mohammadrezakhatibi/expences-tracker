//
//  ListViewController.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/2/22.
//

import UIKit

protocol ItemService {
    func loadItems(completion: @escaping (Result<[ItemsViewModel], Error>) -> Void)
}

class ListViewController: UITableViewController {
    
    var items = [ItemsViewModel]()
    var service: ItemService?

    override func viewDidLoad() {
        super.viewDidLoad()
        if tableView.numberOfRows(inSection: 0) == 0 {
            loadItems()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }


}

extension ListViewController {
    private func loadItems() {
        service?.loadItems(completion: handleResponse)
    }
    
    private func handleResponse(_ result: Result<[ItemsViewModel], Error>) {
        switch result {
        case let .success(items):
            self.items = items
            
        case let .failure(error):
            self.show(error: error)
        }
    }
}

// MARK: - Table view data source

extension ListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
}
