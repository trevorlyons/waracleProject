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
        
        guard let url = URL(string: cake.image) else { return }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.cakeImageView.image = UIImage(data: data)
                }
            } catch {
                DispatchQueue.main.async {
                    self.cakeImageView.image = #imageLiteral(resourceName: "not-available")
                }
            }
        }
    }
}


