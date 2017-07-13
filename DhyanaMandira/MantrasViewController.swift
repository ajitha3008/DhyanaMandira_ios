//
//  MantrasViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class MantrasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var sectionHeaders:[String] = ["Shanti Mantra(Beginning)","Gurusthuti Mantra","Suryanamaskara Mantra","Surya Namaskara Phalashruti Mantra","Bhoo Namana Mantra","Pranayama mantra","Yoga mantra","Jyotir Mantra"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Mantras"
        tableView.tableFooterView =  UIView(frame: .zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LeftSideButtonTapped(_ sender: Any) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    var hidden:[Bool] = [true,true,true,true,true,true,true,true]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MantraMenuItem", for: indexPath) as! MantraTableViewCell
        if(indexPath.section==0) {
            
            let htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Sahanaa Vavatu;<br>Sahanau Bhunakthu;<br>Sahaveeryam Karavavahaihi;<br>Tejasvinava Dheetamastu;<br>Maa Vidvishavahaihi;<br>Aum Shanti Shanti Shanti Hi..!!<br><br><b>Meaning:</b><br>Om, May we all be protected;<br>May we all be nourished;<br>May we work together with<br>great energy;<br>May our intellect be sharpened<br>(may our study be effective);<br>Let there be no Animosity amongst us<br>Om, peace (in me), peace (in nature), peace (in divine forces)</font></body></html>"
            
            let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
            
            let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            
            cell.Content.attributedText = attributedString
        }
        if(indexPath.section==1) {
            let htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Gururbramha-Gururvishnuhu;<br>Gururdevo Maheshwarah;<br>Gurusakshaat Parabramha;<br>Tasmaishri Gurave Namaha…!!<br><br><b>Meaning:</b><br>The Guru is Brahma,<br>the Guru is Vishnu,<br>the Guru Deva is Maheswara (Shiva),<br>The Guru is Verily the Para-Brahman<br>(Supreme Brahman);<br>Salutations to that Guru.</font></body></html>"
            
            let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
            
            let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            
            cell.Content.attributedText = attributedString
        }
        if(indexPath.section==2) {
            cell.Content.text="Mantra:\n" + "Om. Hiranmayena Paatrena,\n" +
            "Satyasyapi Hitham Mukham;\n" +
            "Tatvam Pooshanna Pavrnu;\n" +
            "Satya Dharmaya Drusthaye;\n\n" + "Meaning:\n" +
            "“The Truth is concealed by the\n" +
            "golden vessel.\n" +
            "O Sun! Open the entrance to\n" +
            "that cover, so that the Truth\n" +
            "that is concealed by you is\n" +
            "visible to me, a truthful devotee,\n" +
            "by your illuminating Grace.\n\n"+"Mantra:\n" +
                    "Om dhyeya sada savitra\nmandala madhyavarti |\n" +
                    "Narayana sarasija\nsanasanni vishtah |\n" +
                    "Keyuravana makarakundala\nvana kiriti |\n" +
                    "Hari hiranmaya vapura\ndhritashankha chakrah ||\n" +
                    "\n" +
                    "Meaning:\n" +
                    "One should meditate on the\n" +
                    "form of Lord Narayana\n" +
                    "situated in the sun globe.\n" +
                    "He is seated on a lotus, with\n" +
                    "golden bracelets, crown,\n" +
                    "shark earrings; he is\n" +
                    "golden in complexion,\n" +
                    "and holds the shankha and\n" +
                "chakra in his hands.\n\n" + "Mantra & Meaning:\n\n" + "Om Hraam Mitraya Namaha;\n" +
                    "\tOne who is friendly to all.\n\n" +
                    "Om Hreem Ravaye Namaha;\n" +
                    "\tThe shining one, the radiant one.\n\n" +
                    "Om Hroom Suryaya Namaha;\n" +
                    "\tThe dispeller of darkness,\n" +
                    "\tresponsible for generating activity.\n\n" +
                    "Om Hraim Bhanave Namaha;\n" +
                    "\tOne who illuminates or the bright one.\n\n" +
                    "Om Hraum Khagaya Namaha;\n" +
                    "\tOne who is all pervading, one who moves\n\tthrough the sky.\n\n" +
                    "Om Hraha Pooshne Namaha;\n" +
                    "\tGiver of nourishment and fulfillment.\n\n" +
                    "Om Hraam Hiranya Garbhaaya Namaha;\n" +
                    "\tOne who has a golden colored brilliance.\n\n" +
                    "Om Hreem Mareechaye Namaha;\n" +
                    "\tGiver of light with infinite rays.\n\n" +
                    "Om Hroom Aadityaya Namaha;\n" +
                    "\tThe son of Aditi, the cosmic divine mother.\n\n" +
                    "Om Hraim Savitre Namaha;\n" +
                    "\tOne who is responsible for life.\n\n" +
                    "Om Hraum Arkaaya Namaha;\n" +
                    "\tOne who is worthy of praise and glory.\n\n" +
                    "Om Hraha Bhaskaraaya Namaha;\n" +
                "\tGiver of wisdom and cosmic illumination!!!"
        }
        if(indexPath.section==3) {
            cell.Content.text="Mantra:\n" +
                "Aadityasya Namaskaraan,\n" +
                "Ye Kurvanti Dine Dine,\n" +
                "Aayuh Pragnabalam Veeryam,\n" +
                "Tejastheshancha Jaayate…!!\n" +
                "Om Namo Bhagavate Suryanarayanaya;\n" +
                "Om Namo Bhagavate Suryanarayanaya;\n" +
                "Om Namo Bhagavate Suryanarayanaya Namaha…!!\n" +
                "\n" +
                "Meaning:\n" +
                "It is said that the person who\n" +
                "does Surya Namaskar daily is\n" +
                "untouched by poverty for his\n" +
            "thousand lifetimes."
        }
        if(indexPath.section==4) {
            cell.Content.text="Mantra:\n" +
                "Samudra Vasane Devi,\n" +
                "Parvatasthana Mandele,\n" +
                "Vishnu Patni Namsthubhyam,\n" +
                "Paadasparsham Kshamasvame..!!\n" +
                "\n" +
                "Meaning:\n" +
                "(Oh Mother Earth) The Devi Who\n" +
                "is having Ocean as Her Garments\n" +
                "and Mountains as Her Bosom,\n" +
                "Who is the Consort of Sri Vishnu,\n" +
                "I Bow to You; Please Forgive me\n" +
            "for Touching You with my Feet."
        }
        if(indexPath.section==5) {
            cell.Content.text="Mantra:\n" +
                "Praanasyedam Vashessarvam;\n" +
                "Tridiveyat Pratisthitam; Maateva Putran\n" +
                "Rakshaswa;\n" +
                "Shreescha Prajnanscha Videhi Na Itihi..!\n" +
                "Om Shanti Shanti Shanti Hi…!!\n" +
                "\n" +
                "Meaning:\n" +
                "Whatever is there\n" +
                "on all the three places\n" +
                "(earth, space & heaven),\n" +
                "is all controlled by Prana,\n" +
                "the Life Force. O Prana, protect us, as the mother\n" +
                "protects the child. Please give us the wealth\n" +
            "& the intellect."
        }
        if(indexPath.section==6) {
            cell.Content.text="Mantra:\n" +
                "Yogena Chithasya Padenavacha\n" +
                "Malam Shareerasya Cha Vaidyakenam\n" +
                "Yopakarotham Pravarammuneena\n" +
                "Pathanjalim Pranjalirana Thosmin\n" +
                "Abahu Purushakaram\n" +
                "Shanku Chakra Sidharinum\n" +
                "Sahasra Shirasum Shwetham\n" +
                "Pranamami Pathanjali\n" +
                "\n" +
                "Meaning:\n" +
                "I bow with folded hands to Patanjali,\n" +
                "the greatest of sages, who removed\n" +
                "the impurity of mind by his work on Yoga,\n" +
                "the impurity of speech by his work on\n" +
                "grammar and the impurity of body\n" +
            "by his work on medicine."
        }
        if(indexPath.section==7) {
            cell.Content.text="Mantra:\n" +
                "Asato ma sadgamaya\n" +
                "tamasoma jyotir gamaya\n" +
                "mrityormāamritam gamaya\n" +
                "Aum shanti shanti shantihi\n" +
                "\n" +
                "Meaning:\n" +
                "From ignorance, lead me to truth;\n" +
                "From darkness, lead me to light;\n" +
                "From death, lead me to immortality\n" +
            "Om peace, peace, peace"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor(rgb: 0xff9933)
        label.textAlignment = .left
        label.textColor = UIColor(rgb: 0x000000)
        label.text = "< "+sectionHeaders[section]
        label.tag = section
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(MantrasViewController.tapFunction))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        
        return label
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        let section = sender.view!.tag
        let indexPaths = (0..<1).map { i in return IndexPath(item: i, section: section)  }
        
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
            return 1
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
