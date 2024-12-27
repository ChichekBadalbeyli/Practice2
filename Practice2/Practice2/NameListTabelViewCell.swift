//
//  CellManagerViewCell.swift
//  Practice2
//
//  Created by Chichek on 27.12.24.
//

import UIKit

class NameListTabelViewCell: UITableViewCell {
    
    let name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "NameListTabelViewCell")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    func configureUI (){
        name.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(name)
    }
    

}
