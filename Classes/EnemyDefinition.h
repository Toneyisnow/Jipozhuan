//
//  EnemyDefinition.h
//  Jipozhuan
//
//  Created by sui toney on 11-1-30.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum EnemyClarification {
	
	EnemyDefinition_Null,
	EnemyDefinition0_Luan,
	EnemyDefinition1_Ruo,
	EnemyDefinition1_Di,
	EnemyDefinition1_Ying,
	EnemyDefinition1_BiaoLi,
	EnemyDefinition1_Su,
	EnemyDefinition1_Qin,
	EnemyDefinition1_Qinzi,
	EnemyDefinition1_Da,
	EnemyDefinition1_Zhong,
	EnemyDefinition1_Xiao,
	EnemyDefinition1_Gong,
	EnemyDefinition1_Shou,
	EnemyDefinition1_Xi,
	EnemyDefinition1_Tou,
	EnemyDefinition1_Tong,
	EnemyDefinition1_Wei,
	EnemyDefinition1_Zhu,
	EnemyDefinition1_Cong,
	
	EnemyDefinition2_Die,
	EnemyDefinition2_Wo,
	EnemyDefinition2_Zhu,
	EnemyDefinition2_Zhusi,
	EnemyDefinition2_Yi,
	EnemyDefinition2_Zhi,
	EnemyDefinition2_E,
	EnemyDefinition2_Huang,
	EnemyDefinition2_Wen,
	EnemyDefinition2_Xi,
	EnemyDefinition2_Rui,
	EnemyDefinition2_Meng,
	EnemyDefinition2_Wu,
	EnemyDefinition2_Gong,
	EnemyDefinition2_Xie,
	EnemyDefinition2_Feng,
	EnemyDefinition2_Wa,
	EnemyDefinition2_Chong,
	EnemyDefinition2_Chong3,
	EnemyDefinition2_Chong3Boss,
	
	EnemyDefinition3_Ban,
	EnemyDefinition3_Xiang,
	EnemyDefinition3_Tun,
	EnemyDefinition3_Bao,
	EnemyDefinition3_Ta,
	EnemyDefinition3_Niu,
	EnemyDefinition3_Hu,
	EnemyDefinition3_Xiong,
	EnemyDefinition3_You,
	EnemyDefinition3_YouChou,
	EnemyDefinition3_Hu2,
	EnemyDefinition3_Li,
	EnemyDefinition3_Mao,
	EnemyDefinition3_Shi,
	EnemyDefinition3_Chai,
	EnemyDefinition3_Lie,
	EnemyDefinition3_ShiMao,
	
	EnemyDefinition4_Lu,
	EnemyDefinition4_Ou,
	EnemyDefinition4_Ya,
	EnemyDefinition4_Yuanyang,
	EnemyDefinition4_Yan,
	EnemyDefinition4_Hu,
	EnemyDefinition4_Ying,
	EnemyDefinition4_Que,
	EnemyDefinition4_Zhen,
	EnemyDefinition4_Zhendu,
	EnemyDefinition4_Yuan2,
	EnemyDefinition4_Sun,
	EnemyDefinition4_Huang,
	EnemyDefinition4_HuangYu,
	EnemyDefinition4_Feng,
	
	SupplyDefinition_Bullet,
	SupplyDefinition_Friend,
	
	EnemyBulletDefinition_Simple,
	EnemyBulletDefinition_Round,
	EnemyBulletDefinition_Chasing,
	EnemyBulletDefinition_BossSpecial
	
} EnemyClarification;


@interface EnemyDefinition : NSObject
{
	EnemyClarification clarification;
	int subtype;
}

+(id) enemyWithClarification:(EnemyClarification)c;
+(id) enemyWithClarification:(EnemyClarification)c Type:(int)type;

@property EnemyClarification clarification;
@property int subtype;

@end


