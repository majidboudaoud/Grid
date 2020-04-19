# Grid
![](README/grid-image.png)

## Welcome to Grid
Grid is a simple component based on UIKit’s UICollectionView aiming at simplify and accelerate developments when starting a new project for creating grid based interface like many applications (Apple Music, Spotify, Netflix).

## How to use
```
    private let gridView = LBCGridView().numberOfItemsInSection { _ in 10 }
                                        .setNumberOfSections(1)
                                        .setInsetForSectionAtIndex { _ in .init(top: 8, left: 8, bottom: 8, right: 8) }
                                        .registerCells([UICollectionViewCell.self])
                                        .setNumberOfColumnsFor { _ in return self.numberOfColumns }
```

LBCGrid  can be set up using many simple functions like **setNumberOfSections** or **registerCells**.
LBCGrid is using ColumnLayout as a dependency, and many of the setting up methods are based on the same logic. To see more informations, please follow this link: https://github.com/majidboudaoud/ColumnLayout