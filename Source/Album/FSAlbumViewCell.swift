//
//  FSAlbumViewCell.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 2015/11/14.
//  Copyright © 2015 Yummypets. All rights reserved.
//

import UIKit
import Stevia

class FSAlbumViewCell: UICollectionViewCell {
    
    var representedAssetIdentifier: String!
    let imageView = UIImageView()
    let durationLabel = UILabel()
    let selectionOverlay = UIView()
    
    
    let counterLabel = UILabel()
    let counterContainer = UIView()
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sv(
            imageView,
            durationLabel,
            selectionOverlay,
            counterContainer
        )
  
        counterContainer.sv(counterLabel)
  

        counterContainer.size(20)
        counterContainer.Top == self.contentView.Top + 8
        counterContainer-8-|
        counterContainer.layer.borderColor = UIColor.white.cgColor
        counterContainer.layer.borderWidth = 1
        counterContainer.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        counterContainer.layer.cornerRadius = 10
        
        counterLabel.CenterX == counterContainer.CenterX
        counterLabel.CenterY == counterContainer.CenterY
        counterLabel.font = UIFont(name: "Avenir-Roman", size: 13)!
        counterLabel.text = ""
        counterLabel.textColor = .white
        
        imageView.fillContainer()
        selectionOverlay.fillContainer()
        layout(
            durationLabel-5-|,
            5
        )
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        durationLabel.textColor = .white
        durationLabel.font = .systemFont(ofSize: 12)
        durationLabel.isHidden = true
        selectionOverlay.backgroundColor = .black
        selectionOverlay.alpha = 0
        backgroundColor = UIColor(r: 247, g: 247, b: 247)
    }
    
    func resetConuter() {
        counterContainer.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        counterLabel.text = ""
    }
    
    func setCounter(to value: Int) {
        let purpleColor = UIColor(red: 163.0 / 255.0, green: 132.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).withAlphaComponent(0.8)
        counterContainer.backgroundColor = purpleColor
        counterLabel.text = "\(value)"
    }

    override var isSelected: Bool {
        didSet { isHighlighted = isSelected }
    }
    
    override var isHighlighted: Bool {
        didSet {
            selectionOverlay.alpha = isHighlighted ? 0.5 : 0
        }
    }
}
