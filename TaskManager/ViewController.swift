//
//  ViewController.swift
//  TaskManager
//
//  Created by Joao Paulo on 14/12/15.
//  Copyright © 2015 Joao Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addTask() {
        
        if taskNameTextField.text == "" {
            return
        }
        
        tasks.append(taskNameTextField.text!)
        taskNameTextField.text = ""
        taskNameTextField.resignFirstResponder()
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        configureCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task
    }
    
}

