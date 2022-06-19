//
//  ViewController.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 19.06.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }


    override func loadView() {
super.loadView()
        self.view = viewSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSource.tableView.delegate = self
        viewSource.tableView.dataSource = self
        title = "Todo"
        navigationController?.navigationBar.prefersLargeTitles = true

    }



    var viewSource: VcView = {
        var vc = VcView()
        return vc
    }()


}



//var realm: Realm!
//
//var todoList: Results<ToDoListTaskModel>{
//    get {
//        return realm.objects(ToDoListTaskModel.self)
//    }
//}
//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//    realm = try! Realm()
//}
//
//
//func .... {
//    return todoList.count
//}



// add

//
//try! self.realm.write({
//    self.realm.add(newToDoList)
//    tableview.insertRows(at: [IndexPath.init(row: self.todolist.count-1, section: 0)], with: .automatic)
//})
