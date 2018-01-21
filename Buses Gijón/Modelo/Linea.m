//
//  Linea.m
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "Linea.h"

@implementation Linea
@synthesize codigo, idlinea, descripcion, tipo, colorHex;

-(void) setLinea: (id) result {
	
	codigo = @"";
	if ([[result allKeys]containsObject:@"codigo"])
		codigo = ([result objectForKey:@"codigo"] != (id)[NSNull null]) ? [result objectForKey:@"codigo"] : @"";
	
	idlinea = 0;
	if ([[result allKeys]containsObject:@"idlinea"])
		idlinea = [[result objectForKey:@"idlinea"] intValue];
	
	descripcion = @"";
	if ([[result allKeys]containsObject:@"descripcion"])
		descripcion = ([result objectForKey:@"descripcion"] != (id)[NSNull null]) ? [result objectForKey:@"descripcion"] : @"";
	
	descripcion = [NSString stringWithFormat:@"%@",[descripcion capitalizedString]];
	
	tipo = @"";
	if ([[result allKeys]containsObject:@"tipo"])
		tipo = ([result objectForKey:@"tipo"] != (id)[NSNull null]) ? [result objectForKey:@"tipo"] : @"";
	
	colorHex = @"";
	if ([[result allKeys]containsObject:@"colorHex"])
		colorHex = ([result objectForKey:@"colorHex"] != (id)[NSNull null]) ? [result objectForKey:@"colorHex"] : @"";
	
}

-(NSString *)lineaToString:(Linea *) linea {
	
	NSMutableString *textoLinea = [[NSMutableString alloc] init];
	[textoLinea appendFormat:@"\n\nLínea:"];
	[textoLinea appendFormat:@"\n\tCódigo: %i", linea.codigo];
	[textoLinea appendFormat:@"\n\tID línea: %i", linea.idlinea];
	[textoLinea appendFormat:@"\n\tDescripción: %@", linea.descripcion];
	[textoLinea appendFormat:@"\n\tTipo: %@", linea.tipo];
	[textoLinea appendFormat:@"\n\tColor hex: %@", linea.colorHex];
	
	//NSLog(@"%@",textoLinea);
	
	return textoLinea;
	
}

@end
