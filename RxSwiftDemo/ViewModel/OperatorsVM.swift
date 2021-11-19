//
//  OperatorsVM.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 19.11.2021.
//

import RxCocoa
import RxSwift

class OperatorsVM {
    
    var behaviorRelayCharacters:BehaviorRelay<[CharacterItem]>
    let observableCharacters = Observable.from(Characters.characters)
    let pickerOptions = BehaviorRelay(value: ["Default", "Filter Age","Element At"])
    
    init() {
        behaviorRelayCharacters = BehaviorRelay.init(value:Characters.characters)
    }
    
}
