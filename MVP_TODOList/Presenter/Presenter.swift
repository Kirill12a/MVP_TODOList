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

typealias AlertAndViewControoler = AlertPresentProtocol & UIViewController
class PresnterMainViewContoller {
    var delegate: PresentAlertProtocol!

    func printValueUser(user: [User], index:Int){
        print("User name == \(user[index].name)")
    }

    var delegateAlert: AlertAndViewControoler!

    func createAlertController(user:[User], index:Int){
        let alertVC = UIAlertController(title: "Привет ", message: "Тебя зовут \(user[index].name))", preferredStyle: .alert)

        alertVC.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Введите текст"
        })

        alertVC.addAction(UIAlertAction(title: "Ok", style: .default,handler: { action in
            let textField = alertVC.textFields![0] as UITextField
            print(textField.text!)

        }))
        delegateAlert.present(alertVC, animated: true)
    }
}
