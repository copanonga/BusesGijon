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
