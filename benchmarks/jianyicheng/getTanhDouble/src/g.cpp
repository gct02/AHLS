/*

  Benchmark:		getTanhDouble
  FileName:     	g.cpp
  Author:		    Jianyi Cheng
  Date:			    12 Sep 2019

*/

#include "getTanhDouble.h"

double g(double beta){
 
  double result;

  result = ((beta*beta+19.52381)*beta*beta+3.704762)*beta;

  return result;
}
