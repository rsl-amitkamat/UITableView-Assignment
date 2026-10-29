//
//  ContactTableViewCell.swift
//  UITableView
//
//  Created by Amit Kamat on 29/10/26.
//


import UIKit

class ContactTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ContactTableViewCell"

    let contactImageView = UIImageView()
    let nameLabel = UILabel()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        contactImageView.contentMode = .scaleAspectFill
        contactImageView.clipsToBounds = true
        contactImageView.layer.cornerRadius = 25
        contactImageView.backgroundColor = .systemGray5
        contactImageView.tintColor = .systemGray

        nameLabel.font = .systemFont(ofSize: 17, weight: .medium)

        contentView.addSubview(contactImageView)
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            contactImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            contactImageView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            contactImageView.widthAnchor.constraint(equalToConstant: 50),
            contactImageView.heightAnchor.constraint(equalToConstant: 50),

            nameLabel.leadingAnchor.constraint(
                equalTo: contactImageView.trailingAnchor,
                constant: 16
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            nameLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            )
        ])
    }

    func configure(with contact: Contact) {
        nameLabel.text = contact.name

        if let image = UIImage(named: contact.imageName) {
            contactImageView.image = image
        } else {
            contactImageView.image = UIImage(
                systemName: "person.crop.circle.fill"
            )
        }
    }
}
