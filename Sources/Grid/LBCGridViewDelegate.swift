//
//  LBCGridViewDelegate.swift
//  
//
//  Created by Majid Boudaoud on 19/04/2020.
//

import UIKit

class LBCGridViewDelegate: NSObject, UICollectionViewDelegate {
    
    var didSelectItemAtIndexPath: ((UICollectionView, IndexPath) -> Void)? = nil
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAtIndexPath?(collectionView, indexPath)
    }
}
