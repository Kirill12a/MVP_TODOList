//
//  ViewController.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var viewSource: VcView = {
        var vc = VcView()
        return vc
    }()

    var nameUser: [String] = ["1","2","3","4"]

    var presenter: MainPresenter!

    override func loadView() {
        super.loadView()
        self.view = viewSource
        
        // presenter
        presenter = MainPresenter()
        presenter.delegate = self
        presenter.delegateCreateTask = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSource.tableView.delegate = self
        viewSource.tableView.dataSource = self

        title = "Todo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createTask))
    }

}

extension ViewController: TupTableViewDelegate {
    func didTup() {
        print("Hello World")
    }
}

extension ViewController: CreateTaskDelegate {
    @objc func createTask() {
        let alertController = UIAlertController(
            title: "Login", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Сюда таск напиши"
        }

        let continueAction = UIAlertAction(title: "Continue", style: .default) { [self] _ in
            guard let textFields = alertController.textFields else {return}
            nameUser.append(textFields[0].text!)
            DispatchQueue.main.async { [self] in
                viewSource.tableView.reloadData()
            }
        }

        alertController.addAction(continueAction)
           self.present(alertController, animated: true)
     }
}



//MARK:  - TableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameUser.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nameUser[indexPath.row]
        cell.backgroundColor = .red
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableViewTouch() // пусть тут будет удаление из бд
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
