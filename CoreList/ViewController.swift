//
//  ViewController.swift
//  CoreList
//
//  Created by Jeanie House on 2/24/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//


// Labwork:
// - make the cell show the created date
// - change the color of cell background based on time since creation [green,yellow,red]
// - add fetch predicate & sortdescriptor to order based on creation date..oldest first longest time since created should be first
// - make background grey and text white if completed
// - tap cell to toggle completed

// - bonus create 2 sections [noncompleted, completed]  2 different fetches, return two different arrays

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var itemNameField: UITextField!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    @IBAction func saveItem(sender: AnyObject) {
        
        //save item to core data
        let applicationDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var postObject = NSEntityDescription.insertNewObjectForEntityForName("Items", inManagedObjectContext: applicationDelegate.managedObjectContext!) as NSManagedObject
        
        postObject.setValue(itemNameField.text, forKey: "name")
        postObject.setValue(NSDate(), forKey: "created")
        postObject.setValue(false, forKey: "completed")
        
        
    
        
        applicationDelegate.saveContext()
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    @IBAction func cancelItem(sender: AnyObject) {
        
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

