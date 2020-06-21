//
//  ViewController.swift
//  calculator B
//
//  Created by ahmed mahmoud on 28.05.20.
//  Copyright © 2020 Mohamed Eltaher. All rights reserved.
//

import UIKit
enum modes {
    case notSet
    case addition
    case subtraction
    case muliplication
    case division
}
class ViewController: UIViewController {
    //defual value ((will use this code in clear button ))
    @IBOutlet weak var label1: UILabel!
    var labelstring = "0"
    var savenum = 0
    var lastbuttonpressedwasmode = false
    var currentmode :modes = .notSet
   
    
    func updatetext (){
        guard let labelint = Int(labelstring)  else {
            label1.text = "error"
            return
        }
        if currentmode == .notSet {
            savenum = labelint
        }
        let formatter: NumberFormatter = NumberFormatter()
               formatter.numberStyle = .decimal
               let num: NSNumber = NSNumber(value: labelint)
               
               label1.text = formatter.string(from: num)
    }
    func changemode (mode : modes){
        currentmode = mode
        lastbuttonpressedwasmode = true
    }
    
    @IBAction func equal(_ sender: Any) {
        
        
        
        
        
        labelstring = "0"
              savenum = 0
              lastbuttonpressedwasmode = false
              currentmode = .notSet

    }
    @IBAction func addition(_ sender: Any) {
        changemode(mode: .addition)
    }
    @IBAction func division(_ sender: Any) {
        changemode(mode: .division)
    }
    @IBAction func subtraction(_ sender: Any) {
        changemode(mode: .subtraction)
    }
    @IBAction func muliblcation(_ sender: Any) {
        changemode(mode: .muliplication)
    }
    @IBAction func clearbutton(_ sender: Any) {
       labelstring = "0"
       savenum = 0
       lastbuttonpressedwasmode = false
       currentmode = .notSet
        
    }
    
    @IBAction func didpressbutton(_ sender: UIButton) {
        guard let anothervalue : String = sender.titleLabel?.text
            else {
                label1.text = "error"
                return   }
        if lastbuttonpressedwasmode == true {
            lastbuttonpressedwasmode = false
            labelstring = " 0"
        }
        labelstring = labelstring.appending(anothervalue)
        updatetext()
}

}
