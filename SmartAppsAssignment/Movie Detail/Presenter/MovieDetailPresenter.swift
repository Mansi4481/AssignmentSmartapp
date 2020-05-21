//
//  MovieDetailPresenter.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class MovieDetailPresenter: MovieDetailVToP {
    var view: MovieDetailPToV?
    var interactor: MovieDetailPToI?
    var router: MovieDetailPToR?
    var movieDetail: MovieModel?

}
extension MovieDetailPresenter:MovieDetailIToP{
}
