//
//  CategoryTableViewCell.swift
//  MovieApp
//
//  Created by oktay on 25.06.2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImg.layer.cornerRadius = 10
    }
    
    func setUI(item: Category) {
        movieImg.image = UIImage(named: item.categoryImage)
        movieNameLbl.text = item.categoryName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
