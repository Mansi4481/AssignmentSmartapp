//
//  FirstViewController.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {
    var presenter: NowPlayingVToP?
    var movieData = [MovieModel]()
    var allMovieData = [MovieModel]()
    var searchActive = false
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var searchBar : UISearchBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshMovieDataData(_:)), for: .valueChanged)
        let nib = UINib(nibName: "MovieCVC", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "MovieCVC")
        self.setProtocols()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController!.isNavigationBarHidden = true
    }
    @objc private func refreshMovieDataData(_ sender: Any) {
        self.presenter?.getData()
    }
    func setProtocols(){
        let presenter:  NowPlayingIToP & NowPlayingVToP = NowPlayingPresenter()
        let interactor: NowPlayingPToI = NowPlayingInteractor()
        let router: NowPlayingPToR = NowPlayingRouter()
        
        self.presenter = presenter
        presenter.view = self
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        self.presenter?.getData()
    }
}

extension FirstViewController: NowPlayingPToV{
    func getMovieData(data: [MovieModel]){
        self.movieData = data
        allMovieData = movieData
        self.collectionView?.reloadData()
        self.refreshControl.endRefreshing()
    }
}
extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCVC", for: indexPath) as! MovieCVC
        cell.loadData(dictData: movieData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetail = self.movieData[indexPath.row]
        presenter?.openMovieDetail(movieData: movieDetail, navigationController: self.navigationController!)
    }
    
}
extension FirstViewController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        collectionView?.resignFirstResponder()
        movieData = allMovieData
        collectionView?.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        if searchText.count > 0{
            movieData = allMovieData.filter({($0.title?.contains(searchText) ?? false)})
        }else{
            movieData = allMovieData
        }
        collectionView?.reloadData()
    }
}

