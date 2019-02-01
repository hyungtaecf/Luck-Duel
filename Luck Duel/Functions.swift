//
//  Functions.swift
//  Luck Duel
//
//  Created by 606-15 on 2017. 11. 16..
//  Copyright © 2017년 606-15. All rights reserved.
//

import Foundation


func getCardNameByNumber(_ x: Int) -> String {
    switch(x){
    case 0: return "copas_a";
    case 1: return "copas_2";
    case 2: return "copas_3";
    case 3: return "copas_4";
    case 4: return "copas_5";
    case 5: return "copas_6";
    case 6: return "copas_7";
    case 7: return "copas_8";
    case 8: return "copas_9";
    case 9: return "copas_10";
    case 10: return "copas_j";
    case 11: return "copas_q";
    case 12: return "copas_k";
    case 13: return "espadas_a";
    case 14: return "espadas_2";
    case 15: return "espadas_3";
    case 16: return "espadas_4";
    case 17: return "espadas_5";
    case 18: return "espadas_6";
    case 19: return "espadas_7";
    case 20: return "espadas_8";
    case 21: return "espadas_9";
    case 22: return "espadas_10";
    case 23: return "espadas_j";
    case 24: return "espadas_q";
    case 25: return "espadas_k";
    case 26: return "ouros_a";
    case 27: return "ouros_2";
    case 28: return "ouros_3";
    case 29: return "ouros_4";
    case 30: return "ouros_5";
    case 31: return "ouros_6";
    case 32: return "ouros_7";
    case 33: return "ouros_8";
    case 34: return "ouros_9";
    case 35: return "ouros_10";
    case 36: return "ouros_j";
    case 37: return "ouros_q";
    case 38: return "ouros_k";
    case 39: return "paus_a";
    case 40: return "paus_2";
    case 41: return "paus_3";
    case 42: return "paus_4";
    case 43: return "paus_5";
    case 44: return "paus_6";
    case 45: return "paus_7";
    case 46: return "paus_8";
    case 47: return "paus_9";
    case 48: return "paus_10";
    case 49: return "paus_j";
    case 50: return "paus_q";
    case 51: return "paus_k";
        
    default: return "error";
    }
}
