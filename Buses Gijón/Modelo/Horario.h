//
//  Horario.h
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Horario : NSObject

@property(strong,nonatomic) NSString *fechafin;
@property(strong,nonatomic) NSString *fechainicio;
@property(strong,nonatomic) NSString *hora;
@property(nonatomic) int idlinea;
@property(nonatomic) int idtrayecto;
@property(nonatomic) int numeroexpedicion;

-(void) setHorario: (id) result;
-(NSString *)horarioToString:(Horario *) horario;

@end
