//
//  Presenter.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 20.06.2022.
//

import Foundation
import UIKit


protocol TupTableViewDelegate {
    func didTup()
}

protocol CreateTaskDelegate {
     func createTask()
}

//typealias alertAndViewDelegate = AlertShowDelegate & ViewController

class MainPresenter {
    var delegate: TupTableViewDelegate!
    var delegateCreateTask: CreateTaskDelegate!
//    var delegatePresentAlert: alertAndViewDelegate!


    func tableViewTouch(){
        delegate.didTup()
    }

    




}
