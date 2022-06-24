//
//  ToDoListTaskModel.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 19.06.2022.
//

import Foundation
import RealmSwift

class ToDoListTaskModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var done = false
}
