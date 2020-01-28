//
//  DogHomeTableViewCell.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import UIKit
import Nuke

class DogHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgDog: UIImageView!
    @IBOutlet weak var lblDogName: UILabel!
    @IBOutlet weak var lblDogDescription: UILabel!
    @IBOutlet weak var lblDogAge: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
        imgDog.layer.cornerRadius = 5
        lblDogName.textColor = UIColor.app(color: .black)
        lblDogDescription.textColor = UIColor.app(color: .gray)
        lblDogAge.textColor = UIColor.app(color: .black)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgDog.image = UIImage(named: "placeholder")
    }
    
    func configure(viewData: DogsHomeViewDataType) {
        
        lblDogName.text = viewData.name
        lblDogDescription.text = viewData.information
        lblDogAge.text = viewData.age
        
        if let imageURL = viewData.imageURL {
            Nuke.loadImage(with: imageURL,
                           options: ImageLoadingOptions(placeholder: UIImage(named: "placeholder"),
                                                        transition: .fadeIn(duration: 0.5)),
                           into: imgDog)
        }
    }
}
