//
//  JSONModelHTTPClient.m
//
//  @version 0.8.4
//  @author Marin Todorov, http://www.touch-code-magazine.com
//

// Copyright (c) 2012 Marin Todorov, Underplot ltd.
// This code is distributed under the terms and conditions of the MIT license.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// The MIT License in plain English: http://www.touch-code-magazine.com/JSONModel/MITLicense

#import "JSONHTTPClient.h"

#pragma mark - constants
NSString * const kHTTPMethodGET = @"GET";
NSString * const kHTTPMethodPOST = @"POST";

#pragma mark - static variables

/**
 * Defaults for HTTP requests
 */
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
static int defaultTextEncoding = NSUTF8StringEncoding;
static int defaultCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
#else
static long defaultTextEncoding = NSUTF8StringEncoding;
static long defaultCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
#endif

static int defaultTimeoutInSeconds = 60;

/**
 * Whether the iPhone net indicator automatically shows when making requests
 */
static BOOL doesControlIndicator = YES;

/**
 * Custom HTTP headers to send over with *each* request
 */
static NSMutableDictionary* requestHeaders = nil;

#pragma mark - private methods
@interface JSONHTTPClient()
+(NSData*)syncRequestDataFromURL:(NSURL*)url method:(NSString*)method params:(NSDictionary*)params error:(NSError**)err;
+(NSData*)syncRequestDataFromURL:(NSURL*)url method:(NSString*)method requestBody:(NSString*)bodyString error:(NSError**)err;

+(void)setNetworkIndicatorVisible:(BOOL)isVisible;
@end

#pragma mark - implementation
@implementation JSONHTTPClient

#pragma mark - initialization
+(void)initialize
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        requestHeaders = [NSMutableDictionary dictionary];
    });
}

#pragma mark - configuration methods
+(NSMutableDictionary*)requestHeaders
{
    return requestHeaders;
}

+(void)setDefaultTextEncoding:(NSStringEncoding)encoding
{
    defaultTextEncoding = encoding;
}

+(void)setCachingPolicy:(NSURLRequestCachePolicy)policy
{
    defaultCachePolicy = policy;
}

+(void)setTimeoutInSeconds:(int)seconds
{
    defaultTimeoutInSeconds = seconds;
}

+(void)setControlsNetworkIndicator:(BOOL)does
{
    doesControlIndicator = does;
}

#pragma mark - convenience methods for requests
+(id)getJSONFromURLWithString:(NSString*)urlString error:(NSError**)err
{
    return [self JSONFromURLWithString:urlString method:kHTTPMethodGET params:nil orBodyString:nil error: err];
}

+(id)getJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params error:(NSError**)err
{
    return [self JSONFromURLWithString:urlString method:kHTTPMethodGET params:params orBodyString:nil error: err];
}

+(id)postJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params error:(NSError**)err
{
    return [self JSONFromURLWithString:urlString method:kHTTPMethodPOST params:params orBodyString:nil error: err];
}

+(id)postJSONFromURLWithString:(NSString*)urlString bodyString:(NSString*)bodyString error:(NSError**)err
{
    return [self JSONFromURLWithString:urlString method:kHTTPMethodPOST params:nil orBodyString:bodyString error: err];
}

#pragma mark - base request methods
+(id)JSONFromURLWithString:(NSString*)urlString method:(NSString*)method params:(NSDictionary*)params orBodyString:(NSString*)bodyString error:(NSError**)err
{
    //define local vars
    NSDictionary* json = nil;
    NSData* responseData = nil;
    
    if (bodyString) {
        //fetch data via request with given body (specific for POSTs)
        responseData = [self syncRequestDataFromURL: [NSURL URLWithString:urlString]
                                             method: method
                                        requestBody: bodyString
                                              error: err];
    } else {
        //fetch data via request with given dictionary with parameters
        responseData = [self syncRequestDataFromURL: [NSURL URLWithString:urlString]
                                             method: method
                                             params: params
                                              error: err];
    }
    
    JMLog(@"server response: %@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
    
    //check for valid data response
    if (responseData==nil) {
        if (err) *err = [JSONModelError errorBadResponse];
        return nil;
    }

    //try to get an object out of response data
    @try {
        json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
        NSAssert(json, nil);
    }
    @catch (NSException* e) {
        //no need to do anything, will return nil by default
        if (err) *err = [JSONModelError errorInvalidData];
    }
    
    return json;
}

+(NSData*)syncRequestDataFromURL:(NSURL*)url method:(NSString*)method requestBody:(NSString*)bodyString error:(NSError**)err
{
    //turn on network indicator
    if (doesControlIndicator) dispatch_async(dispatch_get_main_queue(), ^{[self setNetworkIndicatorVisible:YES];});

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url
                                                                cachePolicy: defaultCachePolicy
                                                            timeoutInterval: defaultTimeoutInSeconds];
	[request setHTTPMethod:method];
    
    if (bodyString) {
        //fetch the charset name from the default string encoding
        NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        [request addValue:[NSString stringWithFormat:@"application/json; charset=%@", charset]
       forHTTPHeaderField:@"Content-Type"];
    }
    
    //add all the custom headers defined
    for (NSString* key in [requestHeaders allKeys]) {
        [request addValue:requestHeaders[key] forHTTPHeaderField:key];
    }
    
    if (bodyString) {
        //BODY params
        NSData* bodyData = [bodyString dataUsingEncoding:defaultTextEncoding];
        
        [request setHTTPBody: bodyData];
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
        [request addValue:[NSString stringWithFormat:@"%i", [bodyData length]] forHTTPHeaderField:@"Content-Length"];
#else
        [request addValue:[NSString stringWithFormat:@"%ld", [bodyData length]] forHTTPHeaderField:@"Content-Length"];
#endif
        
    }
    
    //prepare output
	NSHTTPURLResponse* response = nil;
    
    //fire the request
	NSData *responseData = [NSURLConnection sendSynchronousRequest: request
                                                 returningResponse: &response
                                                             error: err];
    //turn off network indicator
    if (doesControlIndicator) dispatch_async(dispatch_get_main_queue(), ^{[self setNetworkIndicatorVisible:NO];});
    
    //check for successful status
	if ([response statusCode] >= 200 && [response statusCode] < 300) {
        //success
        return responseData;
	} else {
        //error, for now just return nil
        return nil;
    }
}

