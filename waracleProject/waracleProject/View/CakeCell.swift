//
//  CakeCell.swift
//  waracleProject
//
//  Created by Trevor Lyons on 15/06/2019.
//

import UIKit

class CakeCell: UITableViewCell {

    @IBOutlet weak var cakeImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    public func configureCell(with cake: Cake) {
        titleLbl.text = cake.title
        descLbl.text = cake.desc
    }
}
