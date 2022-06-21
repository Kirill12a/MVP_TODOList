//
//  ViewController.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 19.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TupTableViewDelegate, CreateTaskDelegate {

    func presentAlert(titile: String, message: String) {
        print("я нажал на плюс")
    }


    var nameUser: [String] = ["1","2","3","4"]

    //delegate
    func didTup() {
        print("Hello World")
    }

    var textAlet: String?

   @objc func createTask() {
//       nameUser.append(newItem)



       let alertController = UIAlertController(title: "Login",
                                                  message: nil,
                                                  preferredStyle: .alert)

       alertController.addTextField { textField in
           textField.placeholder = "Сюда таск напиши"
       }

       let continueAction = UIAlertAction(title: "Continue", style: .default) { [self] _ in
           guard let textFields = alertController.textFields else {return}

           print(textFields[0].text!)

           nameUser.append(textFields[0].text!)
           DispatchQueue.main.async { [self] in
               viewSource.tableView.reloadData()
           }
       }

       alertController.addAction(continueAction)



          self.present(alertController,
                       animated: true)
    }



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
        presenter.tableViewTouch()
    }


    override func loadView() {
        super.loadView()
        self.view = viewSource
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

    var presenter: MainPresenter!


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
