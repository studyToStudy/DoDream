
import SwiftUI
import MessageUI

struct ProfilEditView: View {
    @State private var sendEmail = false
//        let constants = Constants.shared
        var body: some View {
            Text("Hello")
    }
    
    private func sendMail() {
        if MFMailComposeViewController.canSendMail() {
            let composeViewController = MFMailComposeViewController()
            composeViewController.MFMailComposeViewControllerDelegate = self
            composeViewController.setToRecipients(["jenghoo515@gmail.com"])
            composeViewController.setSubject("[두드림] 문의 및 의견 전달")
            composeViewController.setMessageBody(viewModel.commentsBodyString(), isHTML: false)
            present(composeViewController, animated: true)
        } else {
            presentToFailureSendMailAlert()
        }
    }
    
    private func presentToFailureSendMailAlert() {
            let sendMailErrorAlert = viewModel.sendMailFailAlert()
            present(sendMailErrorAlert, animated: true)
        }
}

struct ProfilEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilEditView()
    }
}

    extension SettingTableViewController: MFMailComposeViewControllerDelegate {
    // (피드백 보내기) 메일 보낸 후
        func mailComposeController(
            _ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?
        ) {
            dismiss(animated: true)
        }
    }
}
