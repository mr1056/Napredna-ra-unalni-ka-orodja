#include <iostream>
#include <cmath>

using namespace std;

double eksfun(double x) {
    return exp(3 * x);
}

double arctanfun(double x, int členi) {
    double rezultat = 0;
    for (int n = 0; n < členi; ++n) {
        rezultat += pow(-1, n) * pow(x, 2 * n + 1) / (2 * n + 1);
    }
    return rezultat;
}

double trapezna(double a, double b, int n) {
    double h = (b - a) / n;
    double vsota = (eksfun(a) * arctanfun(a / 2, 10) + eksfun(b) * arctanfun(b / 2, 10)) / 2.0;

    for (int i = 1; i < n; ++i) {
        double x = a + i * h;
        vsota += eksfun(x) * arctanfun(x / 2, 10);
    }

    return h * vsota;
}

int main() {
    double a = 0.0;
    double b = M_PI / 4.0;
    int n = 1000;

    double rezultat = trapezna(a, b, n);

    cout << "Približna vrednost integrala je " << rezultat << endl;

    return 0;
}
