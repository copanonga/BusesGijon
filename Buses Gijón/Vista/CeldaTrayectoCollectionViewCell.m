//
//  CeldaTrayectoCollectionViewCell.m
//  Buses Gijón
//
//  Created by PROIMA on 29/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "CeldaTrayectoCollectionViewCell.h"

@implementation CeldaTrayectoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(int)getAlto {
	return 45;
}

-(int)getAncho {
	return 120;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath parada:(Parada *) parada {
	
	CeldaTrayectoCollectionViewCell *celda= [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CeldaTrayectoCollectionViewCell class]) forIndexPath:indexPath];
	
    celda.viewContenido.backgroundColor = [UIColor clearColor];
    celda.labelTrayecto.textColor = [UIColor blackColor];
    if (parada.esTrayectoSeleccionado) {
        //NSLog(@"\nEs trayecto seleccionado");
        celda.viewContenido.backgroundColor = [UIColor redColor];
        celda.labelTrayecto.textColor = [UIColor whiteColor];
    }
    
	celda.labelTrayecto.text = [NSString stringWithFormat:@"Trayecto %i", parada.idtrayecto];
	
	return celda;
	
}

@end
