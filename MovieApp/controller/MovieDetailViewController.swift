//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by oktay on 25.06.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieDetail: UITextView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    var currentMovie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = currentMovie {
            movieName.text = movie.name
            movieDetail.text = movie.detail
            movieImage.image = UIImage(named: movie.imageUrl)
            
        }
    }

}
