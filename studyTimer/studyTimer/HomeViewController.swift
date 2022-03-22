//
//  HomeViewController.swift
//  studyTimer
//
//  Created by Jessica Inthasane on 3/21/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TaskSettingsViewControllerDelegate{
    
    var taskArray = [task]()
    
    @IBOutlet weak var TimeleftLabel: UILabel!
    @IBOutlet weak var TimeRemainingButton: UIButton!
    @IBOutlet weak var TaskLabel: UILabel!
    @IBOutlet weak var taskTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.dataSource = self
        taskTable.delegate = self
        // Do any additional setup after loading the view.
        self.taskTable.reloadData()
    }
    /*
     set up the task table view
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        cell.taskNameLabel.text = self.taskArray[indexPath.row].name
        return cell
    }
    /*
     get the task from the settings page
     */
    func retrieveTask(task: task) {
        taskArray.append(task)
        self.taskTable.reloadData()
    }
    /*
     segue to settings and timer views
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let viewControllerTS = segue.destination as? TaskSettingsViewController{
            viewControllerTS.delegate = self
        }
        if let timerController = segue.destination as? TimerViewController{
            timerController.seconds = taskArray[taskTable.indexPathForSelectedRow!.row].workDur
            print(timerController.seconds)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
