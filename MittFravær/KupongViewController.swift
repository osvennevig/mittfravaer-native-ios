//
//  KupongViewController.swift
//  MittFravær
//
//  Created by Ole Svennevig on 23/01/2019.
//  Copyright © 2019 kvitér. All rights reserved.
//
import UIKit
struct jsonstruct:Decodable {
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let subregion:String
    let image: String
    
    
}
class KupongViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableview: UITableView!
    
    var arrdata = [jsonstruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
        
    }
    
    
    
    func getdata(){
        let url = URL(string: "https://xn--mittfravr-n3a.no/alpha/testjson")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for _ in self.arrdata{
                    //print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                }
                }
                
            }catch{
                print("Error in get json data")
            }
            
            }.resume()
    }
    
    
    //TableView
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblname.text = "Tilbud: \(arrdata[indexPath.row].name)"
        cell.lblcapital.text = "\(arrdata[indexPath.row].capital)"
        
        cell.reloadInputViews()
        
        if let imageURL = URL(string: arrdata[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                    }
                }
            }
        }
        
        return cell
    }
    

    
    
    
}

