#include <stdio.h>
#include <assert.h>
#include <xmmintrin.h>
#define N 200

float multiply(float *arr1, float *arr2, int num) {
	__m128 *a = (__m128 *)arr1;
	__m128 *b = (__m128 *)arr2;
	__m128 rowsum128;
	rowsum128 = _mm_sub_ps(rowsum128, rowsum128);
	int i;
	for (i = 0; i < num / 4; i++) rowsum128 = _mm_add_ps(rowsum128, _mm_mul_ps(a[i], b[i]));
	float rowsum = rowsum128[0] + rowsum128[1] + rowsum128[2] + rowsum128[3];
	return rowsum;
}

float accumulator(float *sum,int num){
	__m128 accum128;
	__m128 *sum128=(__m128 *)sum;
	float accum;
	int i;
	accum128 = _mm_sub_ps(accum128, accum128);
	for(i=0;i<num/4;i++) accum128=_mm_add_ps(accum128,sum128[i]);
	accum=accum128[0]+accum128[1]+accum128[2]+accum128[3];
	return accum;
}


int main()
{
	FILE *fin = fopen("data.txt", "r");
	assert(fin != NULL);
	int i, j, k;
	int num = 200;
	float matrix[N][N] __attribute__ ((aligned(16)));
	for (i = 0; i < num; i++) {
		for (j = 0; j < num; j++) fscanf(fin, "%f", &matrix[i][j]);
	}
	printf(" ");
	float rowsum[N][N] = {0};
	for (i = 0; i < num; i++) {
		for (j = 0; j < num; j++) {
			rowsum[i][j] = multiply(matrix[i], matrix[j], num);
		}
	}
	float accum[N]={0};
	for(i=0;i<num;i++){
		accum[i]=accumulator(rowsum[i],num);
	}
	for(i=0;i<num;i++) printf("%f\n",accum[i]);
	return 0;
}