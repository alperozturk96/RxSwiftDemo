//
//  OperatorTableViewCell.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 19.11.2021.
//

import UIKit

class OperatorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func configureCell(item: CharacterItem){
        name.text = item.name
        age.text = "Age: " + String(item.age)
        popularity.text = "Popularity: " + String(item.popularity)
        
        if let url = URL(string: item.picUrl) {
            profilePic.load(url: url)
        }
    }
}
