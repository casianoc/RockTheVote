//
//  NewTableViewController.swift
//  RockTheVote
//
//  Created by Casiano, Cameron Joseph on 12/12/19.
//  Copyright © 2019 Casiano, Cameron Joseph. All rights reserved.
//

import UIKit
import CoreData

class NewTableViewController: UITableViewController {

    // context used to access Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var votes = [Vote] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadMyVotes()
        self.tableView.rowHeight = 84.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToViewController"{
            _ = segue.destination as? ViewController
        }
    }
    
    @IBAction func goToViewController(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToViewController", sender: nil)
    }
    
    // fetch shopping lists from core data
    func loadMyVotes(){
        
        // create an instance of a fetch request so that shopping lists can be fetched from core data
        let request: NSFetchRequest<Vote> = Vote.fetchRequest()
        
        do {
            // use context to execute fetch request to fetch ShoppingLists from Core Data store the fethed ShoppingLists in our array
            votes = try context.fetch(request)
        } catch {
            print("Error fetching Votes from Core Data!")
        }
        
        //reloading the fetched data in the table view controller
        tableView.reloadData()
    }
    
    // saves lists to core data
    func saveMyVotes(){
        do {
            try context.save()
        } catch {
            print("Error saving Votes to Core Data")
        }
        
        // reload the data in the Table View Controller
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return votes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VotesCell", for: indexPath)

        // Configure the cell...
        let voteArray = votes[indexPath.row]
        cell.textLabel?.text = voteArray.title!
        cell.detailTextLabel!.numberOfLines = 0
        cell.detailTextLabel?.text = "Voter: " + voteArray.voterName! + "\nLike? " + String(voteArray.vote)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
