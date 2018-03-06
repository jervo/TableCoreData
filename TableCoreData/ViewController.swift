//
//  ViewController.swift
//  TableCoreData
//
//  Created by Jervis Thompson on 3/5/18.
//  Copyright © 2018 Jervis Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  // Link context to persistentContainer
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  var peopleArray: [People] = []
  
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

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

// EXTENSIONS

extension ViewController: UITableViewDataSource {
  
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
}

