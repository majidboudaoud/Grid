//
//  UICollectionView+Extensions.swift
//  Lokan.jp
//
//  Created by Majid Boudaoud on 17/04/2020.
//  Copyright © 2020 Majid Boudaoud. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func applyChanges(deletions: [Int], insertions: [Int], updates: [Int], section: Int) {
        self.performBatchUpdates({
            deleteItems(at: deletions.map { IndexPath.fromRow($0, section: section) })
            insertItems(at: insertions.map { IndexPath.fromRow($0, section: section) })
            reloadItems(at: updates.map { IndexPath.fromRow($0, section: section) })
        })
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(with type: T.Type, kind: String, for indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func registerHeaderReusableView<T: UICollectionReusableView>(cellType: T.Type) {
        register(cellType,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: cellType.className)
    }
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.className)
    }
}
