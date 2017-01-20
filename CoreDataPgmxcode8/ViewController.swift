//
//  ViewController.swift
//  CoreDataPgmxcode8
//
//  Created by Paramswar on 10/01/17.
//  Copyright © 2017 MTPL. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBAction func btnSavAction(_ sender: Any)
    {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entity(forEntityName: "CourseDetails",
                                                 in:managedContext)
        let device = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        
        var arrList = NSArray()
        arrList = ["params","params1","params2","params3","params4","params5"]
        print(arrList);
        let data = NSKeyedArchiver.archivedData(withRootObject: arrList)
        let strUser = "9940794794"

        if ((entity) != nil)
        {
            do
            {
                device.setValue(data, forKey: "content")
                device.setValue(strUser, forKey: "userid")
                try managedContext.save()
            }
            catch let error as NSError
            {
                print("Could not save \(error), \(error.userInfo)")
            }

        }
        else
        {
            print("Already Exists")

        }
        
        
       
    }
    @IBAction func btnDispAction(_ sender: Any)
    {
         self.getDisVal()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    
    
    func getDisVal()
    {
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CourseDetails")
        let resultPredicate = NSPredicate(format: "(userid = %@)", "9940794794")
        fetchRequest.predicate = resultPredicate
       
        do {
            let records = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for record in records
            {
                print(record.value(forKey: "userid") as! NSString)
                let data = (record.value(forKey: "content") as! NSData)
                let arrList = NSKeyedUnarchiver.unarchiveObject(with: data as Data)!
                print(arrList);
                
            }
            
        } catch {
            let saveError = error as NSError
            print("\(saveError), \(saveError.userInfo)")
        }
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        guard (UIApplication.shared.delegate as? AppDelegate) != nil else{
            return
        }
    }

    func beginProcess()   {
        print("Begin Process");
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

