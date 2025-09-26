module decoder_tb;

  // Testbench signals
  logic [3:0] binary;
  logic [15:0] one_hot;

  // Instantiate the decoder module
  decoder uut (
    .binary(binary),
    .one_hot(one_hot)
  );

  // Complete your testbench here
  initial begin
    int i, j, cnt;
    
    for (i = 0; i < 16; i++) begin
      binary = i[3:0];
      #1;

      // Count how many 1 in one_hot
      cnt = 0;
      for (j = 0; j < 16; j++) begin
        if (one_hot[j]) cnt++;
      end

      // Only one 1 and it at index i
      if (cnt != 1 || !one_hot[i])
        $display("FAIL %d", i);
      else
        $display("PASS %d", i);
    end
  end


endmodule
