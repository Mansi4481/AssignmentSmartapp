//
//  TopRatedPresenter.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class TopRatedPresenter: TopRatedVToP {
    var view: TopRatedPToV?
    var interactor: TopRatedPToI?
    var router: TopRatedPToR?
    
    func getData(){
        interactor?.getData()
    }
    func openMovieDetail(movieData:MovieModel, navigationController:UINavigationController){
        router?.openMovieDetail(movieData: movieData, navigationController: navigationController)
    }

}
extension TopRatedPresenter:TopRatedIToP{
    func getMovieData(data: [MovieModel]){
        view?.getMovieData(data: data)
    }
    
}
