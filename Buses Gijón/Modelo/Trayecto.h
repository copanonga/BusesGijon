//
//  Trayecto.h
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trayecto : NSObject

@property(strong,nonatomic) NSString *descripcion;
@property(strong,nonatomic) NSString *destino;
@property(nonatomic) int direccion;
@property(nonatomic) int idcabecera;
@property(nonatomic) int idlinea;
@property(nonatomic) int idtrayecto;

-(void) setTrayecto: (id) result;
-(NSString *)trayectoToString:(Trayecto *) trayecto;

@end
