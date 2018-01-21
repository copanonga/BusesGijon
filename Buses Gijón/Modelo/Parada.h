//
//  Parada.h
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parada : NSObject

@property(nonatomic) int idparada;
@property(strong,nonatomic) NSString *descripcion;
@property(strong,nonatomic) NSString *utmx;
@property(strong,nonatomic) NSString *utmy;

@property(nonatomic) int idlinea;
@property(nonatomic) int idtrayecto;
@property(nonatomic) int orden;

@property(nonatomic) BOOL esUltimaParada;

-(void) setParada: (id) result;
-(NSString *)paradaToString:(Parada *) parada;

@end
