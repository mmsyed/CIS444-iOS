//
//  SecondViewController.swift
//  fitplanner
//
//  Created by Mo Syed on 5/1/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var goal: UILabel!
    @IBOutlet weak var activity: UILabel!
    
    @IBOutlet weak var output: UITextField!
    
    @IBAction func checks(_ sender: Any) {
        output.text =  name.text
        UserDefaults.standard.set(name.text, forKey: "myname")
        name.text = ""
    }
    
    var savu: String = "" {
        didSet{
        }
    }
    
    @IBAction func savedusers(_ sender: Any) {
        if let x = UserDefaults.standard.object(forKey: "name1") as? String {
            savu += " \(x)"
            
        }
        
        if let x = UserDefaults.standard.object(forKey: "age1") as? String {
            savu += " \(x)"
        }
        
        if let x = UserDefaults.standard.object(forKey: "height1") as? String {
            savu += " \(x)"
        }
        
        if let x = UserDefaults.standard.object(forKey: "weight1") as? String {
            savu += " \(x)"
        }
        
        if let x = UserDefaults.standard.object(forKey: "gender1") as? String {
            savu += " \(x)"
        }
        print(savu)
        createAlert(title: "Saved user info:", message: savu)
        
    }
  
    
    var variableName: Int = 2
    var h: Int = 0 {
        didSet{
        }
        
    }
    
    var w: Int = 0 {
        didSet{
        }
    }
   
    var a: Int = 0 {
            didSet{
            }
        }

    var g: String = "" {
        didSet{
        }
    }
    
    var n: String = "" {
        didSet{
        }
    }
    
    var usergoal = String()
    
    var useract = String()
    

    struct GlobalVariable{
        //   h = Int(height.text!) ?? 0
        static var myString = "mdma"
        static var agg = 0
    }
    
    
    func store() -> Int {
        h = Int(height.text!) ?? 0
        w = Int(weight.text!) ?? 0
        a = Int(age.text!) ?? 0
        g = (gender.text!)
        n = (name.text!)
        
        return a
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        h = Int(height.text!) ?? 0
//        w = Int(weight.text!) ?? 0
//        a = Int(age.text!) ?? 0
//        g = (gender.text!)
//        n = (name.text!)
//        useract = (activity.text!)
//        usergoal = goal.text!
        //store()
    }
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myname") as? String {
                }
    }
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("Back")
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }

    
    
    @IBOutlet weak var mealselect: UIPickerView!
    @IBOutlet weak var activitylevel: UIPickerView!

    let goaloptions = ["", "1. Gain weight", "2. Maintain Weight", "3. Lose weight"]
    
    let activityoptions = ["", "1. Sedentary", "2. Lightly Active", "3. Moderately Active", "4. Very Active"]
    
    
    func numberOfComponents(in Mealselect: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return goaloptions[row] }
        else {
            return activityoptions[row]
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return goaloptions.count }
        else {
            return activityoptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            //goal.text = goaloptions[row]
            usergoal = goaloptions[row]
        }
        else {
           // activity.text = activityoptions[row]
            useract = activityoptions[row]
        }
    }
    
    @IBAction func next(_ sender: Any) {
        store();
        print(a, n)
        performSegue(withIdentifier: "next", sender: self)
        
        UserDefaults.standard.set(name.text, forKey: "name1")
        UserDefaults.standard.set(age.text, forKey: "age1")
        UserDefaults.standard.set(weight.text, forKey: "weight1")
        UserDefaults.standard.set(height.text, forKey: "height1")
        
        UserDefaults.standard.set(gender.text, forKey: "gender1")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var third = segue.destination as! ThirdViewController
        third.age = Int(age.text!) ?? 0
        third.name = (name.text!)
        third.height = Int(height.text!) ?? 0
        third.weight = Int(weight.text!) ?? 0
        third.act = useract
        third.goal = usergoal
        third.gender = (gender.text!)
    }
    

    
}
