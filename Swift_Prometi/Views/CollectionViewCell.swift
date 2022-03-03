//
//  CollectionViewCell.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/03.
//

import UIKit

class CollectionViewCell:UICollectionViewCell {
    
    //MARK: Properties
    lazy var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var label2:UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemRed
        return label
    }()
    
    var item:String? {
        didSet {
            self.label.text = item
        }
    }
    
    
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
        backgroundColor = .green
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
}
