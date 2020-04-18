//
//  LBCGridViewColumnLayoutDelegate.swift
//  
//
//  Created by Majid Boudaoud on 18/04/2020.
//

import UIKit
import ColumnLayout

class LBCGridViewColumnLayoutDelegate: ColumnLayoutDelegate {
    
    var insetForSectionAtIndex: ((Int) -> UIEdgeInsets)? = nil
    var heightForCellAt: ((IndexPath) -> CGFloat)? = nil
    var numberOfColumnsFor: ((Int) -> Int)? = nil
    var minimumInteritemSpacingForSection: ((Int) -> CGFloat)? = nil
    var minimumLineSpacingForSection: ((Int) -> CGFloat)? = nil
    var referenceHeightForHeaderInSection: ((Int) -> CGFloat)? = nil
    
    func insetForSectionAtIndex(section: Int) -> UIEdgeInsets {
        insetForSectionAtIndex?(section) ?? .zero
    }
    
    func heightForCellAt(indexPath: IndexPath) -> CGFloat {
        heightForCellAt?(indexPath) ?? 80
    }
    
    func numberOfColumnsFor(section: Int) -> Int {
        numberOfColumnsFor?(section) ?? 1
    }
    
    func minimumInteritemSpacingForSection(section: Int) -> CGFloat {
        minimumInteritemSpacingForSection?(section) ?? 8
    }
    
    func minimumLineSpacingForSection(section: Int) -> CGFloat {
        minimumLineSpacingForSection?(section) ?? 8
    }
    
    func referenceHeightForHeaderInSection(section: Int) -> CGFloat {
        referenceHeightForHeaderInSection?(section) ?? 0
    }
}
