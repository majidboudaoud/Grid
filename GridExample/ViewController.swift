//
//  ViewController.swift
//  GridExample
//
//  Created by Majid Boudaoud on 18/04/2020.
//  Copyright © 2020 Majid Boudaoud. All rights reserved.
//

import UIKit
import Grid

class ViewController: UIViewController {
    
    var numberOfColumns: Int = 2

    private lazy var gridView = LBCGridView().numberOfItemsInSection { _ in 10 }
                                        .setNumberOfSections(1)
                                        .setInsetForSectionAtIndex { _ in .init(top: 8, left: 8, bottom: 8, right: 8) }
                                        .registerCells([UICollectionViewCell.self])
                                        .setNumberOfColumnsFor { _ in return self.numberOfColumns }
                                        .cellForItemAtIndexPath { (collectionView, indexPath) -> UICollectionViewCell in
                                            let cell = collectionView.dequeueReusableCell(with: UICollectionViewCell.self, for: indexPath)
                                            cell.backgroundColor = .red
                                            return cell
                                        }
                                        .didSelectItemAtIndexPath { (collectionView, indexPath) in
                                            collectionView.performBatchUpdates({
                                                self.numberOfColumns += 1
                                                collectionView.collectionViewLayout.invalidateLayout()
                                            })
                                            print("did select item at indexPath: \(indexPath.item)")
                                        }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        gridView.backgroundColor = .blue
        gridView.frame = self.view.frame
        gridView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(gridView)
        gridView.reloadData()
    }
}
