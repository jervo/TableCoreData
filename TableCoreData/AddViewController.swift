//
//  AddViewController.swift
//  TableCoreData
//
//  Created by Jervis Thompson on 3/5/18.
//  Copyright © 2018 Jervis Thompson. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

  @IBOutlet weak var inputName: UITextField!
  @IBOutlet weak var inputFavorite: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func SaveInfo(_ sender: UIButton) {
    print("Save data to CoreData")
    
    // Link context to persistentContainer
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // link personObj to entity Person
    let personObj = Person(context: context)
    
    // Update atrributes with entity
    personObj.firstName = inputName.text
    personObj.favorite = inputFavorite.text
    
    // Save to Context back to CoreData
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    // Pop this view controller
    let _ = navigationController?.popViewController(animated: true)
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
