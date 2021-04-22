# Assemply-MIPS-Examples 
Ex 1- Write, run and test a MIPS program to implement the following C code segment. 
if (g > h)
g = g + h;
else if (g < h)
 g = g − h;
else
 g = g * h;
 
Ex 2- Develop an algorithm, test it and then implement it in MIPS assembly that takes an array of 
characters and prints the number of UPPERCASE letters and the number of LOWERCASE 
letters. 

Ex 3- Write, run and test a MIPS program to execute the following nested C loop. 
for(i = 0; i < a; i++) 
 for(j = 0; j < b; j++) 
 C[2 * i] = i – j; 
 
Ex 4- Translate the following C program to MIPS assembly.
int main() {
...
t1 = sumOdd (10);
printf ("%d", t1);
...
}
int sumOdd (int n) {
int i, result = 0;
for (i = 0; i < n; i++)
if ((i % 2) == 1)
result += i;
return result;
}

5- In A2 we designed a floating point multiplication unit. When a processor does not support 
floating point arithmetic with hardware, it is still possible to support floating-point operations 
using software libraries to simulate what the hardware would do. It is required to write a MIPS 
function that takes two floating-point numbers using IEEE754 and multiplies them and returns 
the result in a third register
(Hint this will require separating the mantissa and exponent, adding the leading one, 
multiplying the mantissas together, adding the exponents, subtracting 127, normalizing the
result. etc. Ignore special cases like infinity, NaN, but consider the case of zero.)
