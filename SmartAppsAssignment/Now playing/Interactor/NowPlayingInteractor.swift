//
//  NowPlayingInteractor.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import Alamofire
import Foundation
class NowPlayingInteractor:NowPlayingPToI{
    var presenter: NowPlayingIToP?
    
    func getData(){
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        Alamofire.request(url).responseJSON { (response) in
            if let reponseDict = response.result.value as! [String:Any]?{
                print(reponseDict)
                let dataDict = reponseDict["results"] as! [[String:Any]]
                do {
                    let data = try JSONSerialization.data(withJSONObject: dataDict, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    let parsedData = try decoder.decode([MovieModel].self, from: data)
                    self.presenter?.getMovieData(data: parsedData)
                }
                catch {
                    print("parsing fail")
                }
            }
            
        }
    }
}
