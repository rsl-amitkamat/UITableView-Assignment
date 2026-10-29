//
//  ContactDetailsViewController.swift
//  UITableView
//
//  Created by Amit Kamat on 29/10/26.
//


import UIKit

class ContactDetailsViewController: UIViewController {

    let contact: Contact

    private let contactImageView = UIImageView()
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()

    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Contact Details"
        view.backgroundColor = .systemBackground

        setupUI()
        displayContact()
    }

    private func setupUI() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false

        contactImageView.contentMode = .scaleAspectFill
        contactImageView.clipsToBounds = true
        contactImageView.layer.cornerRadius = 50
        contactImageView.tintColor = .systemGray

        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        phoneLabel.font = .systemFont(ofSize: 17)
        emailLabel.font = .systemFont(ofSize: 17)

        nameLabel.textAlignment = .center

        let detailsStack = UIStackView(
            arrangedSubviews: [phoneLabel, emailLabel]
        )
        detailsStack.axis = .vertical
        detailsStack.spacing = 16
        detailsStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(contactImageView)
        view.addSubview(nameLabel)
        view.addSubview(detailsStack)

        NSLayoutConstraint.activate([
            contactImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 40
            ),
            contactImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            contactImageView.widthAnchor.constraint(equalToConstant: 100),
            contactImageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(
                equalTo: contactImageView.bottomAnchor,
                constant: 20
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),

            detailsStack.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 30
            ),
            detailsStack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            detailsStack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            )
        ])
    }

    private func displayContact() {
        nameLabel.text = contact.name
        phoneLabel.text = "Phone: \(contact.phone)"
        emailLabel.text = "Email: \(contact.email)"

        contactImageView.image = UIImage(named: contact.imageName)
            ?? UIImage(systemName: "person.crop.circle.fill")
    }
}
