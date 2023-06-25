//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by oktay on 25.06.2023.
//

import UIKit

class MovieListViewController: UIViewController {
    var selected: String = ""
    var dataSet = DataSet()
    var movie: Movie!
    @IBOutlet weak var movieListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListCollectionView.delegate = self
        movieListCollectionView.dataSource = self
    }
    
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSet.getMovies(type: selected).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as? MovieListCollectionViewCell {
            movieCell.setCell(movie: dataSet.getMovies(type: selected)[indexPath.row])
            return movieCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellHeight = ((width) / 2) - 15
        return CGSize(width: cellHeight, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movie = dataSet.getMovies(type: selected)[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieDetail = segue.destination as? MovieDetailViewController {
            movieDetail.currentMovie = movie
        }
    }
}
