//
//  NewsVM.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//

import Foundation
import RxSwift
import RxCocoa

class NewsVM {
    
    var newsItems = [NewsItem]()
    var searchText = "gta"
    
    func fetchNews(onSuccess: @escaping() -> Void) -> Disposable {
        guard let url = URL.fetchNews(searchText) else { return Disposables.create() }
        let resource = Resource<NewsM>(url: url)
        
        return URLRequest.load(resource: resource)
            .subscribe(on: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] response in
                guard let self = self else {return}
                self.handleResponse(response: response)
                onSuccess()
            } onError: { err in
                print("error catched at fetchNews \(err)")
            } onCompleted: {
                print("fetchNews completed")
            } onDisposed: {
                print("fetchNews disposed")
            }
    }
    
    private func handleResponse(response: NewsM){
        guard let articles = response.articles else { return }
        
        for i in 0..<articles.count {
            let data = response.articles![i]
            let news = NewsItem(title: data.title!, author: data.author!, description: data.description!, imageUrl: data.urlToImage!)
            
           
            newsItems.append(news)
        }
    }

    
}
