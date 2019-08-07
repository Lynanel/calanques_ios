//
//  ControllerAvecCarte.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/7/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var calanques: [Calanque] = CalanqueCollection().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addAnnotations() {
        for calanque in calanques {
            /*let annotation = MKPointAnnotation()
            annotation.coordinate = calanque.coordonnee
            annotation.title = calanque.nom
            mapView.addAnnotation(annotation)*/
            
            let annotation = MonAnnotation(calanque)
            mapView.addAnnotation(annotation as! MKAnnotation)
        }
    }

    @IBAction func getPosition(_ sender: Any) {
        
    }
    
    @IBAction func segementedChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = MKMapType.standard
        case 1: mapView.mapType = MKMapType.satellite
        case 2: mapView.mapType = MKMapType.hybrid
        default: break
        }
    }
}
