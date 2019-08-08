//
//  MonAnnotationView.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/8/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class MonAnnotationView: MKAnnotationView {
    
    //Ajout de variables pour afficher les détails à partir de MonAnnotationView
    var controller: ControllerAvecCarte?
    
    init(controller: ControllerAvecCarte, annotation: MKAnnotation?, reuseIdentifier: String?) {
        self.controller = controller
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupAnnotation()
    }
    
    var calanques: [Calanque] = []

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupAnnotation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAnnotation()
    }
    
    func setupAnnotation() {
        image = UIImage(named: "placeholder")
        canShowCallout = true
        
        leftCalloutAccessoryView = setupLeft()
        rightCalloutAccessoryView = setupRight()
        detailCalloutAccessoryView = setupCenter()
    }
    
    func setupLeft() -> UIButton {
        let button = UIButton(frame:  CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "distance"), for: .normal)
        
        //Ajout d'une action dans le button
        button.addTarget(self, action: #selector(gps), for: .touchUpInside)
        return button
    }
    
    func setupRight() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "detail"), for: .normal)
        
        //Ajout d'une action dans le button
        button.addTarget(self, action: #selector(detail), for: .touchUpInside)
        return button
    }
    
    func setupCenter() -> UIView? {
        //Vérification de l'exitence de l'image
        guard let anno = annotation as? MonAnnotation else { return nil }
        
        //Définition de la taille de la frame qui servira à afficher les images
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
        view.translatesAutoresizingMaskIntoConstraints = true
        view.widthAnchor.constraint(equalToConstant: 125).isActive = true
        view.heightAnchor.constraint(equalToConstant: 125).isActive = true
        
        //Affiche de l'image au centre
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = anno.calanque.image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        return view
    }
    
    
    @objc func detail() {
        guard let anno = annotation as? MonAnnotation else { return }
        //controller?.toDetail(calanque: anno.calanque)
        
        NotificationCenter.default.post(name: Notification.Name("detail"), object: anno.calanque)
    }
    
    @objc func gps(){
        
    }
}
