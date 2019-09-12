//
//  ViewController.swift
//  TopMovies
//
//  Created by camilo andres ibarra yepes on 9/12/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet var tableView: UITableView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewModel.fetchMovies {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    /*func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        
        configureCell(cell: cell, forRowAtIndexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.textLabel?.text = viewModel.titleForItemAtIndexPath(indexPath: indexPath)
        
    }


}

