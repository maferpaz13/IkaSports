//
//  TeamsTableViewCell.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contenedoraView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var TeamNameLabel: UILabel!
    @IBOutlet weak var EstadiumLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
