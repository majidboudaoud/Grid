//
//  LBCGridViewDataSource.swift
//  
//
//  Created by Majid Boudaoud on 18/04/2020.
//

import UIKit

class LBCGridViewDataSource: NSObject, UICollectionViewDataSource {
    
    var numberOfItemsInSection: ((Int) -> Int)? = nil
    var cellForItemAtIndexPath: ((UICollectionView, IndexPath) -> UICollectionViewCell)? = nil
    var viewForSupplementaryElementOfKind: ((UICollectionView, String, IndexPath) -> UICollectionReusableView)? = nil
    var numberOfSections: Int = 1
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsInSection?(section) ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellForItemAtIndexPath?(collectionView, indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return viewForSupplementaryElementOfKind?(collectionView, kind, indexPath) ?? collectionView.dequeueReusableSupplementaryView(with: UICollectionReusableView.self, kind: kind, for: indexPath)
    }
}
