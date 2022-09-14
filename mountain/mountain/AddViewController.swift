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
        stackView.spacing = 20
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

    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Mountain Add", for: .normal)
        button.addTarget(self, action: #selector(addMountain), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    weak var delegate: AddViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubView()
        setupLayout()
    }

    func setupSubView() {
        view.addSubview(imageAddButton)
        view.addSubview(verticalStackView)
        view.addSubview(addButton)

        imagePickerController.delegate = self

        verticalStackView.addArrangedSubview(titleTextField)
        verticalStackView.addArrangedSubview(heightTextField)
        verticalStackView.addArrangedSubview(distanceTextField)
        verticalStackView.addArrangedSubview(timeIntervalTextField)
    }

    @objc func addImage() {
        present(imagePickerController, animated: true)
    }

    @objc func addMountain() {
        guard let name = titleTextField.text,
              let height = Double(heightTextField.text!),
              let distance = Double(distanceTextField.text!),
              let timeInterval = timeIntervalTextField.text,
              let image = imageAddButton.imageView?.image else { return }

        delegate?.update(model: MountainModel(name: name,
                                              height: height,
                                              distance: distance,
                                              timeInterval: timeInterval,
                                              image: image))
        self.dismiss(animated: true)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            imageAddButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageAddButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageAddButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageAddButton.heightAnchor.constraint(equalToConstant: 300),

            verticalStackView.topAnchor.constraint(equalTo: imageAddButton.bottomAnchor, constant: 50),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            verticalStackView.heightAnchor.constraint(equalToConstant: 200),

            addButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 50),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
}

// MARK: - UIImagePickerControllerDelegate

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage = UIImage()

        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }

        imageAddButton.setImage(newImage, for: .normal)

        picker.dismiss(animated: true,
                       completion: nil)
    }
}
