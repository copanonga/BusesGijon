//
//  ParadaTableViewCell.h
//  Buses Gijón
//
//  Created by PROIMA on 29/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parada.h"

@interface ParadaTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *viewContenido;
@property (strong, nonatomic) IBOutlet UILabel *labelParada;
@property (strong, nonatomic) IBOutlet UILabel *labelZonaExterior;
@property (strong, nonatomic) IBOutlet UILabel *labelZonaInterior;
@property (strong, nonatomic) IBOutlet UILabel *labelDestinoSiguiente;
@property (strong, nonatomic) IBOutlet UILabel *labelDestinoAnterior;

-(int)getAltura;
-(int)getAnchura;

- (ParadaTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath parada:(Parada *) parada;

@end
