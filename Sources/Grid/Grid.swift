import UIKit
import ColumnLayout

public class LBCGridView: UICollectionView {
    
    private let _dataSource: LBCGridViewDataSource = LBCGridViewDataSource()
    private let _delegate: LBCGridViewDelegate = LBCGridViewDelegate()
    private let columnLayoutDelegate: LBCGridViewColumnLayoutDelegate = LBCGridViewColumnLayoutDelegate()
    
    private let columnLayout: ColumnLayout = {
        let layout = ColumnLayout()
        return layout
    }()
    
    convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    }
    
    convenience init(frame: CGRect) {
        self.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
    }
    
    private override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.columnLayout)
        self.columnLayout.delegate = columnLayoutDelegate
        self.dataSource = _dataSource
        self.delegate = _delegate
        self.alwaysBounceVertical = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.collectionViewLayout = self.columnLayout
        self.columnLayout.delegate = self.columnLayoutDelegate
        self.dataSource = _dataSource
        self.delegate = _delegate
        self.alwaysBounceVertical = true
    }
    
    @discardableResult
    public func setInsetForSectionAtIndex(_ insetForSectionAtIndex: @escaping(_ section: Int) -> UIEdgeInsets) -> Self {
        self.columnLayoutDelegate.insetForSectionAtIndex = insetForSectionAtIndex
        return self
    }
    
    @discardableResult
    public func setHeightForCellAt(_ heightForCellAtIndex: @escaping(IndexPath) -> CGFloat) -> Self {
        self.columnLayoutDelegate.heightForCellAt = heightForCellAtIndex
        return self
    }
    
    @discardableResult
    public func setNumberOfColumnsFor(_ numbersOfColumnsFor: @escaping(Int) -> Int) -> Self {
        self.columnLayoutDelegate.numberOfColumnsFor = numbersOfColumnsFor
        return self
    }
    
    @discardableResult
    public func setMinimumInteritemSpacingForSection(_ minimumInteritemSpacingForSection: @escaping(Int) -> CGFloat) -> Self {
        self.columnLayoutDelegate.minimumInteritemSpacingForSection = minimumInteritemSpacingForSection
        return self
    }
    
    @discardableResult
    public func setInsetForSectionAtIndex(_ minimumLineSpacingForSection: @escaping(Int) -> CGFloat) -> Self {
        self.columnLayoutDelegate.minimumLineSpacingForSection = minimumLineSpacingForSection
        return self
    }
    
    @discardableResult
    public func setReferenceHeightForHeaderInSection(_ referenceHeightForHeaderInSection: @escaping(Int) -> CGFloat) -> Self {
        self.columnLayoutDelegate.referenceHeightForHeaderInSection = referenceHeightForHeaderInSection
        return self
    }
    
    @discardableResult
    public func cellForItemAtIndexPath(_ cellForItemAtIndexPath: @escaping(UICollectionView, IndexPath) -> UICollectionViewCell) -> Self {
        _dataSource.cellForItemAtIndexPath = cellForItemAtIndexPath
        return self
    }
    
    @discardableResult
    public func numberOfItemsInSection(_ numberOfItemsInSection: @escaping(Int) -> Int) -> Self {
        _dataSource.numberOfItemsInSection = numberOfItemsInSection
        return self
    }
    
    @discardableResult
    public func setNumberOfSections(_ numberOfSections: Int) -> Self {
        _dataSource.numberOfSections = numberOfSections
        return self
    }
    
    @discardableResult
    public func registerCells(_ cells: [UICollectionViewCell.Type]) -> Self {
        cells.forEach{ register(cellType: $0) }
        return self
    }
    
    @discardableResult
    public func didSelectItemAtIndexPath(_ didSelectItemAtIndexPath: @escaping(UICollectionView, IndexPath) -> Void) -> Self {
        _delegate.didSelectItemAtIndexPath = didSelectItemAtIndexPath
        return self
    }
}
