//
//  MatchFixtureCell.swift
//  Api_DynamicPract
//
//  Created by Selas Moro on 09/05/23.
//

import UIKit

class MatchFixtureCell: UITableViewCell {

    @IBOutlet weak var TeamImg1: UIImageView!
    @IBOutlet weak var TeamImg2: UIImageView!
    @IBOutlet weak var MatchResult: UILabel!
    @IBOutlet weak var VenueNmae: UILabel!
    @IBOutlet weak var TeamName2: UILabel!
    @IBOutlet weak var TeamName1: UILabel!
    
    @IBOutlet weak var CompletedBtn: UIButton!
    
    @IBOutlet weak var date: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func CompleteBtn(_ sender: Any) {
        
        
        
        
        
    }
    
    
    
    func configurecell(data: Api1) {
        guard let teamhome = data.matchdetail?.teamHome
        else { return }
        guard let teamaway = data.matchdetail?.teamAway
        else { return }
        DispatchQueue.main.async {
            self.TeamName1.text = data.teams?[teamaway]?.nameFull
            self.TeamName2.text = data.teams?[teamhome]?.nameFull
            
            self.MatchResult.text = data.matchdetail?.result
            self.VenueNmae.text = data.matchdetail?.venue?.name
            //self.date.text = data.matchdetail?.match?.league
            
        }
        
    }

    
}
