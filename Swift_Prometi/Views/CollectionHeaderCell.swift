



import UIKit

class CollectionHeaderCell:UICollectionReusableView {
    
    //MARK: Properties
    lazy var label:UILabel = {
        let label = UILabel()
        label.text = "HEADER"
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
    }()
    
    var item:String? {
        didSet {
            self.label.text = item
        }
    }
    
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: configures
    func configure(){
        backgroundColor = .systemGreen
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
