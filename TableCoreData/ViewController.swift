//
//  ViewController.swift
//  TableCoreData
//
//  Created by Jervis Thompson on 3/5/18.
//  Copyright © 2018 Jervis Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  // Link context to persistentContainer
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  var peopleArray: [People] = []
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return peopleArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myCell = tableView.dequeueReusableCell(withIdentifier: "proCell", for: indexPath)
    
    let onePerson = peopleArray[indexPath.row]
    
    myCell.textLabel?.text = onePerson.firstName
    myCell.detailTextLabel?.text = onePerson.favorite
    
    return myCell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getData()
    // Reload table view
    tableView.reloadData()
  }
  
  func getData() {
    // Read People Entity into peopleArray
    do {
      peopleArray = try context.fetch(People.fetchRequest())
      print("People Entity Fetching Successfull")
    }
    catch {
      print("People Entity Fetching Failed")
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      print("Delete row.. " + String(indexPath.row))
      // extract person from array
      let onePerson = peopleArray[indexPath.row]
      // Delete that person from context
      context.delete(onePerson)
      // Save context back to CoreData
      (UIApplication.shared.delegate as! AppDelegate).saveContext()
      // get fresh data
      getData()
      // Reload table view
      tableView.reloadData()
    }
  }
  
  var selRowNum:Int = 0
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Row selected " + indexPath.row.description)
    
    selRowNum = indexPath.row
    self.performSegue(withIdentifier: "showDetail", sender: nil)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
    if segue.identifier == "showDetail" {
      let detailObj = segue.destination as! DetailViewController
      detailObj.transRowNum = selRowNum
    }
  }
}


