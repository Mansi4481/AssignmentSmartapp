//
//  NowPlayingRouter.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class NowPlayingRouter: NowPlayingPToR {
    func openMovieDetail(movieData:MovieModel, navigationController: UINavigationController) {
        let view = MovieDetailRouter.openMovieDetail(movieData: movieData)
        navigationController.pushViewController(view, animated: true)
    }
}
