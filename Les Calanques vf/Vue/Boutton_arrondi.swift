//
//  Boutton_arrondi.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/7/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class Boutton_arrondi: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        layer.cornerRadius = 15
    }
}
