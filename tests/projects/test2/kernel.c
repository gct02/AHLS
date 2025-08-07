
#define N 100

void init_arr(int arr[N]) {
    int i;

    init_arr_loop1:
    for (i = 0; i < N; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
        arr[i] = 0;
    }
}

void top_fn(int in_arr[N], int out_arr[N]) {
    int i, j;

    init_arr(out_arr);

    top_fn_loop1:
    for (i = 0; i < N; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100

        top_fn_loop1_1:
        for (j = 0; j < N; j++) {
            #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
            out_arr[i] = out_arr[i] + in_arr[j];
        }
    }
}