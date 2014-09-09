#!/usr/local/bin/rdmd
import rk4;

void main() {
    double f1(double[] phase, double[] params)
    {
        return phase[3];
    }
    double f2(double[] phase, double[] params)
    {
        return phase[4];
    }
    double f3(double[] phase, double[] params)
    {
        return phase[5];
    }
    double f4(double[] phase, double[] params)
    {
        return phase[0];
    }
    double f5(double[] phase, double[] params)
    {
        return phase[1];
    }
    double f6(double[] phase, double[] params)
    {
        return phase[2];
    }
    double delegate(double[], double[]) fp[6];

    fp[0] = &f1; fp[1] = &f2; fp[2] = &f3;
    fp[3] = &f4; fp[4] = &f5; fp[5] = &f6;

    double h = 0.001;
    double[] particle = [1.0, 1.0, 0.0, -1.0, 0.0, 2.0];
    double[] params = [1.0];

    double[] res = rungekutta4!(double[])(h, fp, particle, params);
}
