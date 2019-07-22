#include <stdio.h>
#include <assert.h>
#define N 200


int main()
{
	FILE *fin=fopen("data.txt","r");
	FILE *fout=fopen("output.txt","w");
	assert(fin!=NULL);
	int i,j,k;
	// read data
	float matrix[N][N];
	for(i=0;i<N;i++){
		for(j=0;j<N;j++) fscanf(fin,"%f",&matrix[i][j]);
	}
	// doing multiplication and addtion between each row pair
	float rowsum[N][N]={0};
	for(i=0;i<N;i++){
		for(j=0;j<N;j++){
			for(k=0;k<N;k++){
				rowsum[i][j]+=matrix[i][k]*matrix[j][k];
			}
		}
	}
	// add each related pair together to form the result
	float accum[N]={0};
	for(i=0;i<N;i++){
		for(j=0;j<N;j++){
			accum[i]+=rowsum[i][j];
		}
	}
	// print the result to output file
	for(i=0;i<N;i++) fprintf(fout,"%f\n",accum[i]);
	fclose(fin);fclose(fout);
	return 0;
}
