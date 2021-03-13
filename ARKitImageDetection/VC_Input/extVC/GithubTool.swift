//
//  GithubTool.swift
//  XML2tabview
//
//  Created by FounderCoder on 17.01.21.
//

import UIKit
import Foundation


extension Input1ViewController {
    
    // MARK: - Interaction with GutHub APIs
    /// Delete the previous xml file
    func writeXML(elementSet: [ DamageDataElement ]) -> String {
        
        // xml file head
        var post = """
        <?xml version="1.0" encoding="ASCII"?>
        <de.tw.bimsis.platform.application.ddpart:DamageDataModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:de.tw.bimsis.platform.application.ddpart="http://tragwerk-software.de/bimsis/damagedatamodel/1.0.0">
        """
        
        // add damage data element
        for item in damageDataElementSet {
            
            var dde = ""
            dde.append("\n")
            for _ in 1...1 {dde.append("    ")}
            dde.append("""
                <damageDataElements id="\(item.id)">
                """)
            
            // add damage intensity
            dde.append("\n")
            for _ in 1...2 {dde.append("    ")}
            dde.append("""
                <damageIntensity key="\(item.damageIntensity.key)" enumId="\(item.damageIntensity.enumId)">
                """)
            
            dde.append("\n")
            for _ in 1...3 {dde.append("    ")}
            dde.append("""
                <value name="\(item.damageIntensity.value.name)" description="\(item.damageIntensity.value.decription)"
                    id="\(item.damageIntensity.value.id)"/>
                """)
            
            dde.append("\n")
            for _ in 1...2 {dde.append("    ")}
            dde.append("</damageIntensity>")
            
            // add damage extent
            dde.append("\n")
            for _ in 1...2 {dde.append("    ")}
            dde.append("""
                <damageExtent key="\(item.damageExtent.key)" enumId="\(item.damageExtent.enumId)">
                """)
            
            dde.append("\n")
            for _ in 1...3 {dde.append("    ")}
            dde.append("""
                <value name="\(item.damageExtent.value.name)" description="\(item.damageExtent.value.decription)" id="\(item.damageExtent.value.id)"/>
                """)
            
            dde.append("\n")
            for _ in 1...2 {dde.append("    ")}
            dde.append("</damageExtent>")


            dde.append("\n")
            for _ in 1...1 {dde.append("    ")}
            dde.append("</damageDataElements>")
            post.append(dde)
            
        
        }
        
        post.append("\n</de.tw.bimsis.platform.application.ddpart:DamageDataModel>")
        
        return post
    }
    
    
    // MARK: - Interaction with GutHub APIs
    /// Delete the previous xml file
    func deleteAPI(sha: String) {
        // Prepare URL
        let url = URL(string: "https://api.github.com/repos/founderlin/fileForTest/contents/one.xml")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "DELETE"
        request.allHTTPHeaderFields = [
            "Accept": "application/vnd.github.v3+json",
            "Authorization": "token 1082cb99c4adc09a2fe35f2968abf5a414a7811a"]
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let message = "Delete the previous xml file"
        let postString = """
        {"message":"\(message)","sha":"\(sha)"}
        """;
//        "sha":"1d495a883725b1243557bcce0c585b3d67583ff7"
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
    
    /// Upload a new xml file
    func uploadAPI(content: String) {
        // Prepare URL
        let url = URL(string: "https://api.github.com/repos/founderlin/fileForTest/contents/one.xml")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = [
            "Accept": "application/vnd.github.v3+json",
            "Authorization": "token 1082cb99c4adc09a2fe35f2968abf5a414a7811a"]
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let utf8str = content.data(using: .utf8)
        let base64String = utf8str?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        let message = "Add a new XML file"
        let postString = """
        {"message":"\(message)","content":"\(base64String!)"}
        """;
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
    
}
