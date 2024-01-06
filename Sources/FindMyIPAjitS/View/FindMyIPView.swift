//
//  FindMyIPView.swift
//  FindMyIP
//
//  Created by Ajit Satarkar on 05/01/24.
//

/*
 @available(iOS 14.0, *)
 @available(macOS 11.0, *)
 public struct ContentView: View {
     
     @StateObject public var viewModel: FindMyIPViewModel = FindMyIPViewModel()
     
     public var body: some View {
         NavigationView {
             VStack {
                 Spacer()
                 if viewModel.isLoading {
                     ProgressView("Fetching Data...")
                 } else {
                     if let findMyIPData = viewModel.findMyIPData {
                         Group {
                             Text("My IP \(findMyIPData.ip)")
                                 .font(.title3)
                             Text("My Network \(findMyIPData.network)")
                                 .font(.footnote)
                         }
                         Spacer()
                     } else {
                         Text("Failed to fetch data.")
                             .foregroundColor(.red)
                     }
                 }
                 Spacer()
             }
             .navigationTitle("Find My IP")
             .alert(isPresented: $viewModel.showAlert) {
                 Alert(title: Text("Error"), message: Text(viewModel.findMyIPError), dismissButton: .default(Text("OK")))
             }
         }
         .onAppear {
             viewModel.getFindMyIPServiceList()
         }
     }
     
 }

 #Preview {
     ContentView()
 }

 */
