//
//  TopRatedRouter.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class TopRatedRouter: TopRatedPToR {
    func openMovieDetail(movieData:MovieModel, navigationController: UINavigationController) {
        let view = MovieDetailRouter.openMovieDetail(movieData: movieData)
        navigationController.pushViewController(view, animated: true)
    }
}

