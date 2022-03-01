//
//  CollectionHeaderCell.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/02.
//

import UIKit

class CollectionHeaderCell:UICollectionReusableView {
    
    //MARK: Properties
    lazy var label:UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configures
    func configure() {
        backgroundColor = .systemBackground
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
