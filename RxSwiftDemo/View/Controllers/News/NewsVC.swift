//
//  NewsVC.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.

/*
 
    Purpose of this class is demonstrade networking via RxSwift. RxSwift can be very good couple with native
    networking solution or 3rd party solution like Alamofire, Moya. I chose native solution.
 
 */

//

import UIKit

class NewsVC: BaseVC {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    let VM = NewsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        fetchNews()
    }
    
    func fetchNews(){
        VM.fetchNews { [weak self] in
            guard let self = self else { return }
            self.newsTableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    func initTableView(){
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
}


extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.newsTVId) as? NewsTableViewCell {
            cell.configureCell(item: VM.newsItems[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}
