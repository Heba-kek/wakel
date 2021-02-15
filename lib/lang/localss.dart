import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:wakel/lang/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;

      return new AppLocalizations();
    });
  }

  String get locale {
    return Intl.message('en', name: 'locale');
  }

  String get lbWait {
    return Intl.message('Wait', name: 'lbWait');
  }

  String get lbWelcom {
    return Intl.message('Welcome Back', name: 'lbWelcom');
  }

  String get lbWelmsg {
    return Intl.message('Let us do some daily buisness', name: 'lbWelmsg');
  }

  String get lbPass {
    return Intl.message('Password', name: 'lbPass');
  }



  String get lbkhho {
    return Intl.message('Government services', name: 'lbkhho');
  } String get lbBooks {
    return Intl.message('Articles and books', name: 'lbBooks');
  } String get lbPros {
    return Intl.message('Programming', name: 'lbPros');
  } String get lbTra {
    return Intl.message('Translation', name: 'lbTra');
  } String get lbGra {
    return Intl.message('Grafic Design', name: 'lbGra');
  } String get lbGh {
    return Intl.message('University admissions', name: 'lbGh');
  }



  String get lbSaveA {
    return Intl.message('Save Account', name: 'lbSaveA');
  }

  String get lbForget {
    return Intl.message('Forget Password', name: 'lbForget');
  }

  String get lbLogVia {
    return Intl.message('Login Via', name: 'lbLogVia');
  }

  String get lbNewU {
    return Intl.message('New User ?', name: 'lbNewU');
  }

  String get lbCreateA {
    return Intl.message('Create New Account', name: 'lbCreateA');
  }

  String get lbSkip {
    return Intl.message('Skip', name: 'lbSkip');
  }

  String get lbHello {
    return Intl.message('Hello', name: 'lbHello');
  }

  String get lbUser {
    return Intl.message('Username', name: 'lbUser');
  }

  String get lbOr {
    return Intl.message('OR', name: 'lbOr');
  }

  String get lbAccountType {
    return Intl.message('Account Type', name: 'lbAccountType');
  }

  String get lbAccountchosse {
    return Intl.message('choose from the option below',
        name: 'lbAccountchosse');
  }

  String get lbCus {
    return Intl.message('Customer', name: 'lbCus');
  }

  String get lbCusDes {
    return Intl.message('Create projects and find the best options.',
        name: 'lbCusDes');
  }

  String get lbFreelan {
    return Intl.message('Freelancer', name: 'lbFreelan');
  }

  String get lbFreeDes {
    return Intl.message('Browse many projects and start making money.',
        name: 'lbFreeDes');
  }

  String get lbRej {
    return Intl.message('Sign Up', name: 'lbRej');
  }
  String get lbEdit {
    return Intl.message('Edit Account', name: 'lbEdit');
  }

  String get lbMsgReg {
    return Intl.message('Let us know more about you', name: 'lbMsgReg');
  }

  String get lbUploadI {
    return Intl.message('Upload Image', name: 'lbUploadI');
  }

  String get lbMobNu {
    return Intl.message('Mobile No.', name: 'lbMobNu');
  }

  String get lbEmail {
    return Intl.message('Email', name: 'lbEmail');
  }

  String get lbCoun {
    return Intl.message('Country', name: 'lbCoun');
  }

  String get lbCity {
    return Intl.message('City', name: 'lbCity');
  }

  String get lbConPass {
    return Intl.message('Confirm Password', name: 'lbConPass');
  }

  String get lbAlredyUser {
    return Intl.message('Already a User ?', name: 'lbAlredyUser');
  }

  String get lbAcouLog {
    return Intl.message('An account Login', name: 'lbAcouLog');
  }

  String get lbOtp {
    return Intl.message('OTP', name: 'lbOtp');
  }

  String get lbOtpM {
    return Intl.message('Enter the 4-digits code sent to your mobile number',
        name: 'lbOtpM');
  }

  String get lbCon {
    return Intl.message('Confirm', name: 'lbCon');
  }

  String get lbWrongM {
    return Intl.message('Wrong mobile number?', name: 'lbWrongM');
  }

  String get lbChangeM {
    return Intl.message('Change Mobile Number', name: 'lbChangeM');
  }

  String get lbSaudiAuth {
    return Intl.message('Saudi Ports Authority', name: 'lbSaudiAuth');
  }

  String get lbMiniHou {
    return Intl.message('Ministry of Housing', name: 'lbMiniHou');
  }

  String get lbMiniAff {
    return Intl.message('Ministry of Foregin Affairs', name: 'lbMiniAff');
  }

  String get lbPassPort {
    return Intl.message('Passports Authority', name: 'lbPassPort');
  }

  String get lbHome {
    return Intl.message('HOME', name: 'lbHome');
  }

  String get lbSocial {
    return Intl.message('SOCIAL', name: 'lbSocial');
  }

  String get lbChat {
    return Intl.message('CHAT', name: 'lbChat');
  }

  String get lbPro {
    return Intl.message('PROJECTS', name: 'lbPro');
  }

  String get lbProLit {
    return Intl.message('Projects', name: 'lbProLit');
  }

  String get lbProfile {
    return Intl.message('PROFILE', name: 'lbProfile');
  }

  String get lbChatLit {
    return Intl.message('Chat', name: 'lbChatLit');
  }

  String get lbSocLit {
    return Intl.message('Social', name: 'lbSocLit');
  }

  String get lbHomeLit {
    return Intl.message('Home', name: 'lbHomeLit');
  }

  String get lbDammam {
    return Intl.message('Dammam', name: 'lbDammam');
  }

  String get lbJadah {
    return Intl.message('Jadah', name: 'lbJadah');
  }

  String get lbNoti {
    return Intl.message('Notifications', name: 'lbNoti');
  }

  String get lbSendMsg {
    return Intl.message(' sent a msg', name: 'lbSendMsg');
  }

  String get lbAccept {
    return Intl.message(' Accepted your request', name: 'lbAccept');
  }

  String get lbAccMsg {
    return Intl.message(
        'Congratulations! jessica accepted your meetup request.',
        name: 'lbAccMsg');
  }

  String get lbShowAll {
    return Intl.message('Show All', name: 'lbShowAll');
  }

  String get lbZakat {
    return Intl.message('Zakat', name: 'lbZakat');
  }

  String get lbRejZakat {
    return Intl.message('Registering in Zakat', name: 'lbRejZakat');
  }

  String get lbProvider {
    return Intl.message('Provider', name: 'lbProvider');
  }

  String get lbSearch {
    return Intl.message('Search', name: 'lbSearch');
  }

  String get lbAsma {
    return Intl.message('Asmaa Ahmed', name: 'lbAsma');
  }

  String get lbSar {
    return Intl.message('SAR', name: 'lbSar');
  }

  String get lbThDay {
    return Intl.message('in 3 days ', name: 'lbThDay');
  }

  String get lbTRans {
    return Intl.message('Transferring from institution to a company',
        name: 'lbTRans');
  }

  String get lbBuyPAck {
    return Intl.message('Buy Package', name: 'lbBuyPAck');
  }

  String get lbOrderPac {
    return Intl.message('Order Package', name: 'lbOrderPac');
  }

  String get lbBe {
    return Intl.message('To be in', name: 'lbBe');
  }

  String get lbdayTH {
    return Intl.message('3 days', name: 'lbdayTH');
  }

  String get lbreq {
    return Intl.message('Requirements', name: 'lbreq');
  }

  String get lbOrigId {
    return Intl.message('Original ID for the host', name: 'lbOrigId');
  }

  String get lbPross {
    return Intl.message('Processed by', name: 'lbPross');
  }

  String get lbExpense {
    return Intl.message('Expenses', name: 'lbExpense');
  }

  String get lbSerCost {
    return Intl.message('Service Cost', name: 'lbSerCost');
  }

  String get lbAppFee {
    return Intl.message('Application Fees', name: 'lbAppFee');
  }

  String get lbVat {
    return Intl.message('VAT', name: 'lbVat');
  }

  String get lbTotal {
    return Intl.message('Total', name: 'lbTotal');
  }

  String get lbConPay {
    return Intl.message('Confirm Payment', name: 'lbConPay');
  }

  String get lbPackExp {
    return Intl.message('Package Expenses', name: 'lbPackExp');
  }

  String get lbPayMeth {
    return Intl.message('Payment Method', name: 'lbPayMeth');
  }

  String get lbAddCard {
    return Intl.message('Add Card', name: 'lbAddCard');
  }

  String get lbBankTra {
    return Intl.message('Bank Transfer', name: 'lbBankTra');
  }

  String get lbBackHome {
    return Intl.message('Back To Homepage', name: 'lbBackHome');
  }

  String get lbPurSuccess {
    return Intl.message('Purchase Successful', name: 'lbPurSuccess');
  }

  String get lbPurSuccessMsg {
    return Intl.message(
        'You have purchase Transferring from institution to a company successfully!',
        name: 'lbPurSuccessMsg');
  }

  String get lbTrackBtn {
    return Intl.message('Track Package Progress', name: 'lbTrackBtn');
  }

  String get lbPakDe {
    return Intl.message('Package Details', name: 'lbPakDe');
  }

  String get lbShowMore {
    return Intl.message('Click to show your package details',
        name: 'lbShowMore');
  }

  String get lbEx {
    return Intl.message('Expense', name: 'lbEx');
  }

  String get lbShoeExD {
    return Intl.message('Click to show your package expenses',
        name: 'lbShoeExD');
  }

  String get lbTrack {
    return Intl.message('Tracking', name: 'lbTrack');
  }
  String get lbDe {
    return Intl.message('Service received', name: 'lbDe');
  }String get lbProc {
    return Intl.message('The service is in progress', name: 'lbProc');
  }String get lbFi {
    return Intl.message('The service has been completed', name: 'lbFi');
  }


  String get lbTas {
    return Intl.message('Category', name: 'lbTas');
  }
  String get lbFiD {
    return Intl.message('First Day', name: 'lbFiD');
  }
  String get lbSiD {
    return Intl.message('Second Day', name: 'lbSiD');
  }
  String get lbThD {
    return Intl.message('Third Day', name: 'lbThD');
  }



  String get lbTrackMsg {
    return Intl.message('Track progress for package', name: 'lbTrackMsg');
  }

  String get lbProMsg {
    return Intl.message('Processing the Request to Authorities',
        name: 'lbProMsg');
  }

  String get lbDayAgo {
    return Intl.message('a day ago', name: 'lbDayAgo');
  }

  String get lbHandle {
    return Intl.message('Handling Paperwork', name: 'lbHandle');
  }

  String get lbConClient {
    return Intl.message('Confirming Data from client', name: 'lbConClient');
  }

  String get lbFinalPack {
    return Intl.message('Finalizing Package', name: 'lbFinalPack');
  }

  String get lbSetCom {
    return Intl.message('Set as completed', name: 'lbSetCom');
  }

  String get lbNewPro {
    return Intl.message('New Project', name: 'lbNewPro');
  }

  String get lbFillNew {
    return Intl.message('Fill the data below to create', name: 'lbFillNew');
  }

  String get lbSud {
    return Intl.message('Saudi Arabia', name: 'lbSud');
  }

  String get lbSubIns {
    return Intl.message('Submission Institute', name: 'lbSubIns');
  }

  String get lnInsName {
    return Intl.message('Institute Name', name: 'lnInsName');
  }

  String get lbSub {
    return Intl.message('Subject', name: 'lbSub');
  }

  String get lbProSub {
    return Intl.message('Project Subject', name: 'lbProSub');
  }

  String get lbDet {
    return Intl.message('Details', name: 'lbDet');
  }

  String get lbDead {
    return Intl.message('Deadline', name: 'lbDead');
  }

  String get lbCreatePro {
    return Intl.message('Create New Project', name: 'lbCreatePro');
  }

  String get lbOnPro {
    return Intl.message('Ongoing project', name: 'lbOnPro');
  }

  String get lbCancelPro {
    return Intl.message('Canceled project', name: 'lbCancelPro');
  }

  String get lbComp {
    return Intl.message('Completed', name: 'lbComp');
  }

  String get lbStef {
    return Intl.message('Stephane Kane', name: 'lbStef');
  }

  String get lbSelectL {
    return Intl.message('Select Language', name: 'lbSelectL');
  }


  String get lbPaid {
    return Intl.message('Paid', name: 'lbPaid');
  }

  String get lbRev {
    return Intl.message('Reviews', name: 'lbRev');
  }
  String get lbTop {
    return Intl.message('Top Up', name: 'lbTop');
  }

  String get lbCurrentB {
    return Intl.message('Reviews', name: 'lbCurrentB');
  }

  String get lbTopA {
    return Intl.message('Top Up Amount', name: 'lbTopA');
  }

  String get lbAddNC {
    return Intl.message('Add New Card', name: 'lbAddNC');
  }
  String get lbNC {
    return Intl.message('Add New Card', name: 'lbNC');
  }

  String get lbCardNum {
    return Intl.message('Card Number', name: 'lbCardNum');
  }

  String get lbCardNam {
    return Intl.message('Card Name', name: 'lbCardNam');
  }

  String get lbExpi {
    return Intl.message('Expiry', name: 'lbExpi');
  }

  String get lbSaveC {
    return Intl.message('Save card for future payments', name: 'lbSaveC');
  }

  String get lbEditPro {
    return Intl.message('Edit Project Details', name: 'lbEditPro');
  }

  String get lbLatBid {
    return Intl.message('Latest Bids', name: 'lbLatBid');
  }

  String get lbSelectBid {
    return Intl.message('Select Bid', name: 'lbSelectBid');
  }

  String get lbSearchChat {
    return Intl.message('Expiry', name: 'lbSearchChat');
  }

  String get lbMute {
    return Intl.message('Expiry', name: 'lbMute');
  }

  String get lbRepo {
    return Intl.message('Report', name: 'lbRepo');
  }

  String get lbOn {
    return Intl.message('Online', name: 'Online');
  }

  String get lbTypeS {
    return Intl.message(' Type Something', name: 'lbTypeS');
  }

  String get lbMan {
    return Intl.message('Managment', name: 'lbMan');
  }

  String get lbProDet {
    return Intl.message('Project Details', name: 'lbProDet');
  }

  String get lbProDeMsg {
    return Intl.message('Click to show your project description',
        name: 'lbProDeMsg');
  }

  String get lbBid {
    return Intl.message('Bids', name: 'lbBid');
  }

  String get lbBidMsg {
    return Intl.message('Click to show bids on project', name: 'lbBid');
  }

  String get lbTrackMsgP {
    return Intl.message('Track progress for project', name: 'lbTrackMsgP');
  }

  String get lbREvoke {
    return Intl.message('Revoke Bid', name: 'lbREvoke');
  }

  String get lbFinishPro {
    return Intl.message('are you sure you want to end the project now?',
        name: 'lbFinishPro');
  }

  String get lbLater {
    return Intl.message('Later', name: 'lbLater');
  }

  String get lbFinish {
    return Intl.message('Finish Now', name: 'lbFinish');
  }

  String get lbCreateP {
    return Intl.message('Create New Payment', name: 'lbCreateP');
  }
  String get lbSha {
    return Intl.message('Recharge', name: 'lbSha');
  }
  String get lbPayA {
    return Intl.message('Payment Amount', name: 'lbPayA');
  }

  String get lbProFeed {
    return Intl.message('Provide Feedback', name: 'lbProFeed');
  }

  String get lbComm {
    return Intl.message('Communication', name: 'lbComm');
  }

  String get lbSer {
    return Intl.message('Service', name: 'lbSer');
  }

  String get lbProf {
    return Intl.message('Professionalism', name: 'lbProf');
  }

  String get lbTime {
    return Intl.message('Time', name: 'lbTime');
  }

  String get lbFeed {
    return Intl.message('Feedback', name: 'lbFeed');
  }

  String get lbSerMsg {
    return Intl.message('Let us know how was the service', name: 'lbSerMsg');
  }

  String get lbFeedProde {
    return Intl.message('Feedback Provided', name: 'lbFeedProde');
  }

  String get lbFeedProdeMsg {
    return Intl.message(
        'Feedback has been provided successfully and will be published soon',
        name: 'lbFeedProdeMsg');
  }

  String get lbSen {
    return Intl.message('Senior Product Designer', name: 'lbSen');
  }

  String get lbPackages {
    return Intl.message('Packages', name: 'lbPackages');
  }
  String get lngen {
    return Intl.message('Nationality', name: 'lngen');
  }

  String get gend {
    return Intl.message('Gender', name: 'gend');
  }
  String get lbMale {
    return Intl.message('Male', name: 'lbMale');
  }

  String get lbDay {
    return Intl.message('Day', name: 'lbDay');
  }
  String get lbEditD {
    return Intl.message('Edit Details', name: 'lbEditD');
  }
  String get lbMo {
    return Intl.message('Month', name: 'lbMo');
  }
  String get lbY {
    return Intl.message('Year', name: 'lbY');
  }



  String get lbFemale {
    return Intl.message('Female', name: 'gend');
  }

  String get lbAge {
    return Intl.message('Age', name: 'lbAge');
  }

  String get lbThAge {
    return Intl.message('3 days ago', name: 'lbThAge');
  }

  String get lbFaq {
    return Intl.message('FAQs', name: 'lbFaq');
  }

  String get lbFaqq {
    return Intl.message('How to start using Wakel ?', name: 'lbFaqq');
  }

  String get lbStartT {
    return Intl.message(' Start Typing Here', name: 'lbStartT');
  }

  String get lbBankT {
    return Intl.message('Confirm Transfer', name: 'lbBankT');
  }

  String get lbAccNum {
    return Intl.message('Account Number', name: 'lbAccNum');
  }

  String get lbAccNam {
    return Intl.message('Account Name', name: 'lbAccNam');
  }

  String get lbBankN {
    return Intl.message('Bank Name', name: 'lbBankN');
  }

  String get lbIbn {
    return Intl.message('IBAN', name: 'lbIbn');
  }

  String get lbPayands {
    return Intl.message('Pay & Select Bid', name: 'lbPayands');
  }

  String get lbPaySuc {
    return Intl.message('Payment Success', name: 'lbPaySuc');
  }

  String get lbPaySucM {
    return Intl.message(
        'You\'ve successfully paid and selected the bid on your project ',
        name: 'lbPaySucM');
  }

  String get lbTracPro {
    return Intl.message('Track Package Progress', name: 'lbTracPro');
  }

  String get lbType {
    return Intl.message('Type', name: 'lbType');
  }

  String get lbComName {
    return Intl.message('Company name', name: 'lbComName');
  }

  String get lbCom {
    return Intl.message('Company', name: 'lbCom');
  }

  String get lbIdN {
    return Intl.message('ID Number', name: 'lbIdN');
  }

  String get lbLoc {
    return Intl.message('Location', name: 'lbLoc');
  }

  String get lbLAtPro {
    return Intl.message('Latest Projects', name: 'lbLAtPro');
  }

  String get lbAllC {
    return Intl.message('All City', name: 'lbAllC');
  }

  String get lbAllIn {
    return Intl.message('All Instituitions', name: 'lbAllIn');
  }

  String get lbNewP {
    return Intl.message('New Package', name: 'lbNewP');
  }

  String get lbInSec {
    return Intl.message('Internal Section', name: 'lbInSec');
  }

  String get lbSecName {
    return Intl.message('Section Name', name: 'lbSecName');
  }

  String get lbDes {
    return Intl.message('Description', name: 'lbDes');
  }

  String get lbDesP {
    return Intl.message('Desired Price', name: 'lbDesP');
  }

  String get lbCreatePa {
    return Intl.message('Create Package', name: 'lbCreatePa');
  }

  String get lbMakeO {
    return Intl.message('Make an offer', name: 'lbMakeO');
  }

  String get lbCreateBy {
    return Intl.message('Created By', name: 'lbCreateBy');
  }

  String get lbOffer {
    return Intl.message('Offer', name: 'lbOffer');
  }

  String get lbOffDes {
    return Intl.message('Offer Description', name: 'lbOffDes');
  }

  String get lbOffCre {
    return Intl.message('Offer Created', name: 'lbOffCre');
  }

  String get lbOffCreMsg {
    return Intl.message(
        'You\'ve created an offer to this project successfully!',
        name: 'lbOffCreMsg');
  }

  String get lbViewP {
    return Intl.message('View Project', name: 'lbViewP');
  }

  String get lbEditO {
    return Intl.message('Edit Offer', name: 'lbEditO');
  }

  String get lbUpdateT {
    return Intl.message('Update Track', name: 'lbUpdateT');
  }

  String get lbProAwa {
    return Intl.message('Project Awarded', name: 'lbProAwa');
  }

  String get lbExDead {
    return Intl.message('Extend DeadLine', name: 'lbExDead');
  }

  String get lbNumd {
    return Intl.message('Number of days', name: 'lbNumd');
  }

  String get lbCancel {
    return Intl.message('Cancel', name: 'lbCancel');
  }

  String get lbExtend {
    return Intl.message('Extend', name: 'lbExtend');
  }

  String get lbAddPa {
    return Intl.message('Add New Package', name: 'lbAddPa');
  }

  String get lbEditP {
    return Intl.message('Edit Package', name: 'lbEditP');
  }

  String get lbSett {
    return Intl.message('Setting', name: 'lbSett');
  }

  String get lbAppV {
    return Intl.message('App Version', name: 'lbAppV');
  }

  String get lbNotiSet {
    return Intl.message('Notification Settings', name: 'lbNotiSet');
  }

  String get lbChossec {
    return Intl.message('Choose categories to get them!', name: 'lbChossec');
  }

  String get lbSave {
    return Intl.message('Save', name: 'lbSave');
  }

  String get lbUpMem {
    return Intl.message('Upgrade Membership', name: 'lbUpMem');
  }

  String get lbUpMemMsg {
    return Intl.message('Upgrade for better value', name: 'lbUpMemMsg');
  }

  String get lbBasic {
    return Intl.message('Basic', name: 'lbBasic');
  }

  String get lbPlus {
    return Intl.message('Plus', name: 'lbPlus');
  }

  String get lbProS {
    return Intl.message('Pro', name: 'lbProS');
  }

  String get lbWakB {
    return Intl.message('Wakel Basic', name: 'lbWakB');
  }

  String get lbPerM {
    return Intl.message('Per month', name: 'lbPerM');
  }

  String get lbCustonC {
    return Intl.message('Custom Cover Photo', name: 'lbCustonC');
  }

  String get lbBook {
    return Intl.message('Project Bookmarks', name: 'lbBook');
  }

  String get lbOfferF {
    return Intl.message('50 Offers per Month', name: 'lbOfferF');
  }

  String get lbGo {
    return Intl.message('Go Basic', name: 'lbGo');
  }

  String get lbPP {
    return Intl.message('Privacy Policy', name: 'lbPP');
  }

  String get lbPPM {
    return Intl.message('Our privacy policy to view', name: 'lbPPM');
  }

  String get lbT {
    return Intl.message('Terms & Conditions', name: 'lbT');
  }

  String get lbTm {
    return Intl.message('Our terms & conditions to view', name: 'lbTm');
  }

  String get lbWith {
    return Intl.message('Withdrawals', name: 'lbWith');
  }

  String get lbWithReq {
    return Intl.message('Withdrawal Request', name: 'lbWithReq');
  }

  String get lbPaidOn {
    return Intl.message('Paid on', name: 'lbPaidOn');
  }

  String get lbConf {
    return Intl.message('Confirmed', name: 'lbConf');
  }

  String get lbPending {
    return Intl.message('Pending', name: 'lbPending');
  }

  String get lbRejected {
    return Intl.message('Rejected', name: 'lbRejected');
  }

  String get lbREqWN {
    return Intl.message('Request New Withdrawal', name: 'lbREqWN');
  }

  String get lbWithCash {
    return Intl.message('Withdraw Cash', name: 'lbWithCash');
  }

  String get lbWithA {
    return Intl.message('Withdrawal Amount', name: 'lbWithA');
  }

  String get lbWithM {
    return Intl.message('Withdrawal Method', name: 'lbWithM');
  }

  String get lbBankA {
    return Intl.message('Bank Account', name: 'lbBankA');
  }

  String get lbABankA {
    return Intl.message('Add Bank Account', name: 'lbABankA');
  }

  String get lbWithSuccess {
    return Intl.message('Withdrawal Requested', name: 'lbWithSuccess');
  }

  String get lbWithSuccessMsg {
    return Intl.message('You\'ve successfully submitted a request for withdrawal ', name: 'lbWithSuccessMsg');
  }

  String get lbWithCheck {
    return Intl.message('Check Withdrawals ', name: 'lbWithCheck');
  }


//and add all the text you have inside the app that you need to make it in

//arabic and english launguages

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return false;
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<_DefaultCupertinoLocalizations>(
          _DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
