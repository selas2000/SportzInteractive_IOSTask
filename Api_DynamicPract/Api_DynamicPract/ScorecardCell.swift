//
//  ScorecardCell.swift
//  Api_DynamicPract
//
//  Created by Selas Moro on 11/05/23.
//

import UIKit

class ScorecardCell: UITableViewCell {

    

    @IBOutlet weak var ScorecardTeams: UISegmentedControl!
    @IBOutlet weak var PlayerScorecard: UITableView!
    
    var dataArray : Api1?
    
    
    //variables
//    var IndiaIng = []
//    var NZIng = []
//    var Innings = []
    override func awakeFromNib() {
        super.awakeFromNib()
        PlayerScorecard.dataSource = self
        PlayerScorecard.delegate = self
        PlayerScorecard.reloadData()
        // Initialization code
        let nib = UINib(nibName: "PlayerScoreCell", bundle: nil)
       // TableView.register(nib, forCellWithReuseIdentifier: "MatchFixtureCell")
        PlayerScorecard.register(nib, forCellReuseIdentifier: "PlayerScoreCell")
        print(dataArray)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func TeamScorecard(_ sender: UISegmentedControl) {
        
        if ScorecardTeams.selectedSegmentIndex == 0 {
            PlayerScorecard.backgroundColor = .systemRed
            
        } else {
            PlayerScorecard.backgroundColor = .blue
        }
        
        switch sender.selectedSegmentIndex {
        case 0 :
            DispatchQueue.main.async{
                
                self.PlayerScorecard.reloadData()
            }
        case 1 :
            DispatchQueue.main.async{
                self.PlayerScorecard.reloadData()
            }

        default:
            break
        }
    }
    
}

extension ScorecardCell: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerScoreCell", for: indexPath) as! PlayerScoreCell
       // cell.configurecell(data: )
        return cell
    }
}
