//
//  VcView.swift
//  MVP_TODOList
//
//  Created by Kirill Drozdov on 20.06.2022.
//

import Foundation
import UIKit


class VcView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
        fatalError("init(coder:) has not been implemented")
    }


    var tableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()


    func setUp(){
        [tableView].forEach(self.addSubview(_:))


        



        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
