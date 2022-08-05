//
//  ListViewController.swift
//  Expenses Tracker
//
//  Created by mohammadreza on 8/2/22.
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
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadItems), for: .valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if tableView.numberOfRows(inSection: 0) == 0 {
            loadItems()
        }
    }
}

extension ListViewController {
    
    @objc func loadItems() {
        refreshControl?.beginRefreshing()
        service?.loadItems(completion: handleResponse)
    }
    
    private func handleResponse(_ result: Result<[ItemsViewModel], Error>) {
        switch result {
        case let .success(items):
            self.items = items
            refreshControl?.endRefreshing()
            self.tableView.reloadData()
            
        case let .failure(error):
            refreshControl?.endRefreshing()
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
        
        return items.count
    }
}

extension ListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "ItemCell")
        cell.configure(item)
        return cell
    }
}

extension UITableViewCell {
    func configure(_ vm: ItemsViewModel) {
        textLabel?.text = vm.title
        detailTextLabel?.text = vm.detail
        imageView?.image = UIImage(systemName: vm.icon)
    }
}

extension DispatchQueue {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.async(execute: work)
        }
    }
}
