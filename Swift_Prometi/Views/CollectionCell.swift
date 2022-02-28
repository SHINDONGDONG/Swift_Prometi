//
//  CollectionCell.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/01.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    //MARK: Properties
    var item:String? {
        didSet {
            self.label.text = item
        }
    }
    
    lazy var label:UILabel = {
       let label = UILabel()
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder)ADFDSAFDSFDS")
    }
    
    //MARK: Configures
    func configures() {
        backgroundColor = .red
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
}
