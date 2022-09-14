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
        return tableView
    }()

    private lazy var mountainDataSource = self.configureDataSource(with: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
    }

    func configureLayouts() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    func updateTableView(_ dataSource: DataSource,
                         by data: [MountainModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)

        dataSource.apply(snapshot,
                         animatingDifferences: false,
                         completion: nil)
    }

    func configureDataSource(with tableView: UITableView) -> DataSource? {
        let dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, model -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MountainTableViewCell.identifier,
                                                           for: indexPath) as? MountainTableViewCell else {
                return UITableViewCell()
            }

            return cell
        })

        return dataSource
    }
}
