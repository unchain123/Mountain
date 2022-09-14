//
//  AddViewController.swift
//  mountain
//
//  Created by 오경식 on 2022/09/14.
//

import UIKit

class AddViewController: UIViewController {

    lazy var imageAddButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus")
        button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let imagePickerController: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        return picker
    }()

    private let titleTextField: UITextField = {
        let title = UITextField()
        title.placeholder = "Title"
        title.borderStyle = .roundedRect
        title.layer.borderColor = UIColor.systemGray2.cgColor
        return title
    }()

    private let heightTextField: UITextField = {
        let height = UITextField()
        height.placeholder = "Height"
        height.borderStyle = .roundedRect
        height.layer.borderColor = UIColor.systemGray2.cgColor
        return height
    }()

    private let distanceTextField: UITextField = {
        let distance = UITextField()
        distance.placeholder = "Distance"
        distance.borderStyle = .roundedRect
        distance.layer.borderColor = UIColor.systemGray2.cgColor
        return distance
    }()

    private let timeIntervalTextField: UITextField = {
        let timeInterval = UITextField()
        timeInterval.placeholder = "TimeInterval"
        timeInterval.borderStyle = .roundedRect
        timeInterval.layer.borderColor = UIColor.systemGray2.cgColor
        return timeInterval
    }()

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let allStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubView()
        setupLayout()
    }

    func setupSubView() {
        view.addSubview(imageAddButton)
        view.addSubview(verticalStackView)

        verticalStackView.addArrangedSubview(titleTextField)
        verticalStackView.addArrangedSubview(heightTextField)
        verticalStackView.addArrangedSubview(distanceTextField)
        verticalStackView.addArrangedSubview(timeIntervalTextField)
    }

    @objc func addImage() {
        present(imagePickerController, animated: true)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            imageAddButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageAddButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageAddButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageAddButton.heightAnchor.constraint(equalToConstant: 300),

            verticalStackView.topAnchor.constraint(equalTo: imageAddButton.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -280)
        ])


    }
}
