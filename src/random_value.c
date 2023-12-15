#include <stdlib.h>
#include "random_value.h"

int random_int()
{
	return rand();
}

double random_float()
{
	return (double)rand() / (double)RAND_MAX;
}