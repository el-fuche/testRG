//
//  ObjCMethodsPjsip.h
//  rogerVoiceTest
//
//  Created by Adadémey Marvin on 20/01/2019.
//  Copyright © 2019 Adadémey Marvin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PJ : NSObject

typedef void (^RegisterCallBack)(BOOL success);

+ (PJ *)sharedPJ;

- (int)startPjsipAndRegisterOnServer:(char *) domain
                        withUserName:(char *) username
                         andPassword:(char *) pass;

-(void)makeCall:(char*)uri;

-(void)endCall;

@end



@protocol MyDelegate <NSObject>


@required
+ (void)callIncoming;

@end

@interface ObjCMethodsPjsip : NSObject
@property (nonatomic, weak) id<MyDelegate> delegate;


@end


