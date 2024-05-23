//
//  PlaylistCollectionViewCell.swift
//  MVVMMusicApp
//
//  Created by Pham Minh Thuan on 23/05/2024.
//

import UIKit

class PlaylistCollectionViewCell: UICollectionViewCell {

    static let identifier = "PlaylistCollectionViewCell"
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var subLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addGradient()
        labelOutlet.layer.zPosition = 1
        subLabelOutlet.layer.zPosition = 1
    }
    
    func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        gradientLayer.frame = bounds
        contentView.layer.addSublayer(gradientLayer)
    }
    
    func setupContent(data : PlaylistModel){
        imageViewOutlet.loadWebImage(from: data.artworkURL)
        labelOutlet.text = data.name
    }

}
