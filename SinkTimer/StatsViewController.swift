//
//  StatsViewController.swift
//  SinkTimer
//
//  Created by Austin Rath on 3/29/20.
//  Copyright © 2020 Austin Rath. All rights reserved.
//

import UIKit
import UICircularProgressRing
import Firebase


class StatsViewController: UIViewController {
    
    // DISREGARD VARIABLE NAMES ON RING
    
    @IBOutlet weak var ring1: UICircularProgressRing!
    
    @IBOutlet weak var ring2: UICircularProgressRing!
    
    @IBOutlet weak var ring3: UICircularProgressRing!
    
    @IBOutlet weak var ring4: UICircularProgressRing!
    
    var ref: DatabaseReference!
    var ring1Format = UICircularProgressRingFormatter()
    var ring2Format = UICircularProgressRingFormatter()
    
    var dateString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        /*
        otherFormat.valueIndicator = ""
        successfulRing.valueFormatter = otherFormat
        */
        // Do any additional setup after loading the view.
        ring1.resetProgress()
        ring2.resetProgress()
        ring3.resetProgress()
        ring4.resetProgress()
        
        ring1.maxValue = 20
        ring1Format.valueIndicator = ""
        ring1.valueFormatter = ring1Format
        
        ring2.maxValue = 20
        ring2Format.valueIndicator = "s"
        ring2.valueFormatter = ring2Format
        
        
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let snap = snapshot.value as! NSDictionary
            
            for (_, value) in snap {
                let subDic = value as! NSDictionary
                for (_, value2) in subDic {
                    let subDic2 = value2 as! NSDictionary
                    for (key, value3) in subDic2 {
                        if let key = key as? String {
                            if (key == self.dateString) {
                                // we found our data
                                if let arr = value3 as? [Int] {
                                    self.fillCircles(arr: arr)
                                } else {
                                    if let dic = value3 as? NSDictionary {
                                        var arr: [Int] = []
                                        for (_,value) in dic {
                                            arr.append(value as! Int)
                                        }
                                        self.fillCircles(arr: arr)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
        
    }
    
    func fillCircles(arr: [Int]) {
        ring1.startProgress(to: CGFloat(arr.count), duration: 2)
        
        var total = 0
        var unsuccessful:CGFloat = 0
        var successful:CGFloat = 0
        let count:CGFloat = CGFloat(arr.count)
        for integer in arr {
            total = total + integer
            if (integer >= 20) {
                successful =  successful + 1
            } else {
                unsuccessful = unsuccessful + 1
            }
        }
        
        ring2.startProgress(to: CGFloat(total/arr.count), duration: 2)
        
        ring3.startProgress(to: (successful*100/count), duration: 2)
        ring4.startProgress(to: (unsuccessful*100/count), duration: 2)
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
