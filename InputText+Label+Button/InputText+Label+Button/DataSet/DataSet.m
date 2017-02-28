//
//  DataSet.m
//  InputText+Label+Button
//
//  Created by Vishal Kumar on 27/02/17.
//  Copyright © 2017 Training. All rights reserved.
//

#import "DataSet.h"

@implementation DataSet
-(instancetype)initWithName:(NSString *)name email:(NSString *)email number:(NSString *)number{
    
    if (self){
        self.name = name;
        self.email = email;
        self.number = number;
    }
    return self;
}

@end
