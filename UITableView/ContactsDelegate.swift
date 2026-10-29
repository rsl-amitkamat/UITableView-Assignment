//
//  ContactsDelegate.swift
//  UITableView
//
//  Created by Amit Kamat on 29/10/26.
//


import UIKit

class ContactsDelegate: NSObject, UITableViewDelegate {

    let contacts: [Contact]

    init(contacts: [Contact]) {
        self.contacts = contacts
    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return indexPath.row % 2 == 0 ? 80 : 110
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        let contact = contacts[indexPath.row]
        let detailsVC = ContactDetailsViewController(contact: contact)

        tableView.window?
            .rootViewController?
            .presentedViewController

        if let navigationController = tableView
            .nearestViewController?
            .navigationController {
            navigationController.pushViewController(
                detailsVC,
                animated: true
            )
        }
    }
}


private extension UIView {
    var nearestViewController: UIViewController? {
        var responder: UIResponder? = self

        while let current = responder {
            if let viewController = current as? UIViewController {
                return viewController
            }

            responder = current.next
        }

        return nil
    }
}

