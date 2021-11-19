//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var menuTableView: UITableView!
    
    var homeItems:[HomeItem] = [HomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initHomeItems()
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    
    private func initHomeItems(){
        homeItems.append(HomeItem(title: "Networking", imagePath: "ic_network",destinationVC: "openNewsVC"))
        homeItems.append(HomeItem(title: "Computation", imagePath: "ic_disk",destinationVC: "openComputationVC"))
        homeItems.append(HomeItem(title: "Binding", imagePath: "ic_bind",destinationVC: "openBindingVC"))
        homeItems.append(HomeItem(title: "Operators", imagePath: "ic_operators",destinationVC: "openOperatorVC"))
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: homeItems[indexPath.row].destinationVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.homeTVId) as? HomeTableViewCell {
            cell.configureCell(item: homeItems[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}
