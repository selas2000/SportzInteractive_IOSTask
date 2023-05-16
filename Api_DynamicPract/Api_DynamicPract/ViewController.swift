//
//  ViewController.swift
//  Api_DynamicPract
//
//  Created by Selas Moro on 09/05/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var ScorecardBtn: UIButton!
    
   
    var dataArray = [Api1]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.delegate = self
        TableView.dataSource = self
        let nib = UINib(nibName: "MatchFixtureCell", bundle: nil)
       // TableView.register(nib, forCellWithReuseIdentifier: "MatchFixtureCell")
        TableView.register(nib, forCellReuseIdentifier: "MatchFixtureCell")
        
        // Step 6: Fetch the API data and parse it into the data array
        // Example using URLSession:
        let url = URL(string: "https://demo.sportz.io/nzin01312019187360.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let parsedData = try decoder.decode(Api1.self, from: data)
                    self.dataArray.append(parsedData)
                    print("data check",parsedData)
                    DispatchQueue.main.async {
                        self.TableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    @IBAction func clickedScorecardBtn(_ sender: Any) {
        
        let vc : NewController = NewController(nibName: "NewController", bundle: nil)
        vc.dataArray = self.dataArray
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
extension ViewController: UITableViewDelegate {
    // Step 7: Implement the UItableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchFixtureCell", for: indexPath) as! MatchFixtureCell
        
        
        let data = dataArray[indexPath.row]
        cell.configurecell(data: data)
        //        cell.SeriesName.text = dataArray[indexPath.item].matchdetail?.series?.name
        //        cell.subtitleLabel.text = data.subtitle
        //        cell.imageView.load(url: data.imageURL) // Load image from URL using an extension method or library
        return cell
    }
}
