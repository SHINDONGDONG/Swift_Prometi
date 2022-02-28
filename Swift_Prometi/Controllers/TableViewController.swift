//
//  TableViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/02/28.
//

import UIKit

//문자열이 필요한다
private let reuseableIdentifier = "cell"

class TableViewController:UITableViewController {
    //MARK: Properties
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    
//    enum Items2:String, CaseIterable {
//        case one = "1"
//        case two = "2"
//        case three = "3"
//
//        var itemImage:String {
//            switch self {
//            case .one:
//                return "gear"
//            case .two:
//                return "airplane"
//            case .three:
//                return "house"
//            }
//        }
//    }
    
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tableView didload!!")
        
        config()
    }
    
    //MARK: configures
    func config() {
        //tableCell 클래스의를 가지고와서 register에 등록시킨것이다.
        tableView.register(TableCell.self, forCellReuseIdentifier: reuseableIdentifier)
    }
    
}


//MARK: TableViewController Delegate and DataSource function
extension TableViewController {
    //개수를 반환
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell에 tableview의 reuseablecell을 등록 해주고 이것은 tablecell이라는것을 확신시켜준다.
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath) as! TableCell
        let item = self.items[indexPath.row]
        cell.item = item
        cell.backgroundColor = .systemBackground
        return cell
    }
    
    //cell의 높이를 지정할 수 있다.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
