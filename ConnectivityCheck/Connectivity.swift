//
//  Connectivity.swift
//  ConnectivityCheck
//
//  Created by Jalloh on 21/06/2016.
//  Copyright © 2016 CodeWithJalloh. All rights reserved.
//

import Foundation
import SystemConfiguration

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAdress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0,0,0,0,0,0,0,0))
        
        zeroAdress.sin_len = UInt8(sizeofValue(zeroAdress))
        zeroAdress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(&zeroAdress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        
        let isReachable = flags.contains(.Reachable)
        let needsConnection = flags.contains(.ConnectionRequired)
        
        return isReachable && !needsConnection
        
    }
    
    
}
