//
//  ViewController.swift
//  Practice2
//
//  Created by Chichek on 27.12.24.
//

import UIKit

class NameListTableView: UIViewController {
    
    private let viewModel = NameListViewModel()
    
    private let table = UITableView()
    
    private let loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .large)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.color = .black
        return loadingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        configureLoadingConstraints()
        configureTableConstraints()
        names()
        viewModel.getNames()
    }
    
    private func configureUI(){
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        view.addSubview(loadingView)
    }
    
    private func configureTableView() {
        table.register(NameListTableViewCell.self, forCellReuseIdentifier: "NameListTableViewCell")
        table.dataSource = self
        table.delegate = self
    }
    
    private func configureTableConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureLoadingConstraints() {
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension NameListTableView: UITableViewDelegate, UITableViewDataSource {
    
    private func names() {
        viewModel.nameListCallBack = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .fail:
                    print("Error fetching names")
                case .loading:
                    self?.loadingView.startAnimating()
                    print("start")
                case .success:
                    self?.loadingView.stopAnimating()
                    self?.table.reloadData()
                case.loaded:
                    print("stop")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameListTableViewCell", for: indexPath) as! NameListTableViewCell
        let name = viewModel.names[indexPath.row].name
        cell.configureElementsInCell(name: name)
        return cell
    }
    
}
