//
//  RootViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/22.
//

import UIKit

class RootViewController: UIViewController {

    //MARK: Properties
    lazy var helloWwolrdLabel:UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        return label
    }()
    
    lazy var helloWolrdButton:UIButton = {
        //apple에서 권장하는 버튼의 타입.
        let button = UIButton(type: UIButton.ButtonType.system)
        
        //버튼의 이름과, state를 노멀로 만들어준다.
        button.setTitle("hello World", for: UIControl.State.normal)
        return button
    }()
    
    //uiview는 담고있는것이 없기에 사이즈를 지정해주어야 표현이 가능함.
    lazy var helloWorldView:UIView = {
        let view = UIView()
        //제 2의 백그라운드 컬러 tertiarysystemgroupbackground
//        view.backgroundColor = .systemGreen
        //테두리를 정의하고
        view.layer.borderWidth = 1
        //bordercolor를 uicolor로 먼저 지정한다음 cgcolor로 바꾸어준다.
        view.layer.borderColor = UIColor.systemGreen.cgColor
        
        //cornerRadius
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var helloWorldTextField:UITextField = {
       let tf = UITextField()
        return tf
    }()
    
    
    //MARK: Life Cycle funcions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponent()
    }
    
    
    //MARK: Configures
    
    func configureViewComponent() {
        //self는 RootViewController를 의미 Rootviewcontroller는 UIViewController를 가지고있음.
        self.view.backgroundColor = .systemBackground
        
        //view에 text를 추가시켜준다.
        view.addSubview(helloWwolrdLabel)
        //code로 constraints를 주려면 false를 해주고 제약을 걸어야한다
        helloWwolrdLabel.translatesAutoresizingMaskIntoConstraints = false
        //topanchor를 constraint를 준다 safearealayoutGuid 탑앵커를 액티브 트루.등등..
//        helloWwolrdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        helloWwolrdLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        //center의 x,y을 true로 조정하면 가운데로 온다.
        helloWwolrdLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        helloWwolrdLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        //button을 label보다 10 밑에 배치한다.
        view.addSubview(helloWolrdButton)
        helloWolrdButton.translatesAutoresizingMaskIntoConstraints = false
        helloWolrdButton.centerYAnchor.constraint(equalTo: helloWwolrdLabel.bottomAnchor, constant: 10 ).isActive = true
        helloWolrdButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        view.addSubview(helloWorldView)
        helloWorldView.translatesAutoresizingMaskIntoConstraints = false
        helloWorldView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        helloWorldView.centerYAnchor.constraint(equalTo: helloWolrdButton.bottomAnchor, constant: 20).isActive = true
        //width height를 지정해주어야한다.
        helloWorldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        helloWorldView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        //view에 textfield를 넣어주는 방법. left right의 constant를 꼭 지정해주어야함.
        view.addSubview(helloWorldTextField)
        helloWorldTextField.translatesAutoresizingMaskIntoConstraints = false
        helloWorldTextField.topAnchor.constraint(equalTo: helloWorldView.topAnchor).isActive = true
        helloWorldTextField.bottomAnchor.constraint(equalTo: helloWorldView.bottomAnchor).isActive = true
        helloWorldTextField.leftAnchor.constraint(equalTo: helloWorldView.leftAnchor, constant: 4).isActive = true
        helloWorldTextField.rightAnchor.constraint(equalTo: helloWorldView.rightAnchor, constant: -4).isActive = true
        
    }

}
