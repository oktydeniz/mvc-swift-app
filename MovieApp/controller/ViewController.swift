//
//  ViewController.swift
//  MovieApp
//
//  Created by oktay on 25.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var homePageTableView: UITableView!
    let dataSet = DataSet()
    var selectedItem:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePageTableView.delegate = self
        homePageTableView.dataSource = self
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cetegoryCell") as? CategoryTableViewCell {
            cell.setUI(item: dataSet.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = dataSet.categories[indexPath.row].categoryName
        performSegue(withIdentifier: "movieList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movieList = segue.destination as? MovieListViewController {
            movieList.selected = selectedItem
        }
    }
    
}
