//
//  TableCell.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/28.
//

import UIKit




class TableCell:UITableViewCell {
    
    //MARK: Properties
    var item:String? {
        didSet {
            //item이 들어왔을 때 label에 item을 대입해준다.
            self.label.text = item
        }
    }
    
    //cell에 들어갈 라벨
    lazy var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init Coder: has not been ")
    }
    
    
    func configure() {
        backgroundColor = .systemRed
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
