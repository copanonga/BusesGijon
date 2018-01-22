//
//  ViewController.h
//  Buses Gijón
//
//  Created by PROIMA on 21/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocolos.h"
#import <AFNetworking.h>

@interface ViewController : UIViewController <Protocolos>

-(NSMutableArray *)getParadas;
-(NSMutableArray *)getLineas;
-(NSMutableArray *)getTrayectos;
-(NSMutableArray *)getHorarios;
-(NSMutableArray *)getParadasTrayectos;



@end
