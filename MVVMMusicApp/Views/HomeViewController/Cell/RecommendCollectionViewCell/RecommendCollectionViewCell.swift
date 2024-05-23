//
//  RecommendCollectionViewCell.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendCollectionViewCell"

    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var subLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupContent(data : RecommendModel){
        imageViewOutlet.loadWebImage(from: data.imageUrl)
        labelOutlet.text = data.name
        subLabelOutlet.text = data.subName
    }
}
