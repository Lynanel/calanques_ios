//
//  ControllerAvecTableView.swift
//  Les Calanques vf
//
//  Created by TRAORE Lionel on 8/7/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class ControllerAvecTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var calanques: [Calanque] = []
    var CellId = "Alternative"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        calanques = CalanqueCollection().all()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calanques.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calanque = calanques[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellId) as? CalanqueCellAlternative {
            cell.calanque = calanque
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueId, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId, let vc = segue.destination as? DetailController {
            vc.calanqueRecue = sender as? Calanque
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            calanques.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        calanques = CalanqueCollection().all()
        tableView.reloadData()
    }
}
