//
//  Peticiones.h
//  Buses Gijón
//
//  Created by PROIMA on 3/1/18.
//  Copyright © 2018 Copanonga. All rights reserved.
//

#import "Protocolos.h"
#import <Foundation/Foundation.h>

@interface Peticiones : NSObject

@property (strong, nonatomic) id<Protocolos> delegate;

- (void)getDatos;
-(void)getInfo;

@end
