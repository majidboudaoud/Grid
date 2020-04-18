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
    var numberOfSections: Int = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItemsInSection?(section) ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellForItemAtIndexPath?(collectionView, indexPath) ?? UICollectionViewCell()
    }
}
