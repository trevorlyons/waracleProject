//
//  ViewController.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import UIKit

class CakeVC: UIViewController, ErrorHandler {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [Cake]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(cell: CakeCell.self)
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 50, right: 0)
        tableView.separatorStyle = .none
        
        getCakes()
    }
    
    private func getCakes() {
        CakeService.getCakes { (result) in
            switch result {
            case let .success(cakes):
                DispatchQueue.main.async {
                    self.data = cakes
                }
                
            case let .failure(error):
                self.handleError(error)
            }
        }
    }
}

extension CakeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cell: CakeCell.self, indexPath: indexPath)
        let current = data[indexPath.row]
        
        cell.tag = indexPath.row
        cell.configureCell(with: current)
        return cell
    }
}
