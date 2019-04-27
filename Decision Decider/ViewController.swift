//
//  ViewController.swift
//  Decision Decider
//
//  Created by James Paul Mason on 2019-04-06.
//  Copyright © 2019 James Paul Mason. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    private var data: [String] = []
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Editing is about to begin")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Editing has begun")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Editing is about to end")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Editing has ended")
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return button pressed")
        
        data.append(choiceTextField.text!)
        print(choiceTextField.text!)
        tableView.reloadData()
        choiceTextField.text = ""
        
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        choiceTextField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBOutlet weak var choiceTextField: UITextField!
    @IBAction func decideButtonPressed(_ sender: Any) {
        print("Decide button pressed")
        
        let randomCellIndex = Int.random(in: 0 ..< data.count)
        let indexPath = IndexPath(row: randomCellIndex, section: 0)
        let cell = tableView(tableView, cellForRowAt: indexPath)
        
        print(randomCellIndex)
        print(indexPath)
        
        cell.backgroundColor = UIColor.green
        tableView.reloadData() // not working
        
        
        
    }
    
    @IBOutlet weak var tableView: UITableView!
}
