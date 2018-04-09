//
//  DetalleLineaViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "DetalleLineaViewController.h"
#import "DetalleHorariosViewController.h"
#import "ViewController.h"
#import "Parada.h"
#import "CeldaTrayectoCollectionViewCell.h"
#import "ParadasLineasContainerViewController.h"

@interface DetalleLineaViewController () {
	NSMutableArray *listadoParadasTrayectos;
	NSMutableArray *listadoParadas;
	NSMutableArray *trayectosObtenidos;
	Parada *trayectoParadaSeleccionado;
	
	ParadasLineasContainerViewController *paradasLineasContainer;
	
}

@property (strong, nonatomic) IBOutlet UIView *paradasContainerView;
@property (strong, nonatomic) IBOutlet UIView *rutasContainerView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentTipo;
@property (strong, nonatomic) IBOutlet UICollectionView *coleccionTrayectos;
@property (strong, nonatomic) IBOutlet UILabel *labelTituloCabecera;

@end

@implementation DetalleLineaViewController
@synthesize paradasContainerView, rutasContainerView, segmentTipo;
@synthesize lineaSeleccionada, coleccionTrayectos, labelTituloCabecera;

- (void)viewDidLoad {
	
	NSLog(@"\nDetalleLineaViewController");
    [super viewDidLoad];
	
	[self inicializarTitulo];
	[self inicializarSegment];
	[self registrarCeldas];
	[self getDatos];
	[self getTrayectosLinea];
	[self getParadasTrayecto];
	[paradasLineasContainer setParadas:listadoParadas];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Inicializar 

-(void)inicializarTitulo {
	labelTituloCabecera.text = [NSString stringWithFormat:@"Línea %@",lineaSeleccionada.codigo];
}

-(void)inicializarSegment {
	[paradasContainerView setHidden:NO];
	[rutasContainerView setHidden:YES];
}

-(void)registrarCeldas {
	
	[coleccionTrayectos registerNib:[UINib nibWithNibName:NSStringFromClass([CeldaTrayectoCollectionViewCell class]) bundle:nil]  forCellWithReuseIdentifier:NSStringFromClass([CeldaTrayectoCollectionViewCell class])];
		
}

#pragma mark - Container View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	
	if ([[segue identifier] isEqualToString:@"paradasLineasContainerViewController"]) {
		paradasLineasContainer = (ParadasLineasContainerViewController*) segue.destinationViewController;
	}
	
}

#pragma mark - Segment

- (IBAction)valorSegmentTipo:(id)sender {

	switch (segmentTipo.selectedSegmentIndex)
	{
		case 0://Parada
			[paradasContainerView setHidden:NO];
			[rutasContainerView setHidden:YES];
			break;
		case 1://Ruta
			[paradasContainerView setHidden:YES];
			[rutasContainerView setHidden:NO];
			break;
		default:
			break;
	}
	
}

#pragma mark - Botones

- (IBAction)botonVolver:(id)sender {
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

- (IBAction)botonVerHorarios:(id)sender {

	DetalleHorariosViewController *horarioBus = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detalleHorariosViewController"];

	CATransition* transition = [CATransition animation];
	transition.duration = 0.4f;
	transition.type = kCATransitionMoveIn;
	transition.subtype = kCATransitionFromTop;
	[self.navigationController.view.layer addAnimation:transition
												forKey:kCATransition];
	[self.navigationController pushViewController:horarioBus animated:NO];
	
}

#pragma mark - Obtener datos

-(void)getDatos {
	
	NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:[[self navigationController] viewControllers]];
	
	for ( int i = 0 ; i < [viewControllers count] ; i++ ) {
		
		UIViewController *vistaAnterior = [viewControllers objectAtIndex:i];
		
		if ([vistaAnterior isKindOfClass:[ViewController class]]){
			
			ViewController *viewPrincipal = [viewControllers objectAtIndex:i];
			listadoParadasTrayectos = [[NSMutableArray alloc] init];
			listadoParadasTrayectos = [viewPrincipal getParadasTrayectos];
			
		}
	}
	
}

-(void)getTrayectosLinea {
	
	trayectosObtenidos = [[NSMutableArray alloc] init];
	
	for (Parada *parada in listadoParadasTrayectos) {
		
		if (parada.idlinea == lineaSeleccionada.idlinea){
			
			BOOL existeTrayecto = FALSE;
			for (Parada * trayectoParada in trayectosObtenidos) {
				
				if (trayectoParada.idtrayecto==parada.idtrayecto)
					existeTrayecto = TRUE;
			}
			
			if (existeTrayecto==FALSE) {
				[trayectosObtenidos addObject:parada];
			}
			
		}
	}
	
	if ([trayectosObtenidos count]>0) {
		trayectoParadaSeleccionado = [[Parada alloc] init];
		trayectoParadaSeleccionado = [trayectosObtenidos objectAtIndex:0];
        Parada *primeraParada = [trayectosObtenidos objectAtIndex:0];
        primeraParada.esTrayectoSeleccionado = YES;
	}
	
	[coleccionTrayectos reloadData];
	
}

-(void)getParadasTrayecto {
	
	listadoParadas = [[NSMutableArray alloc] init];
	for (Parada *parada in listadoParadasTrayectos) {
		if(parada.idtrayecto == trayectoParadaSeleccionado.idtrayecto && parada.idlinea == lineaSeleccionada.idlinea) {
			[listadoParadas addObject:parada];
		}
	}
	
	Parada *parada = [listadoParadas lastObject];
	parada.esUltimaParada = YES;

}

#pragma mark - Colección

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	if([collectionView isEqual:coleccionTrayectos])
		return [trayectosObtenidos count];
	
	return 0;
	
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	
	if([collectionView isEqual:coleccionTrayectos]) {
		
		Parada *paradaSeleccionada = [trayectosObtenidos objectAtIndex:indexPath.row];
		return [[CeldaTrayectoCollectionViewCell alloc] collectionView:coleccionTrayectos cellForItemAtIndexPath:indexPath parada:paradaSeleccionada];
		
	}
	
	return nil;
	
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	
	if([collectionView isEqual:coleccionTrayectos]) {
		
        for (Parada *paradaAMostrar in trayectosObtenidos)
            paradaAMostrar.esTrayectoSeleccionado = NO;
        
		Parada *paradaSeleccionada = [trayectosObtenidos objectAtIndex:indexPath.row];
        paradaSeleccionada.esTrayectoSeleccionado = YES;
		
		trayectoParadaSeleccionado = [[Parada alloc] init];
		trayectoParadaSeleccionado = paradaSeleccionada;
		[self getParadasTrayecto];
		[paradasLineasContainer setParadas:listadoParadas];
		
        [coleccionTrayectos reloadData];
        
	}
	
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	
	if([collectionView isEqual:coleccionTrayectos])
		return CGSizeMake([[CeldaTrayectoCollectionViewCell alloc] getAncho], [[CeldaTrayectoCollectionViewCell alloc] getAlto]);
	
	return CGSizeMake(50,50);
	
}

@end
