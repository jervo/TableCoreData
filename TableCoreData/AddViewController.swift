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
  
  @IBAction func SaveInfo(_ sender: Any) {
    print("Save data to CoreData")
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
