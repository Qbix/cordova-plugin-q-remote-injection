//
//  QWKWebViewEngine.m
//  QbixCordovaApp
//
//  Created by adventis on 19.02.2020.
//

#import "QWKWebViewEngine.h"

@interface QWKWebViewEngine()
@property(nonatomic, strong) QRemoteInjectionProvider* qRemoteInjectionProvider;
@end

@implementation QWKWebViewEngine

- (void)pluginInitialize {
    self.qRemoteInjectionProvider = [[QRemoteInjectionProvider alloc] init];
    [super pluginInitialize];
    
    WKWebView* wkWebView = (WKWebView*)[self engineWebView];
    NSString *jsToInject = [self.qRemoteInjectionProvider buildInjectionJS];
       WKUserScript *userScript = [[WKUserScript alloc] initWithSource:jsToInject injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];
    [wkWebView.configuration.userContentController addUserScript:userScript];
}

//- (WKUserContentController*) createController {
//    WKUserContentController* controller = [[WKUserContentController alloc] init];;
//   
//    [controller addUserScript:userScript];
//    return controller;
//}

- (void)userContentController:(WKUserContentController*)userContentController didReceiveScriptMessage:(WKScriptMessage*)message {
//    QResultEncryptManager *resultEncryptManager = [QResultEncryptManager sharedManager];
//    WKFrameInfo *info = message.frameInfo;
//    NSString *protocol = info.securityOrigin.protocol;
//    NSString *host = info.securityOrigin.host;
//    NSInteger port = info.securityOrigin.port;
//
//    NSString *origin = [NSString stringWithFormat:@"%@://%@:%ld", protocol, host, (long)port];
//    if(port == 0) {
//        origin = [NSString stringWithFormat:@"%@://%@", protocol, host];
//    }
//
//    NSLog(@"message domain: %@",info.securityOrigin.host);
//
//    NSArray* jsonEntry = message.body; // NSString:callbackId, NSString:service, NSString:action, NSArray:args
//    CDVInvokedUrlCommand* command = [CDVInvokedUrlCommand commandFromJson:jsonEntry];
//    NSString *callbackId = command.callbackId;
//    if([jsonEntry count] != 6) {
//        return;
//    }
//
//    NSString *encryptKey = [jsonEntry objectAtIndex:4];
//    NSString *encryptionIv = [jsonEntry objectAtIndex:5];
//    NSData *jsonData = [encryptKey dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *ivJsonData = [encryptionIv dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *error;
////    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//    if (error) {
//        return;
//    }
//
//    NSArray *ivObject = [NSJSONSerialization JSONObjectWithData:ivJsonData options:0 error:&error];
//    if (error) {
//        return;
//    }
//
////    JsonWebKey *jsonWebKey = [[JsonWebKey alloc] initWithDictionary:jsonObject andIV:ivObject];
//    JsonWebKey *jsonWebKey = [[JsonWebKey alloc] initWithRaw:jsonObject andIV:ivObject];
////
//    [resultEncryptManager setEncryptKey:jsonWebKey forCallback:callbackId andOrign:origin];
    [super userContentController:userContentController didReceiveScriptMessage:message];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
