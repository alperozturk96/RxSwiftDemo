//
//  BaseVC.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.
//

import RxSwift
import UIKit

class BaseVC: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        
    }
    
    private func configureNavBar(){
       navigationController?.navigationBar.barTintColor = UIColor.black
       navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
