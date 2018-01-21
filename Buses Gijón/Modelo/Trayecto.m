//
//  Trayecto.m
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "Trayecto.h"

@implementation Trayecto
@synthesize descripcion, destino, direccion, idcabecera, idlinea, idtrayecto;

-(void) setTrayecto: (id) result {
	
	descripcion = @"";
	if ([[result allKeys]containsObject:@"descripcion"])
		descripcion = ([result objectForKey:@"descripcion"] != (id)[NSNull null]) ? [result objectForKey:@"descripcion"] : @"";
	
	descripcion = [NSString stringWithFormat:@"%@",[descripcion capitalizedString]];
	
	destino = @"";
	if ([[result allKeys]containsObject:@"destino"])
		destino = ([result objectForKey:@"destino"] != (id)[NSNull null]) ? [result objectForKey:@"destino"] : @"";
	
	direccion = 0;
	if ([[result allKeys]containsObject:@"direccion"])
		direccion = [[result objectForKey:@"direccion"] intValue];
	
	idcabecera = 0;
	if ([[result allKeys]containsObject:@"idcabecera"])
		idcabecera = [[result objectForKey:@"idcabecera"] intValue];
	
	idlinea = 0;
	if ([[result allKeys]containsObject:@"idlinea"])
		idlinea = [[result objectForKey:@"idlinea"] intValue];
	
	idtrayecto = 0;
	if ([[result allKeys]containsObject:@"idtrayecto"])
		idtrayecto = [[result objectForKey:@"idtrayecto"] intValue];
	
}

-(NSString *)trayectoToString:(Trayecto *) trayecto {
	
	NSMutableString *textoTrayecto = [[NSMutableString alloc] init];
	[textoTrayecto appendFormat:@"\n\nTrayecto:"];
	[textoTrayecto appendFormat:@"\n\tDescripción: %@", trayecto.descripcion];
	[textoTrayecto appendFormat:@"\n\tDestino: %@", trayecto.destino];
	[textoTrayecto appendFormat:@"\n\tDirección: %i", trayecto.direccion];
	[textoTrayecto appendFormat:@"\n\tID cabecera: %i", trayecto.idcabecera];
	[textoTrayecto appendFormat:@"\n\tID línea: %i", trayecto.idlinea];
	[textoTrayecto appendFormat:@"\n\tID trayecto: %i", trayecto.idtrayecto];
	
	//NSLog(@"%@",textoTrayecto);
	
	return textoTrayecto;
	
}

@end
