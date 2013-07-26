//
//  BNRItemStore.m
//  Homepwner
//
//  Created by longwei su on 5/7/13.
//  Copyright (c) 2013 com.longwei. All rights reserved.
//

#import "BNRItemStore.h"
//#import "BNRItem.h"
#import "TopicsList.h"
#import "DatabaseAccess.h"

@implementation BNRItemStore

+(BNRItemStore*) sharedStore
{
    static BNRItemStore* sharedStore = nil;
    if(!sharedStore){
        //use sharedstore's NSObject's allocWithZone to avoid loop
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

//prevent alloc call
+(id) allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id) init
{
    self = [super init];
    if(self){
//        allItems = [[NSMutableArray alloc] init];
        allItems = [DatabaseAccess database].readAllFromLocal;
        [self fetch];
    }
    return self;
}

- (NSArray*) allItems
{
    return allItems;
}

- (TopicsList*) createItem
{
    TopicsList* p = [TopicsList randomItem];
    [allItems addObject:p];
    return p;
}


- (void) removeItem:(TopicsList*) p
{
    [allItems removeObjectIdenticalTo:p];
}

-(void) moveItemAtIndex:(int) from toIndex:(int)to
{
    if(from == to) {return;}
    TopicsList* p = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:p atIndex:to];
}

- (void) fetch
{
    NSString* session = @"92ace1bfd5bba49add7401c7cc1bfd8f";
    url = [NSURL URLWithString:[NSString stringWithFormat:@"http://topicserver.ics.com/getLists?session_id=%@", session]];
    [self parseJSONWithURL:url];
}


- (void) parseJSONWithURL:(NSURL *) jsonURL
{
    // Set the queue to the background queue. We will run this on the background thread to keep
    // the UI Responsive.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // Run request on background queue (thread).
    dispatch_async(queue, ^{
        NSError *error = nil;
        
        // Request the data and store in a string.
        NSString *json = [NSString stringWithContentsOfURL:jsonURL
                                                  encoding:NSASCIIStringEncoding
                                                     error:&error];
        if (error == nil){
            
            
            // Convert the String into an NSData object.
            NSData *jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
            
            // Parse that data object using NSJSONSerialization without options.
            jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            
            // Parsing success.
            if (error == nil)
            {
                NSLog(@"parsing data");
                // Go back to the main thread and update the table with the json data.
                // Keeps the user interface responsive.
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                    episodes = [jsonDict valueForKey:@"lists"];
                    NSDateFormatter *format = [[NSDateFormatter alloc] init];
                    [format setDateFormat:@"YYYY-MM-DDTHH:MM:SS"];
//                    NSMutableArray *retval = [[NSMutableArray alloc] init];
                    for (int i = 2; i < episodes.count; i++) {
                        id object = [episodes objectAtIndex:i];
                        NSArray* scheme = [TopicsList scheme];
//                        for (int i = 0;i < scheme.count; i++) {
//                            NSLog(@"%@",[object objectForKey:[scheme objectAtIndex:i]]);
//                            NSLog([scheme objectAtIndex:i]);
//                        }
                        TopicsList *info = [[TopicsList alloc]initWithUniqueId:[[object objectForKey:@"id"] intValue]
                                                                  lastDeleted: [object objectForKey:@"lastdeleted"]
                                                                         descr:[object objectForKey:@"description"]
                                                                         title:[object objectForKey:@"title"]
                                                                       deleted:[[object objectForKey:@"deleted"] boolValue]
                                                                       created:[object objectForKey:@"timeofcreation"]
                                                                     itemOrder:[object objectForKey:@"itemsorder"]
                                                                      priority:[[object objectForKey:@"priority"] intValue]
                                                                      numItems:[[object objectForKey:@"numItems"] intValue]
                                                                  lastModified:[object objectForKey:@"lastmodified"]
                                                                    numChecked:[[object objectForKey:@"numChecked"] intValue]
                                                                        hidden:[[object objectForKey:@"hidden"] intValue]];
//                        [remoteItems addObject:info];
//                        NSLog(@"callbacked");
//                        NSLog(@"%d",remoteItems.count);
                    }
                });
            }
            
            // Parsing failed, display error as alert.
            else
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Uh Oh, Parsing Failed." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                
                [alertView show];
            }
        }
        
        // Request Failed, display error as alert.
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Request Error! Check that you are connected to wifi or 3G/4G with internet access." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            
            [alertView show];
        }
    });
}
@end
