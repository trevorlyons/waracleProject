//
//  TableView.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import Foundation

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T>(cell: T.Type, indexPath: IndexPath) -> T where T:UITableViewCell {
        let cellId = String(describing: cell)
        return self.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! T
    }
    
    func register(cell: UITableViewCell.Type) {
        let cellId = String(describing: cell)
        self.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
}
