//
//  FourthViewController.swift
//  fitplanner
//
//  Created by Mo Syed on 5/1/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    var height = Int()
    var weight = Int()
    var gender = String()
    var act = String()
    var name = String()
    var goal = String()
    var age = Int()
    var selectedmeat = String()
    var selectedexer = String()
    
    let food1 = ["Chicken and rice : 550",
                 "Chicken and pasta : 600",
                 "Chicken baked : 350",
                 "Chicken sandwich : 280",
                 "Chicken baked : 250",
                 "chicken salad : 300",
                 "chicken parmeasan : 560",
                 "Chicken grilled : 320" ]
    
    let food2 = [
        "2.Beef and rice' : 700",
        "1.Beef and pasta' : 850",
        "3.Beef baked' : 650",
        "4.Beef sandwich' : 400",
        "5.Beef salad' : 250",
        "6.Beef  parmeasan' : 700",
        "7.Beef  grilled' : '350",
        "8. Beef burger' : '490"
    ]
    
    let food3 = [
        "1.Fish and rice : 480",
        "2.Fish and pasta :600",
        "3.Fish baked : 550",
        "4.Fish sandwich : 450",
        "5.Fish salad : 290",
        "6.Fish & cheese : 400",
        "7.Fish grilled : 350",
        "8. Fish n chips : 5000"
    ]
    
    @IBAction func resultspage(_ sender: Any) {
        performSegue(withIdentifier: "fifth", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         var fifth = segue.destination as! fifthViewController
        fifth.selectedexer = selectedexer
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if (selectedmeat.hasPrefix("1")) {
            return food1.count
        }
            else if (selectedmeat.hasPrefix("2")) {
            return food2.count
            }
            else {
            return food3.count
            }
    }
//        else {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle, reuseIdentifier: "cell")
        let cell1 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        if (selectedmeat.hasPrefix("1")) {
            cell1.textLabel?.text = food1[indexPath.row]        }
        else if (selectedmeat.hasPrefix("2")) {
cell1.textLabel?.text = food2[indexPath.row]        }
        else {
cell1.textLabel?.text = food3[indexPath.row]        }
        
     return cell1
    }
    

    @IBOutlet weak var tdeeout: UILabel!
    @IBOutlet weak var goalsout: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tdeeout.text = String(tdeecalculate(age: age, gender: gender, height: height, weight: weight, act: act))
        goalsout.text = String(goalcals(calstdee: (tdeecalculate(age: age, gender: gender, height: height, weight: weight, act: act)), goal: goal))
        
    }
    
   
    
    @IBAction func check(_ sender: Any) {
        print(name,age,height,weight,gender,goal,act, selectedmeat, selectedexer)
    }
    
    
    
    func tdeecalculate(age:Int, gender:String, height:Int, weight:Int, act:String) -> Double {
        var bmr1 = Double()
        var bmr2 = Double()
        var bmr = Double()
        var tdee = 0.0
        var activitylevelvalue = 0.0
        if (gender.lowercased().hasPrefix("male")) {
            bmr1 = ((Double(height) * 6.25) + (Double(weight) * 9.9))
            bmr2 = (bmr1 - (Double(age) * 4.92)) + 5
            bmr = bmr2
         if (act.hasPrefix("1")){
         activitylevelvalue = 1.2 }
         else if (act.hasPrefix("2")) {
         activitylevelvalue = 1.375 }
         else if (act.hasPrefix("3")){
         activitylevelvalue = 1.55 }
         else {
         activitylevelvalue = 1.725 }
         }
        
         else {
       // bmr = (((height * 6.25) + (weight * 9.9)) - (age * 4.92) - 161)
         bmr1 = ((Double(height) * 6.25) + (Double(weight) * 9.9))
         bmr2 = ((bmr1 - (Double(age) * 4.92)) - 161)
            bmr = bmr2
            
            if (act.hasPrefix("1")){
         activitylevelvalue = 1.1}
         else if (act.hasPrefix("2")){
         activitylevelvalue = 1.275 }
         else if (act.hasPrefix("3")){
         activitylevelvalue = 1.35}
        else{
         activitylevelvalue = 1.725 }
         }
         
        tdee = bmr * activitylevelvalue
        return tdee
    }
    
    func goalcals(calstdee:Double, goal:String) -> Double {
        var goalcals = Double()
        if ((goal.hasPrefix("1"))){
            goalcals = calstdee
        }
        if ((goal.hasPrefix("2"))) {
            goalcals = calstdee + 200
        }
        if ((goal.hasPrefix("3"))) {
            goalcals = calstdee - 300
    }
        return goalcals

    }
    
    
    
}

