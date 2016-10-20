//
//  TaskTableViewController.swift
//  To-Do-List-App
//
//  Created by Milan Saxena on 10/16/16.
//  Copyright © 2016 Milan Saxena. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var count = 0
    var numComplete: Int = 0
    var numInComplete: Int = 0
    var rightIndex: Int = 0
    var complete: String = "Swipe Left To Delete"
    var dataSource: String = "Press Add to Add a Task"
    var numberOfTasks: Int = 16
    var cellIdentifiers: [String] = ["CellTableViewCell", "Hi", "Bye", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfTasks
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       //initializeArray()
        if count == rightIndex {
            let cellIdentifier = cellIdentifiers[0]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CellTableViewCell
        
            cell?.task?.text = dataSource
            cell?.complete?.text = complete
            if cell!.task == nil && cell!.complete == nil {
                cell!.task = UILabel(frame: CGRect(x: 15, y: 4, width: 34, height: 21))
                cell!.task.text = dataSource
                cell!.complete = UILabel(frame: CGRect(x: 15, y: 25, width: 44, height:15))
                cell!.complete.text = complete
            }
            count+=1
            //array[count] = cell!
            return cell!
        } else {
            let cellIdentifier = cellIdentifiers[count]
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CellTableViewCell
            cell!.task = UILabel(frame: CGRect(x: 15, y: 4, width: 34, height: 21))
            cell!.complete = UILabel(frame: CGRect(x: 15, y: 25, width: 44, height:15))
            cell!.task!.text = "Press add to add a task"
            cell!.complete!.text = "Swipe left to delete"
            count+=1
            //array[count] = cell!
            return cell!
        }
        
//        if count == rightIndex {
//            cell?.task?.text = dataSource
//            cell?.complete?.text = complete
//            
//            if cell?.task == nil {
//                cell!.task = UILabel(frame: CGRect(x: 15, y: 4, width: 34, height: 21)
//                )
//                cell!.task!.text = dataSource
//                
//            }
//            
//            if cell?.task == nil {
//                cell!.task = UILabel(frame: CGRect(x: 15, y: 4, width: 34, height: 21)
//                )
//                cell!.task!.text = dataSource
//                
//            }
//            
//            
//            if complete == "Complete" || complete == "complete" {
//                numComplete+=1
//            } else if complete == "Incomplete" || complete == "incomplete" {
//                
//                numInComplete+=1
//            }
//        }
        
        
            
        print(count)
        print("Right index: (\(rightIndex))")
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer) as? CellTableViewCell
//        cell?.task?.text = dataSource
//        cell?.complete?.text = complete
//        count+=1
        print(count)
        // Configure the cell...

    }
    
    
    func setCount(num: Int) {
        count += num
    }
    
    func setRightIndex(num: Int) {
        rightIndex = num
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goingTable" {
            let vc = segue.destination as! TaskViewController
            vc.setComp(elem: numComplete)
            vc.setInComp(elem: numInComplete)
            vc.setRight(elem: rightIndex)
        }
    }
    
    func setC(elem: Int) {
        numComplete = elem
    }
    
    func setInc(elem: Int) {
        numInComplete = elem
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    
    
    func setDataSource(element: String) {
        dataSource = element
    }

    func setComplete(element: String) {
        complete = element
    }

//    func setArray() -> CellTableViewCell {
//        let cellIdentifier = cellIdentifiers[0]
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CellTableViewCell
//        
//        cell?.task?.text = dataSource
//        cell?.complete?.text = complete
//        return cell!
//    }
//    
//    func initializeArray() {
//        let i = 0
//        while i < 16 {
//            array[i] = setArray()
//        }
//    }
//    
    
    
    
    func tapEdit(recognizer: UITapGestureRecognizer)  {
        if recognizer.state == UIGestureRecognizerState.ended {
            let tapLocation = recognizer.location(in: self.tableView)
            if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                if let tappedCell = self.tableView.cellForRow(at: tapIndexPath) as? CellTableViewCell {
                    //do what you want to cell here
                    
                    if tappedCell.complete.text == "Complete" {
                        tappedCell.complete.text = "Incomplete"
                        
                    } else {
                        tappedCell.complete.text = "Complete"
                    }
                }
            }
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
