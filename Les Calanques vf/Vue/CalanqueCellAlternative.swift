//
//  CalanqueCellAlternative.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/7/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class CalanqueCellAlternative: UITableViewCell {

    
    @IBOutlet weak var calanqueIV: UIImageView!
    @IBOutlet weak var nomLabel: UILabel!
    
    var calanque: Calanque? {
        didSet {
            if calanque != nil {
                calanqueIV.image = calanque!.image
                nomLabel.text = calanque!.nom
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
