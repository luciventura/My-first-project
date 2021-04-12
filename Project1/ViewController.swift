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
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share App", style: .plain, target: self, action: #selector(shareApp))
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
            
        }
        
        pictures.sort()
        print(pictures)
        
       
        
    }
    
    @objc func shareApp () {
        guard  let url = URL(string: "https://www.hackingwithswift.com/100/22") else {
            return
        }
        let shareAppVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        present(shareAppVC, animated: true)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
        
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures [indexPath.row]
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPicture = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    }

