//
//  CollectionViewController.swift
//  Swift_Prometi
//
//  Created by 申民鐡 on 2022/03/01.
//

import UIKit

private let collcetionCellIdentfier = "cell"
private let collcetionHeaderCellIdentfier = "header"

class CollectionViewController:UICollectionViewController {
    
    
    //MARK: Properties
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    
    //MARK: init
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        print("CollcetionView")
    }
    
    
    //MARK: Configures
    func config() {
        view.backgroundColor = .systemGreen
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: collcetionCellIdentfier)
        //header의 레지스터를 등록한다.
        collectionView.register(CollectionHeaderCell.self ,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: collcetionHeaderCellIdentfier)
    }
    
}

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collcetionCellIdentfier, for: indexPath) as! CollectionCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    //header cell을 collectionview 로 반환하는 kind 메서드
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: collcetionHeaderCellIdentfier ,
                                                                   for: indexPath) as! CollectionHeaderCell
        
        return cell
    }
    
}

//
extension CollectionViewController:UICollectionViewDelegateFlowLayout {
    //sizeforheader  = collectionheader 사이즈를 조정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: (view.frame.width / 3) * 2 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 2, height: (view.frame.width / 3) - 2)
    }
    
    //cell들 사이 가로 간격을 지정한다
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //cell들 사이 세로 간격을 지정한다
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
