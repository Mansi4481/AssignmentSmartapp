//
//  NowPlayingPresenter.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class NowPlayingPresenter: NowPlayingVToP {
    var view: NowPlayingPToV?
    var interactor: NowPlayingPToI?
    var router: NowPlayingPToR?
    
    func getData(){
        interactor?.getData()
    }
    
    func openMovieDetail(movieData:MovieModel, navigationController:UINavigationController){
        router?.openMovieDetail(movieData: movieData, navigationController: navigationController)
    }

}
extension NowPlayingPresenter:NowPlayingIToP{
    func getMovieData(data: [MovieModel]){
        view?.getMovieData(data: data)
    }
    
}
