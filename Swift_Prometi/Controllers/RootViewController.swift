//
//  RootViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/22.
//

import UIKit

class RootViewController: UIViewController {

    //MARK: Properties
    lazy var tredulerLabel:UILabel = {
        //메인 라벨을 만든다.
        let label = UILabel()
        label.text = "Treduler"
        label.font = UIFont.boldSystemFont(ofSize: 60)
//        label.font = UIFont.italicSystemFont(ofSize: 38)
        return label
    }()
    
    lazy var loginLabel: UILabel = {
        //로그인 표시 라벨
        let label = UILabel()
        label.text = "login"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        //텍스트필드 ID입력창
        let tf = UITextField()
        tf.placeholder = "ID"
        return tf
    }()
    
    lazy var loginTextFieldView:UIView = {
        let view = UIView()
        //uiveiw를 만들어 textfield를 넣어준다.
        //border를 1로 테두리 만들어주고 color는 서브 시스템컬러와 같은 teriarysystemgroup
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        //cornerradius로 둥글게 표현해준다.
        view.layer.cornerRadius = 10
        //만들었던 logintextField를 넣어주고 view에 자리를잡는다
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loginTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -10).isActive = true
        return view
    }()
    
    lazy var passTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "PASSWORD"
        //text가 비밀번호와같이 ***로 표시되는 기능
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var passTextFieldView:UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.cornerRadius = 10
        view.addSubview(passTextField)
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        passTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        passTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        passTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -10).isActive = true
        return view
    }()

    lazy var loginButton:UIButton = {
        //로그인 버튼을 만들어준다.
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Login", for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        return button
    }()
//    lazy var helloWwolrdLabel:UILabel = {
//        let label = UILabel()
//        label.text = "Hello World"
//        return label
//    }()
//
//    lazy var helloWolrdButton:UIButton = {
//        //apple에서 권장하는 버튼의 타입.
//        let button = UIButton(type: UIButton.ButtonType.system)
//
//        //버튼의 이름과, state를 노멀로 만들어준다.
//        button.setTitle("hello World", for: UIControl.State.normal)
//        return button
//    }()
//
//    //uiview는 담고있는것이 없기에 사이즈를 지정해주어야 표현이 가능함.
//    lazy var helloWorldView:UIView = {
//        let view = UIView()
//        //제 2의 백그라운드 컬러 tertiarysystemgroupbackground
////        view.backgroundColor = .systemGreen
//        //테두리를 정의하고
//        view.layer.borderWidth = 1
//        //bordercolor를 uicolor로 먼저 지정한다음 cgcolor로 바꾸어준다.
//        view.layer.borderColor = UIColor.systemGreen.cgColor
//
//        //cornerRadius
//        view.layer.cornerRadius = 20
//        return view
//    }()
//
//    lazy var helloWorldTextField:UITextField = {
//       let tf = UITextField()
//        return tf
//    }()

    //MARK: Life Cycle funcions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponent()
        self.hiddenKeyboard()
        self.moveViewWithKeyboard()
     }
    
    //userinterface가 바뀔때마다 실행되는 override메서드임.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        configureColors()
    }
    
    //MARK: Configures
    func configureColors() {
        //만약에 유저인터페이스 스타일이 다크스타일일때그리고 아닐때를 나누어 주어 발동시킨다
        if self.traitCollection.userInterfaceStyle == .dark {
            loginButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
            loginButton.backgroundColor = .white
        } else {
            loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            loginButton.backgroundColor = .black
        }
    }
    
    
    func configureViewComponent() {
        configureColors()
        //self는 RootViewController를 의미 Rootviewcontroller는 UIViewController를 가지고있음.
        view.backgroundColor = .systemBackground
        view.addSubview(tredulerLabel)
        tredulerLabel.translatesAutoresizingMaskIntoConstraints = false
        tredulerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400).isActive = true
        tredulerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: tredulerLabel.bottomAnchor,constant: 20).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginTextFieldView)
        loginTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        loginTextFieldView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50).isActive = true
        loginTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextFieldView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        loginTextFieldView.widthAnchor.constraint(equalToConstant: view.frame.width-80).isActive = true
        loginTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passTextFieldView)
        passTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        passTextFieldView.topAnchor.constraint(equalTo: loginTextFieldView.bottomAnchor, constant: 20).isActive = true
        passTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passTextFieldView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        passTextFieldView.widthAnchor.constraint(equalToConstant: view.frame.width-80).isActive = true
        passTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passTextFieldView.bottomAnchor, constant: 30).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width-80).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        
//        //view에 text를 추가시켜준다.
//        view.addSubview(helloWwolrdLabel)
//        //code로 constraints를 주려면 false를 해주고 제약을 걸어야한다
//        helloWwolrdLabel.translatesAutoresizingMaskIntoConstraints = false
//        //topanchor를 constraint를 준다 safearealayoutGuid 탑앵커를 액티브 트루.등등..
////        helloWwolrdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
////        helloWwolrdLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        //center의 x,y을 true로 조정하면 가운데로 온다.
//        helloWwolrdLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        helloWwolrdLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//
//        //button을 label보다 10 밑에 배치한다.
//        view.addSubview(helloWolrdButton)
//        helloWolrdButton.translatesAutoresizingMaskIntoConstraints = false
//        helloWolrdButton.centerYAnchor.constraint(equalTo: helloWwolrdLabel.bottomAnchor, constant: 10 ).isActive = true
//        helloWolrdButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//
//        view.addSubview(helloWorldView)
//        helloWorldView.translatesAutoresizingMaskIntoConstraints = false
//        helloWorldView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        helloWorldView.centerYAnchor.constraint(equalTo: helloWolrdButton.bottomAnchor, constant: 20).isActive = true
//        //width height를 지정해주어야한다.
//        helloWorldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        helloWorldView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
//        //view에 textfield를 넣어주는 방법. left right의 constant를 꼭 지정해주어야함.
//        view.addSubview(helloWorldTextField)
//        helloWorldTextField.translatesAutoresizingMaskIntoConstraints = false
//        helloWorldTextField.topAnchor.constraint(equalTo: helloWorldView.topAnchor).isActive = true
//        helloWorldTextField.bottomAnchor.constraint(equalTo: helloWorldView.bottomAnchor).isActive = true
//        helloWorldTextField.leftAnchor.constraint(equalTo: helloWorldView.leftAnchor, constant: 4).isActive = true
//        helloWorldTextField.rightAnchor.constraint(equalTo: helloWorldView.rightAnchor, constant: -4).isActive = true
        
    }

}

