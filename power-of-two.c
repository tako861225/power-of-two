#include<stdio.h>


bool isPowerOfTwo(int n){    
    while(n){
        if (n==1) return true;
        if(n%2)return false;
        n/=2;
    }
    return false;
}
