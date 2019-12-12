//
//  ViewController.swift
//  RockTheVote
//
//  Created by Casiano, Cameron Joseph on 12/12/19.
//  Copyright © 2019 Casiano, Cameron Joseph. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    var vote = [Vote]()
    
    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func songReference(_ sender: Any) {
    }
    
    @IBAction func likeAction(_ sender: UIButton) {
        var allowLike = false
        
        if songTextField.text!.isEmpty || nameTextField.text!.isEmpty{
            allowLike = false
        } else {
            allowLike = true
        }
        
        if allowLike == true{
            
        }
    }
    
    
    @IBAction func dislikeAction(_ sender: UIButton) {
    }
}

