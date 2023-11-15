//
//  AccountView.swift
//  Appetizers_SwiftUI
//
//  Created by Elizabeth Nikolova on 10/23/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Personal info")) {
                        sectionContent()
                    }
                    Section(header: Text("Requests")) {
                        Toggle("Extra Napkings", isOn: $viewModel.user.extraNapkings)
                        Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                }
                .formStyle(GroupedFormStyle())
                .navigationTitle("Account")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
                
                Button {
                    viewModel.saveChanges()
                } label: {
                    Text("Save changes")
                }
                .modifier(StandardButtonStyle())
                .padding(.bottom, 30)
            }
        }
        .onAppear() {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
    @ViewBuilder
    func sectionContent() -> some View {
        TextField("First Name", text: $viewModel.user.firstName)
            .focused($focusedTextField, equals: .firstName)
            .onSubmit { focusedTextField = .lastName }
            .submitLabel(.next)

        TextField("Last Name", text: $viewModel.user.lastName)
            .focused($focusedTextField, equals: .lastName)
            .onSubmit { focusedTextField = .email }
            .submitLabel(.next)

        TextField("Email", text: $viewModel.user.email)
            .focused($focusedTextField, equals: .email)
            .onSubmit { focusedTextField = nil }
            .submitLabel(.continue)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.none)
            .autocorrectionDisabled(true)
        DatePicker("Birthday",
                   selection: $viewModel.user.birthdate,
                   in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                   displayedComponents: .date)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
