//
//  NowPlayingProtocol.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//
import UIKit

protocol NowPlayingVToP: class {
    var view: NowPlayingPToV? {get set}
    var interactor: NowPlayingPToI? {get set}
    var router: NowPlayingPToR? {get set}
    func getData()
    func openMovieDetail(movieData:MovieModel, navigationController:UINavigationController)
}

protocol NowPlayingPToV: class {
    func getMovieData(data: [MovieModel])
}

protocol NowPlayingPToR: class {
    func openMovieDetail(movieData:MovieModel, navigationController: UINavigationController)
}

protocol NowPlayingPToI: class {
    var presenter: NowPlayingIToP? {get set}
    func getData()
}

protocol NowPlayingIToP: class {
    func getMovieData(data: [MovieModel])
}

