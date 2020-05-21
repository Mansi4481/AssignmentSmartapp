//
//  MovieDetailVC.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 20/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    var presenter: MovieDetailVToP?
    @IBOutlet weak var imageView : UIImageView?
    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var collectionViewHeight : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        
    }
    func loadData(){
        self.navigationController!.isNavigationBarHidden = false
        let imgUrl = "https://image.tmdb.org/t/p/original\(presenter?.movieDetail?.poster_path ?? "")"
        self.imageView?.loadImage(imgUrl: imgUrl)
        collectionViewHeight?.constant = 160 + (presenter?.movieDetail?.overview?.height(constraintedWidth: (collectionView?.bounds.width ?? 20) - 20, font: UIFont.systemFont(ofSize: 15.0)) ?? 21.0)
    }
    func changeDateFormat(date:String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM dd, yyyy"

        if let dateFromStr = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: dateFromStr)
        } else {
           return ""
        }
    }

}
extension MovieDetailVC: MovieDetailPToV{

}

extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
        let movie = presenter?.movieDetail
        cell.labelTitle?.text = movie?.title
        cell.labelDate?.text = self.changeDateFormat(date: movie?.release_date ?? "")
        cell.labelPercentage?.text = "\(movie?.popularity ?? 0) %"
        cell.labelTime?.text = "2 hrs 48 mns"
        cell.labelDescr?.text = movie?.overview
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

class MovieDetailCell:UICollectionViewCell{
    @IBOutlet weak var labelTitle : UILabel?
    @IBOutlet weak var labelDate : UILabel?
    @IBOutlet weak var labelPercentage : UILabel?
    @IBOutlet weak var labelTime : UILabel?
    @IBOutlet weak var labelDescr : UILabel?
}
