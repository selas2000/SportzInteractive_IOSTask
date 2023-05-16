//
//  PlayerScoreCell.swift
//  Api_DynamicPract
//
//  Created by Selas Moro on 11/05/23.
//

import UIKit

class PlayerScoreCell: UITableViewCell {

    @IBOutlet weak var Runs: UILabel!
    
    @IBOutlet weak var Batsman: UILabel!
    
    @IBOutlet weak var Howout: UILabel!
    @IBOutlet weak var StrikeRate: UILabel!
    @IBOutlet weak var Balls: UILabel!
    
    
    var dataArray = [Api1]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        debugPrint(dataArray)
    }

    
    
    
    func configurecell(data: Api1) {
//        guard let firstInnings = data.innings?[0].batsmen?[0].batsman
//        else { return }
//        guard let secoundInnings = data.matchdetail?.teamAway
//        else { return }
        DispatchQueue.main.async {
            self.Howout.text = data.innings?[0].batsmen?[0].howout
            self.Batsman.text = data.innings?[0].batsmen?[0].batsman
            self.Runs.text = data.innings?[0].batsmen?[0].runs
            self.StrikeRate.text = data.innings?[0].batsmen?[0].strikerate
            self.Balls.text = data.innings?[0].batsmen?[0].balls
            //self.date.text = data.matchdetail?.match?.league
            print(data.innings?[0].batsmen?[0].howout)
            print(data.innings?[0].batsmen?[0].batsman)
        }
        
    }
}
