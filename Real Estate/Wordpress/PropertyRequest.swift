//
//  propertyRequest.swift
//  Real Estate
//
//  Created by Nayef Alotaibi on 1/30/19.
//  Copyright © 2019 Nayef Alotaibi. All rights reserved.
//

import Foundation

public class PropertyRequest: NSObject
{
    private var baseURL = ""
    
    private var parameters:Dictionary<String, Any>? = nil
    
    private var page:Int? = nil
    private var perPage:Int? = nil
    private var search:String? = nil
    private var categories:Int? = nil
    
    private var requestURL = ""
    private var isFirstParameter = true       // for building the http request
    
    public convenience init(url: String, page:Int?=nil, perPage:Int?=nil, categories:Int?=nil, search:String?=nil) {
        self.init()
        self.baseURL = url
        self.page = page            // page parameter is one based [1..[
        self.perPage = perPage
        self.search = search
        self.categories = categories
    }
    
    public convenience init(url: String, parameters:Dictionary<String, Any>?=nil) {
        self.init()
        self.baseURL = url
        self.parameters = parameters
    }
    
    public func fetchLastProperty (completionHandler:@escaping (Array<Property>?, Error?) -> Void) {
        requestURL = baseURL + "/properties"
        isFirstParameter = true
        if let page = self.page {
            self.appendParameter("page", page)
        }
        
        if let categories = self.categories {
            self.appendParameter("categories", categories)
        }
        
        if let perPage = self.perPage {
            self.appendParameter("per_page", perPage)
        }
        
        if let search = self.search {
            self.appendParameter("search", search)
        }
        
        let url = URL(string: requestURL)!
        print(requestURL)
        let urlSession = URLSession.shared
        
        // (Data?, URLResponse?, Error?)
        let dataTask = urlSession.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                completionHandler(nil, error);
                return;
            }
            var jsonError: Error?
            var jsonResult:Any?
            do {
                jsonResult = try JSONSerialization.jsonObject(with:data!, options:[])
            } catch let error {
                jsonError = error
                jsonResult = nil
            }

          
            var properties:Array<Property> = []
            if let propertyArray = jsonResult as? [Dictionary<String, Any>] {
                for propertyDictionary in propertyArray {
                    if let property = Property(data:propertyDictionary as Dictionary<String, AnyObject>) {
                        // print(property)
                        properties.append(property)
                    }
                }
            }
            completionHandler(properties, jsonError);
        })
        
        dataTask.resume()
    }
    
    private func appendParameter (_ name:String, _ value:Any) {
        if isFirstParameter {
            requestURL += "?\(name)=\(value)"
            isFirstParameter = false
        }
        else {
            requestURL += "&\(name)=\(value)"
        }
    }
    
    public struct ParamKey {
        public static let page = "page"
        public static let perPage = "per_page"
    }
    
}

