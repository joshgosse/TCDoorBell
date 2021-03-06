//
//  TCConstants.h
//  TCDoorBell
//
//  Created by Joshua Gosse on 2012-10-15.
//  Copyright (c) 2012 Shopify. All rights reserved.
//

#define kTCCellIdentifier @"TCPeopleCollectionViewCell"

#pragma mark - Notifications

#define kTCApplicationDidReceiveUnlockNotification @"kTCApplicationDidReceiveUnlockNotification"

#pragma mark - Service

#define kTCKeyName			@"name"
#define kTCKeyPhoneNumber	@"phone_number"
#define kTCKeyPhotoURL		@"photo_url"

#pragma mark - Phidget Communication

#define kTCDoorURL @"http://10.11.21.229:4567"
#define kTCDoorEndPoint @"/open"
#define kTCDoorSecret @"i3V5ewReAYWAmzixf1CdSPgBp0NHL2tHCwvFYQdA0tUmJAf3YBoYfMXKtuCPK4r"

#pragma mark - Numeric

#define kTCNumericCellPadding			10.0f
#define kTCNumericCellWidth				240.0f
#define kTCNumericCellHeight			240.0f
#define kTCNumericSectionInset			12.0f
#define kTCNumericPeopleCellFontSize	24.0f
#define kTCNumericCellTextYOffset		6.0f

#pragma mark - Strings

#define kTCStringTextMessageBody		@"Someone is here to see you. Reply with 'UNLOCK' to let them in."
#define kTCStringMessageSendSuccess		@"Your message was sent successfully!"
#define kTCStringMessageSendFailure		@"There was a problem sending your text message!"

#pragma mark - Twilio API

// twilio API
#define kTCTwilioSMSURL @"https://%@:%@@api.twilio.com/2010-04-01/Accounts/%@/SMS/Messages.json"
#define kTCTwilioAppSID @"your_app_sid_here"
#define kTCTwilioAccountSID @"your_account_sid_here"
#define kTCTwilioAuthToken @"your_auth_token_here"
#define kTCTwilioLocalNumber @"your_twilio_number_here"

#define kTCKeyTwilioAccountSID @"account_sid"
#define kTCKeyTwilioAPIVersion @"api_version"
#define kTCKeyTwilioBody @"body"
#define kTCKeyTwilioDateCreated @"date_created"
#define kTCKeyTwilioDateSent @"date_sent"
#define kTCKeyTwilioDateUpdated @"date_updated"
#define kTCKeyTwilioDirection @"direction"
#define kTCKeyTwilioFrom @"from"
#define kTCKeyTwilioPrice @"price"
#define kTCKeyTwilioSID @"sid"
#define kTCKeyTwilioStatus @"status"
#define kTCKeyTwilioTo @"to"
#define kTCKeyTwilioURI @"uri"

