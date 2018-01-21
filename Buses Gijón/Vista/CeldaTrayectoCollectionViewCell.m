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
	
	celda.labelTrayecto.text = [NSString stringWithFormat:@"Trayecto %i", parada.idtrayecto];
	
	return celda;
	
}

@end
