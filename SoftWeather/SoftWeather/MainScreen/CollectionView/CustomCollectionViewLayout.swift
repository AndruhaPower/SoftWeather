//
//  CustomCollectionViewLayout.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewLayout {
    
    private var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    private let columnsCount: CGFloat = 3
    private let cellHeight: CGFloat = 70
    private var totalCellHeight: CGFloat = 0
    
    override func prepare() {
        super.prepare()
        self.cacheAttributes = [:]
        
        guard let collectionView = self.collectionView,
            self.columnsCount != 0 else { return }
        
        let itemCount = collectionView.numberOfItems(inSection: 0)
        guard itemCount > 0,
            self.columnsCount != 0 else { return }

        let cellWidth = collectionView.bounds.width / self.columnsCount
        var lastY: CGFloat = 0
        var lastX: CGFloat = 0
        
        for index in 0 ..< itemCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(x: lastX, y: lastY, width: cellWidth, height: self.cellHeight)
            
            let isLastColumn = (index + 1) % Int(self.columnsCount) == 0 || index == (itemCount - 1)
            
            if isLastColumn {
                lastX = 0
                lastY += self.cellHeight
            } else {
                lastX += cellWidth
            }
            self.cacheAttributes[indexPath] = attributes
        }
        self.totalCellHeight = lastY
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.cacheAttributes.values.filter { rect.intersects($0.frame) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.bounds.width ?? 0, height: totalCellHeight)
    }
}
