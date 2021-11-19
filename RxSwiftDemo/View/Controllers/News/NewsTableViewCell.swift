//
//  NewsTableViewCell.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//



import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDescription: TopLeft!
    @IBOutlet weak var newsThumbnail: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    func configureCell(item:NewsItem){
        newsTitle.text = item.title
        newsAuthor.text = item.author
        newsDescription.text = item.description
        
        if let url = URL(string: item.imageUrl) {
            newsThumbnail.load(url: url)
        }
    }
    
    
}
