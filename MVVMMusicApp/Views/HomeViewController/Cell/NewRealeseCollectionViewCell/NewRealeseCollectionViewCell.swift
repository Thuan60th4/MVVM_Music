//
//  NewRealeseCollectionViewCell.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.

import UIKit

class NewRealeseCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewRealeseCollectionViewCell"
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var subLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupContent(data : NewRealeaseModel){
        imageViewOutlet.loadWebImage(from: data.artworkURL)
        labelOutlet.text = data.name
        subLabelOutlet.text = data.artistName
    }
}
