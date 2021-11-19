//
//  BindingVC.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 18.11.2021.

/*
 
    Purpose of this class is demonstrade using of bindings. Instead of doing this simple add operation with
    traditional methods we are using bindings.
 
    In the example below creation tableView, tableViewItemSelect, listening textField inputs can be done with
    bindings.
 */

//

import UIKit
import RxCocoa
import RxSwift

class BindingVC: BaseVC {
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var outputTableView: UITableView!
    
    let VM = BindingVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindInputToList(source: VM.sources)
        subscribeToInputTF()
        subscribeToItemSelect()
        
        btnAdd.addAction { [weak self] in
            guard let self = self else { return }
            self.VM.sources.add(element: self.VM.input)
            self.inputTF.text = nil
        }
    }
    
    func subscribeToInputTF(){
        inputTF.rx.text.subscribe { [weak self] input in
            guard let self = self else { return }
            guard let input = input else { return }
            self.VM.input = input
        } onError: { err in
            print("inputTF has error: ",err)
        } onCompleted: {
            print("inputTF completed")
        } onDisposed: {
            print("inputTF disposed")
        }.disposed(by: disposeBag)
    }
    
    func subscribeToItemSelect(){
        outputTableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            guard let cell = self.outputTableView.cellForRow(at: indexPath)  else { return }
            
            if let cellTextLabel = cell.textLabel, let cellText = cellTextLabel.text
            {
                print("celltext: ",cellText)
            }
        }).disposed(by: disposeBag)
    }
    
    func bindInputToList(source:BehaviorRelay<[String]>){
        source.bind(to: outputTableView.rx.items(cellIdentifier: CellIdentifier.outputTVId, cellType: UITableViewCell.self)) { _ , item ,cell in
            cell.textLabel?.text = item
        }.disposed(by: disposeBag)
    }
}
