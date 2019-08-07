//
//  CalanqueCell.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/7/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class CalanqueCell: UITableViewCell {
    
    var calanque: Calanque!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell (_ calanque: Calanque) {
        self.calanque = calanque
       /* ContainerView.layer.cornerRadius = 20
        ContainerView.backgroundColor = UIColor.lightGray
        nomLabel.text = self.calanque.nom
        calanqueIV.image = self.calanque.image*/
    }

}
