//
//  PreMakeCakeViewController.swift
//  UMP Cake
//
//  Created by DA SONG on 1/31/18.
//  Copyright © 2018 csci 4950. All rights reserved.
//

import UIKit

class PreMakeCakeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var cakeLabel: UILabel!
    @IBOutlet weak var premakeCakeDropdownList: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    //var cakes = [Cake]()
    var chosen_store_id = 0

    var cakes = [Cake]()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        print(self.chosen_store_id)
    }
    
    func getCakes() {
        let link = "http://localhost:8080/cakes/byStore" + String(chosen_store_id)
        guard let url = URL(string: link) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let cakeData = try JSONDecoder().decode([Cake].self, from: data)
                DispatchQueue.main.async {
                    self.cakes = cakeData
                    self.premakeCakeDropdownList.reloadAllComponents()
                    print(self.cakes)
                }
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cakes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cakes[row].cake_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Pass the store_id from this function to the next view to GET /stores/:store_id
        print(cakes[row].cake_name, cakes[row].cake_id)
    }


        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
