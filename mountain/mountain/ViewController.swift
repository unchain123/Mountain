//
//  ViewController.swift
//  mountain
//
//  Created by 오경식 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    typealias DataSource = UITableViewDiffableDataSource<Section, MountainModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MountainModel>

    enum Section {
        case main
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(MountainTableViewCell.self, forCellReuseIdentifier: MountainTableViewCell.identifier)
        return tableView
    }()

    private lazy var mountainDataSource = self.configureDataSource(with: tableView)

    private var data = MountainModel.sample

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.navigationItem.title = "Mountain"
        self.view.backgroundColor = .systemBackground

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapPlusButton))
        configureLayouts()
        updateTableView(by: data)
    }

    @objc private func didTapPlusButton() {
        let viewController = AddViewController()
        viewController.modalPresentationStyle = .formSheet
        viewController.delegate = self
        self.navigationController?.present(viewController, animated: true, completion: nil)
    }

    func configureLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    func updateTableView(by data: [MountainModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)

        mountainDataSource?.apply(snapshot,
                         animatingDifferences: false,
                         completion: nil)
    }

    func configureDataSource(with tableView: UITableView) -> DataSource? {
        let dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, model -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MountainTableViewCell.identifier,
                                                           for: indexPath) as? MountainTableViewCell else {
                return UITableViewCell()
            }
            cell.bind(mountainModel: model)
            return cell
        })

        return dataSource
    }
}

extension ViewController: AddViewControllerDelegate {
    func update(model: MountainModel) {
        self.data.append(model)
        updateTableView(by: data)
    }
}
