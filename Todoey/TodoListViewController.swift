//
//  ViewController.swift
//  Todoey
//
//  Created by Mariusz Materek on 07/07/2018.
//  Copyright © 2018 Mariusz Materek. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Kupic mleko", "Nakarmic dziecie", "Umyc zeby"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK: Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on the UIAlert
            //print(textField.text)
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
            
        }
        
//        let actionCancel = UIAlertAction(title: "Cancel", style: .default) { (actionCancel) in
//            //what will happen once the user clicks the Cancel button on the UIAlert
//        }
    
        alert.addTextField { (alertTextField) in
            
            //this code is executed when the alertTextField is created in the UIAlert. NOT when the Add Item button is preseed.
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        //alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

