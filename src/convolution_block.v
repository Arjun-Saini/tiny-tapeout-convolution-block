/*
 * Copyright (c) 2024 Arjun Saini 
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_c2s2_convolution_block  (
  input wire clk,
  input wire reset,
  
  // TODO: link the tiny tapeout pins to req1, req2, and resp
  // see project.v for example
  
  // input array
  input logic [3:0] req1_msg[2],

  // input filter
  input logic [3:0] req2_msg[2],

  // output array
  output logic [3:0] resp_msg[2]
);

  // perform array convolution: output[i] = input[i] * filter[n - i]
  generate
    for (genvar i = 0; i < 2; i++) begin
      always @(posedge clk) begin
        resp_msg[i] <= reset ? 0 : req1_msg[i] * req2_msg[1-i];
      end
    end
  endgenerate
endmodule
