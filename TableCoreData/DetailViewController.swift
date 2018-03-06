//
//  DetailViewController.swift
//  TableCoreData
//
//  Created by Jervis Thompson on 3/5/18.
//  Copyright © 2018 Jervis Thompson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detName: UILabel!
  @IBOutlet weak var detFavorite: UILabel!
  
  // Link context to persistentContainer
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  var peopleArray: [People] = []
  
  var transRowNum:Int?
  
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      if let tmpRowNum = transRowNum {
        // Read People Entity into peopleArray
        do {
          peopleArray = try context.fetch(People.fetchRequest())
          print("People Entity Fetching Successfull")
        }
        catch {
          print("People Entity Fetching Failed")
        }
        let onePerson = peopleArray[tmpRowNum]
        detName.text = onePerson.firstName
        detFavorite.text = onePerson.favorite
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
