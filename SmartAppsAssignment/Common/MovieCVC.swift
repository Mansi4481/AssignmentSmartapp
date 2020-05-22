//
//  MovieCVC.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class MovieCVC: UICollectionViewCell {

    @IBOutlet weak var imgView : UIImageView?
    @IBOutlet weak var labelName : UILabel?
    @IBOutlet weak var labelDescr : UILabel?
    @IBOutlet weak var btnDelete : UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadData(dictData:MovieModel){
        self.labelName?.text = dictData.title
        self.labelDescr?.text = dictData.overview
        let imagePath = "https://image.tmdb.org/t/p/w342\(dictData.poster_path ?? "")"
        self.imgView?.loadImage(imgUrl: imagePath)
    }
}

