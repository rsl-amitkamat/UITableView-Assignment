//
//  ViewController.swift
//  UITableView
//
//  Created by Amit Kamat on 29/10/26.
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @objc func openContacts() {
        let contactsVC = ContactsViewController()
        navigationController?.pushViewController(
            contactsVC,
            animated: true
        )
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return shoppingItems.count
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Contacts",
            style: .plain,
            target: self,
            action: #selector(openContacts)
        )
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let item = shoppingItems[indexPath.row]
        cell.textLabel?.text = item.name

        return cell
    }

    let tableView = UITableView()
    
    let shoppingItems = [
        ShoppingItem(name: "Apples", price: 120),
        ShoppingItem(name: "Milk", price: 60),
        ShoppingItem(name: "Bread", price: 45),
        ShoppingItem(name: "Eggs", price: 90),
        ShoppingItem(name: "Rice", price: 250)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Shopping List"
        
        setupNavigationBar()
        setupTableView()
    }

    func setupTableView() {
        
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }
}
#Preview {
    ViewController()
}
