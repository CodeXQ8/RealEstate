//
//  property .swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 1/30/19.
//  Copyright © 2019 Nayef Alotaibi. All rights reserved.
//


public struct Property : CustomStringConvertible
{
    public let id: Int
    public let title: String
    public let propertyDescription: String
    public let address: String
    public let gallery: [String]
    public let price: String
    public let area: String
    public let bedrooms: String
    public let bathrooms: String
    public let type: [[String]]
    public let status: [[String]]
    public let agentName: String


    
    public var description: String {
        return "\n\(id) - : \(title)"
    }
    
    //    init(id : Int, data: Date, title: String, content: String, excerpt: String) {
    //        self.title = title
    //        self.content = content
    //        self.excerpt = excerpt
    //        self.id = id
    //        self.data = data
    //    }
    
    init? (data: Dictionary<String, AnyObject>) {
        guard
            let identifier = data["id"] as? Int,
            let title = data["title"] as? String,
            let propertyDescription = data["description"] as? String,
            let address = data["address"] as? String,
            let gallery = data["gallery"] as? [String],
            let area = data["area"] as? String,
            let bathrooms = data["bathrooms"] as? String,
            let price = data["price"] as? String,
            let status = data["status"] as? [[String]],
            let bedrooms = data["bedrooms"] as? String,
            let type = data["type"] as? [[String]],
            let agentName = data["agent_responsible"] as? String

        
            else {
                return nil
        }
        

        self.id = identifier
        self.title = title
        self.propertyDescription = propertyDescription
        self.address = address
        self.gallery = gallery
        self.price = price
        self.area = area
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.status = status
        self.type = type
        self.agentName = agentName

        
    }
    
    private let wpDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss"     // "2016-01-29T01:45:33"
        return formatter
    }()
    
}


