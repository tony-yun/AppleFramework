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
        
        // navigation controller top item title 코드로 변경
        navigationController?.navigationBar.topItem?.title = "Apple Frameworks"
        
        // collectionView size inspector -> estimate size: none를 코드로 만들어보기(버튼으로 해도되지만 코드로 하면 직관적임, 선택사항)
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // 컨텐츠 상하좌우 여백주기
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
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
        
        // 3열일 때 계산
        let interItemSpacing: CGFloat = 10
        let paddingSpacing: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing * 2 - paddingSpacing * 2) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
        
//        // 2열일 때 계산
//        let interItemSpacing: CGFloat = 10
//        let paddingSpacing: CGFloat = 16
//        
//        //interItemSpacing 아이템 간 spacing, 따라서 *2 -> *1 변경
//        // 좌우의 padding은 그대로
//        let width = (collectionView.bounds.width - interItemSpacing * 3 - paddingSpacing * 2) / 4
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
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

// item touch에 반응하기
extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print("selected: \(framework.name)")
    }
}
