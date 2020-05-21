//
//  MovieDetailRouter.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class MovieDetailRouter: MovieDetailPToR {
    weak var presenter : MovieDetailVToP?
    static func openMovieDetail(movieData:MovieModel) -> MovieDetailVC{
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyBoard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        
        let presenter: MovieDetailVToP & MovieDetailIToP = MovieDetailPresenter()
        let interactor: MovieDetailPToI = MovieDetailInteractor()
        let router: MovieDetailPToR = MovieDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.presenter = presenter
        presenter.interactor = interactor
        presenter.movieDetail = movieData
        interactor.presenter = presenter
        
        return view
    }
}

