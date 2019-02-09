//
//  ViewController.swift
//  CalculatorIOSBootCampPA1
//
//  Created by Thomas James Stuart on 2/3/19.
//  Copyright © 2019 Thomas James Stuart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // TEXT FIELDS
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var peopleLabel: UILabel!
    
    //LABELS
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    //Selectors
    @IBOutlet weak var tipSelector: UISegmentedControl!

    //Sliders
    @IBOutlet weak var splitBillSlider: UISlider!
    
    //Image Views
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var icon4: UIImageView!
    @IBOutlet weak var icon5: UIImageView!
    @IBOutlet weak var icon6: UIImageView!
    @IBOutlet weak var icon7: UIImageView!
    @IBOutlet weak var icon8: UIImageView!
    @IBOutlet weak var icon9: UIImageView!
    @IBOutlet weak var icon10: UIImageView!
    
    var billAmount = 0.00
    var tipPercentage = 0.15 // set the tipPercentage to the suggested minimum amount
    let segTipArr = [0.15, 0.18, 0.20]
    var tip = 0.00
    
    /**
     viewDidLoad() loads items to screen before the user can view it.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Closes the keyboard when the user taps anywhere outside of the box.
    @IBAction func onTap(_ sender: Any) {
      view.endEditing(true)
    }
    
    //Whenever the user changes the "Bill Amount", this method fires/exectues
    @IBAction func calculateTipWhenUserEntersBill(_ sender: Any) {
     billAmount = Double(billField.text!) ?? 0 // ?? that means everything to the left of the question mark, if it isnt
       
        tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f",tip ) //.2 means we want 2 decimal points after
        totalLabel.text = String(format: "$%.2f",total )
    }
    
    
    @IBAction func selectorChangedValue(_ sender: Any) {
    // Selector tip amount
    tipPercentage = segTipArr[tipSelector.selectedSegmentIndex]
        tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f",tip ) //.2 means we want 2 decimal points after
        totalLabel.text = String(format: "$%.2f",total )
    }
    
    
    @IBAction func customTipChangedValue(_ sender: Any) {
      //Custom tip amount
      tipPercentage = Double(customTipField.text!) ?? 0
        
        if( tipPercentage >= 1){
          tipPercentage = tipPercentage/100
        }
        
        tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f",tip ) //.2 means we want 2 decimal points after
        totalLabel.text = String(format: "$%.2f",total )
    }
    
    
    
    @IBAction func splitBillCalculator(_ sender: Any) {
        var currentValue = Int(splitBillSlider.value)
        var denominator = Double(currentValue)
        
        toggleImageHelper(currentValue: currentValue)
        
        let total = (billAmount + tip)/denominator
        
        if(currentValue == 1){
          peopleLabel.text = String(currentValue) + " person"
        }
        else{
          peopleLabel.text = String(currentValue) + " ppl"
        }
        
        tipLabel.text = String(format: "$%.2f",tip ) //.2 means we want 2 decimal points after
        totalLabel.text = String(format: "$%.2f",total )
    }
    
    
    func toggleImageHelper( currentValue: Int){
        
        //Toggle on & off images
        if( currentValue >= 2){
            icon2.isHidden = false
        }
        else{
            icon2.isHidden = true
        }
        
        if( currentValue >= 3){
            icon3.isHidden = false
        }
        else{
            icon3.isHidden = true
        }
        
        if( currentValue >= 4){
            icon4.isHidden = false
        }
        else{
            icon4.isHidden = true
        }
        
        if( currentValue >= 5){
            icon5.isHidden = false
        }
        else{
            icon5.isHidden = true
        }
        
        if( currentValue >= 6){
            icon6.isHidden = false
        }
        else{
            icon6.isHidden = true
        }
        
        if( currentValue >= 7){
            icon7.isHidden = false
        }
        else{
            icon7.isHidden = true
        }
        
        if( currentValue >= 8){
            icon8.isHidden = false
        }
        else{
            icon8.isHidden = true
        }
        
        if( currentValue >= 9){
            icon9.isHidden = false
        }
        else{
            icon9.isHidden = true
        }
        
        if( currentValue >= 10){
            icon10.isHidden = false
        }
        else{
            icon10.isHidden = true
        }
        
    }
    
    
    @IBAction func heptaicFeedback(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
    
}//end of class

