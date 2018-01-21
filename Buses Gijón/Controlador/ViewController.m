//
//  ViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "ViewController.h"
#import "URLs.h"
#import <AFNetworking.h>
#import "Horario.h"
#import "Linea.h"
#import "Parada.h"
#import "Trayecto.h"
#import "LineasViewController.h"
#import "ParadasViewController.h"
#import "Peticiones.h"
#import "Protocolos.h"

@interface ViewController () {

	NSMutableArray *listadoParadas;
	NSMutableArray *listadoLineas;
	NSMutableArray *listadoTrayectos;
	NSMutableArray *listadoHorarios;
	NSMutableArray *listadoParadasTrayectos;
	
}

@property (strong, nonatomic) IBOutlet UITextView *textViewResultado;

@end

@implementation ViewController
@synthesize textViewResultado;

- (void)viewDidLoad {
	
	NSLog(@"\nViewController");
	[super viewDidLoad];
	
	[self getDatosPorProtocolo];
	//[self getInfo];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - Protocolos

-(void)getDatosPorProtocolo {
	
	Peticiones *peticiones = [[Peticiones alloc] init];
	peticiones.delegate = self;
	[peticiones getDatos];
	[peticiones getInfo];
	
}

-(void) getDatosPeticion: (NSString *) texto {
	NSLog(@"\nTexto datos petición: %@", texto);
	[textViewResultado setText:texto];
}

-(void)getInfoBuses: (NSMutableArray *) listadoParadasProtocolo :(NSMutableArray *) listadoLineasProtocolo :(NSMutableArray *) listadoTrayectosProtocolo :(NSMutableArray *) listadoHorariosProtocolo :(NSMutableArray *) listadoParadasTrayectosProtocolo {
	
	listadoParadas = [[NSMutableArray alloc] init];
	listadoParadas = listadoParadasProtocolo;
	
	listadoLineas = [[NSMutableArray alloc] init];
	listadoLineas = listadoLineasProtocolo;
	
	listadoTrayectos = [[NSMutableArray alloc] init];
	listadoTrayectos = listadoTrayectosProtocolo;
	
	listadoHorarios = [[NSMutableArray alloc] init];
	listadoHorarios = listadoHorariosProtocolo;
	
	listadoParadasTrayectos = [[NSMutableArray alloc] init];
	listadoParadasTrayectos = listadoParadasTrayectosProtocolo;
	
}

-(void)showError: (NSString *) texto {
	
	UIAlertController * alert=   [UIAlertController
								  alertControllerWithTitle:NSLocalizedString(@"Buses Gijón", nil)
								  message:texto
								  preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction* yesButton = [UIAlertAction
								actionWithTitle:NSLocalizedString(@"Ok", nil)
								style:UIAlertActionStyleDefault
								handler:^(UIAlertAction * action)
								{
									[alert dismissViewControllerAnimated:YES completion:nil];
									
								}];
	
	[alert addAction:yesButton];
	
	[self presentViewController:alert animated:YES completion:nil];

}

#pragma mark - Peticiones

-(void)getInfo {
	
	NSString *URL = URL_INFO;
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	manager.requestSerializer=[AFHTTPRequestSerializer serializer];
	manager.responseSerializer= [AFHTTPResponseSerializer serializer];
	[manager GET:URL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
		
		NSDictionary* json = [NSJSONSerialization
							  JSONObjectWithData:responseObject
							  options:kNilOptions
							  error:nil];
		
		listadoLineas = [[NSMutableArray alloc] init];

		NSDictionary *lineasTotal = [json objectForKey:@"lineas"];
		NSArray *lineas = [lineasTotal objectForKey:@"linea"];
		[lineas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			Linea *lineaObtenida = [[Linea alloc]init];
			[lineaObtenida setLinea:obj];
			[listadoLineas addObject:lineaObtenida];
			
		}];
		
		listadoParadas = [[NSMutableArray alloc] init];
		
		NSDictionary *paradasTotal = [json objectForKey:@"paradas"];
		NSArray *paradas = [paradasTotal objectForKey:@"parada"];
		[paradas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			Parada *paradaObtenida = [[Parada alloc]init];
			[paradaObtenida setParada:obj];
			[listadoParadas addObject:paradaObtenida];
			
		}];
		
		listadoParadasTrayectos = [[NSMutableArray alloc] init];
		
		NSDictionary *paradasTrayectosTotal = [json objectForKey:@"paradasTrayectos"];
		NSArray *paradasTrayectos = [paradasTrayectosTotal objectForKey:@"parada"];
		[paradasTrayectos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			Parada *paradaObtenida = [[Parada alloc]init];
			[paradaObtenida setParada:obj];
			[listadoParadasTrayectos addObject:paradaObtenida];
			
		}];
		
		listadoHorarios = [[NSMutableArray alloc] init];
		
		NSDictionary *horariosTotal = [json objectForKey:@"horarios"];
		NSArray *horarios = [horariosTotal objectForKey:@"horario"];
		[horarios enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			Horario *horarioObtenido = [[Horario alloc]init];
			[horarioObtenido setHorario:obj];
			[listadoHorarios addObject:horarioObtenido];
			
		}];
		
		listadoTrayectos = [[NSMutableArray alloc] init];
		
		NSDictionary *trayectosTotal = [json objectForKey:@"trayectos"];
		NSArray *trayectos = [trayectosTotal objectForKey:@"trayecto"];
		[trayectos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			
			Trayecto *trayectoObtenido = [[Trayecto alloc]init];
			[trayectoObtenido setTrayecto:obj];
			[listadoTrayectos addObject:trayectoObtenido];
			
		}];
		
	} failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
		NSLog(@"Error: Información no disponible");
	}];
	
}

