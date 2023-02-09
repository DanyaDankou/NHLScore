//
//  TeamDetailsViewController.swift
//  NHLScore
//
//  Created by comp on 4.02.23.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var team: Team?
    
    // MARK: - UI Elements
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let rosterButton = UIButton(type: .system)
    private let calendarButton = UIButton(type: .system)
    private let otherParametersButton = UIButton(type: .system)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }
    
    // MARK: - Configuration
    
    @IBAction func handleButtonTap(_ sender: UIButton) {
      switch sender.titleLabel?.text {
        case "Roster":
          // code to show roster information
          break
        case "Calendar":
          // code to show calendar information
          break
        default:
          // code to show other team information
          break
      }
    }

    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = team?.name
        
        rosterButton.setTitle("Roster", for: .normal)
        calendarButton.setTitle("Calendar", for: .normal)
        otherParametersButton.setTitle("Other Parameters", for: .normal)
        
        [rosterButton, calendarButton, otherParametersButton].forEach { button in
            button.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
        }
    }
    
    private func configureLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [rosterButton, calendarButton, otherParametersButton].forEach(contentView.addSubview)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let buttonsStackView = UIStackView(arrangedSubviews: [rosterButton, calendarButton, otherParametersButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 16
        
        contentView.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints

}
}

