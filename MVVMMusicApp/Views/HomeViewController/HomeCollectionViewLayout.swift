//
//  HomeCollectionViewLayout.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import UIKit

class HomeCollectionViewLayout: UICollectionViewCompositionalLayout {

    init() {
        super.init { sectionIndex, _ in
            return HomeCollectionViewLayout.createSectionLayout(section: sectionIndex)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func createSectionLayout(section : Int) ->  NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let supplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(60)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)]
        
        switch section {
            case 0:

                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.9),
                        heightDimension: .absolute(250)),
                    subitem: item,
                    count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.boundarySupplementaryItems = supplementaryItems
                return section
                
            case 1:
                let verticalGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)),
                    subitem: item,
                    count: 2)
                verticalGroup.interItemSpacing = .fixed(10)
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.35),
                        heightDimension: .fractionalWidth(0.7)),
                    subitem: verticalGroup,
                    count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 20
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = supplementaryItems
                return section
                
            default:
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(75)),
                    subitem: item,
                    count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = supplementaryItems
                return section
        }
        
    }
}
