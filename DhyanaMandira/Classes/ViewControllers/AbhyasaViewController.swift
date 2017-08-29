//
//  AbhyasaViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class AbhyasaViewController: BaseViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    struct Section {
        var name: String!
        var items: [String]!
        
        init(name: String, items: [String]) {
            self.name = name
            self.items =  items
        }
    }
    var sections = [Section(name:"Breathing methods",items:["Pooraka (inhalation)","Rechaka (exhalation)","Antar-Kumbhaka (holding the breath inside)","Bahya-Kumbhaka (holding the breath outside)"]),
                    Section(name:"Breathing exercises",items:["Udara Shwasa Kriya","Urah Shwasa Kriya","Greeva Shwasa Kriya","Poorna Shwasa Kriya","Maarjala Shwasa Kriya","Shwana Shwasa Kriya","Katishwasa Kriya"]),
                    Section(name:"Body joint exercises",items:["Hastha-Paada Anguli Chalane (Hands & Legs Fingers)","Paada Chalane & Bhramana (Ankle joints)","Jaanu sandhi Chalane & Bhramana (Knee joints)","Ooru Sandhi Chalane & Bhramana (Hip joints)","Kati Sandhi Chalane & Bhramana (Waist)","Skanda Sandhi Chalane & Bhramana (Shoulder joints)","Koorpra Sandhi Chalane & Bhramana (Elbow joints)","Manibandha Sandhi Chalane & Bhramana (Wrist joints)","Hasthanguli Sanchalana (Hands fingers fast exercises)","Greeva Sandhi Chalane & Bhramana (Neck)","Netha Chalane & Bhramana (Eyes)","Running exercises","Prasarita Paadotthanasana-Trikonasana-Hastha Parshwa Chalane (Backbone exercises)"]),
                    Section(name:"Categories of Asanas",items:["Sitting Asanas","Standing Asanas","Sleeping Asanas","Special Category Asanas","Forward bending Asanas","Backward bending Asanas","Twisting Asanas","Head down-Legs up Asanas"]),
                    Section(name:"Sitting Asanas",items:["Sukhasana","Dandasana","Paadangusta Dandasana","Paada Pashchimothanasana","Oordhwa Hastha Dandasana","Oordhwa Namaskarasana","BaddhangulyaDandasana","Upavista Konasana","Paadangusta Upavista Konasana","Suptha Paadangusta Upavista Konasana","Eka-Paada Paschimothanasana","Badha Konasana","Suptha Badhakonasana","Vajrasana","Adhomukha Vajransana","Ardha Makarasana","Padmasana","Tolasana-Lolasana","Simhasana","Uthita-Jaanu Shirshasana","Parivrutha-Jaanu Shirshasana","TrayangaMukha Pada Paschimothanasana"       ,"Poorna Veerasana","Suptha Veerasana","Baddhangulya Veerasana","Mandookasana","Krounchasana","Gomukhasana","Mareechasana","Bharadhwajasana","Ardha-Matseyndhrasana"]),
                    Section(name:"Standing Asanas",items:["Taadasana","Oordhwa-Hastha Taadasana","Baddhangulya Taadasana","Baddha-Hasta Taadasana","Baddha-Hasta Utthanasana","Utkatasana","Paadangusta Utthansana","Poorna Utthanasana","ArdhaChakrasana","Ardha Kati Chakrasana","Gomukhasana","Paschima-Namaskrarasana","Vrukshasana","Utthita-Trikonasana","Parivruttha Trikonasana","Utthita Parshwa Konasana","Parivruttha Paarshwa Konasana","Ardha Chandrasana","Veerabhadrasana","Parshwa Utthanasana","Prasarita Paadotthansana","Chatushpadasana"]),
                    Section(name:"Sleeping Asanas",items:["Suptha Taadasana","Hastha-Paadangustasana","Eka-Paada Halasana","Poorna Halasana","Sethu Bandhasana","Jathara Parivartansana","Anantasana","Chaturanga Dandasana","Oordhwa Mukha Dhanirasana","Adhomukha Dhanurasana","Matsyasana","Mayurasana","Hamsasana","Eka-Pada Halasana","Poorna Halasana","Parshwa Halasana","Vipareethakarani"]),
                    Section(name:"Special Asanas",items:["Shrishasana","Sarvangasana","Adhomukha Vrukdshasana","Bakasana","BhujaPeedasana","Parighasana","Ustrasana","Karna Peedasana"]),
                    Section(name:"Relaxation Asanas",items:["Sukhasana","Ardha-Makarasana","Poorna-Makarasana","Shashankasana","Ardha-Shavasana","Poorna-Shavasana"]),
                    Section(name:"Surya Namaskara Asanas",items:["Namaskarasana","Oordhwa Namaskarasana","Utthanasana","Ekapaada Prasaranasana","Adhomukha Shwanasana","Shadangasana","Astangaprani Padasana","Bhujangasana","Adhomukha Shwanasana","Ekapada Prasaranasana","Utthanasana","Oordhwa Namaskarasana","Namaskarasana"]),
                    Section(name:"Pranayama techniques",items:["Anuloma –Viloma","Aumkara Pranayama","Chandranuloma","Suryanuloma","Chandrabedhana","Suryabedhana","Naadishodhana","Bhastrika","Kapalabhati","Sheethali","Sheetkari","Sadantha","Bhramari"]),
                    Section(name:"Mudras",items:["Drona Mudra","Chin Mudra","Chinmaya Mudra","Adi Mudra","Akasha Mudra","Bramha Mudra","Bhairava Mudra","Mrugi Mudra","Shanmuga Mudra","Karna Mudra","Khechari Mudra","Bhoochari Mudra"]),
                    Section(name:"Saptha Chakras",items:["Mooladhara Chakra","Swasdisthana Chakra","Manipoora Chakra","Anahata Chakra","Vishuddhi Chakra","Jnana Chakra","Sahasrara Chakra"]),
                    Section(name:"Mantras",items:["Shanti Mantra","Gurusthuti Mantra","Surya Namaskrara Mantra","Surya Namaskara Phalashruti Mantra","Bhoo Namana Mantra","Yoga Mantra","Jyotir Mantra","Pranayama Mantra","Aikya Mantra","Ekatmata Stotra"])]
    
    /*var sectionHeaders:[String] = ["Breathing methods","Breathing exercises","Body joint exercises","Categories of Asanas","Sitting Asanas","Standing Asanas","Sleeping Asanas","Special Asanas","Relaxation Asanas","Surya Namaskara Asanas","Pranayama techniques","Mudras","Saptha Chakras","Mantras"]*/
    
    var hidden:[Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true,true]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Yogabhyasa Prakriyas"
        tableView.tableFooterView =  UIView(frame: .zero)
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0)//top,left,bottom,right
        tableView.reloadData()
        self.addShadow(baseView: tableView)
        self.setupLeftMenuButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func LeftSideButtonTapped(_ sender: Any) {
//        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AbhyasaTableViewCell", for: indexPath) as! AbhyasaTableViewCell
        
        cell.Label.text = sections[indexPath.section].items[indexPath.row]
        let stringValue = String(describing: sections[indexPath.section].items[indexPath.row].characters.first!)
        cell.avatarInitials.text = stringValue
        cell.avatarImageView.backgroundColor = UIColor(rgb: 0xff9933)
        //cell.avatarImageView.layer.borderWidth = 1
        cell.avatarImageView.layer.masksToBounds = false
        //cell.avatarImageView.layer.borderColor = UIColor(rgb: 0x000000).cgColor
        cell.avatarImageView.layer.cornerRadius = cell.avatarImageView.frame.height/2
        cell.avatarImageView.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        headerView.backgroundColor = UIColor(rgb: 0xff9933)
        let label = UILabel(frame: CGRect(x: 70, y: 0, width: tableView.frame.size.width, height: 50))
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.textColor = UIColor(rgb: 0x000000)
        label.text = sections[section].name
        label.tag = section
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MantrasViewController.tapFunction))
        headerView.tag = section;
        label.isUserInteractionEnabled = true
        headerView.addGestureRecognizer(tap)
        headerView.addSubview(label)
        let icon = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        icon.image = UIImage(named: "ic_stat_keyboard_arrow_down");
        icon.contentMode = UIViewContentMode.scaleAspectFit
        
        headerView.addSubview(icon)
        return headerView

        
        
        /*let label = UILabel()
        label.backgroundColor = UIColor(rgb: 0xff9933)
        label.textAlignment = .left
        label.textColor = UIColor(rgb: 0x000000)
        label.text = "< "+sections[section].name
        label.tag = section
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MantrasViewController.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        
        return label*/
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        let section = sender.view!.tag
        let indexPaths = (0..<sections[section].items.count).map { i in return IndexPath(item: i, section: section)  }
        
        hidden[section] = !hidden[section]
        
        tableView?.beginUpdates()
        if hidden[section] {
            tableView?.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView?.insertRows(at: indexPaths, with: .fade)
        }
        tableView?.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hidden[section] {
            return 0
        } else {
            return sections[section].items.count
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
