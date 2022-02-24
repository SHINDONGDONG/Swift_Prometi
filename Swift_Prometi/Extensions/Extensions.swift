//
//  Extensions.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/24.
//

import UIKit

extension UIViewController {
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
