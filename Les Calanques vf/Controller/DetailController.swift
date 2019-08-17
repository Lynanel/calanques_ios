//
//  DetailController.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/7/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var calanqueIV: UIImageView!
    @IBOutlet weak var nomEtDesc: UITextView!
    var calanqueRecue: Calanque?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let calanque = calanqueRecue else { return }
        calanqueIV.image = calanque.image
        
        let mutable = NSMutableAttributedString(string: calanque.nom + "\n \n", attributes: [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 18)
            ])
        
        mutable.append(NSAttributedString(
            string: calanque.desc,
            attributes: [
                .font: UIFont.systemFont(ofSize: 28),
                .foregroundColor: UIColor.darkGray
            ]))
        
        nomEtDesc.attributedText = mutable
        nomEtDesc.textAlignment = .center
    }
}
