//
//  ContentView.swift
//  Weekly Payroll
//
//  Created by Tyler Berlin on 9/18/24.
//

import SwiftUI

struct ContentView: View {
@State private var hourlyWageTextField = ""
@State private var hoursWorkedTextField = ""
@State private var pay = 0.0

    var body: some View {
        VStack {
            CustomText(text: "Weekly Payroll")
            CustomTextField(placeholder: "Hourly Wage", varriable: $hourlyWageTextField)
            CustomTextField(placeholder: "Hours Worked", varriable: $hoursWorkedTextField)
            Button("Calculate") {
                if let hourlyWage = Double(hourlyWageTextField){
                    if let hoursWorked = Double(hoursWorkedTextField){
                        pay = calculationGrossPay(hourlyWage: hourlyWage, hoursWorked: hoursWorked)
                    }
                }
            }
        }
        .padding()
        CustomText(text: "Gross Pay")
        CustomText(text: "$" + String(format: "%.2f", pay))
        Spacer()
    }
}

func calculationGrossPay(hourlyWage: Double, hoursWorked: Double) -> Double{
    let regularHours = min(hoursWorked, 40.0)
    let overtimeHours = max(hoursWorked - 40.0, 0.0)
    let regularPay = regularHours * hourlyWage
    let overtimePay = overtimeHours * hourlyWage * 1.5
    return regularPay + overtimePay
}

#Preview {
    ContentView()
}

struct CustomTextField: View {
    let placeholder: String
    let varriable: Binding<String>
    var body: some View{
        TextField(placeholder, text: varriable)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30)
            .font(.body)
            .padding()
    }
}

struct CustomText: View {
    let text: String
    var body: some View{
        Text(text)
            .font(.title)
            .fontWeight(.bold)
    }
}


