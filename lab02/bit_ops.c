#include <stdio.h>
#include "bit_ops.h"
#include <math.h>

/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {
    /* YOUR CODE HERE */
    int temp = pow(2.0, (double) n);
    int ans = temp & x;

    return ans == temp ? 1 : 0; /* UPDATE WITH THE CORRECT RETURN VALUE*/
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    int temp = pow(2.0, (double) n);

    if (v == 1) {
        *x = *x | temp;
    } else {
        temp = ~temp;
        *x = *x & temp;
    }
    /* YOUR CODE HERE */
}

/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {
    /* YOUR CODE HERE */
    int a = get_bit(*x, n);
    a = a == 1 ? 0 : 1;
    set_bit(x, n, a);
}

