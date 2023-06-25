//
//  MovieListCollectionViewCell.swift
//  MovieApp
//
//  Created by oktay on 25.06.2023.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 10
        
    }
    func setCell(movie: Movie) {
        movieImage.image = UIImage(named: movie.imageUrl)
    }
}
