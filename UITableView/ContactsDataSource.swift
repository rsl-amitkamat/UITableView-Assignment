
import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {

    let contacts: [Contact]

    init(contacts: [Contact]) {
        self.contacts = contacts
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return contacts.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ContactTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! ContactTableViewCell

        let contact = contacts[indexPath.row]
        cell.configure(with: contact)

        return cell
    }
}
