//
//	Weatherinfo.swift
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

import Foundation

struct Weatherinfo{

	var radar : String!
	var sD : String!
	var wD : String!
	var wS : String!
	var wSE : String!
	var city : String!
	var cityid : String!
	var isRadar : String!
	var njd : String!
	var qy : String!
	var rain : String!
	var temp : String!
	var time : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		radar = dictionary["Radar"] as? String
		sD = dictionary["SD"] as? String
		wD = dictionary["WD"] as? String
		wS = dictionary["WS"] as? String
		wSE = dictionary["WSE"] as? String
		city = dictionary["city"] as? String
		cityid = dictionary["cityid"] as? String
		isRadar = dictionary["isRadar"] as? String
		njd = dictionary["njd"] as? String
		qy = dictionary["qy"] as? String
		rain = dictionary["rain"] as? String
		temp = dictionary["temp"] as? String
		time = dictionary["time"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if radar != nil{
			dictionary["Radar"] = radar
		}
		if sD != nil{
			dictionary["SD"] = sD
		}
		if wD != nil{
			dictionary["WD"] = wD
		}
		if wS != nil{
			dictionary["WS"] = wS
		}
		if wSE != nil{
			dictionary["WSE"] = wSE
		}
		if city != nil{
			dictionary["city"] = city
		}
		if cityid != nil{
			dictionary["cityid"] = cityid
		}
		if isRadar != nil{
			dictionary["isRadar"] = isRadar
		}
		if njd != nil{
			dictionary["njd"] = njd
		}
		if qy != nil{
			dictionary["qy"] = qy
		}
		if rain != nil{
			dictionary["rain"] = rain
		}
		if temp != nil{
			dictionary["temp"] = temp
		}
		if time != nil{
			dictionary["time"] = time
		}
		return dictionary
	}

}