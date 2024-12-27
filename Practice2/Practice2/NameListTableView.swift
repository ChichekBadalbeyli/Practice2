//
//  ViewController.swift
//  Practice2
//
//  Created by Chichek on 27.12.24.
//

import UIKit

class NameListTableView: UIViewController {
    
    let viewModel = NameListViewModel()
    
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureTableView()
    }
    
    func configureUI (){
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
    }
    
    func configureTableView() {
        table.register(NameListTabelViewCell.self, forCellReuseIdentifier: "NameListTabelViewCell")
        table.dataSource = self
        table.delegate = self
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
extension NameListTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameListTabelViewCell", for: indexPath) as! NameListTabelViewCell
        cell.name.text = "nameList"
        return cell
    }
    
}
