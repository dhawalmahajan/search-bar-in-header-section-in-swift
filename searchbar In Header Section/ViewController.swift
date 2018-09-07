//
//  ViewController.swift
//  searchbar In Header Section
//
//  Created by Dhawal Mahajan on 07/09/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

struct NameData {
    var firstName : String
    var lastName : String
}

class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {

    @IBOutlet var tableView: UITableView!
    
    var arrayOfNames = [NameData]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registering tableview cell class with its cell identifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        setDataModelWithStaticData()
        setUpSearchBar()
       
    }

    private func setDataModelWithStaticData() {
        // Here we will set Static Data instead of parsing data here.
        arrayOfNames = [
            NameData(firstName: "Iron", lastName: "Man"),
            NameData(firstName: "Sherlock", lastName: "Holmes"),
            NameData(firstName: "Captain", lastName: "Marvel"),
            NameData(firstName: "Spider", lastName: "Man"),
            NameData(firstName: "Hawk", lastName: "Eye"),
            NameData(firstName: "Super", lastName: "Man"),
            NameData(firstName: "Black", lastName: "Widow"),
            NameData(firstName: "The Mighty", lastName: "Thor"),
            NameData(firstName: "Bat", lastName: "Man")
            
        ]
    }
    
    private func setUpSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchedText = searchController.searchBar.text else { return }
        if searchedText == "" {
            setDataModelWithStaticData()
        } else {
            setDataModelWithStaticData()
            arrayOfNames = arrayOfNames.filter({
                $0.firstName.contains(searchedText)
            })
                
        }
        tableView.reloadData()
    }
}
    
    


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrayOfNames[indexPath.row].firstName
        cell.detailTextLabel?.text = arrayOfNames[indexPath.row].lastName
        
        return cell
    }
    
}

