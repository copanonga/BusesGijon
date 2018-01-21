//
//  CeldaTrayectoCollectionViewCell.h
//  Buses Gijón
//
//  Created by PROIMA on 29/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parada.h"

@interface CeldaTrayectoCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIView *viewContenido;
@property (strong, nonatomic) IBOutlet UILabel *labelTrayecto;

-(int)getAlto;
-(int)getAncho;

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath parada:(Parada *) parada;

@end
