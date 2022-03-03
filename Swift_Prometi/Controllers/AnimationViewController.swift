//
//  AnimationViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/02.
//

import UIKit


class AnimationViewController: UIViewController {

    //MARK: Properties
    lazy var openButton:UIButton = {
       let button = UIButton()
        button.setTitle("Open", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(openButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    //만든 modalview를 선언해준다
    lazy var modalView:ModalView = {
        let view = ModalView()
        return view
    }()
    
    lazy var blurEffectView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    //MARK: init
    override func viewDidLoad() {
        super.viewDidLoad()
 
        configure()
    }
    
    //MARK: Selectors
    @objc func openButtonTapped(){
        openModal()
    }
    
    //MARK: Helpers
    func openModal(){
        view.addSubview(modalView)
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:  -25).isActive = true
        //view.widthanchor의 80퍼센트로 크기를준다. //view의 크기를 주는것임.
        modalView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        modalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        modalView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        modalView.delegate = self
        
        //uiview animate를 0.3초를 걸쳐서 alpha값을 1로 바꾸어주고,
        //transform을 기본_??? 으로 설정해준다.
        UIView.animate(withDuration: 0.3) {
            //클릭했을 때 blur alpha가 1이 되면서 투명해진다.
            self.blurEffectView.alpha = 1
            self.modalView.transform = .identity
        }
    }
    
    func closeModal() {
        UIView.animate(withDuration: 0.3, animations:  {
            //클릭했을 때 blur alpha가 1이 되면서 투명해진다.
            self.modalView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.blurEffectView.alpha = 0
            
        }) { (_) in
            //modalview의 superview에서 완전히 삭제시켜서 메모리 절약을 시킨다.
            self.modalView.removeFromSuperview()
        }
    }
    
    
    //MARK: Configures
    func configure() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(openButton)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //블러의 투명도를 없앤다.
        blurEffectView.alpha  = 0
        

        
    }
}

extension AnimationViewController:ModalViewDelegate {
    func closeButtonTapped() {
        closeModal()
    }
}
