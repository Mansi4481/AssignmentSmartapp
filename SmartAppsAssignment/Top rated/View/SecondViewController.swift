//
//  SecondViewController.swift
//  SmartAppsAssignment
//
//  Created by RIG00015MAC on 15/05/20.
//  Copyright © 2020 Manshi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var presenter: TopRatedVToP?
    var movieData = [MovieModel]()
    var allMovieData = [MovieModel]()
    var searchActive = false
    var deletedCells = [Double]()
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
        let presenter:  TopRatedIToP & TopRatedVToP = TopRatedPresenter()
        let interactor: TopRatedPToI = TopRatedInteractor()
        let router: TopRatedPToR = TopRatedRouter()
        
        self.presenter = presenter
        presenter.view = self
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        self.presenter?.getData()
    }
    @objc func deleteCell(_ sender: UIButton){
        self.updateMovieData(index: sender.tag)
        self.movieData.remove(at: sender.tag)
        collectionView?.reloadData()
       }
    
    func updateMovieData(index:Int){
        let idToBeDeleted = self.movieData[index].id
        deletedCells.append(idToBeDeleted)
        let indexToBeDeleted = allMovieData.firstIndex { (movie) -> Bool in
            return movie.id == idToBeDeleted
        }
        if indexToBeDeleted != nil{
           self.allMovieData.remove(at: indexToBeDeleted!)
        }
    }
}
extension SecondViewController: TopRatedPToV{
    func getMovieData(data: [MovieModel]){
        movieData.removeAll()
        for movie in data{
            if deletedCells.filter({$0 == movie.id}).count == 0{
                self.movieData.append(movie)
            }
        }
        allMovieData = movieData
        self.collectionView?.reloadData()
        self.refreshControl.endRefreshing()
    }
}
extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCVC", for: indexPath) as! MovieCVC
        cell.btnDelete?.tag = indexPath.row
        cell.btnDelete?.addTarget(self, action: #selector(deleteCell(_:)), for: .touchUpInside)

        cell.loadData(dictData: movieData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetail = self.movieData[indexPath.row]
        presenter?.openMovieDetail(movieData: movieDetail, navigationController: self.navigationController!)
    }
    
}
extension SecondViewController:UISearchBarDelegate{
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
            movieData = allMovieData.filter({($0.title?.localizedCaseInsensitiveContains(searchText) ?? false)})
        }else{
            movieData = allMovieData
        }
        collectionView?.reloadData()
    }
}

