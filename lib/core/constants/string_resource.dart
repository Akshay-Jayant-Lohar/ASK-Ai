class AppString {
  AppString._internal();
  static final AppString _instance = AppString._internal();
  factory AppString() {
    return _instance;
  }
  final String title = "Message FarmX AI";
  final String dropDownmsg = "Please Select From below options:";
  final String buttonText = "Submit";
  final String cancel = "Cancel";
  final String proceed = "Proceed";
  final String search = "Search";
  final String language = "Language";
  final String issue = "Issue";
  final String model = "Model";
  final String issueDec = 'Issue Description';
  final String animatedWelcomeText = 'Welcome';
  final String searchHistory = "Search History";
  final String clear = "Clear";
  final String animatedToText = 'To';
  final String animatedAskAIText = 'ASK AI';
  final String dialogMessage = 'Are you satisfied with this chat ?';
  final String yesDialogMessage = 'Yes';
  final String noDialogMessage = 'No';
  final String marqueeText =
      'Issue:     Model:      IssueDecription:      Language:';
}
