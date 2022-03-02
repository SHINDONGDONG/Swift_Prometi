//
//  ModalView.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/02.
//

import UIKit

protocol ModalViewDelegate:AnyObject {
    func closeButtonTapped()
}

class ModalView: UIView {

    //MARK: Properties
    lazy var closeButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Close", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    weak var delegate:ModalViewDelegate?
    
    //MARK: Selectors
    @objc func closeButtonTapped(){
        delegate?.closeButtonTapped()
    }

    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configureViewComponents() {
        backgroundColor = .systemBackground
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50 ).isActive = true
        
        
    }
    
}
