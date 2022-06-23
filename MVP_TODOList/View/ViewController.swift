//
//  ViewController.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 19.06.2022.
//

import UIKit


struct User {
    var name:String
    var age: Int
}

class ViewController: UIViewController, AlertPresentProtocol {

    var viewSource: VcView = {
        var vc = VcView()
        return vc
    }()

    var userList: [User] = [User(name: "Kirill", age: 12), User(name: "Anon", age: 19)]

    var presenter = PresnterMainViewContoller()

    override func loadView() {
        super.loadView()
        self.view = viewSource
        // presenter
        presenter.delegate = self
        presenter.delegateAlert = self

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.tableView.delegate = self
        viewSource.tableView.dataSource = self

        print("HELLO THIS VIEWDIDLOAD")

        title = "Todo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertCreate))
    }
}

//MARK:  - TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userList[indexPath.row].name
        cell.backgroundColor = .red
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: PresentAlertProtocol {
    @objc func alertCreate() {

        presenter.printValueUser(user: userList, index: 1)
        presenter.createAlertController(user: userList, index: 1)

    }
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