#pragma mark - Botones

- (IBAction)botonLineas:(id)sender {
	
	[textViewResultado setText:@""];
	
	NSMutableString *texto = [[NSMutableString alloc] init];
	for (Linea *linea in listadoLineas) {
		[texto appendString:[[Linea alloc] lineaToString:linea]];
	}
	
	[textViewResultado setText:texto];
	
	LineasViewController *lineasBus = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"lineasViewController"];
	[self.navigationController pushViewController:lineasBus animated:YES];

}

- (IBAction)botonHorarios:(id)sender {
	
	[textViewResultado setText:@""];
	
	NSMutableString *texto = [[NSMutableString alloc] init];
	for (Horario *horario in listadoHorarios) {
		[texto appendString:[[Horario alloc] horarioToString:horario]];
	}
	
	[textViewResultado setText:texto];

}

- (IBAction)botonParadas:(id)sender {
	
	[textViewResultado setText:@""];
	
	NSMutableString *texto = [[NSMutableString alloc] init];
	for (Parada *parada in listadoParadas) {
		[texto appendString:[[Parada alloc] paradaToString:parada]];
	}
	
	[textViewResultado setText:texto];

	ParadasViewController *paradasBus = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"paradasViewController"];
	paradasBus.listadoParadas = [[NSMutableArray alloc] init];
	paradasBus.listadoParadas = listadoParadas;
	[self.navigationController pushViewController:paradasBus animated:YES];

}

- (IBAction)botonTrayectos:(id)sender {
	
	[textViewResultado setText:@""];
	
	NSMutableString *texto = [[NSMutableString alloc] init];
	for (Trayecto *trayecto in listadoTrayectos) {
		[texto appendString:[[Trayecto alloc] trayectoToString:trayecto]];
	}
	
	[textViewResultado setText:texto];

}

- (IBAction)botonParadasTrayectos:(id)sender {
	
	[textViewResultado setText:@""];
	
	NSMutableString *texto = [[NSMutableString alloc] init];
	for (Parada *parada in listadoParadasTrayectos) {
		[texto appendString:[[Parada alloc] paradaToString:parada]];
	}
	
	[textViewResultado setText:texto];

}

#pragma mark - Resultados

-(NSMutableArray *)getParadas {
	return listadoParadas;
}

-(NSMutableArray *)getLineas {
	return listadoLineas;
}

-(NSMutableArray *)getTrayectos {
	return listadoTrayectos;
}

-(NSMutableArray *)getHorarios {
	return listadoHorarios;
}

-(NSMutableArray *)getParadasTrayectos {
	return listadoParadasTrayectos;
}

@end
