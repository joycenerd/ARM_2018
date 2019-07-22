all: hw8.out hw8simd.out clean
hw8.out: hw8.c;\
gcc hw8.c -o hw8.out;\
./hw8.out

hw8simd.out: hw8simd.c;\
gcc -msse hw8simd.c -o hw8simd.out;\
./hw8simd.out

clean: hw8.out hw8simd.out;\
rm -f hw8.out;\
rm -f hw8simd.out;