//
//  Horario.m
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "Horario.h"

@implementation Horario
@synthesize fechafin, fechainicio, hora, idlinea, idtrayecto, numeroexpedicion;

-(void) setHorario: (id) result {

	fechafin = @"";
	if ([[result allKeys]containsObject:@"fechafin"])
		fechafin = ([result objectForKey:@"fechafin"] != (id)[NSNull null]) ? [result objectForKey:@"fechafin"] : @"";
	
	fechainicio = @"";
	if ([[result allKeys]containsObject:@"fechainicio"])
		fechainicio = ([result objectForKey:@"fechainicio"] != (id)[NSNull null]) ? [result objectForKey:@"fechainicio"] : @"";
	
	hora = @"";
	if ([[result allKeys]containsObject:@"hora"])
		hora = ([result objectForKey:@"hora"] != (id)[NSNull null]) ? [result objectForKey:@"hora"] : @"";
	
	idlinea = 0;
	if ([[result allKeys]containsObject:@"idlinea"])
		idlinea = [[result objectForKey:@"idlinea"] intValue];
	
	idtrayecto = 0;
	if ([[result allKeys]containsObject:@"idtrayecto"])
		idtrayecto = [[result objectForKey:@"idtrayecto"] intValue];
	
	numeroexpedicion = 0;
	if ([[result allKeys]containsObject:@"numeroexpedicion"])
		numeroexpedicion = [[result objectForKey:@"numeroexpedicion"] intValue];
	
}

-(NSString *)horarioToString:(Horario *) horario {
	
	NSMutableString *textoHorario = [[NSMutableString alloc] init];
	[textoHorario appendFormat:@"\n\nHorario:"];
	[textoHorario appendFormat:@"\n\tFecha inicio: %@", horario.fechainicio];
	[textoHorario appendFormat:@"\n\tFecha inicio: %@", horario.fechainicio];
	[textoHorario appendFormat:@"\n\tFecha fin: %@", horario.fechafin];
	[textoHorario appendFormat:@"\n\tHora: %@", horario.hora];
	[textoHorario appendFormat:@"\n\tID línea: %i", horario.idlinea];
	[textoHorario appendFormat:@"\n\tID trayecto: %i", horario.idtrayecto];
	[textoHorario appendFormat:@"\n\tNúmero de expedición: %i", horario.numeroexpedicion];
	
	//NSLog(@"%@",textoHorario);
	
	return textoHorario;
	
}

@end
