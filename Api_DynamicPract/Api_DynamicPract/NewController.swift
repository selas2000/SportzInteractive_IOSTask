//
//  NewController.swift
//  Api_DynamicPract
//
//  Created by Selas Moro on 11/05/23.
//

import UIKit

class NewController: UIViewController {
    
    


    @IBOutlet weak var NewTableView: UITableView!
    
    var dataArray = [Api1]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NewTableView.delegate = self
        NewTableView.dataSource = self
        NewTableView.reloadData()
        let nib = UINib(nibName: "FixtureScorecardCell", bundle: nil)
       // TableView.register(nib, forCellWithReuseIdentifier: "MatchFixtureCell")
        NewTableView.register(nib, forCellReuseIdentifier: "FixtureScorecardCell")
        let nib2 = UINib(nibName: "ScorecardCell", bundle: nil)
       // TableView.register(nib, forCellWithReuseIdentifier: "MatchFixtureCell")
        NewTableView.register(nib2, forCellReuseIdentifier: "ScorecardCell")
        // Step 6: Fetch the API data and parse it into the data array
        // Example using URLSession:
        let url = URL(string: "https://demo.sportz.io/nzin01312019187360.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                debugPrint(data.description.utf8)
                do {
                    let decoder = JSONDecoder()
                    let parsedData = try decoder.decode(Api1.self, from: data)
                    self.dataArray.append(parsedData)
                    print("data check",parsedData)
                    DispatchQueue.main.async {
                        self.NewTableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
        
        
        
        
    }


}

extension NewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FixtureScorecardCell", for: indexPath) as! FixtureScorecardCell
            let data = dataArray[indexPath.row]
            cell.configurecell(data: data)
            //        cell.SeriesName.text = dataArray[indexPath.item].matchdetail?.series?.name
            //        cell.subtitleLabel.text = data.subtitle
            //        cell.imageView.load(url: data.imageURL) // Load image from URL using an extension method or library
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScorecardCell", for: indexPath) as! ScorecardCell
            let data = dataArray[indexPath.row].innings
           
            
//            let data = dataArray[indexPath.row]
//            cell.configurecell(data: data)
//            //        cell.SeriesName.text = dataArray[indexPath.item].matchdetail?.series?.name
//            //        cell.subtitleLabel.text = data.subtitle
//            //        cell.imageView.load(url: data.imageURL) // Load image from URL using an extension method or library
              return cell
        }
        
    }
    
    
    
}



extension NewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 400
        }
            else
        {
            return 600
        }
    }
    
    
}
