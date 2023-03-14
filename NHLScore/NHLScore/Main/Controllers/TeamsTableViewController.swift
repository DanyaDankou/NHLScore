//
//  TeamsTableViewController.swift
//  NHLScore
//
//  Created by comp on 28.01.23.
//

import UIKit
import Alamofire
import SwiftUI
import Combine


class TeamsTableViewController: UITableViewController {
    
    var teams = [Team]()
    var conferences = [Conference]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let teamsURL = getTeamsURL() else { return }

        NetworkingManager.shared.fetch (from: teamsURL, responseType: TeamsResponse.self) { result in
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
        let team = teams[indexPath.row]
        let teamLogoView = UIHostingController(rootView: TeamInfoView(teamInfo: team))
        navigationController?.pushViewController(teamLogoView, animated: true)
    }
}