+(NSData*)syncRequestDataFromURL:(NSURL*)url method:(NSString*)method params:(NSDictionary*)params error:(NSError**)err
{
    //create the request body
    NSMutableString* paramsString = nil;
    if (params) {
        //build a simple url encoded param string
        paramsString = [NSMutableString stringWithString:@""];
        for (NSString* key in [params allKeys]) {
            [paramsString appendFormat:@"%@=%@&", key, [self urlEncode:params[key]] ];
        }
    }
    
    //request body
    NSString* requestBodyString = nil;
    
    //set the request params
    if ([method isEqualToString:kHTTPMethodPOST]) {
        requestBodyString = paramsString;
        
    } else if (paramsString) {
        //URL params
        url = [NSURL URLWithString:[NSString stringWithFormat:
                                    @"%@?%@", [url absoluteString], paramsString
                                    ]];
    }
    
    //call the more general synq request method
    return [self syncRequestDataFromURL:url method:method requestBody:requestBodyString error: err];
}

#pragma mark - helper methods
+(NSString*)urlEncode:(NSString*)string
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                 NULL,
                                                                                 (__bridge CFStringRef) string,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8));
}

#pragma mark - Async calls
+(void)JSONFromURLWithString:(NSString*)urlString method:(NSString*)method params:(NSDictionary*)params orBodyString:(NSString*)bodyString completion:(JSONObjectBlock)completeBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSDictionary* jsonObject = nil;
        JSONModelError* error = nil;
        NSData* responseData = nil;
        
        @try {
            if (bodyString) {
                responseData = [self syncRequestDataFromURL: [NSURL URLWithString:urlString]
                                                     method: method
                                                requestBody: bodyString
                                                      error: &error];
            } else {
                responseData = [self syncRequestDataFromURL: [NSURL URLWithString:urlString]
                                                     method: method
                                                     params: params
                                                      error: &error];
            }

            jsonObject = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        }
        @catch (NSException *exception) {
            error = [JSONModelError errorBadResponse];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completeBlock) {
                completeBlock(jsonObject, error);
            }
        });
    });
}

+(void)getJSONFromURLWithString:(NSString*)urlString completion:(JSONObjectBlock)completeBlock
{
    [self JSONFromURLWithString:urlString method:kHTTPMethodGET
                         params:nil
                   orBodyString:nil completion:^(NSDictionary *json, JSONModelError* e) {
                       if (completeBlock) completeBlock(json, e);
                   }];
}

+(void)getJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params completion:(JSONObjectBlock)completeBlock
{
    [self JSONFromURLWithString:urlString method:kHTTPMethodGET
                         params:params
                   orBodyString:nil completion:^(NSDictionary *json, JSONModelError* e) {
                       if (completeBlock) completeBlock(json, e);
                   }];
}

+(void)postJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params completion:(JSONObjectBlock)completeBlock
{
    [self JSONFromURLWithString:urlString method:kHTTPMethodPOST
                         params:params
                   orBodyString:nil completion:^(NSDictionary *json, JSONModelError* e) {
                       if (completeBlock) completeBlock(json, e);
                   }];

}

+(void)postJSONFromURLWithString:(NSString*)urlString bodyString:(NSString*)bodyString completion:(JSONObjectBlock)completeBlock
{
    [self JSONFromURLWithString:urlString method:kHTTPMethodPOST
                         params:nil
                   orBodyString:bodyString completion:^(NSDictionary *json, JSONModelError* e) {
                       if (completeBlock) completeBlock(json, e);
                   }];
}

+(void)setNetworkIndicatorVisible:(BOOL)isVisible
{
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:isVisible];
#endif
}

@end
