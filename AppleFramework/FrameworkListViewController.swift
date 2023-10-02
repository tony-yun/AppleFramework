//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by 윤태웅 on 10/2/23.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list:[AppleFramework] = AppleFramework.list
    
    // data, presentation, layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension FrameworkListViewController: UICollectionViewDataSource {
    // 몇개의 cell을 보여줄건지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // 어떻게 cell을 표현할건지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            // 케스팅이 실패했을 경우에
            return UICollectionViewCell()
        }
        // 성공했을 경우
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        
        return cell
    }
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 10
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    // 좌우 아이템 간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // 위아래 아이템 간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}