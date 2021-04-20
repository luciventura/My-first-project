//
//  ViewController.swift
//  Project1
//
//  Created by Luciene Ventura on 24/03/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String] ()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets a title and a right bar button on the navigation controller
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share App", style: .plain, target: self, action: #selector(shareApp))
        
        //finds the images in the system and stores them in the pictures array
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
            
        }
        
        //shows the pictures in sorted order
        pictures.sort()
    }
    
    //function that tells our right bar button what it needs to do
    @objc func shareApp () {
        //as the app was not published, it doesn't have an URL, so I included the URL from the challenge
        guard  let url = URL(string: "https://www.hackingwithswift.com/100/22") else {
            return
        }
        let shareAppVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        present(shareAppVC, animated: true)
    }
    
    //function that tells our table view how many rows per section it should show
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
   
    //function that tells our table view to reuse its rows
    //we use the identifier we declared on the storyboard
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    //function that connects our table view to the Detail View Controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //again we use the identifier declared on the storyboard
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures [indexPath.row]
            
            //this instance bellow helsp us to say how many pictures there are 
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPicture = pictures.count
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

