//
//  Peticiones.m
//  Buses Gijón
//
//  Created by PROIMA on 3/1/18.
//  Copyright © 2018 Copanonga. All rights reserved.
//

#import "Peticiones.h"
#import "URLs.h"
#import <AFNetworking.h>
#import "Horario.h"
#import "Linea.h"
#import "Parada.h"
#import "Trayecto.h"

@implementation Peticiones

- (void)getDatos {

	[self.delegate getDatosPeticion:@"El veloz murciélago hindú mediante protocolo"];
	
}

-(void)getInfo {
	
    NSURL *URL = [NSURL URLWithString:URL_INFO];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSDictionary* json = [NSJSONSerialization
                              JSONObjectWithData:responseObject
                              options:kNilOptions
                              error:nil];
        
        NSMutableArray *listadoLineas = [[NSMutableArray alloc] init];
        
        NSDictionary *lineasTotal = [json objectForKey:@"lineas"];
        NSArray *lineas = [lineasTotal objectForKey:@"linea"];
        [lineas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            Linea *lineaObtenida = [[Linea alloc]init];
            [lineaObtenida setLinea:obj];
            [listadoLineas addObject:lineaObtenida];
            
        }];
        
        NSMutableArray *listadoParadas = [[NSMutableArray alloc] init];
        
        NSDictionary *paradasTotal = [json objectForKey:@"paradas"];
        NSArray *paradas = [paradasTotal objectForKey:@"parada"];
        [paradas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            Parada *paradaObtenida = [[Parada alloc]init];
            [paradaObtenida setParada:obj];
            [listadoParadas addObject:paradaObtenida];
            
        }];
        
        NSMutableArray *listadoParadasTrayectos = [[NSMutableArray alloc] init];
        
        NSDictionary *paradasTrayectosTotal = [json objectForKey:@"paradasTrayectos"];
        NSArray *paradasTrayectos = [paradasTrayectosTotal objectForKey:@"parada"];
        [paradasTrayectos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            Parada *paradaObtenida = [[Parada alloc]init];
            [paradaObtenida setParada:obj];
            [listadoParadasTrayectos addObject:paradaObtenida];
            
        }];
        
        NSMutableArray *listadoHorarios = [[NSMutableArray alloc] init];
        
        NSDictionary *horariosTotal = [json objectForKey:@"horarios"];
        NSArray *horarios = [horariosTotal objectForKey:@"horario"];
        [horarios enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            Horario *horarioObtenido = [[Horario alloc]init];
            [horarioObtenido setHorario:obj];
            [listadoHorarios addObject:horarioObtenido];
            
        }];
        
        NSMutableArray *listadoTrayectos = [[NSMutableArray alloc] init];
        
        NSDictionary *trayectosTotal = [json objectForKey:@"trayectos"];
        NSArray *trayectos = [trayectosTotal objectForKey:@"trayecto"];
        [trayectos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            Trayecto *trayectoObtenido = [[Trayecto alloc]init];
            [trayectoObtenido setTrayecto:obj];
            [listadoTrayectos addObject:trayectoObtenido];
            
        }];
        
        [self.delegate getInfoBuses:listadoParadas :listadoLineas :listadoTrayectos :listadoHorarios :listadoParadasTrayectos];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error getInfo: %@", error);
        [self.delegate showError:@"Ayuntamiento de Gijón: datos no disponibles temporalmente"];
    }];
    
}

@end
