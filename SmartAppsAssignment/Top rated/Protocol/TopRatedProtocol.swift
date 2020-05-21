//
//  TopRatedProtocol.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

protocol TopRatedVToP: class {
    var view: TopRatedPToV? {get set}
    var interactor: TopRatedPToI? {get set}
    var router: TopRatedPToR? {get set}
    func getData()
    func openMovieDetail(movieData:MovieModel, navigationController:UINavigationController)
}

protocol TopRatedPToV: class {
    func getMovieData(data: [MovieModel])
}

protocol TopRatedPToR: class {
    func openMovieDetail(movieData:MovieModel, navigationController: UINavigationController)
}

protocol TopRatedPToI: class {
    var presenter: TopRatedIToP? {get set}
    func getData()
}

protocol TopRatedIToP: class {
    func getMovieData(data: [MovieModel])
}
