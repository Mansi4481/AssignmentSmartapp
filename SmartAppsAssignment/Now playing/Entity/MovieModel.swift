//
//  MovieModel.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    let id:Double
    let overview:String?
    let title:String?
    let release_date:String?
    let poster_path:String?
    let popularity: Double?
    let backdrop_path:String?
}
