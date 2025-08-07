
#define N 100

void init_arr(int arr[N]) {
    int i;

    init_arr_loop1:
    for (i = 0; i < N; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
        arr[i] = 0;
    }
}

int fn1(int arr[N]) {
    int i, num = 0;

    fn1_loop1:
    for (i = 0; i < N; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
        if (arr[i] > 0) {
            num += arr[i];
        }
    }
    return num;
}

void top_fn(int in_arr[N], int out_arr[N]) {
    int i, j, num;

    init_arr(out_arr);

    num = fn1(in_arr);

    top_fn_loop1:
    for (i = 0; i < N; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100

        top_fn_loop1_1:
        for (j = 0; j < N; j++) {
            #pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
            if (in_arr[j] > 0) {
                out_arr[i] = out_arr[i] + in_arr[j] + num;
            } else {
                out_arr[i] = out_arr[i] + in_arr[j];
            }
        }
    }
}