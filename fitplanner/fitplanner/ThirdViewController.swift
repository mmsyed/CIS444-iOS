//
//  ThirdViewController.swift
//  fitplanner
//
//  Created by Mo Syed on 5/1/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var meatlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //var age = Int()
    var age: Int = 0 {
        didSet{
        }
    }
    var height = Int()
    var weight = Int()
    var gender = String()
    var act = String()
    var name = String()
    var goal = String()
    
    
    @IBOutlet weak var mealpref: UIPickerView!
    @IBOutlet weak var exerselect: UIPickerView!
    
    @IBAction func check(_ sender: Any) {
        //print(aa.agg)
    //print(SecondViewController.GlobalVariable.myString)
        print(name,age,height,weight,gender,goal,act, selectedmeat, selectedexer)
    }
    
    var selectedmeat = String()
    var selectedexer = String()


    
    let meatoptions = ["", "1. Chicken", "2. Beef", "3. Fish"]
    let exer = ["", "1. Cardio", "2. Cardio & weights", "3. weights"]
    
    
    func numberOfComponents(in Mealselect: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return meatoptions[row] }
        else {
                return exer[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if pickerView.tag == 1 {
            return meatoptions.count }
           else {
            return exer.count
            }
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           // Meatlabel.text = activityoptions[row]
        
        selectedmeat = meatoptions[row]
        selectedexer = exer[row]
        }
    


    @IBAction func resultspage(_ sender: Any) {
            performSegue(withIdentifier: "fourth", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var fourth = segue.destination as! FourthViewController
    fourth.age = age
    fourth.name = name
    fourth.height = height
    fourth.weight = weight
    fourth.act = act
    fourth.goal = goal
    fourth.gender = gender
    fourth.selectedmeat = selectedmeat
    fourth.selectedexer = selectedexer
}

}
