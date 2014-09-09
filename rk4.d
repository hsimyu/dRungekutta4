/**
  dRungeKutta4
  Copyright (c) 2014 hoshimi
  This code is released under the MIT License.
*/

module rk4;

T[] rungekutta4(T:T[])(T h, T delegate(T[], T[])[] funcs, T[] phase, T[] params){
    int dim = cast(int)funcs.length;
    T[] k1; T[] k2; T[] k3; T[] k4; T[] res;
    k1.length = dim; k2.length = dim; k3.length = dim; k4.length = dim;
    res.length = dim;
    T[] temp_phase = phase.dup;

    k1 = calcRungeKuttaFunc!(T[])(h, funcs, temp_phase, params, dim);

    for(uint i = 0; i < dim; i++){
        temp_phase[i] += k1[i]/2.0;
    }
    k2 = calcRungeKuttaFunc!(T[])(h, funcs, temp_phase, params, dim);

    for(uint i = 0; i < dim; i++){
        temp_phase[i] += k2[i]/2.0 - k1[i]/2.0;
    }
    k3 = calcRungeKuttaFunc!(T[])(h, funcs, temp_phase, params, dim);

    for(uint i = 0; i < dim; i++){
        temp_phase[i] += k3[i] - k2[i]/2.0;
    }
    k4 = calcRungeKuttaFunc!(T[])(h, funcs, temp_phase, params, dim);
    
    for(uint i = 0; i < dim; i++){
        res[i] = (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i])/6.0;
    }

    return res;
}

T[] calcRungeKuttaFunc(T:T[])(T h, T delegate(T[], T[])[] funcs, T[] phase, T[] params, int dim){
    T[] k;
    k.length = dim;
    foreach(i, v; k){
        k[i] = h * funcs[i](phase, params);
    }

    return k;
}
