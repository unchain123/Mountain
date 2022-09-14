//
//  MountainTableViewCell.swift
//  mountain
//
//  Created by Derrick kim on 9/14/22.
//

import UIKit

class MountainTableViewCell: UITableViewCell {
    static let identifier = "MountainTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
