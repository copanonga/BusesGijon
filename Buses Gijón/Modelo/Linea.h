//
//  Linea.h
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Linea : NSObject

@property(strong,nonatomic) NSString *codigo;
@property(nonatomic) int idlinea;
@property(strong,nonatomic) NSString *descripcion;
@property(strong,nonatomic) NSString *tipo;
@property(strong,nonatomic) NSString *colorHex;

-(void) setLinea: (id) result;
-(NSString *)lineaToString:(Linea *) linea;

@end
