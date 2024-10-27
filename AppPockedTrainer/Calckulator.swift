import SwiftUI

struct Calckulator: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var tall: String = ""
    @State private var weight: String = ""
    @State private var activity: Double = 0.0
    @State private var selectOption = 0
    @State private var genderOptions = 0
    @State private var selecktActive = 0
    @State private var result = 0
    @State private var movement: Double = 1.0
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    let options = ["Схуднення", "Набір м'язів", "Норма"]
    let gender = ["Man", "Woman"]
    let activ = ["не тренуюсь", "1-3 тренування", "5 тренувань на тиждень", "Більш активний спосіб життя"]
    
    var body: some View {
        ZStack{
            Image(colorScheme == .dark ? "listBumagy2" : "listBumagy")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    VStack {
                        Image(systemName: "fork.knife.circle.fill")
                            .font(.system(size: 60))
                            .frame(maxWidth: .infinity)
                            .padding(.top, 70)
                        Text("Калькулятор").font(.title2)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text("калорый").font(.title2)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    
                }
                .frame(height: 56)
                
                VStack {
                    Picker("", selection: $genderOptions) {
                        ForEach(0..<gender.count, id: \.self) { index in
                            Text(gender[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    Picker("", selection: $selectOption) {
                        ForEach(0..<options.count, id: \.self) { index in
                            Text(options[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                   
                    Picker("", selection: $selecktActive) {
                        ForEach(0..<activ.count, id: \.self) {
                            index in Text(activ[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                   
                    
                    TextField("Скільки повних років: ", text: $age)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(10)
                    
                    TextField("Зріст: ", text: $tall)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(10)
                    
                    TextField("Вага: ", text: $weight)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(colorScheme == .dark ? .black : .white)
                        .cornerRadius(10)
                    
                   

                    Button(action: {
                        authenticate()
                    }) {
                        Image(systemName: "equal.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .padding()
                    .background(colorScheme == .dark ? .black : .white)
                    .cornerRadius(60)
                    .frame(width: 100, height: 100) // Фиксированный размер кнопки



                    
                   
                }
                .padding(EdgeInsets(top: 70, leading: 30, bottom: 0, trailing: 30))
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        })
                        {
                            Image(systemName: "house.fill")
                                .font(.largeTitle)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.vertical, 10)
                        }
                        .frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.black.opacity(0.4) : Color.black.opacity(0.4))
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(""),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    func authenticate() {
      
        guard let ageInt = Int(age), let tallInt = Int(tall), let weightInt = Int(weight) else {
            alertMessage = "Заповніть всі поля"
            showAlert = true
            return
        }
        
        Calculator(ageInt: ageInt, tallInt: tallInt, weightInt: weightInt, movement: movement)
    }
    
    func Calculator(ageInt: Int, tallInt: Int, weightInt: Int, movement: Double) {
        
        if selecktActive == 0 {
            activity = 1.2
        }
        else if selecktActive == 1 {
            activity = 1.375
        }
        else if selecktActive == 2 {
            activity = 1.55
        }
        
        else if selecktActive == 3 {
            activity = 1.9
        }
        
        if genderOptions == 0 { // Man
            let baseResult = (Double(weightInt) * 10) + (Double(6.25) * Double(tallInt)) - (5 * Double(ageInt)) + 5
            let procent = baseResult * 0.2
            switch selectOption {
            case 0: result = Int(Double(baseResult) * activity - procent)
            case 1: result = Int(Double(baseResult) * activity + procent)
            default: result = Int(Double(baseResult) * activity)
            }
        } else if genderOptions == 1 { // Woman
            let baseResult = (Double(weightInt) * 10) + (Double(6.25) * Double(tallInt)) - (5 * Double(ageInt)) - 161
            let procent = baseResult * 0.2
            switch selectOption {
            case 0: result = Int(Double(baseResult) * activity - procent)
            case 1: result = Int(Double(baseResult) * activity + procent)
            default: result = Int(Double(baseResult) * activity)
            }
        }

        


        alertMessage = "'\(options[selectOption])':  \(result) калорій на добу."
        showAlert = true
    }
}

struct Muscules_Calckulator: PreviewProvider {
    static var previews: some View {
        Calckulator()
            .preferredColorScheme(.light) // Превью для светлой темы
        Calckulator()
            .preferredColorScheme(.dark) // Превью для тёмной темы
    }
}
