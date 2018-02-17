//
//  ViewController.swift
//  UMP Cake
//
//  Created by DA SONG on 11/14/17.
//  Copyright © 2017 csci 4950. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    var stores:[Store] = []
    var return_id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.storePicker.delegate = self
        self.storePicker.dataSource = self
        
        getStores()
    }
    
    func getStores() {
        guard let url = URL(string: "http://localhost:8080/stores/") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let storeData = try JSONDecoder().decode([Store].self, from: data)
                
                DispatchQueue.main.async {
                    self.stores = storeData
                    self.storePicker.reloadAllComponents()
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
        return stores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stores[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Pass the store_id from this function to the next view to GET /stores/:store_id
        print(stores[row].name, stores[row].store_id)
        self.return_id = stores[row].store_id
        print(self.return_id)
    }
    
    @IBAction func leaveStorePage(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PreMakeCakeViewController = segue.destination as? PreMakeCakeViewController {
            PreMakeCakeViewController.chosen_store_id = self.return_id
        }
        print("store", return_id)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

