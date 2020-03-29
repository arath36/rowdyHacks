//
//  HomeViewController.swift
//  SinkTimer
//
//  Created by Austin Rath on 3/28/20.
//  Copyright © 2020 Austin Rath. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var commercialButton: UIButton!
    
    @IBOutlet weak var houseHoldButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commercialButton.layer.cornerRadius = 35
        houseHoldButton.layer.cornerRadius = 35

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}