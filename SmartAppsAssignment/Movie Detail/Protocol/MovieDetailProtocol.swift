//
//  MovieDetailProtocol.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

protocol MovieDetailVToP: class {
    var view: MovieDetailPToV? {get set}
    var interactor: MovieDetailPToI? {get set}
    var router: MovieDetailPToR? {get set}
    var movieDetail: MovieModel? {get set}
}

protocol MovieDetailPToV: class {
}

protocol MovieDetailPToR: class {
    var presenter: MovieDetailVToP? {get set}
    static func openMovieDetail(movieData:MovieModel) -> MovieDetailVC
}

protocol MovieDetailPToI: class {
    var presenter: MovieDetailIToP? {get set}
}

protocol MovieDetailIToP: class {
}
