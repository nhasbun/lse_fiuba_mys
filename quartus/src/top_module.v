module top_module (
    input FPGA_CLK1_50,
    output [7:0] LED,
    input [3:0] SWITCH,

    // sdram declaration requirement
    // Error: The auto-constraining script was not able to detect any instance for core < hps_sdram_p0 >
    output wire [14:0] memory_mem_a,
    output wire [2:0]  memory_mem_ba,
    output wire        memory_mem_ck,
    output wire        memory_mem_ck_n,
    output wire        memory_mem_cke,
    output wire        memory_mem_cs_n,
    output wire        memory_mem_ras_n,
    output wire        memory_mem_cas_n,
    output wire        memory_mem_we_n,
    output wire        memory_mem_reset_n,
    inout  wire [31:0] memory_mem_dq,
    inout  wire [3:0]  memory_mem_dqs,
    inout  wire [3:0]  memory_mem_dqs_n,
    output wire        memory_mem_odt,
    output wire [3:0]  memory_mem_dm,
    input  wire        memory_oct_rzqin,

    // hps ios are needed too
    output wire        hps_io_hps_io_emac1_inst_TX_CLK,
    output wire        hps_io_hps_io_emac1_inst_TXD0,
    output wire        hps_io_hps_io_emac1_inst_TXD1,
    output wire        hps_io_hps_io_emac1_inst_TXD2,
    output wire        hps_io_hps_io_emac1_inst_TXD3,
    input  wire        hps_io_hps_io_emac1_inst_RXD0,
    inout  wire        hps_io_hps_io_emac1_inst_MDIO,
    output wire        hps_io_hps_io_emac1_inst_MDC,
    input  wire        hps_io_hps_io_emac1_inst_RX_CTL,
    output wire        hps_io_hps_io_emac1_inst_TX_CTL,
    input  wire        hps_io_hps_io_emac1_inst_RX_CLK,
    input  wire        hps_io_hps_io_emac1_inst_RXD1,
    input  wire        hps_io_hps_io_emac1_inst_RXD2,
    input  wire        hps_io_hps_io_emac1_inst_RXD3
);


    axi_test u0 (
        .clk_clk                           (FPGA_CLK1_50),
        .led_core_0_led_out_dummy          (LED),
        .sw_pio_external_connection_export (SWITCH),

        .memory_mem_a                 (memory_mem_a),
        .memory_mem_ba                (memory_mem_ba),
        .memory_mem_ck                (memory_mem_ck),
        .memory_mem_ck_n              (memory_mem_ck_n),
        .memory_mem_cke               (memory_mem_cke),
        .memory_mem_cs_n              (memory_mem_cs_n),
        .memory_mem_ras_n             (memory_mem_ras_n),
        .memory_mem_cas_n             (memory_mem_cas_n),
        .memory_mem_we_n              (memory_mem_we_n),
        .memory_mem_reset_n           (memory_mem_reset_n),
        .memory_mem_dq                (memory_mem_dq),
        .memory_mem_dqs               (memory_mem_dqs),
        .memory_mem_dqs_n             (memory_mem_dqs_n),
        .memory_mem_odt               (memory_mem_odt),
        .memory_mem_dm                (memory_mem_dm),
        .memory_oct_rzqin             (memory_oct_rzqin),

        .hps_io_hps_io_emac1_inst_TX_CLK (hps_io_hps_io_emac1_inst_TX_CLK),
        .hps_io_hps_io_emac1_inst_TXD0   (hps_io_hps_io_emac1_inst_TXD0),
        .hps_io_hps_io_emac1_inst_TXD1   (hps_io_hps_io_emac1_inst_TXD1),
        .hps_io_hps_io_emac1_inst_TXD2   (hps_io_hps_io_emac1_inst_TXD2),
        .hps_io_hps_io_emac1_inst_TXD3   (hps_io_hps_io_emac1_inst_TXD3),
        .hps_io_hps_io_emac1_inst_RXD0   (hps_io_hps_io_emac1_inst_RXD0),
        .hps_io_hps_io_emac1_inst_MDIO   (hps_io_hps_io_emac1_inst_MDIO),
        .hps_io_hps_io_emac1_inst_MDC    (hps_io_hps_io_emac1_inst_MDC),
        .hps_io_hps_io_emac1_inst_RX_CTL (hps_io_hps_io_emac1_inst_RX_CTL),
        .hps_io_hps_io_emac1_inst_TX_CTL (hps_io_hps_io_emac1_inst_TX_CTL),
        .hps_io_hps_io_emac1_inst_RX_CLK (hps_io_hps_io_emac1_inst_RX_CLK),
        .hps_io_hps_io_emac1_inst_RXD1   (hps_io_hps_io_emac1_inst_RXD1),
        .hps_io_hps_io_emac1_inst_RXD2   (hps_io_hps_io_emac1_inst_RXD2),
        .hps_io_hps_io_emac1_inst_RXD3   (hps_io_hps_io_emac1_inst_RXD3)
    );

endmodule
