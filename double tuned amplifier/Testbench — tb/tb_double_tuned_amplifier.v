`include "constants.vams"
`include "disciplines.vams"

module double_tuned_amplifier(in, out, gnd);

    input  in;
    output out;
    input  gnd;

    electrical in, out, gnd;

    parameter real gain = 20.0;
    parameter real f0   = 1.0e6;
    parameter real bw   = 2.0e5;
    parameter real k    = 0.8;

    real freq;
    real response;
    real omega;
    real denominator;

    analog begin

        /*
         * Behavioral double-tuned response.
         *
         * The response consists of two coupled
         * resonant sections. The response is maximum
         * around f0 and decreases away from resonance.
         */

        omega = 2.0 * `M_PI * f0;

        /*
         * Approximate normalized double-tuned
         * frequency response.
         */
        denominator =
            1.0 +
            pow((V(in) / bw), 2);

        response = gain / denominator;

        /*
         * Coupling factor modifies the output.
         */
        response = response * k;

        V(out) <+ response * V(in);

    end

endmodule