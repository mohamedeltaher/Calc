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
    var savedNum = 0
    var lastbuttonpressedwasmode = false
    var currentmode :modes = .notSet
   
    
    func updateText() {
           guard let labelInt: Int = Int(labelstring) else {
               label1.text = "Error"
               return
           }
           
           if currentmode == .notSet {
               savedNum = labelInt
           }
           
          let formatter: NumberFormatter = NumberFormatter()
                 formatter.numberStyle = .decimal
                 let num: NSNumber = NSNumber(value: labelInt)
                 
                 label1.text = formatter.string(from: num)
       }
    func changemode (mode : modes){
        currentmode = mode
        lastbuttonpressedwasmode = true
    }
    
    @IBAction func equal(_ sender: Any) {
        guard let labelint: Int = Int(labelstring) else {
                   label1.text = "Error"
                   return
               }
               if currentmode == .notSet || lastbuttonpressedwasmode {
                   return
               }
               
               if currentmode == .addition {
                   savedNum += labelint
               } else if currentmode == .subtraction {
                   savedNum -= labelint
               }else if currentmode == .division {
                savedNum /= labelint }
               else if currentmode == .muliplication {
                savedNum *= labelint }
        
        currentmode = .notSet
        labelstring = "\(savedNum) "
        updateText()
        lastbuttonpressedwasmode = false

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
       savedNum = 0
       lastbuttonpressedwasmode = false
       currentmode = .notSet
        
    }
    
    @IBAction func didpressnumber(_ sender: UIButton) {
       guard let stringValue: String = sender.titleLabel?.text else {
                  label1.text = "Error"
                  return
              }
              
              if lastbuttonpressedwasmode {
                  lastbuttonpressedwasmode = false
                  labelstring = "0"
              }
              
              labelstring = labelstring.appending(stringValue)
              updateText()
}

}
