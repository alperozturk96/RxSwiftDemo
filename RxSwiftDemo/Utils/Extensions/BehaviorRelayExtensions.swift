//
//  BehaviorRelayExtensions.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 19.11.2021.
//

import RxCocoa
import Foundation

extension BehaviorRelay where Element: RangeReplaceableCollection {

    func add(element: Element.Element) {
        var array = self.value
        array.append(element)
        self.accept(array)
    }
    
}
