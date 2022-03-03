//
//  CollectionViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/03.
//

import UIKit

private let collectionCellIdentfier = "cell"
private let collectionHeaderCellIdentfier = "header"
class CollectionViewController:UICollectionViewController {

    //MARK: Properties
    enum items:String,CaseIterable {
        case one = "1"
        case two = "2"
        case thr = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
    }
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    //MARK: Configures
    func configure() {
        view.backgroundColor = .red
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: collectionCellIdentfier)
        collectionView.register(CollectionHeaderCell.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: collectionHeaderCellIdentfier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentfier, for: indexPath) as! CollectionViewCell
        cell.item = items.allCases[indexPath.row].rawValue
        return cell
    }
}

extension CollectionViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 2, height: (view.frame.width / 3) - 2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionHeaderCellIdentfier, for: indexPath) as! CollectionHeaderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.width / 3) * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
