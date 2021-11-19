//
//  ComputationVC.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 14.11.2021.

/*
 
    Purpose of this class is demonstrade using of different schedulers for different specific job.
 
    Job:
    Generate random numbers up to the fiftieth number of the Fibonacci sequence and try to matching the first fifty
    fibonacci numbers. OperationQueueScheduler designed for complex calculations.
 
 */

//

import UIKit
import ShimmerSwift
import RxSwift

class ComputationVC: BaseVC {

    let fiftiethFibonacciNumber = 12586269025
    var fibonacciNumberSeries = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addShimmerView()
        fibonacciNumberSeries = findFibonacciNumberSeriesUntilNthNumber(n: 50)
        initOperationQueueSchedulerAndDoSomeHardWork()
    }
    
    func addShimmerView(){
        let shimmerView = ShimmeringView(frame: CGRect(x:  0, y: 0, width: 400, height: 200))
        shimmerView.center.x = view.center.x
        shimmerView.center.y = view.center.y
        view.addSubview(shimmerView)
        
        let shimmerText = UILabel(frame: shimmerView.bounds)
        shimmerText.text = "Some Hard Work Going On Background Thread"
        shimmerText.textAlignment = .center
        shimmerText.numberOfLines = 0
        shimmerText.textColor = .red
        shimmerText.font = .systemFont(ofSize: 30)
        
        shimmerView.contentView = shimmerText
        shimmerView.isShimmering = true
        shimmerView.shimmerSpeed = 400
        shimmerView.shimmerPauseDuration = 0.0
    }
    
    func initOperationQueueSchedulerAndDoSomeHardWork(){
        let operationQueue = OperationQueue.init()
        let threadCount = 40
        operationQueue.maxConcurrentOperationCount = threadCount
        
        let operationQueueScheduler = OperationQueueScheduler.init(operationQueue: operationQueue, queuePriority: .veryHigh)
        
        doSomeNonSenseHardWork(scheduler: operationQueueScheduler)
    }
    
    func doSomeNonSenseHardWork(scheduler: ImmediateSchedulerType ){
        let dummyNumber = 1
        let iterationCount = 50000
        let observable = Observable.just(dummyNumber).subscribe(on: scheduler)
        var disposable = Disposables.create()
        
        for _ in 0...iterationCount {
            disposable = observable.subscribe { event in
                print("Current Thread is: ",Thread.current)
                let randomNumber = Int.random(in: 1..<self.fiftiethFibonacciNumber)
                self.isInFibonacciNumberSeries(randomNumber)
            }
        }
       
        disposable.dispose()
    }
    
    func isInFibonacciNumberSeries(_ randomNumber: Int) {
        for i in 0..<fibonacciNumberSeries.count {
            if fibonacciNumberSeries[i] == randomNumber {
                print("EUREKA!")
            }
        }
    }
    
    func findFibonacciNumberSeriesUntilNthNumber(n: Int) -> [Int] {
        assert(n > 1)

        var array = [0, 1]

        while array.count < n {
            array.append(array[array.count - 1] + array[array.count - 2])
        }
        
        return array
    }
}
