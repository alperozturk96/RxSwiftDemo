//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T>{
    let url:URL
}

extension URL {
    
    static func fetchNews(_ search:String) -> URL? {
        return URL(string: AppConst.baseURL + "everything?q=" + search + "&apiKey=" + AppConst.apiKey)
    }
}

extension URLRequest{
    
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.just(resource.url)
            .subscribe(on: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .observe(on: MainScheduler.instance)
            .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.response(request: request)
            }.map { response, data -> T in
                
                if 200..<300 ~= response.statusCode
                {
                    return try JSONDecoder().decode(T.self, from: data)
                }
                else
                {
                    throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
                }
                
            }.asObservable()
        
    }
}
