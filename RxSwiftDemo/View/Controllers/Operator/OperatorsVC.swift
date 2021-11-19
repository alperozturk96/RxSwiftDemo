//
//  OperatorsVC.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 19.11.2021.

/*
 
    Purpose of this class is demonstrade simple usage of RxSwift operators and show usage of BehaviorRelay,
    Observables. Also PickerView,TableView implemantation was done by binding.
 
 */

//

import UIKit
import RxCocoa
import RxSwift

class OperatorsVC: BaseVC {
    
    @IBOutlet weak var filterValue: UITextField!
    @IBOutlet weak var characterListTableView: UITableView!
    @IBOutlet weak var operatorsPickerView: UIPickerView!
    
    let VM = OperatorsVM()
    var updatedCharacters:BehaviorRelay<[CharacterItem]>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindCharacterListToTableView()
        bindOperatorsToPickerView()
        subscribeToPickerViewItemSelect()
    }
    
    func updateCharacterList(){
        if updatedCharacters != nil {
            var array = VM.behaviorRelayCharacters.value
            array.removeAll()
            array = updatedCharacters.value
            VM.behaviorRelayCharacters.accept(array)
        }
    }
    
    func restoreCharacterList(){
        updatedCharacters = BehaviorRelay.init(value: Characters.characters)
        updateCharacterList()
    }
    
    func filterOperator(){
        restoreCharacterList()
        
        guard let maxAge = filterValue.text else { return }
        guard let intMaxAge = Int(maxAge) else { return }
        
        VM.behaviorRelayCharacters
            .map { element in
                element.filter { $0.age > intMaxAge }
            }
            .subscribe(onNext: { items in
                self.updatedCharacters = BehaviorRelay.init(value: items)
            })
            .disposed(by: disposeBag)
        
        updateCharacterList()
    }
    
    func elementAtOperator(){
        restoreCharacterList()
        
        guard let wantedElement = filterValue.text else { return }
        guard let intWantedElement = Int(wantedElement) else { return }
        
        VM.observableCharacters
            .element(at: intWantedElement)
            .subscribe { items in
                var chars = [CharacterItem]()
                chars.append(items)
                self.updatedCharacters = BehaviorRelay.init(value: chars)
            } onError: { err in
                print("error caught at elementAtOperator")
            } onCompleted: {
                print("elementAtOperator completed")
            } onDisposed: {
                print("elementAtOperator disposed")
            }.disposed(by: disposeBag)
        
        updateCharacterList()
    }
    
    func subscribeToPickerViewItemSelect(){
        operatorsPickerView.rx.itemSelected.subscribe { (event) in
            switch event {
            case .next(let selected):
                if selected.row == 0 {
                    self.restoreCharacterList()
                }
                else if selected.row == 1 {
                    self.filterOperator()
                }
                else if selected.row == 2 {
                    self.elementAtOperator()
                }
            default:
                break
            }
        }.disposed(by: disposeBag)
    }
    
    func bindOperatorsToPickerView(){
        VM.pickerOptions.bind(to: operatorsPickerView.rx.itemTitles) { (row, element) in
            return element
        }
        .disposed(by: disposeBag)
    }
    
    func bindCharacterListToTableView(){
        VM.behaviorRelayCharacters.bind(to: characterListTableView.rx.items(cellIdentifier: CellIdentifier.operatorTVId, cellType: OperatorTableViewCell.self)) { _ , item ,cell in
           
            cell.configureCell(item: item)
        }.disposed(by: disposeBag)
    }
}
