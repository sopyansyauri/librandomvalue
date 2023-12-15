#include <stdio.h>
#include <random_value.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    int number_int[2][2];
    double number_double[2][2];

    int i, j;

    // In order to get random value
    srand(time(0));
    for (i = 0; i < sizeof(number_int) / sizeof(number_int[0]); i++)
    {
        for (j = 0; j < sizeof(number_int[0]) / sizeof(number_int[0][0]); j++)
        {
            number_int[i][j] = random_int();
        }
    }

    for (i = 0; i < sizeof(number_int) / sizeof(number_int[0]); i++)
    {
        for (j = 0; j < sizeof(number_int[0]) / sizeof(number_int[0][0]); j++)
        {
            printf("%d ", number_int[i][j]);
        }
        printf("\n");
    }

    printf("\n");

    // In order to get random value
    srand(time(0));
    for (i = 0; i < sizeof(number_double) / sizeof(number_double[0]); i++)
    {
        for (j = 0; j < sizeof(number_double[0]) / sizeof(number_double[0][0]); j++)
        {
            number_double[i][j] = random_float();
        }
    }

    for (i = 0; i < sizeof(number_double) / sizeof(number_double[0]); i++)
    {
        for (j = 0; j < sizeof(number_double[0]) / sizeof(number_double[0][0]); j++)
        {
            printf("%f ", number_double[i][j]);
        }
        printf("\n");
    }

    return 0;
}
