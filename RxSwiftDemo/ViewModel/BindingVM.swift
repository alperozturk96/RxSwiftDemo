//
//  BindingVM.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 18.11.2021.
//

import RxSwift
import RxCocoa

class BindingVM {
    
    var sources = BehaviorRelay(value: [String]())
    var input = ""
}
