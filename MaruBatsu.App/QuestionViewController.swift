//
//  QuestionViewController.swift
//  MaruBatsu.App
//
//  Created by user on 2023/09/04.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var addQFeild: UITextField!
    
    @IBOutlet weak var answerSelect: UISegmentedControl!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
                        questions = userDefaults.object(forKey: "add") as! [String]
            
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
}

    
