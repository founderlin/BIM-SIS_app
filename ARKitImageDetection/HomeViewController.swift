//
//  HomeViewController.swift
//  ARKitImageDetection
//
//  Created by FounderCoder on 15.12.20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, XMLParserDelegate {
    
    var qrText: String = ""
    
    @IBOutlet weak var toOutput: UIButton!
    @IBOutlet weak var toInput: UIButton!
    @IBOutlet weak var toAbout: UIButton!
    
    var elementName: String = String()
    var linkIn = String()
    var linkOut = String()
    var paths: [Path] = []

    struct Path {
        var input: String
        var output: String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Parse the XML file
        let filepath = qrText
        guard let path = URL(string: filepath) else { return print("No such URL!") }

        if let parser = XMLParser(contentsOf: path) {
            parser.delegate = self
            parser.parse()
        }
        
        print(paths)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Pass data to the ScanViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue1" {
            let vc = segue.destination as? ViewController
            vc?.qrText = paths[0].output
        }
        
        if segue.identifier == "segue2" {
            let vc = segue.destination as? Input1ViewController
            vc?.qrText = paths[0].input
        }
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == "filepath" {
            linkIn = String()
            linkOut = String()
        }
        self.elementName = elementName
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "filepath" {
            let path = Path(input: linkIn, output: linkOut)
            paths.append(path)
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        if (!data.isEmpty) {
            if self.elementName == "linkin" {
                linkIn += data
            } else if self.elementName == "linkout" {
                linkOut += data
            }
        }
    }

    
}




