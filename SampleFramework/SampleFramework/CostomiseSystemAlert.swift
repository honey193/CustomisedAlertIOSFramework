//
//  CostomiseSystemAlert.swift
//  SampleFramework
//
//  Created by Honey Shah on 23/02/23.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CostomiseSystemAlert: View {
    @State var showingAlert = true
    var alertMessage: String?
    var buttonText: String?
    var buttonClick: () -> Void
    
    public init(alertMessage: String, buttonText: String, buttonClick: @escaping () -> Void) {
        self.buttonClick = buttonClick
        self.alertMessage = alertMessage
        self.buttonText = buttonText
    }
    
    public var body: some View {
        if #available(iOS 15.0, *) {
            ZStack { }
                .alert(alertMessage ?? "", isPresented: $showingAlert) {
                    Button(buttonText ?? "", role: .cancel, action: {
                        buttonClick()
                    })
                }
        } else {
            Text(alertMessage ?? "")
        }
    }
}
