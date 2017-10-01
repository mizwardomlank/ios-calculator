//
//  ViewController.swift
//  ios-calculator
//
//  Created by Miftah Mizwar on 10/1/17.
//  Copyright © 2017 Miftah Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var isFirst:Bool = true
    var performingMath:Bool = false
    var operation = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        // resize font
        self.fontResizer()
        
        if (performingMath){
            resultLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
            performingMath = false
        }
        else {
            if (isFirst && sender.tag != 1){
                // clear zero number when first
                resultLabel.text = ""
                isFirst = false
                
                resultLabel.text = resultLabel.text! + String(sender.tag - 1)
                numberOnScreen = Double(resultLabel.text!)!
            } else if (!isFirst){
                resultLabel.text = resultLabel.text! + String(sender.tag - 1)
                numberOnScreen = Double(resultLabel.text!)!
            }
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
      
        if (resultLabel.text != ""){
            if (sender.tag != 11 && sender.tag != 16){
                previousNumber = Double(resultLabel.text!)!
            }
            if (sender.tag == 11){
                // it's 'C' button
                resultLabel.text = "0"
                self.isFirst = true
            } else if (sender.tag == 12){
                // it's '/' button
                resultLabel.text = "/"
            } else if (sender.tag == 13){
                // it's 'x' button
                resultLabel.text = "x"
            } else if (sender.tag == 14){
                // it's '-' button
                resultLabel.text = "-"
            } else if (sender.tag == 15){
                // it's '+' button
                resultLabel.text = "+"
            } else if (sender.tag == 16){
                // it's '=' button
                if (operation == 12){
                    // divide
                    resultLabel.text = String(previousNumber / numberOnScreen)
                }else if (operation == 13){
                    // multiple
                    resultLabel.text = String(previousNumber * numberOnScreen)
                }else if (operation == 14){
                    // minus
                    resultLabel.text = String(previousNumber - numberOnScreen)
                }else if (operation == 15){
                    // add
                    resultLabel.text = String(previousNumber + numberOnScreen)
                }
            }
            
            performingMath = true
            isFirst = true
            operation = sender.tag
        }
        
        // resize font
        self.fontResizer()
    }
    
    func fontResizer (){
        if (resultLabel.text!.count > 6) {
            resultLabel.font = resultLabel.font.withSize(30)
        }else {
            resultLabel.font = resultLabel.font.withSize(70)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

