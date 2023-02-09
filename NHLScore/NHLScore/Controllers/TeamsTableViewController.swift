//
//  TeamsTableViewController.swift
//  NHLScore
//
//  Created by comp on 28.01.23.
//

import UIKit
import Alamofire


class TeamsTableViewController: UITableViewController {
    
    var teams = [Team]()
    var conferences = [Conference]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchTeams()
        NetworkingManager.fetch { [weak self] (result) in
                    guard let self = self else { return }
                    switch result {
                    case .success(let teamsResponse):
                        self.teams = teamsResponse.teams
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let team = teams[indexPath.row]
        cell.textLabel?.text = team.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showTeamDetails", sender: indexPath)
      }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showTeamDetails",
//          let destination = segue.destination as? TeamDetailsViewController,
//          let team = sender as? Team {
//            destination.team = team
//        }
//      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TeamDetailsViewController,
           let indexPath = sender as? IndexPath {
            let team = teams[indexPath.row]
            vc.team = team
        }
    }
}
