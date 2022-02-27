//
//  ScrollViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/28.
//

import UIKit

class ScrollViewController:UIViewController {
    
    //MARK: Properties
    lazy var scrollView:UIScrollView = {
       let view = UIScrollView()
        view.backgroundColor = .systemBackground
        view.contentSize = CGSize(width: view.frame.width, height: 2000)
        return view
    }()
    
    lazy var labelOne:UILabel = {
       let label = UILabel()
        label.text = "TOP"
        return label
    }()

    lazy var labelTwo:UILabel = {
       let label = UILabel()
        label.text = "Bottom"
        return label
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configrueViewComponent()
    }
    
    //MARK: Configure
    func configrueViewComponent() {
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(labelOne)
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:  100).isActive = true
        labelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 1500).isActive = true
        labelTwo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
    }
}
