//
//  CellManagerViewCell.swift
//  Practice2
//
//  Created by Chichek on 27.12.24.
//

import UIKit

class NameListTableViewCell: UITableViewCell {
    
    private(set) var name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "NameListTableViewCell")
        configureUI()
        configureConstaint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUI (){
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        contentView.addSubview(name)
    }
    
    private func configureConstaint() {
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configureElementsInCell(name:String) {
        self.name.text = name
    }
    
}
