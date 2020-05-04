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

    var numberOfColumns: Int = 1

    private lazy var gridView = LBCGridView()
        .numberOfItemsInSection { _ in 10 }
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
            print("did select item at indexPath: \(indexPath.item)")
        }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        let firstButton = UIButton()
        firstButton.backgroundColor = .green
        firstButton.setTitle("👍", for: .normal)
        firstButton.addTarget(self, action: #selector(addColumn), for: .touchUpInside)
        
        let secondButton = UIButton()
        secondButton.backgroundColor = .red
        secondButton.setTitle("👎", for: .normal)
        secondButton.addTarget(self, action: #selector(removeColumn), for: .touchUpInside)
        
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(firstButton)
        return stackView
    }()
    
    @objc func addColumn() {
        self.numberOfColumns += 1
        updateGrid()
    }
    
    @objc func removeColumn() {
        self.numberOfColumns -= 1
        updateGrid()
    }
    
    func updateGrid() {
        gridView.performBatchUpdates({
            gridView.collectionViewLayout.invalidateLayout()
        })
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
        
        view.addSubview(stackView)
        
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
