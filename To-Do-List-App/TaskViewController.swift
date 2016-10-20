//
//  TaskViewController.swift
//  To-Do-List-App
//
//  Created by Milan Saxena on 10/17/16.
//  Copyright © 2016 Milan Saxena. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var stats: UILabel!
    @IBOutlet var cancel: UIButton!

    @IBOutlet var text: UITextField!
    @IBOutlet var task: UITextField!
    @IBOutlet var complete: UITextField!
    var numComplete: Int = 0
    var numInComplete: Int = 0
    var rightIndex: Int = 0
    var array: [CellTableViewCell] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if numComplete + numInComplete != 0 {
        stats.text = "Stats: " + "\(Double(numComplete)/Double(numInComplete + numComplete))"
        } else {
            stats.text = "Stats: 0"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func goToTable(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToTable", sender: sender)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToTable" {
            let vc = segue.destination as! TaskTableViewController
            vc.setDataSource(element: task.text ?? "")
            vc.setComplete(element: complete.text ?? "")
            vc.setC(elem: numComplete)
            vc.setInc(elem: numInComplete)
            vc.setRightIndex(num: rightIndex+1)
            
            //vc.setCount(num: 1)
            
        }
    }
    
    @IBAction func goBack(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "table", sender: sender)
    }
    func setRight(elem: Int) {
        rightIndex = elem
    }
    
    func setComp(elem: Int) {
        numComplete = elem
    }
    
    func setInComp(elem: Int) {
        numInComplete = elem
    }
    
//    func createArray() -> CellTableViewCell {
//        let cell =
//    }
   

}
