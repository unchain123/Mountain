//
//  MountainModel.swift
//  mountain
//
//  Created by Derrick kim on 9/14/22.
//

struct MountainModel: Hashable {
    let name: String
    let height: Double
    let distance: Double
    let timeInterval: String
    let image: String
}

extension MountainModel {
    static let sample = [MountainModel(name: "가리산",
                                       height: 1050.9,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "garisan"),
                         MountainModel(name: "가리왕산",
                                       height: 1561.9,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "gariwangsan"),
                         MountainModel(name: "가야산",
                                       height: 1432.6,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "gayasan"),
                         MountainModel(name: "가지산",
                                       height: 1240.9,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "gazisan"),
                         MountainModel(name: "감악산",
                                       height: 674.9,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "gamyacsan"),
                         MountainModel(name: "강천산",
                                       height: 583.7,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "gangcheonsan"),
                         MountainModel(name: "금산",
                                       height: 704.9,
                                       distance: 2.0,
                                       timeInterval: "02:47",
                                       image: "goldsan"),
    ]
}
