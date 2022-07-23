//
//  LeaguesTableViewCell.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 22/07/22.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {
    @IBOutlet weak var LeaguesLabel: UILabel!
    @IBOutlet weak var vistaContenedora: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
