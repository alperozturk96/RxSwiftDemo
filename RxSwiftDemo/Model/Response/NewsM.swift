//
//  NewsVC.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//

import Foundation


struct NewsM: Codable {
    var status:String?
    var totalResults:Int?
    var articles:[Articles]?
}

struct Articles: Codable {
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}
