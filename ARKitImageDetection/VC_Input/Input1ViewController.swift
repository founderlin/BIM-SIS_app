//
//  ViewController.swift
//  XML2tabview
//
//  Created by FounderCoder on 23.12.20.
//

import UIKit
import Foundation

class Input1ViewController: UIViewController, XMLParserDelegate, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    var qrText: String = ""
    
    @IBOutlet weak var refresh: UIButton!
    @IBOutlet weak var xmlTableView: UITableView!
    
    // damage intensity and extent
    @IBOutlet weak var DiValTextField: UITextField!
    @IBOutlet weak var DeValTextField: UITextField!
    
    @IBOutlet weak var deidLabel: UILabel!
    @IBOutlet weak var ogKeyLabel: UILabel!
    @IBOutlet weak var ogEnumIDLabel: UILabel!
    @IBOutlet weak var ogValueIDLabel: UILabel!
    @IBOutlet weak var ogKeyLabelDE: UILabel!
    @IBOutlet weak var ogEnumIDLabelDE: UILabel!
    @IBOutlet weak var ogValueIDLabelDE: UILabel!
    
    /// damage attribute
    // attribute 1
    @IBOutlet weak var ar1Key: UILabel!
    @IBOutlet weak var ar1En: UILabel!
    @IBOutlet weak var ar1Val: UILabel!
    @IBOutlet weak var ar1ValTextField: UITextField!
    
    // attribute 2
    @IBOutlet weak var ar2Key: UILabel!
    @IBOutlet weak var ar2En: UILabel!
    @IBOutlet weak var ar2Val: UILabel!
    @IBOutlet weak var ar2ValTextField: UITextField!
    
    // attribute3
    @IBOutlet weak var ar3Key: UILabel!
    @IBOutlet weak var ar3En: UILabel!
    @IBOutlet weak var ar3Val: UILabel!
    @IBOutlet weak var ar3ValTextField: UITextField!
    
    // attribute 4
    @IBOutlet weak var ar4Key: UILabel!
    @IBOutlet weak var ar4Dgt: UILabel!
    @IBOutlet weak var ar4Unt: UILabel!
    @IBOutlet weak var ar4DgtTextField: UITextField!
    @IBOutlet weak var ar4UntTextField: UITextField!
    
    // attribute 5
    @IBOutlet weak var ar5Key: UILabel!
    
    /// Cracks
    // attributes
    @IBOutlet weak var cAr1Key: UILabel!
    @IBOutlet weak var cAr1En: UILabel!
    @IBOutlet weak var cAr1EnTextField: UITextField!
    
    @IBOutlet weak var cAr2Key: UILabel!
    @IBOutlet weak var cAr2En: UILabel!
    @IBOutlet weak var cAr2EnTextField: UITextField!
    
    @IBOutlet weak var cAr3Key: UILabel!
    @IBOutlet weak var cAr3En: UILabel!
    @IBOutlet weak var cAr3EnTextField: UITextField!
    
    @IBOutlet weak var cAr4Key: UILabel!
    @IBOutlet weak var cAr4Dgt: UILabel!
    @IBOutlet weak var cAr4DgtTextField: UITextField!
    @IBOutlet weak var cAr4Unt: UILabel!
    @IBOutlet weak var cAr4UntTextField: UITextField!
    
    @IBOutlet weak var cAr5Key: UILabel!
    @IBOutlet weak var cAr5Dgt: UILabel!
    @IBOutlet weak var cAr5DgtTextField: UITextField!
    @IBOutlet weak var cAr5Unt: UILabel!
    @IBOutlet weak var cAr5UntTextField: UITextField!
    
    @IBOutlet weak var cAr6Key: UILabel!
    @IBOutlet weak var cAr6Dgt: UILabel!
    @IBOutlet weak var cAr6DgtTextField: UITextField!
    @IBOutlet weak var cAr6Unt: UILabel!
    @IBOutlet weak var cAr6UntTextField: UITextField!
    
    @IBOutlet weak var cAr7Key: UILabel!
    @IBOutlet weak var cAr7KeyTextField: UITextField!
    
    // subcategories
    @IBOutlet weak var sub1Id: UILabel!
    @IBOutlet weak var sub1CN: UILabel!
    @IBOutlet weak var sub1Key: UILabel!
    @IBOutlet weak var sub1KeyTextField: UITextField!
    
    @IBOutlet weak var sub2Id: UILabel!
    @IBOutlet weak var sub2CN: UILabel!
    @IBOutlet weak var sub2Key: UILabel!
    @IBOutlet weak var sub2KeyTextField: UITextField!
    
    @IBOutlet weak var sub3Id: UILabel!
    @IBOutlet weak var sub3CN: UILabel!
    @IBOutlet weak var sub3Key: UILabel!
    @IBOutlet weak var sub3KeyTextField: UITextField!
    
    @IBOutlet weak var sub4Id: UILabel!
    @IBOutlet weak var sub4CN: UILabel!
    @IBOutlet weak var sub4Key: UILabel!
    @IBOutlet weak var sub4KeyTextField: UITextField!
    
    @IBOutlet weak var sub5Id: UILabel!
    @IBOutlet weak var sub5CN: UILabel!
    @IBOutlet weak var sub5Key: UILabel!
    @IBOutlet weak var sub5KeyTextField: UITextField!
    
    /// Bio Colonisation
    // attributes
    @IBOutlet weak var bAr1Key: UILabel!
    @IBOutlet weak var bAr1En: UILabel!
    @IBOutlet weak var bAr1EnTextField: UITextField!
    
    @IBOutlet weak var bAr1ValName: UILabel!
    @IBOutlet weak var bAr1ValDes: UILabel!
    @IBOutlet weak var bAr1ValDesTextField: UITextField!
    @IBOutlet weak var bAr1ValId: UILabel!
    @IBOutlet weak var bAr1ValIdTextField: UITextField!
    
    @IBOutlet weak var bAr2Key: UILabel!
    @IBOutlet weak var bAr2En: UILabel!
    @IBOutlet weak var bAr2EnTextField: UITextField!
    
    @IBOutlet weak var bAr3Key: UILabel!
    @IBOutlet weak var bAr3Dgt: UILabel!
    @IBOutlet weak var bAr3DgtTextField: UITextField!
    @IBOutlet weak var bAr3Unt: UILabel!
    @IBOutlet weak var bAr3UntTextField: UITextField!
    
    @IBOutlet weak var bAr4Key: UILabel!
    @IBOutlet weak var bAr4KeyTextField: UITextField!
    
    
    // subcategories
    @IBOutlet weak var subb1Id: UILabel!
    @IBOutlet weak var subb1CN: UILabel!
    @IBOutlet weak var subb1Key: UILabel!
    @IBOutlet weak var subb1KeyTextField: UITextField!
    
    @IBOutlet weak var subb11Id: UILabel!
    @IBOutlet weak var subb11CN: UILabel!
    @IBOutlet weak var subb11Key: UILabel!
    @IBOutlet weak var subb11KeyTextField: UITextField!
    
    @IBOutlet weak var subb2Id: UILabel!
    @IBOutlet weak var subb2CN: UILabel!
    @IBOutlet weak var subb2Key: UILabel!
    @IBOutlet weak var subb2KeyTextField: UITextField!
    
    @IBOutlet weak var subb3Id: UILabel!
    @IBOutlet weak var subb3CN: UILabel!
    @IBOutlet weak var subb3Key: UILabel!
    @IBOutlet weak var subb3KeyTextField: UITextField!
    
    @IBOutlet weak var subb4Id: UILabel!
    @IBOutlet weak var subb4CN: UILabel!
    @IBOutlet weak var subb4Key: UILabel!
    @IBOutlet weak var subb4KeyTextField: UITextField!
    
    @IBOutlet weak var subb5Id: UILabel!
    @IBOutlet weak var subb5CN: UILabel!
    @IBOutlet weak var subb5Key: UILabel!
    @IBOutlet weak var subb5KeyTextField: UITextField!
    
    
    
    struct DamageDataElement {
        var id: String
        var linkData: LinkData
        var categories: Categories
        var damageIntensity: DamageIntensity
        var damageExtent: DamageExtent
    }
    
    struct LinkData {
        var links: [Links] = []
    }
    
    struct Links {
        var linkedElementGuid: String
        var linkElementType: String
    }
    
    struct DamageIntensity {
        var key: String
        var enumId: String
        var value: Value
    }
    
    struct DamageExtent {
        var key: String
        var enumId: String
        var value: Value
    }
    
    struct Value {
        var name: String
        var decription: String
        var id: String
    }
    
    struct Categories {
        var id: String
        var categoryName: String
        var subCategories1: [SubCategories1] = []
        var attributes: [NonDocumentFields] = []
        var applicableForObjectTypes: String
    }
    
    struct SubCategories1 {
        var id: String
        var categoryName: String
        var subCategories2: [SubCategories2] = []
        var attributes: [NonDocumentFields] = []
        var applicableForObjectTypes: String
    }
    
    struct SubCategories2 {
        var id: String
        var categoryName: String
        var attributes: NonDocumentFields
        var applicableForObjectTypes: String
        var subcacategory: SubCategories3?
    }
    
    struct SubCategories3 {
        var id: String
        var categoryName: String
        var attributes: NonDocumentFields
        var applicableForObjectTypes: String
    }
    struct NonDocumentFields {
        var xsitype: String
        var key: String
        var enumId: String
        var digits: String?
        var unit: String?
        var value: Value?
    }
        
    
    var categoriesList = [[String]]()
    var subcategoriesList = [[String]]()
    var NDFList = [[String]]()
    var valList = [[String]]()
    var linkList = [[String]]()
    
    var attr: [NonDocumentFields] = []
    var sub2Set: [SubCategories2] = []
    var sub2SetX: [SubCategories2] = []
    var sub1Set: [SubCategories1] = []
    var linkSet: [Links] = []
    var categoriesSet: [Categories] = []

    
    var damageDataElementSet: [DamageDataElement] = []
    var elementName: String = String()
    var dde_id = String()
    var di_key = String()
    var di_enumId = String()
    var di_v_n = String()
    var di_v_d = String()
    var di_v_id = String()
    var de_key = String()
    var de_enumId = String()
    var de_v_n = String()
    var de_v_d = String()
    var de_v_id = String()
    
    var linkedEG = String()
    var linkedET = String()
    var categoriesID = String()
    var categoriesNM = String()
    var subcategoriesID = String()
    var subcategoriesNM = String()
    var NDFxsitype = String()
    var NDFkey = String()
    var NDFenumId = String()
    var NDFdigits = String()
    var NDFunit = String()
    
    var index = IndexPath()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.xmlTableView.delegate = self
        self.xmlTableView.dataSource = self
        
        self.hideKeyboardWhenTappedAround()
        
        
        // Parse the XML file
//        let filepath = "https://raw.githubusercontent.com/founderlin/fileForTest/main/fileTwo.xml"
//        let filepath = "https://raw.githubusercontent.com/founderlin/fileForTest/main/fileOne.xml"
        let filepath = qrText
        guard let path = URL(string: filepath) else { return print("No such URL!") }

        if let parser = XMLParser(contentsOf: path) {
            parser.delegate = self
            parser.parse()
            
            print(damageDataElementSet)

        }
    }
}

extension Input1ViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(Input1ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

