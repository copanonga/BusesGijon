//
//  Parada.m
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "Parada.h"

@implementation Parada
@synthesize idparada, descripcion, utmx, utmy, idlinea, idtrayecto, orden, esUltimaParada;

-(void) setParada: (id) result {
	
	idparada = 0;
	if ([[result allKeys]containsObject:@"idparada"])
		idparada = [[result objectForKey:@"idparada"] intValue];
	
	descripcion = @"";
	if ([[result allKeys]containsObject:@"descripcion"])
		descripcion = ([result objectForKey:@"descripcion"] != (id)[NSNull null]) ? [result objectForKey:@"descripcion"] : @"";
	
	descripcion = [NSString stringWithFormat:@"%@",[descripcion capitalizedString]];
	
	utmx = @"";
	if ([[result allKeys]containsObject:@"utmx"])
		utmx = ([result objectForKey:@"utmx"] != (id)[NSNull null]) ? [result objectForKey:@"utmx"] : @"";
	
	utmy = @"";
	if ([[result allKeys]containsObject:@"utmy"])
		utmy = ([result objectForKey:@"utmy"] != (id)[NSNull null]) ? [result objectForKey:@"utmy"] : @"";
	
	idlinea = 0;
	if ([[result allKeys]containsObject:@"idlinea"])
		idlinea = [[result objectForKey:@"idlinea"] intValue];
	
	idtrayecto = 0;
	if ([[result allKeys]containsObject:@"idtrayecto"])
		idtrayecto = [[result objectForKey:@"idtrayecto"] intValue];
	
	orden = 0;
	if ([[result allKeys]containsObject:@"orden"])
		orden = [[result objectForKey:@"orden"] intValue];
	
	esUltimaParada = NO;
	
}

-(NSString *)paradaToString:(Parada *) parada {
	
	NSMutableString *textoParada = [[NSMutableString alloc] init];
	[textoParada appendFormat:@"\n\nParada:"];
	[textoParada appendFormat:@"\n\tID parada: %i", parada.idparada];
	[textoParada appendFormat:@"\n\tDescripción: %@", parada.descripcion];
	[textoParada appendFormat:@"\n\tumtx: %@", parada.utmx];
	[textoParada appendFormat:@"\n\tumty: %@", parada.utmy];
	[textoParada appendFormat:@"\n\tID línea: %i", parada.idlinea];
	[textoParada appendFormat:@"\n\tID trayecto: %i", parada.idtrayecto];
	[textoParada appendFormat:@"\n\tOrden: %i", parada.orden];
	
	//NSLog(@"%@",textoParada);
	
	return textoParada;
	
}

@end
