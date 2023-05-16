//
//  FixtureScorecardCell.swift
//  Api_DynamicPract
//
//  Created by Selas Moro on 11/05/23.
//

import UIKit

class FixtureScorecardCell: UITableViewCell {

    
    @IBOutlet weak var venue: UILabel!
    
    @IBOutlet weak var result: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configurecell(data: Api1) {
        guard let teamhome = data.matchdetail?.teamHome
        else { return }
        guard let teamaway = data.matchdetail?.teamAway
        else { return }
        DispatchQueue.main.async {
            
            self.result.text = data.matchdetail?.result
            self.venue.text = data.matchdetail?.venue?.name
            //self.date.text = data.matchdetail?.match?.league
            
        }
        
    }
}
