//
//  ViewController.swift
//  Network Call
//
//  Created by Field Employee on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView ( _ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell1", for: indexPath) as? myTableViewCell else { return UITableViewCell() }
        NetworkManager.shared.fetchImage{(image,id) in
            DispatchQueue.main.async {
                cell.myImage?.image = image
                cell.myLabel?.text = "ID: \(id ?? "0")"
            }
        }
//        cell.myLabel?.text = "Hi"
//        cell.myImage?.image = UIImage(named:"doggo.png")
        return cell
    }
    
    @IBAction func vuttonTap(_ sender: Any) {
//        NetworkManager.shared.fetchImage{[weak self] (image,id) in
//            guard let self = self else {return}
//            DispatchQueue.main.async {
//                self.imageView.image = image
//                self.myButton.setTitle("ID: \(id ?? "0")", for: .normal)
//            }
//        }
        self.myTableView.reloadData()
    }
}

