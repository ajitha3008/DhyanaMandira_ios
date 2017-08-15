//
//  MantrasViewController.swift
//  DhyanaMandira
//
//  Created by AjithaYasmin on 06/07/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit

class MantrasViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var sectionHeaders:[String] = ["Shanti Mantra(Beginning)","Gurusthuti Mantra","Suryanamaskara Mantra","Surya Namaskara Phalashruti Mantra","Bhoo Namana Mantra","Pranayama mantra","Yoga mantra","Jyotir Mantra"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Mantras"
        tableView.tableFooterView =  UIView(frame: .zero)
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0)//top,left,bottom,right
        //self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        self.setupLeftMenuButton()
        self.addShadow(baseView: tableView)
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
        var htmlString = ""
        if(indexPath.section==0) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Sahanaa Vavatu;<br>Sahanau Bhunakthu;<br>Sahaveeryam Karavavahaihi;<br>Tejasvinava Dheetamastu;<br>Maa Vidvishavahaihi;<br>Aum Shanti Shanti Shanti Hi..!!<br><br><b>Meaning:</b><br>Om, May we all be protected;<br>May we all be nourished;<br>May we work together with<br>great energy;<br>May our intellect be sharpened<br>(may our study be effective);<br>Let there be no Animosity amongst us<br>Om, peace (in me), peace (in nature), peace (in divine forces)</font></body></html>"
        }
        if(indexPath.section==1) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Gururbramha-Gururvishnuhu;<br>Gururdevo Maheshwarah;<br>Gurusakshaat Parabramha;<br>Tasmaishri Gurave Namaha…!!<br><br><b>Meaning:</b><br>The Guru is Brahma,<br>the Guru is Vishnu,<br>the Guru Deva is Maheswara (Shiva),<br>The Guru is Verily the Para-Brahman<br>(Supreme Brahman);<br>Salutations to that Guru.</font></body></html>"
        }
        if(indexPath.section==2) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Om. Hiranmayena Paatrena,<br>Satyasyapi Hitham Mukham;<br>Tatvam Pooshanna Pavrnu;<br>Satya Dharmaya Drusthaye.<br><br><b>Meaning:</b><br>The Truth is concealed by the<br>golden vessel.O Sun! Open the entrance to that cover, so that the Truth that is concealed by you is visible to me, a truthful devotee,by your illuminating Grace.<br><br><b>Mantra:</b><br>Om dhyeya sada savitra\nmandala madhyavarti;<br>Narayana sarasijasana sanni vishtah<br>Keyuravana makarakundala vana kiriti<br>Hari hiranmaya vapura dhritashankha chakrah<br><br><b>Meaning:</b><br>One should meditate on the form of Lord Narayana situated in the sun globe. He is seated on a lotus, with golden bracelets, crown, shark earrings; he is golden in complexion,and holds the shankha and chakra in his hands.<br><br><b>Mantra & Meaning:</b><br><br>Om Hraam Mitraya Namaha;<br>One who is friendly to all.<br><br>Om Hreem Ravaye Namaha;<br>The shining one, the radiant one.<br><br>Om Hroom Suryaya Namaha;<br>The dispeller of darkness responsible for generating activity.<br><br>Om Hraim Bhanave Namaha;<br>One who illuminates or the bright one.<br><br>Om Hraum Khagaya Namaha;<br>One who is all pervading, one who moves through the sky.<br><br>Om Hraha Pooshne Namaha;<br>Giver of nourishment and fulfillment.<br><br>Om Hraam Hiranya Garbhaaya Namaha;<br>One who has a golden colored brilliance.<br><br>Om Hreem Mareechaye Namaha;<br>Giver of light with infinite rays.<br><br>Om Hroom Aadityaya Namaha;<br>The son of Aditi, the cosmic divine mother.<br><br>Om Hraim Savitre Namaha;<br>One who is responsible for life.<br><br>Om Hraum Arkaaya Namaha;<br>One who is worthy of praise and glory.<br><br>Om Hraha Bhaskaraaya Namaha;<br>Giver of wisdom and cosmic illumination!!!</font></body></html>"
        }
        if(indexPath.section==3) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Aadityasya Namaskaraan,<br>Ye Kurvanti Dine Dine,<br>Aayuh Pragnabalam Veeryam,<br>Tejastheshancha Jaayate…!!<br>Om Namo Bhagavate Suryanarayanaya;<br>Om Namo Bhagavate Suryanarayanaya;<br>Om Namo Bhagavate Suryanarayanaya Namaha…!!<br><br><b>Meaning:</b><br>It is said that the person who does Surya Namaskar daily is untouched by poverty for his thousand lifetimes.</font></body></html>"

        }
        if(indexPath.section==4) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Samudra Vasane Devi,<br>Parvatasthana Mandele,<br>Vishnu Patni Namsthubhyam,<br>Paadasparsham Kshamasvame..!!<br><br><b>Meaning:</b><br>(Oh Mother Earth) The Devi Who is having Ocean as Her Garments and Mountains as Her Bosom, Who is the Consort of Sri Vishnu, I Bow to You; Please Forgive me for Touching You with my Feet.</font></body></html>"
        }
        if(indexPath.section==5) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Praanasyedam Vashessarvam;<br>Tridiveyat Pratisthitam;<br>Maateva Putran Rakshaswa;<br>Shreescha Prajnanscha Videhi Na Itihi..!<br>Om Shanti Shanti Shanti Hi…!<br><br><b>Meaning:</b><br>Whatever is there on all the three places(earth, space & heaven), is all controlled by Prana, the Life Force. O Prana, protect us, as the mother protects the child. Please give us the wealth & the intellect.</font></body></html>"
        }
        if(indexPath.section==6) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Yogena Chithasya, Padenavacha,<br>Malam Shareerasya Cha Vaidyakenam<br>Yopakarotham Pravarammuneena<br>Pathanjalim Pranjalirana Thosmin<br>Abahu Purushakaram<br>Shanku Chakra Sidharinum<br>Sahasra Shirasum Shwetham<br>Pranamami Pathanjali<br><br><b>Meaning:</b><br>I bow with folded hands to Patanjali, the greatest of sages, who removed the impurity of mind by his work on Yoga, the impurity of speech by his work on grammar and the impurity of body by his work on medicine.</font></body></html>"
        }
        if(indexPath.section==7) {
            htmlString = "<html><body style=\"text-align:justify;font-size:18px\"><b>Mantra:</b><br>Asato ma sadgamaya<br>tamasoma jyotir gamaya<br>mrityormāamritam gamaya<br>Aum shanti shanti shantihi!!<br><br><b>Meaning:</b><br>From ignorance, lead me to truth; From darkness, lead me to light; From death, lead me to immortality, Om peace, peace, peace!</font></body></html>"
        }
        
        let htmlData = NSString(string: htmlString).data(using: String.Encoding.unicode.rawValue)
        
        let attributedString = try! NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        
        cell.Content.attributedText = attributedString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        headerView.backgroundColor = UIColor(rgb: 0xff9933)
        let label = UILabel(frame: CGRect(x: 70, y: 0, width: tableView.frame.size.width, height: 50))
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        label.textColor = UIColor(rgb: 0x000000)
        label.text = sectionHeaders[section]
        label.tag = section
        label.font = UIFont.boldSystemFont(ofSize: 14)
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(MantrasViewController.tapFunction))
        headerView.tag = section;
        label.isUserInteractionEnabled = true
        headerView.addGestureRecognizer(tap)
        headerView.addSubview(label)
        let icon = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        icon.image = UIImage(named: "ic_action_aum_mantra_symbol");
        icon.contentMode = UIViewContentMode.scaleAspectFit
        
        headerView.addSubview(icon)
        return headerView
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
