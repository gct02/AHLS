/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
 *
 * Web address: http://polybench.sourceforge.net
 */

# ifndef _GRAMSCHMIDT_H
# define _GRAMSCHMIDT_H

void kernel_gramschmidt(double A[1000][1200], double R[1200][1200], double Q[1000][1200]);

#endif /* !_GRAMSCHMIDT_H */