import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'ProPix8'**
  String get appTitle;

  /// Label for the posts section
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// Title shown when there is no internet connection
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternetTitle;

  /// Subtitle shown when there is no internet connection
  ///
  /// In en, this message translates to:
  /// **'Please check your connection and try again.'**
  String get noInternetSubtitle;

  /// Label for the try again button
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgainText;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error;

  /// Message shown when no data is available
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// Button text to start the onboarding flow
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get startNow;

  /// Label for the next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Label for the back button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Label for the skip button in onboarding
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Title for the first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Start now and discover your ideal unit'**
  String get onboardingTitle1;

  /// Subtitle for the first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Browse units easily and save your favorites'**
  String get onboardingSubtitle1;

  /// Title for the second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'View units for sale or rent quickly and easily'**
  String get onboardingTitle2;

  /// Subtitle for the second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Search easily, choose quickly'**
  String get onboardingSubtitle2;

  /// Title for the third onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Discover the best properties in your area easily and quickly'**
  String get onboardingTitle3;

  /// Subtitle for the third onboarding screen
  ///
  /// In en, this message translates to:
  /// **'All options in one place'**
  String get onboardingSubtitle3;

  /// Title for the login screen and label for the login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Title for the signup screen
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// Label for the contact us section
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsSection;

  /// Success message after sending contact request
  ///
  /// In en, this message translates to:
  /// **'Your request has been sent successfully'**
  String get contactUsSuccess;

  /// Label for the send request button
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// Label for the signup button
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signup_Button;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label for the full name input field
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get name;

  /// Label for the phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// Label for the address input field
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Label for the city input field
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Label for the date selection
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Label for the time selection
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Label for the delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Label for the approval button
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// Title for the delete booking confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete Booking'**
  String get deleteBooking;

  /// Message for the delete booking confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this booking permanently?'**
  String get deleteBookingConfirmation;

  /// Success message after deleting a booking
  ///
  /// In en, this message translates to:
  /// **'Booking deleted successfully'**
  String get bookingDeletedSuccess;

  /// Label for the suggested date
  ///
  /// In en, this message translates to:
  /// **'Suggested Date'**
  String get suggestedDate;

  /// Label for the suggested time
  ///
  /// In en, this message translates to:
  /// **'Suggested Time'**
  String get suggestedTime;

  /// Label for the admin notes section
  ///
  /// In en, this message translates to:
  /// **'Admin Notes'**
  String get adminNotes;

  /// Label for the user message
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get yourMessage;

  /// Status label for pending booking
  ///
  /// In en, this message translates to:
  /// **'Pending Confirmation'**
  String get statusPending;

  /// Status label for confirmed booking
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// Status label when admin suggests a new time
  ///
  /// In en, this message translates to:
  /// **'Admin Suggested New Time'**
  String get statusRescheduleAdmin;

  /// Status label for cancelled booking
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// Confirmation message for suggested time
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to approve the suggested time?'**
  String get confirmSuggestedTime;

  /// Button label to approve suggested time
  ///
  /// In en, this message translates to:
  /// **'Approve Suggested Time'**
  String get approveSuggestedTime;

  /// Success message after accepting suggested time
  ///
  /// In en, this message translates to:
  /// **'Suggested time accepted successfully'**
  String get suggestedTimeAccepted;

  /// Button label to suggest another time
  ///
  /// In en, this message translates to:
  /// **'Suggest Another Time'**
  String get suggestAnotherTime;

  /// Button label to edit booking time
  ///
  /// In en, this message translates to:
  /// **'Edit Booking Time'**
  String get editBookingTime;

  /// Success message after sending new time suggestion
  ///
  /// In en, this message translates to:
  /// **'New time suggestion sent'**
  String get newTimeSuggestionSent;

  /// Title for cancellation confirmation
  ///
  /// In en, this message translates to:
  /// **'Confirm Cancellation'**
  String get confirmCancellation;

  /// Message for cancellation confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this booking? This action cannot be undone.'**
  String get cancelBookingConfirmation;

  /// Button label to cancel booking
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking'**
  String get cancelBooking;

  /// Success message after cancelling a booking
  ///
  /// In en, this message translates to:
  /// **'Booking Cancelled'**
  String get bookingCancelled;

  /// Button label or prompt to select a date
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// Button label or prompt to select a time
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// Validation error message for missing date
  ///
  /// In en, this message translates to:
  /// **'Please select a date'**
  String get pleaseSelectDate;

  /// Validation error message for missing time
  ///
  /// In en, this message translates to:
  /// **'Please select a time'**
  String get pleaseSelectTime;

  /// Validation error message for past time selection
  ///
  /// In en, this message translates to:
  /// **'Selected time has passed, please select a future time'**
  String get pastTimeError;

  /// Label for optional message field
  ///
  /// In en, this message translates to:
  /// **'Message (Optional)'**
  String get messageOptional;

  /// Placeholder for message input field
  ///
  /// In en, this message translates to:
  /// **'Write your message here...'**
  String get messagePlaceholder;

  /// Button label to send a suggestion
  ///
  /// In en, this message translates to:
  /// **'Send Suggestion'**
  String get sendSuggestion;

  /// Label for the confirm password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Label for the forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Label for the registration prompt
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Label for the login prompt
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Label for the send reset email button
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// Message shown after sending reset link
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent to your email'**
  String get passwordResetConfirmation;

  /// Label for password strength indicator
  ///
  /// In en, this message translates to:
  /// **'Password Strength'**
  String get passwordStrength;

  /// Label for weak password strength
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get weak;

  /// Label for fair password strength
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get fair;

  /// Label for good password strength
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// Label for strong password strength
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strong;

  /// Label for terms and conditions checkbox
  ///
  /// In en, this message translates to:
  /// **'I agree to the terms & conditions'**
  String get agreeToTerms;

  /// Validation error for required fields
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// Validation error for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmail;

  /// Validation error for short password
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordTooShort;

  /// Validation error for short password
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength6;

  /// Validation error for mismatched passwords
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// Success message after login
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get loginSuccess;

  /// Success message after signup
  ///
  /// In en, this message translates to:
  /// **'Account created successfully please verify your email to login'**
  String get signupSuccess;

  /// Success message after password reset
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get resetSuccess;

  /// Instruction to enter new password
  ///
  /// In en, this message translates to:
  /// **'Enter your new password below'**
  String get enterNewPassword;

  /// Label for reset token input
  ///
  /// In en, this message translates to:
  /// **'Reset Token'**
  String get token;

  /// Title for terms and conditions screen
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// Section title for payment schedule
  ///
  /// In en, this message translates to:
  /// **'1. Payment Schedule'**
  String get paymentSchedule;

  /// Content for payment schedule section
  ///
  /// In en, this message translates to:
  /// **'- 100% of the total amount must be paid at the time of booking\n- Remaining balance: due later'**
  String get paymentScheduleContent;

  /// Section title for cancellation policy
  ///
  /// In en, this message translates to:
  /// **'2. Cancellation Policy'**
  String get cancellationPolicy;

  /// Content for cancellation policy section
  ///
  /// In en, this message translates to:
  /// **'- 75% of pre-paid payments are refundable when canceled 41 days or more before arrival\n- 50% of pre-paid payments are refundable when canceled 21 days or more before arrival\n- 0% refundable if canceled after that'**
  String get cancellationPolicyContent;

  /// Section title for security deposit
  ///
  /// In en, this message translates to:
  /// **'3. Security Deposit'**
  String get securityDeposit;

  /// Content for security deposit section
  ///
  /// In en, this message translates to:
  /// **'- A refundable security deposit of 25% must be paid'**
  String get securityDepositContent;

  /// Section title for additional notes
  ///
  /// In en, this message translates to:
  /// **'4. Notes'**
  String get notes;

  /// Content for additional notes section
  ///
  /// In en, this message translates to:
  /// **'- 5% discount for stays of 14 nights or more\n- 10% discount for stays of 30 nights or more'**
  String get notesContent;

  /// First part of the terms agreement text
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get agreeToTermsPart1;

  /// Second part of the terms agreement text (linked)
  ///
  /// In en, this message translates to:
  /// **'terms & conditions'**
  String get agreeToTermsPart2;

  /// Title for the password reset success screen
  ///
  /// In en, this message translates to:
  /// **'Password Changed'**
  String get resetPasswordSuccessTitle;

  /// Subtitle for the password reset success screen
  ///
  /// In en, this message translates to:
  /// **'Your password has been changed successfully'**
  String get resetPasswordSuccessSubtitle;

  /// Instructional text on the forgot password screen
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we will send you a link to reset your password'**
  String get forgotPasswordSubtitle;

  /// Title for the reset password screen
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Instructional text on the reset password screen
  ///
  /// In en, this message translates to:
  /// **'Please write a password you can easily remember'**
  String get resetPasswordSubtitle;

  /// Label for the change password button
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Title for the complete profile screen
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get completeProfile;

  /// Label for city selection dropdown
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// Label for displaying the selected address
  ///
  /// In en, this message translates to:
  /// **'Selected Address: {address}'**
  String selectedAddress(String address);

  /// Label for the submit profile button
  ///
  /// In en, this message translates to:
  /// **'Submit Profile'**
  String get submitProfile;

  /// Success message after updating profile
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdateSuccess;

  /// Error message when profile update fails
  ///
  /// In en, this message translates to:
  /// **'An error occurred while updating profile'**
  String get profileUpdateError;

  /// Error message when city or location is not selected
  ///
  /// In en, this message translates to:
  /// **'Please select a city and a location on the map.'**
  String get selectLocationError;

  /// Button text to start exploring
  ///
  /// In en, this message translates to:
  /// **'Start Exploring Now'**
  String get startExploring;

  /// Label for buy option
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// Label for rent option
  ///
  /// In en, this message translates to:
  /// **'For Rent'**
  String get rent;

  /// Title for location details section
  ///
  /// In en, this message translates to:
  /// **'Location Details'**
  String get locationDetails;

  /// Label for all categories option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Label for apartments category
  ///
  /// In en, this message translates to:
  /// **'Apartments'**
  String get apartments;

  /// Label for villas category
  ///
  /// In en, this message translates to:
  /// **'Villas'**
  String get villas;

  /// Label for houses category
  ///
  /// In en, this message translates to:
  /// **'Houses'**
  String get houses;

  /// Title for nearby properties section on home screen
  ///
  /// In en, this message translates to:
  /// **'Nearby Properties'**
  String get nearbyProperties;

  /// Title for latest properties section on home screen
  ///
  /// In en, this message translates to:
  /// **'Latest Properties'**
  String get latestProperties;

  /// Title for all properties section on home screen
  ///
  /// In en, this message translates to:
  /// **'All Properties'**
  String get allProperties;

  /// Label for 'See All' button
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// Message shown when no properties are found
  ///
  /// In en, this message translates to:
  /// **'No properties found'**
  String get noPropertiesFound;

  /// Label for resend verification button
  ///
  /// In en, this message translates to:
  /// **'Resend Verification'**
  String get resendVerification;

  /// Message shown when verification email is sent
  ///
  /// In en, this message translates to:
  /// **'Verification link has been sent to your email'**
  String get verificationEmailSent;

  /// Message shown when email is verified successfully
  ///
  /// In en, this message translates to:
  /// **'Email verified successfully'**
  String get verificationSuccess;

  /// Error message for unverified account login attempt
  ///
  /// In en, this message translates to:
  /// **'Your account is not verified. Please verify your email to login.'**
  String get accountNotVerified;

  /// Loading text for email verification
  ///
  /// In en, this message translates to:
  /// **'Verifying Email...'**
  String get verifyingEmail;

  /// Success text for email verification
  ///
  /// In en, this message translates to:
  /// **'Email verified successfully'**
  String get emailVerified;

  /// Label for home navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Label for services navigation item
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get navServices;

  /// Label for favorites navigation item
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// Title shown when there are no favorite properties
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesTitle;

  /// Subtitle shown when there are no favorite properties
  ///
  /// In en, this message translates to:
  /// **'Start adding properties to your favorites to see them here.'**
  String get noFavoritesSubtitle;

  /// Label for profile navigation item
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// Title for filter screen
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Label for reset button
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Label for location section
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Placeholder text for location search input
  ///
  /// In en, this message translates to:
  /// **'Search for apartment, house, ........'**
  String get searchLocationPlaceholder;

  /// Label for price range section
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// Label for property specifications section
  ///
  /// In en, this message translates to:
  /// **'Property Specifications'**
  String get propertySpecs;

  /// Label for bedrooms counter
  ///
  /// In en, this message translates to:
  /// **'Bedrooms'**
  String get bedrooms;

  /// Label for bathrooms counter
  ///
  /// In en, this message translates to:
  /// **'Bathrooms'**
  String get bathrooms;

  /// Label for rooms counter
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get rooms;

  /// Label for unit area section
  ///
  /// In en, this message translates to:
  /// **'Unit Area'**
  String get unitArea;

  /// Label for apply button
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Label for 'from' range
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// Label for 'to' range
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// Title for unit details section
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get unitDetails;

  /// Title for description section
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Title for map location section
  ///
  /// In en, this message translates to:
  /// **'Location on Map'**
  String get mapLocation;

  /// Title for virtual tour section
  ///
  /// In en, this message translates to:
  /// **'Virtual Tour'**
  String get virtualTour;

  /// Label for compound field
  ///
  /// In en, this message translates to:
  /// **'Compound'**
  String get compound;

  /// Label for developer field
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// Title for floor plan section
  ///
  /// In en, this message translates to:
  /// **'Floor Plan'**
  String get floorPlan;

  /// Title for amenities section
  ///
  /// In en, this message translates to:
  /// **'Amenities'**
  String get amenities;

  /// Label for garages field
  ///
  /// In en, this message translates to:
  /// **'Garages'**
  String get garages;

  /// Label for land area field
  ///
  /// In en, this message translates to:
  /// **'Land Area'**
  String get landArea;

  /// Label for internal area field
  ///
  /// In en, this message translates to:
  /// **'Internal Area'**
  String get internalArea;

  /// Label for the unit sale status
  ///
  /// In en, this message translates to:
  /// **'Offer Type: '**
  String get saleStatusLabel;

  /// Label for sale offer type
  ///
  /// In en, this message translates to:
  /// **'For Sale'**
  String get sale;

  /// Symbol for square meters
  ///
  /// In en, this message translates to:
  /// **'m²'**
  String get meterSquared;

  /// Label for build year field
  ///
  /// In en, this message translates to:
  /// **'Build Year'**
  String get buildYear;

  /// Label for reserve now button
  ///
  /// In en, this message translates to:
  /// **'Reserve Now'**
  String get reserveNow;

  /// Label for already booked status
  ///
  /// In en, this message translates to:
  /// **'You have already booked this unit'**
  String get alreadyBooked;

  /// Label for send message button
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// Hint text to tap map to interact
  ///
  /// In en, this message translates to:
  /// **'Tap to interact with the map'**
  String get tapToInteract;

  /// Label for related units section
  ///
  /// In en, this message translates to:
  /// **'Related Units'**
  String get relatedUnits;

  /// Label for properties count
  ///
  /// In en, this message translates to:
  /// **'Number of Properties: {count}'**
  String propertiesCount(int count);

  /// Success message after successful booking
  ///
  /// In en, this message translates to:
  /// **'Booking submitted successfully!'**
  String get bookingSuccess;

  /// Title for the bookings screen
  ///
  /// In en, this message translates to:
  /// **'My Bookings'**
  String get myBookings;

  /// Title shown when there are no bookings
  ///
  /// In en, this message translates to:
  /// **'No bookings yet'**
  String get noBookingsTitle;

  /// Subtitle shown when there are no bookings
  ///
  /// In en, this message translates to:
  /// **'You haven\'t made any property bookings. Explore properties and start booking today!'**
  String get noBookingsSubtitle;

  /// Label for reviews section
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// Label for submit review button
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submitReview;

  /// Placeholder for review comment
  ///
  /// In en, this message translates to:
  /// **'Write a comment...'**
  String get writeComment;

  /// Success message for review submission
  ///
  /// In en, this message translates to:
  /// **'Review submitted successfully'**
  String get reviewSubmittedSuccess;

  /// Success message for review update
  ///
  /// In en, this message translates to:
  /// **'Review updated successfully'**
  String get reviewUpdatedSuccess;

  /// Success message for review deletion
  ///
  /// In en, this message translates to:
  /// **'Review deleted successfully'**
  String get reviewDeletedSuccess;

  /// Error message for review submission
  ///
  /// In en, this message translates to:
  /// **'Failed to submit review'**
  String get reviewSubmissionError;

  /// Label for edit review option
  ///
  /// In en, this message translates to:
  /// **'Edit Review'**
  String get editReview;

  /// Label for update review button
  ///
  /// In en, this message translates to:
  /// **'Update Review'**
  String get updateReview;

  /// Label for add review button
  ///
  /// In en, this message translates to:
  /// **'Add Review'**
  String get addReview;

  /// Label for view all reviews button
  ///
  /// In en, this message translates to:
  /// **'View All Reviews'**
  String get viewAllReviews;

  /// Label for contact owner button
  ///
  /// In en, this message translates to:
  /// **'Contact Owner'**
  String get contactOwner;

  /// Label for message input
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// Success message for sending message
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully'**
  String get messageSuccess;

  /// Error message for sending message
  ///
  /// In en, this message translates to:
  /// **'Failed to send message'**
  String get messageFailure;

  /// Title for contact owner dialog
  ///
  /// In en, this message translates to:
  /// **'Contact Unit Owner'**
  String get contactOwnerTitle;

  /// Label for send button
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Title for delete review confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete Review'**
  String get deleteReviewConfirmationTitle;

  /// Content for delete review confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this review?'**
  String get deleteReviewConfirmationContent;

  /// Label for confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Label for cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Label for rating
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// Label for review text
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// Error message for a required field
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// Title for Our Services screen
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get ourServices;

  /// Title for FAQs screen
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqs;

  /// Title for Our Profile screen
  ///
  /// In en, this message translates to:
  /// **'Our Profile'**
  String get ourProfile;

  /// Placeholder text for coming soon screens
  ///
  /// In en, this message translates to:
  /// **'Coming Soon: {title}'**
  String comingSoon(String title);

  /// Title for home maintenance services section
  ///
  /// In en, this message translates to:
  /// **'Home Maintenance Services'**
  String get homeMaintenanceServices;

  /// Title for technical maintenance services section
  ///
  /// In en, this message translates to:
  /// **'Technical Maintenance Services'**
  String get technicalMaintenanceServices;

  /// Label for book now button
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// Error message when phone is missing
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneRequired;

  /// Error message for invalid phone
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalidPhoneNumber;

  /// Error message when address is missing
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get addressRequired;

  /// Title for booking form
  ///
  /// In en, this message translates to:
  /// **'Booking request for'**
  String get bookingFor;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// Message to prompt user to press again to exit
  ///
  /// In en, this message translates to:
  /// **'Press again to exit'**
  String get pressAgainToExit;

  /// Title for exit app confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitAppConfirmationTitle;

  /// Content for exit app confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit the app?'**
  String get exitAppConfirmationMessage;

  /// Label for exit button
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// Label for property type section
  ///
  /// In en, this message translates to:
  /// **'Property Type'**
  String get propertyType;

  /// Label for development status section
  ///
  /// In en, this message translates to:
  /// **'Development Status'**
  String get developmentStatus;

  /// Label for primary development status
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get primary;

  /// Label for resale development status
  ///
  /// In en, this message translates to:
  /// **'Resale'**
  String get resale;

  /// Title for the maintenance bookings section
  ///
  /// In en, this message translates to:
  /// **'Maintenance Bookings'**
  String get maintenanceBookings;

  /// Title shown when there are no maintenance bookings
  ///
  /// In en, this message translates to:
  /// **'No maintenance bookings yet'**
  String get noMaintenanceBookingsTitle;

  /// Subtitle shown when there are no maintenance bookings
  ///
  /// In en, this message translates to:
  /// **'You haven\'t made any maintenance service bookings. Explore our services and start booking today!'**
  String get noMaintenanceBookingsSubtitle;

  /// Title for privacy policy screen
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Introduction text for privacy policy
  ///
  /// In en, this message translates to:
  /// **'Welcome to Propix Eight Group for Real Estate Marketing & Property Solutions. We respect your privacy and represent our commitment to protecting your personal data.'**
  String get privacyPolicyIntro;

  /// Title for data collection section
  ///
  /// In en, this message translates to:
  /// **'1. Data Collection'**
  String get dataCollection;

  /// Content for data collection section
  ///
  /// In en, this message translates to:
  /// **'We collect information you provide directly to us, such as when you create an account, update your profile, make a booking, or communicate with us. This may include your name, email, phone number, and payment information.'**
  String get dataCollectionContent;

  /// Title for use of data section
  ///
  /// In en, this message translates to:
  /// **'2. Use of Data'**
  String get useOfData;

  /// Content for use of data section
  ///
  /// In en, this message translates to:
  /// **'We use your data to provide and improve our services, process transactions, send you notifications, and communicate with you about updates and offers.'**
  String get useOfDataContent;

  /// Title for data retention section
  ///
  /// In en, this message translates to:
  /// **'3. Data Retention'**
  String get dataRetention;

  /// Content for data retention section
  ///
  /// In en, this message translates to:
  /// **'We retain your personal data only as long as necessary to provide you with our services and for legitimate business purposes.'**
  String get dataRetentionContent;

  /// Title for data deletion section
  ///
  /// In en, this message translates to:
  /// **'4. Data Deletion'**
  String get dataDeletion;

  /// Content for data deletion section
  ///
  /// In en, this message translates to:
  /// **'You can request the deletion of your account and personal data at any time by contacting us or using the delete account option in your profile settings.'**
  String get dataDeletionContent;

  /// Title for security section
  ///
  /// In en, this message translates to:
  /// **'5. Security'**
  String get security;

  /// Content for security section
  ///
  /// In en, this message translates to:
  /// **'We implement appropriate technical and organizational measures to protect your personal data against unauthorized access, loss, or misuse.'**
  String get securityContent;

  /// Title for location information section
  ///
  /// In en, this message translates to:
  /// **'6. Location Information'**
  String get locationInformation;

  /// Content for location information section
  ///
  /// In en, this message translates to:
  /// **'We may use your location data to help you find nearby properties and services. This data is used to improve your search experience and is not shared with third parties without your consent.'**
  String get locationInformationContent;

  /// Title for changes to policy section
  ///
  /// In en, this message translates to:
  /// **'7. Changes to Policy'**
  String get changesToPolicy;

  /// Content for changes to policy section
  ///
  /// In en, this message translates to:
  /// **'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.'**
  String get changesToPolicyContent;

  /// Title for contact us section
  ///
  /// In en, this message translates to:
  /// **' Contact Us'**
  String get contactUs;

  /// Content for contact us section
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about this privacy policy, please contact us at support@propix8.com.'**
  String get contactUsContent;

  /// Title for the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Label for the appearance section in settings
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// Label for the language selection in settings
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Label for the system theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Label for the light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Label for the dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// Label for English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Label for Arabic language option
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// Label for the theme selection dialog
  ///
  /// In en, this message translates to:
  /// **'Choose Theme'**
  String get chooseTheme;

  /// Label for the language selection dialog
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// Title for restart required dialog
  ///
  /// In en, this message translates to:
  /// **'Restart Required'**
  String get restartRequired;

  /// Message for restart required dialog
  ///
  /// In en, this message translates to:
  /// **'The app will restart to apply the new language. Do you want to continue?'**
  String get restartRequiredMessage;

  /// Label for the restart button
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// Title for the developers section
  ///
  /// In en, this message translates to:
  /// **'Developers'**
  String get developers;

  /// Message shown when no developers are found
  ///
  /// In en, this message translates to:
  /// **'No developers found'**
  String get noDevelopers;

  /// Label for the retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Title for edit profile screen
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Label for property bookings section
  ///
  /// In en, this message translates to:
  /// **'Property Bookings'**
  String get propertyBookings;

  /// Label for service bookings section
  ///
  /// In en, this message translates to:
  /// **'Service Bookings'**
  String get serviceBookings;

  /// Title for the compounds section
  ///
  /// In en, this message translates to:
  /// **'Compounds'**
  String get compounds;

  /// Label for the about us section
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// Label for the logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Message for the logout confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmationMessage;

  /// Title for edit password screen
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get editPassword;

  /// Success message after updating password
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully'**
  String get updatePasswordSuccess;

  /// Label for current password input field
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// Label for new password input field
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Label for confirm new password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// Title for edit account screen
  ///
  /// In en, this message translates to:
  /// **'Edit Account'**
  String get editAccount;

  /// Label for edit data section
  ///
  /// In en, this message translates to:
  /// **'Edit Details'**
  String get editData;

  /// Label for the delete account button
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// Message for the delete account confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get deleteAccountConfirmationMessage;

  /// Warning message for delete account action
  ///
  /// In en, this message translates to:
  /// **'All your data will be permanently deleted and cannot be recovered'**
  String get deleteAccountWarning;

  /// Button label to confirm account deletion
  ///
  /// In en, this message translates to:
  /// **'Yes, Delete My Account'**
  String get confirmDeleteAccount;

  /// Message shown when the compounds view is empty
  ///
  /// In en, this message translates to:
  /// **'No compounds available at the moment'**
  String get compounds_view_empty;

  /// Title for delete maintenance booking dialog
  ///
  /// In en, this message translates to:
  /// **'Delete Booking'**
  String get maintenance_bookings_card_deleteTitle;

  /// Confirmation message for deleting maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this booking?'**
  String get maintenance_bookings_card_deleteConfirmation;

  /// Success message after deleting a maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Booking deleted successfully'**
  String get maintenance_bookings_card_deleteSuccess;

  /// Title for edit maintenance booking dialog
  ///
  /// In en, this message translates to:
  /// **'Edit Booking'**
  String get maintenance_bookings_card_editTitle;

  /// Success message after editing a maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Booking edited successfully'**
  String get maintenance_bookings_card_editSuccess;

  /// Button label to edit maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Edit Booking Details'**
  String get maintenance_bookings_card_editButton;

  /// Label for the message in maintenance booking card
  ///
  /// In en, this message translates to:
  /// **'Message:'**
  String get maintenance_bookings_card_messageLabel;

  /// Status label for pending maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get maintenance_bookings_status_pending;

  /// Status label for contacted maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Contacted'**
  String get maintenance_bookings_status_contacted;

  /// Status label for completed maintenance booking
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get maintenance_bookings_status_done;

  /// Unit label for area
  ///
  /// In en, this message translates to:
  /// **'m²'**
  String get unit_specs_area_unit;

  /// Label for rooms count in unit specs
  ///
  /// In en, this message translates to:
  /// **'Rooms'**
  String get unit_specs_rooms;

  /// Label for bathrooms count in unit specs
  ///
  /// In en, this message translates to:
  /// **'Bathrooms'**
  String get unit_specs_bathrooms;

  /// Label for primary unit type
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get unit_type_primary;

  /// Label for resale unit type
  ///
  /// In en, this message translates to:
  /// **'Resale'**
  String get unit_type_resale;

  /// Label for EGP currency
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get currency_egp;

  /// Title for the maintenance services banner
  ///
  /// In en, this message translates to:
  /// **'Integrated property management and maintenance services'**
  String get maintenance_banner_title;

  /// Subtitle for the maintenance services banner
  ///
  /// In en, this message translates to:
  /// **'Reliable solutions that support your property value and facilitate its management.'**
  String get maintenance_banner_subtitle;

  /// Label for booking date in unit details
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get unit_details_booking_date;

  /// Label for booking time in unit details
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get unit_details_booking_time;

  /// Label for booking notes in unit details
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get unit_details_booking_notes;

  /// Label for guest user
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guest_user;

  /// Title for the team members section
  ///
  /// In en, this message translates to:
  /// **'Team Members'**
  String get teamMembers;

  /// Label for the team member position
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// Title for the statistics section
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No data found
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get noDataFound;

  /// Label for the show more button
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// Label for the show less button
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// Success message after deleting an account
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get accountDeletedSuccess;

  /// Label for unit status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get unitStatus;

  /// Label for sold status
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get status_sold;

  /// Label for rented status
  ///
  /// In en, this message translates to:
  /// **'Rented'**
  String get status_rented;

  /// Label for available status
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get status_available;

  /// Label for approved status
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get status_approved;

  /// Title for choose product screen
  ///
  /// In en, this message translates to:
  /// **'Choose Product to Compare'**
  String get chooseProductTitle;

  /// Title for comparison screen
  ///
  /// In en, this message translates to:
  /// **'Product Comparison'**
  String get comparisonTitle;

  /// Message when no products are available to compare
  ///
  /// In en, this message translates to:
  /// **'No products available for comparison'**
  String get noProductsToCompare;

  /// Hint text for product selection
  ///
  /// In en, this message translates to:
  /// **'Please select a product to compare with'**
  String get selectProductHint;

  /// Compare action button label
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compare;

  /// Label for price per square meter
  ///
  /// In en, this message translates to:
  /// **'Price / m²'**
  String get pricePerM2;

  /// Error message for network issues
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get networkError;

  /// Error message when booking update fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update booking'**
  String get failedToUpdateBooking;

  /// Placeholder for home service name
  ///
  /// In en, this message translates to:
  /// **'Home Service Name'**
  String get homeServicePlaceholder;

  /// Placeholder for technical service name
  ///
  /// In en, this message translates to:
  /// **'Technical Service Name'**
  String get technicalServicePlaceholder;

  /// Placeholder for category
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryPlaceholder;

  /// Success message when testimonial is added
  ///
  /// In en, this message translates to:
  /// **'Testimonial added successfully'**
  String get testimonialAdded;

  /// Error message when testimonial addition fails
  ///
  /// In en, this message translates to:
  /// **'Failed to add testimonial'**
  String get failedToAddTestimonial;

  /// Success message when testimonial is updated
  ///
  /// In en, this message translates to:
  /// **'Testimonial updated successfully'**
  String get testimonialUpdated;

  /// Error message when testimonial update fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update testimonial'**
  String get failedToUpdateTestimonial;

  /// Success message when testimonial is deleted
  ///
  /// In en, this message translates to:
  /// **'Testimonial deleted successfully'**
  String get testimonialDeleted;

  /// Error message when testimonial deletion fails
  ///
  /// In en, this message translates to:
  /// **'Failed to delete testimonial'**
  String get failedToDeleteTestimonial;

  /// Title for edit testimonial sheet
  ///
  /// In en, this message translates to:
  /// **'Edit Testimonial'**
  String get editTestimonial;

  /// Title for add testimonial sheet
  ///
  /// In en, this message translates to:
  /// **'Add Testimonial'**
  String get addTestimonial;

  /// Placeholder for testimonial content field
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts...'**
  String get shareThoughts;

  /// Label for update button
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Label for submit button
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Title for delete confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Delete Testimonial'**
  String get deleteTestimonial;

  /// Message for delete confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this testimonial?'**
  String get deleteConfirmation;

  /// Label for edit option
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Fallback content for testimonial
  ///
  /// In en, this message translates to:
  /// **'Great service! Highly recommended.'**
  String get fallbackTestimonial;

  /// Placeholder for service name
  ///
  /// In en, this message translates to:
  /// **'Service Name Placeholder'**
  String get servicePlaceholder;

  /// Placeholder for service description
  ///
  /// In en, this message translates to:
  /// **'This is a lengthy description placeholder to simulate the visual weight of the text in the card.'**
  String get serviceDescriptionPlaceholder;

  /// Placeholder for faq question
  ///
  /// In en, this message translates to:
  /// **'Common Question Placeholder?'**
  String get faqQuestionPlaceholder;

  /// Placeholder for faq answer
  ///
  /// In en, this message translates to:
  /// **'This is a detailed answer placeholder to ensure the skeleton looks realistic. It spans multiple lines.'**
  String get faqAnswerPlaceholder;

  /// Title for testimonials section
  ///
  /// In en, this message translates to:
  /// **'Testimonials'**
  String get testimonials;

  /// Title for my testimonials view
  ///
  /// In en, this message translates to:
  /// **'My Testimonials'**
  String get myTestimonials;

  /// Loading content text for skeletons
  ///
  /// In en, this message translates to:
  /// **'Loading content...'**
  String get loadingContent;

  /// Empty state message for testimonials
  ///
  /// In en, this message translates to:
  /// **'No testimonials yet.'**
  String get noTestimonialsYet;

  /// Text displayed for unauthenticated users
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get guestUser;

  /// Placeholder email for unauthenticated users
  ///
  /// In en, this message translates to:
  /// **'guest@example.com'**
  String get guestEmail;

  /// Label for the save changes button
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// Message shown when no search results are found
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get no_results;

  /// Placeholder for property search input
  ///
  /// In en, this message translates to:
  /// **'Search for property...'**
  String get searchPropertyPlaceholder;

  /// Title for the search screen
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_title;

  /// Initial title displayed on search screen
  ///
  /// In en, this message translates to:
  /// **'Find your dream home'**
  String get search_start_title;

  /// Initial subtitle displayed on search screen
  ///
  /// In en, this message translates to:
  /// **'Search for units, compounds, or developers'**
  String get search_start_subtitle;

  /// Label for search results section
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get search_results;

  /// Label for already booked service
  ///
  /// In en, this message translates to:
  /// **'Already Booked'**
  String get serviceBooked;

  /// Title for bookings group in profile
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get profileGroupBookings;

  /// Title for discover group in profile
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get profileGroupDiscover;

  /// Title for general group in profile
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get profileGroupGeneral;

  /// Title for settings group in profile
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileGroupSettings;

  /// Success message when a unit is added to favorites
  ///
  /// In en, this message translates to:
  /// **'Added to favorites'**
  String get addedToFavorites;

  /// Success message when a unit is removed from favorites
  ///
  /// In en, this message translates to:
  /// **'Removed from favorites'**
  String get removedFromFavorites;

  /// No description provided for @failedToUpdateFavorite.
  ///
  /// In en, this message translates to:
  /// **'Failed to update favorite'**
  String get failedToUpdateFavorite;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
