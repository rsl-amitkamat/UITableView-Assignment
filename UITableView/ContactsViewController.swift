
import UIKit

class ContactsViewController: UIViewController {

    let tableView = UITableView()

    let contacts = [
        Contact(name: "Rahul Sharma", imageName: "rahul",
                phone: "9876543210", email: "rahul@example.com"),
        Contact(name: "Priya Patel", imageName: "priya",
                phone: "9876501234", email: "priya@example.com"),
        Contact(name: "Aarav Mehta", imageName: "aarav",
                phone: "9988776655", email: "aarav@example.com"),
        Contact(name: "Sneha Kulkarni", imageName: "sneha",
                phone: "9123456780", email: "sneha@example.com"),
        Contact(name: "Rohan Desai", imageName: "rohan",
                phone: "9090909090", email: "rohan@example.com")
    ]

    var contactsDataSource: ContactsDataSource!
    var contactsDelegate: ContactsDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contacts"
        view.backgroundColor = .systemBackground

        contactsDataSource = ContactsDataSource(contacts: contacts)
        contactsDelegate = ContactsDelegate(contacts: contacts)

        setupTableView()
        setupHeaderAndFooter()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(
            ContactTableViewCell.self,
            forCellReuseIdentifier: ContactTableViewCell.reuseIdentifier
        )

        tableView.dataSource = contactsDataSource
        tableView.delegate = contactsDelegate

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setupHeaderAndFooter() {
        let headerLabel = UILabel()
        headerLabel.text = "  My Contacts"
        headerLabel.font = .systemFont(ofSize: 22, weight: .bold)
        headerLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 55)

        tableView.tableHeaderView = headerLabel

        let footerLabel = UILabel()
        footerLabel.text = "  Total contacts: \(contacts.count)"
        footerLabel.font = .systemFont(ofSize: 14)
        footerLabel.textColor = .secondaryLabel
        footerLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 40)

        tableView.tableFooterView = footerLabel
    }
}
