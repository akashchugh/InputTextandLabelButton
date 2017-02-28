//
//  DataSet.h
//  InputText+Label+Button
//
//  Created by Vishal Kumar on 27/02/17.
//  Copyright © 2017 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSet : NSObject
@property(nonatomic) NSString* name;
@property(nonatomic) NSString* email;
@property(nonatomic) NSString* number;

-(instancetype)initWithName:(NSString*) name email:(NSString*)email number:(NSString*) number;
@end
