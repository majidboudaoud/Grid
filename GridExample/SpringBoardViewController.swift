//
//  SpringBoardViewController.swift
//  GridExample
//
//  Created by Majid Boudaoud on 03/05/2020.
//  Copyright © 2020 Majid Boudaoud. All rights reserved.
//

import UIKit
import Grid
import ColumnLayout

class SearchBarCollectionViewCell: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBlurEffectOnBackground()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addBlurEffectOnBackground() {
        let visualEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: visualEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.layer.cornerRadius = 8
        visualEffectView.layer.masksToBounds = true
        self.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        visualEffectView.heightAnchor.constraint(equalToConstant: 37).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

class WidgetCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "APPNAME"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addBlurEffectOnBackground()
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(image: UIImage?) {
        self.imageView.image = image
    }
    
    private func addBlurEffectOnBackground() {
        let visualEffect = UIBlurEffect(style: .extraLight)
        let visualEffectView = UIVisualEffectView(effect: visualEffect)
        visualEffectView.layer.cornerRadius = 8
        visualEffectView.layer.masksToBounds = true
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(visualEffectView)
        visualEffectView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 11).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
}

class AppIconCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 13
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Appname"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(image: UIImage?) {
        self.imageView.image = image
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true

        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6).isActive = true
    }
}

class AppListCollectionViewCell: UICollectionViewCell {
    
    var test: Bool = false
    
    private func addBlurEffectOnBackground() {
        let visualEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: visualEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        visualEffectView.heightAnchor.constraint(equalToConstant: 93).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }

    private lazy var gridView = LBCGridView()
        .numberOfItemsInSection { _ in 20 }
        .setLineSpacingForSection { _ in 8 }
        .setMinimumInteritemSpacingForSection { _ in 16 }
        .setHeightForCellAt { _ in 80 }
        .setInsetForSectionAtIndex { _ in UIEdgeInsets(top: 17, left: 16, bottom: 0, right: 16) }
        .registerCells([AppIconCollectionViewCell.self])
        .setNumberOfColumnsFor { _ in return 4 }
        .cellForItemAtIndexPath { (collectionView, indexPath) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(with: AppIconCollectionViewCell.self, for: indexPath)
            cell.configure(image: UIImage(named: "\(indexPath.item)"))
            return cell
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.addBlurEffectOnBackground()
    }
    
    required init?(coder: NSCoder) { fatalError("init coder: has not been implemented") }

    private func setupView() {
        gridView.backgroundColor = .clear
        gridView.frame = self.contentView.frame
        gridView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(gridView)
        gridView.reloadData()
    }
}


class WidgetListCollectionViewCell: UICollectionViewCell {
    
    var test: Bool = false

    private lazy var gridView = LBCGridView()
        .addLayoutEffects([CLProgressiveCollapsingEffect.self, CLStickyHeaderEffect.self])
        .numberOfItemsInSection { _ in 10 }
        .setLineSpacingForSection { _ in 8 }
        .setHeightForCellAt { _ in 200 }
        .setReferenceHeightForHeaderInSection { _ in 60 }
        .setInsetForSectionAtIndex { _ in UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) }
        .registerCells([WidgetCollectionViewCell.self])
        .setNumberOfColumnsFor { _ in return 1 }
        .cellForItemAtIndexPath { (collectionView, indexPath) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(with: WidgetCollectionViewCell.self, for: indexPath)
            cell.configure(image: UIImage(named: "\(indexPath.item)"))
            return cell
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init coder: has not been implemented") }

    private func setupView() {
        gridView.backgroundColor = .clear
        gridView.frame = self.contentView.frame
        gridView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(gridView)
        gridView.reloadData()
    }
}

enum SpringBoardSectionType: Int, CaseIterable {
    case widgetList
    case appList
}

class SpringBoardViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.view.frame)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.image = UIImage(named: "wallpaper")
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var gridView = LBCGridView()
        .setScrollDirection(.horizontal)
        .numberOfItemsInSection { _ in 1 }
        .setNumberOfSections(SpringBoardSectionType.allCases.count)
        .setPagingEnabled(true)
        .setMinimumInteritemSpacingForSection { _ in 0 }
        .setWidthForCellAt { _ in UIScreen.main.bounds.width }
        .setInsetForSectionAtIndex { _ in .zero }
        .registerCells([WidgetListCollectionViewCell.self, AppListCollectionViewCell.self])
        .setNumberOfColumnsFor { _ in return 1 }
        .cellForItemAtIndexPath { (collectionView, indexPath) -> UICollectionViewCell in
            let section = SpringBoardSectionType.allCases[indexPath.section]
            switch section {
            case .widgetList:
                let cell = collectionView.dequeueReusableCell(with: WidgetListCollectionViewCell.self, for: indexPath)
                return cell
            case .appList:
                let cell = collectionView.dequeueReusableCell(with: AppListCollectionViewCell.self, for: indexPath)
                return cell
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        gridView.backgroundColor = .clear
        gridView.frame = self.view.frame
        gridView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(imageView)
        view.addSubview(gridView)
        gridView.reloadData()
    }
}
