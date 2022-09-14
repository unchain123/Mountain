//
//  MountainTableViewCell.swift
//  mountain
//
//  Created by Derrick kim on 9/14/22.
//

import UIKit

class MountainTableViewCell: UITableViewCell {
    static let identifier = "MountainTableViewCell"

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let mountainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()

    let heightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let distanceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let timeIntervalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubView()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubView() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(mountainImageView)
        verticalStackView.addArrangedSubview(horizontalStackView)

        mountainImageView.addSubview(titleLabel)

        horizontalStackView.addArrangedSubview(heightLabel)
        horizontalStackView.addArrangedSubview(distanceLabel)
        horizontalStackView.addArrangedSubview(timeIntervalLabel)
    }

    func configureLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            mountainImageView.heightAnchor.constraint(equalTo: mountainImageView.widthAnchor),
            mountainImageView.widthAnchor.constraint(equalToConstant: 100),

            titleLabel.leadingAnchor.constraint(equalTo: mountainImageView.leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: mountainImageView.bottomAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: mountainImageView.trailingAnchor, constant: -100)
        ])
    }

    func bind(mountainModel: MountainModel) {
        mountainImageView.image = mountainModel.image
        titleLabel.text = mountainModel.name
        heightLabel.text = "높이: \(mountainModel.height)m"
        distanceLabel.text = "거리: \(mountainModel.distance)km"
        timeIntervalLabel.text = "시간: \(mountainModel.timeInterval)"
    }
}
