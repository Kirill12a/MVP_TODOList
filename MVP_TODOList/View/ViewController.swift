//
//  ViewController.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 19.06.2022.
//

import RealmSwift
import UIKit



class ViewController: UIViewController, AlertPresentProtocol {

    var realm: Realm!

    var todoList: Results<ToDoListTaskModel>{
        get {
            return realm.objects(ToDoListTaskModel.self)
        }
    }

    var viewSource: VcView = {
        var vc = VcView()
        return vc
    }()


    fileprivate var presenter = PresnterMainViewContoller()

    override func loadView() {
        super.loadView()
        self.view = viewSource

        presenter.delegateAlert = self
        presenter.delegateRealm = self

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSource.tableView.delegate = self
        viewSource.tableView.dataSource = self

        title = "Todo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertCreate))

        realm = try! Realm()
    }
}

//MARK:  - TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row].name
        cell.backgroundColor = .red
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        try! self.realm.write({
            self.realm.delete(todoList[indexPath.row])
        })
        DispatchQueue.main.async {
            self.viewSource.tableView.reloadData()
        }
    }
}

extension ViewController: PresentAlertProtocol {
    @objc func alertCreate() {
        presenter.createAlertController()
    }
}

extension ViewController: RealmProtocol {
    func save(task: ToDoListTaskModel) {
        try! self.realm.write({
            self.realm.add(task)
        })
        DispatchQueue.main.async {
            self.viewSource.tableView.reloadData()
        }
    }
}
