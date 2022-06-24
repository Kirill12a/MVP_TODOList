//
//  Presenter.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 20.06.2022.
//

import Foundation
import UIKit


protocol PresentAlertProtocol {
    func alertCreate()
}
protocol AlertPresentProtocol {
}

protocol RealmProtocol {
    func save(task: ToDoListTaskModel)
}


typealias AlertAndViewControoler = AlertPresentProtocol & UIViewController

class PresnterMainViewContoller {

    var delegateRealm: RealmProtocol!
    var delegateAlert: AlertAndViewControoler!

    func createAlertController(){
        let alertVC = UIAlertController(title: "Добавить таск ", message: "", preferredStyle: .alert)

        alertVC.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Введите текст"
        })

        alertVC.addAction(UIAlertAction(title: "Ok", style: .default,handler: { action in
            let textField = alertVC.textFields![0] as UITextField
            print(textField.text!)
            let object = ToDoListTaskModel()
            object.name = textField.text!
            self.delegateRealm.save(task:object)
        }))
        delegateAlert.present(alertVC, animated: true)
    }

}
