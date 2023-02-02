//
//  TeamsTableViewController.swift
//  NHLScore
//
//  Created by comp on 28.01.23.
//

import UIKit
import Alamofire
import SwiftyJSON

class TeamsTableViewController: UITableViewController {
    
    var teams = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTeams()
    }
    
    private func fetchTeams() {
        guard let teamsURL = getTeamsURL() else { return }
        
        AF.request(teamsURL).responseData { (response) in
            if let error = response.error {
                print(error.localizedDescription)
                return
            }
            guard let data = response.data else { return }
            
            do {
                let teamsResponse = try JSONDecoder().decode(TeamsResponse.self, from: data)
                self.teams = teamsResponse.teams
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonError {
                print(jsonError)
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
}
