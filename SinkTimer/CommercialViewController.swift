//
//  CommercialViewController.swift
//  SinkTimer
//
//  Created by Austin Rath on 3/28/20.
//  Copyright © 2020 Austin Rath. All rights reserved.
//

import UIKit

class CommercialViewController: UIViewController {
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var datePickerField: UITextField!
    
    var date: Date?
    let datePicker = UIDatePicker()
    var formattedDateString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateButton.layer.cornerRadius = 35
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    
    func createDatePicker() {
         let toolbar = UIToolbar()
         toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        datePickerField.inputAccessoryView = toolbar
        datePickerField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        datePickerField.text = formatter.string(from: datePicker.date)
        let dateString = datePicker.date.description.components(separatedBy: " ")
        let dateWZero = dateString[0]
        let YDM = dateWZero.components(separatedBy: "-")
        let finalString = "\(String(describing: Int(YDM[0])!))-\(String(describing: Int(YDM[1])!))-\(String(describing: Int(YDM[2])!))"
        formattedDateString = finalString
        
        
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let statsVC = segue.destination as? StatsViewController {
            statsVC.dateString = self.formattedDateString
        }
    }

}
