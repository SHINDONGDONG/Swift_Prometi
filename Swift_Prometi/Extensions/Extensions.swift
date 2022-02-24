//
//  Extensions.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/24.
//

import UIKit

extension UIViewController {
    //MARK: Helpers
    func moveViewWithKeyboard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide ),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    //MARK: Selectors
    @objc func keyboardWillShow(notification: NSNotification) {
        
        //키보드가 나타날 때 키보드의 사이즈를 확인한다.  값이 유저인포가 존재할 수 있고 없을수도있다.. keyboardfram유저 인포키가
        if let keyboardSize = (notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as?
                               NSValue)?.cgRectValue { //NSValue값이고 존재한다면 cgrectvalue값으로 가져온다.
            //view의 프레임 오리진값이 0이아니면 (밑으로 내려가거나 올라가이_ㅅ으면)
            if self.view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height-50
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    
    func hiddenKeyboard() {
        //tap제스쳐를 선언 후 타겟은 self,(view) selector를 지정해준 후 특정동작을 실행시킨다.
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //cancelsTouchesInview = true는 기존에 일어나고있는 touch 이벤트를 취소시키는 속성
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    //    아무곳이나 눌러도 keyboard가 사라지는 메서드
        @objc func dismissKeyboard() {
            print("clied endEditing")
            view.endEditing(true)

        }

}
