//
//  HomeTableViewCell.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    func configureCell(item:HomeItem){
        cellLabel.text = item.title
        cellImageView.image = UIImage.init(named: item.imagePath)
    }
    
    
}
