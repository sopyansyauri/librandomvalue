#include <stdlib.h>
#include <time.h>
#include "random_value.h"

int random_int()
{
	srand(time(0));
	return rand();
}

double random_float()
{
	srand(time(0));
	return (double)rand() / (double)RAND_MAX;
}
