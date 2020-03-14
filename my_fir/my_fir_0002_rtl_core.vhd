-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.1 (Release Build #670)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from my_fir_0002_rtl_core
-- VHDL created on Sat Mar 14 17:19:18 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity my_fir_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(33 downto 0);  -- sfix34
        clk : in std_logic;
        areset : in std_logic
    );
end my_fir_0002_rtl_core;

architecture normal of my_fir_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra11_count0_lutreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra11_count0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra11_count0_i : UNSIGNED (2 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra11_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_we11_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we11_seq_eq : std_logic;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_wa11_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_wa11_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa11_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr11_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_ca9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca9_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_ca9_i : signal is true;
    signal u0_m0_wo0_cma0_reset : std_logic;
    type u0_m0_wo0_cma0_a0type is array(NATURAL range <>) of SIGNED(15 downto 0);
    signal u0_m0_wo0_cma0_a0 : u0_m0_wo0_cma0_a0type(0 to 9);
    attribute preserve of u0_m0_wo0_cma0_a0 : signal is true;
    signal u0_m0_wo0_cma0_b0 : u0_m0_wo0_cma0_a0type(0 to 9);
    attribute preserve of u0_m0_wo0_cma0_b0 : signal is true;
    type u0_m0_wo0_cma0_c0type is array(NATURAL range <>) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c0 : u0_m0_wo0_cma0_c0type(0 to 9);
    attribute preserve of u0_m0_wo0_cma0_c0 : signal is true;
    type u0_m0_wo0_cma0_ltype is array(NATURAL range <>) of SIGNED(16 downto 0);
    signal u0_m0_wo0_cma0_l : u0_m0_wo0_cma0_ltype(0 to 9);
    type u0_m0_wo0_cma0_rtype is array(NATURAL range <>) of SIGNED(11 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_rtype(0 to 9);
    type u0_m0_wo0_cma0_ptype is array(NATURAL range <>) of SIGNED(28 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_ptype(0 to 9);
    type u0_m0_wo0_cma0_utype is array(NATURAL range <>) of SIGNED(43 downto 0);
    signal u0_m0_wo0_cma0_u : u0_m0_wo0_cma0_utype(0 to 9);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_utype(0 to 9);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_utype(0 to 9);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_utype(0 to 9);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(144,12),
        1 => TO_SIGNED(108,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-122,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-186,12),
        1 => TO_SIGNED(-141,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(167,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k4 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(260,12),
        1 => TO_SIGNED(204,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k5 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-263,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k6 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(-434,12),
        1 => TO_SIGNED(-368,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k7 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(614,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k8 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(1303,12),
        1 => TO_SIGNED(1842,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k9 : u0_m0_wo0_cma0_rtype(0 to 7) := (
        0 => TO_SIGNED(0,12),
        1 => TO_SIGNED(2047,12),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_z : u0_m0_wo0_cma0_utype(0 to 0);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_utype(0 to 9);
    signal u0_m0_wo0_cma0_anl : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cma0_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_cma0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_cma0_ena0 : std_logic;
    signal u0_m0_wo0_cma0_ena1 : std_logic;
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr1_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr1_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr1_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr5_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr5_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr5_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr5_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr9_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr9_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr9_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr9_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of u0_m0_wo0_wi0_r0_delayr9_sticky_ena_q : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr12_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr12_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr12_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr12_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr16_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_delayr16_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_delayr16_rdcnt_i : signal is true;
    signal u0_m0_wo0_wi0_r0_delayr16_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q : signal is true;
    signal d_xIn_0_13_mem_reset0 : std_logic;
    signal d_xIn_0_13_mem_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_13_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_mem_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_13_mem_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_xIn_0_13_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of d_xIn_0_13_rdcnt_i : signal is true;
    signal d_xIn_0_13_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of d_xIn_0_13_sticky_ena_q : signal is true;
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_rdmux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdmux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_rdmux_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra11_count0_lut_q : STD_LOGIC_VECTOR (1 downto 0);
    signal out0_m0_wo0_lineup_select_delay_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_c : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_d : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_e : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split5_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split5_c : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split5_d : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split5_e : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_sym_add9_assign_id4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split12_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split12_c : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split12_d : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split12_e : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_c : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_d : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_split16_e : STD_LOGIC_VECTOR (15 downto 0);
    signal out0_m0_wo0_assign_id3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_join1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_join5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_join12_q : STD_LOGIC_VECTOR (63 downto 0);
    signal u0_m0_wo0_wi0_r0_join16_q : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- u0_m0_wo0_wi0_r0_delayr9_notEnable(LOGICAL,108)@13
    u0_m0_wo0_wi0_r0_delayr9_notEnable_q <= STD_LOGIC_VECTOR(not (d_u0_m0_wo0_compute_q_13_q));

    -- u0_m0_wo0_wi0_r0_delayr9_nor(LOGICAL,109)@13
    u0_m0_wo0_wi0_r0_delayr9_nor_q <= not (u0_m0_wo0_wi0_r0_delayr9_notEnable_q or u0_m0_wo0_wi0_r0_delayr9_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr9_cmpReg(REG,107)@13 + 1
    u0_m0_wo0_wi0_r0_delayr9_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr9_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr9_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr9_sticky_ena(REG,110)@13 + 1
    u0_m0_wo0_wi0_r0_delayr9_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr9_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr9_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr9_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr9_enaAnd(LOGICAL,111)@13
    u0_m0_wo0_wi0_r0_delayr9_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr9_sticky_ena_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_delayr9_rdcnt(COUNTER,104)@13 + 1
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr9_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr9_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr9_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr9_rdcnt_i, 1)));

    -- u0_m0_wo0_wi0_r0_delayr9_rdmux(MUX,105)@13
    u0_m0_wo0_wi0_r0_delayr9_rdmux_s <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_r0_delayr9_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr9_rdmux_s, u0_m0_wo0_wi0_r0_delayr9_wraddr_q, u0_m0_wo0_wi0_r0_delayr9_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr9_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr9_rdmux_q <= u0_m0_wo0_wi0_r0_delayr9_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr9_rdmux_q <= u0_m0_wo0_wi0_r0_delayr9_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr9_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_wi0_r0_delayr9_wraddr(REG,106)@13 + 1
    u0_m0_wo0_wi0_r0_delayr9_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr9_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr9_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr9_mem(DUALMEM,103)@13 + 2
    u0_m0_wo0_wi0_r0_delayr9_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split5_e);
    u0_m0_wo0_wi0_r0_delayr9_mem_aa <= u0_m0_wo0_wi0_r0_delayr9_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr9_mem_ab <= u0_m0_wo0_wi0_r0_delayr9_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr9_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr9_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr9_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr9_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr9_mem_ia,
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_delayr9_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr9_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr9_mem_q <= u0_m0_wo0_wi0_r0_delayr9_mem_iq(15 downto 0);

    -- u0_m0_wo0_sym_add9_assign_id4(DELAY,79)@13
    u0_m0_wo0_sym_add9_assign_id4_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_mem_q);

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(0 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(0, 1);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(0) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-1);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(0 downto 0));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,82)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra11_count0(COUNTER,24)@13
    -- low=0, high=7, step=1, init=1
    u0_m0_wo0_wi0_r0_ra11_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra11_count0_i <= TO_UNSIGNED(1, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra11_count0_i <= u0_m0_wo0_wi0_r0_ra11_count0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra11_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra11_count0_i, 3)));

    -- u0_m0_wo0_wi0_r0_ra11_count0_lut(LOOKUP,22)@13
    u0_m0_wo0_wi0_r0_ra11_count0_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra11_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra11_count0_q) IS
            WHEN "000" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "01";
            WHEN "001" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "00";
            WHEN "010" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "10";
            WHEN "011" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "01";
            WHEN "100" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "11";
            WHEN "101" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "10";
            WHEN "110" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "00";
            WHEN "111" => u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= "11";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra11_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra11_count0_lutreg(REG,23)@13
    u0_m0_wo0_wi0_r0_ra11_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra11_count0_lutreg_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra11_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra11_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_we11_seq(SEQUENCE,25)@12 + 1
    u0_m0_wo0_wi0_r0_we11_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_r0_we11_seq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we11_seq_c := "0000";
            u0_m0_wo0_wi0_r0_we11_seq_q <= "0";
            u0_m0_wo0_wi0_r0_we11_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_we11_seq_c = "0000") THEN
                    u0_m0_wo0_wi0_r0_we11_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_we11_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_we11_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_we11_seq_c := u0_m0_wo0_wi0_r0_we11_seq_c + 1;
                ELSE
                    u0_m0_wo0_wi0_r0_we11_seq_c := u0_m0_wo0_wi0_r0_we11_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_r0_we11_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_we11_seq_c(3 downto 3));
            ELSE
                u0_m0_wo0_wi0_r0_we11_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa11(COUNTER,27)@13
    -- low=0, high=3, step=1, init=3
    u0_m0_wo0_wi0_r0_wa11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa11_i <= TO_UNSIGNED(3, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we11_seq_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa11_i <= u0_m0_wo0_wi0_r0_wa11_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa11_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa11_i, 2)));

    -- u0_m0_wo0_wi0_r0_memr11(DUALMEM,29)@13
    u0_m0_wo0_wi0_r0_memr11_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split5_e);
    u0_m0_wo0_wi0_r0_memr11_aa <= u0_m0_wo0_wi0_r0_wa11_q;
    u0_m0_wo0_wi0_r0_memr11_ab <= u0_m0_wo0_wi0_r0_ra11_count0_lutreg_q;
    u0_m0_wo0_wi0_r0_memr11_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr11_aa,
        data_a => u0_m0_wo0_wi0_r0_memr11_ia,
        wren_a => u0_m0_wo0_wi0_r0_we11_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr11_ab,
        q_b => u0_m0_wo0_wi0_r0_memr11_iq
    );
    u0_m0_wo0_wi0_r0_memr11_q <= u0_m0_wo0_wi0_r0_memr11_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5_notEnable(LOGICAL,99)@13
    u0_m0_wo0_wi0_r0_delayr5_notEnable_q <= STD_LOGIC_VECTOR(not (d_u0_m0_wo0_compute_q_13_q));

    -- u0_m0_wo0_wi0_r0_delayr5_nor(LOGICAL,100)@13
    u0_m0_wo0_wi0_r0_delayr5_nor_q <= not (u0_m0_wo0_wi0_r0_delayr5_notEnable_q or u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr5_cmpReg(REG,98)@13 + 1
    u0_m0_wo0_wi0_r0_delayr5_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr5_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr5_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr5_sticky_ena(REG,101)@13 + 1
    u0_m0_wo0_wi0_r0_delayr5_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr5_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr5_enaAnd(LOGICAL,102)@13
    u0_m0_wo0_wi0_r0_delayr5_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr5_sticky_ena_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_delayr5_rdcnt(COUNTER,95)@13 + 1
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr5_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr5_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr5_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr5_rdcnt_i, 1)));

    -- u0_m0_wo0_wi0_r0_delayr5_rdmux(MUX,96)@13
    u0_m0_wo0_wi0_r0_delayr5_rdmux_s <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_r0_delayr5_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr5_rdmux_s, u0_m0_wo0_wi0_r0_delayr5_wraddr_q, u0_m0_wo0_wi0_r0_delayr5_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr5_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr5_rdmux_q <= u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr5_rdmux_q <= u0_m0_wo0_wi0_r0_delayr5_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr5_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join5(BITJOIN,33)@13
    u0_m0_wo0_wi0_r0_join5_q <= u0_m0_wo0_wi0_r0_split5_d & u0_m0_wo0_wi0_r0_split5_c & u0_m0_wo0_wi0_r0_split5_b & u0_m0_wo0_wi0_r0_split1_e;

    -- u0_m0_wo0_wi0_r0_delayr5_wraddr(REG,97)@13 + 1
    u0_m0_wo0_wi0_r0_delayr5_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr5_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr5_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr5_mem(DUALMEM,94)@13 + 2
    u0_m0_wo0_wi0_r0_delayr5_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join5_q);
    u0_m0_wo0_wi0_r0_delayr5_mem_aa <= u0_m0_wo0_wi0_r0_delayr5_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr5_mem_ab <= u0_m0_wo0_wi0_r0_delayr5_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr5_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr5_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 64,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr5_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr5_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr5_mem_ia,
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_delayr5_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr5_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr5_mem_q <= u0_m0_wo0_wi0_r0_delayr5_mem_iq(63 downto 0);

    -- u0_m0_wo0_wi0_r0_split5(BITSELECT,34)@13
    u0_m0_wo0_wi0_r0_split5_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_mem_q(15 downto 0));
    u0_m0_wo0_wi0_r0_split5_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_mem_q(31 downto 16));
    u0_m0_wo0_wi0_r0_split5_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_mem_q(47 downto 32));
    u0_m0_wo0_wi0_r0_split5_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_mem_q(63 downto 48));

    -- u0_m0_wo0_wi0_r0_delayr12_notEnable(LOGICAL,119)@13
    u0_m0_wo0_wi0_r0_delayr12_notEnable_q <= STD_LOGIC_VECTOR(not (d_u0_m0_wo0_compute_q_13_q));

    -- u0_m0_wo0_wi0_r0_delayr12_nor(LOGICAL,120)@13
    u0_m0_wo0_wi0_r0_delayr12_nor_q <= not (u0_m0_wo0_wi0_r0_delayr12_notEnable_q or u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr12_mem_last(CONSTANT,116)
    u0_m0_wo0_wi0_r0_delayr12_mem_last_q <= "010";

    -- u0_m0_wo0_wi0_r0_delayr12_cmp(LOGICAL,117)@13
    u0_m0_wo0_wi0_r0_delayr12_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_delayr12_rdmux_q);
    u0_m0_wo0_wi0_r0_delayr12_cmp_q <= "1" WHEN u0_m0_wo0_wi0_r0_delayr12_mem_last_q = u0_m0_wo0_wi0_r0_delayr12_cmp_b ELSE "0";

    -- u0_m0_wo0_wi0_r0_delayr12_cmpReg(REG,118)@13 + 1
    u0_m0_wo0_wi0_r0_delayr12_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr12_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr12_cmpReg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr12_sticky_ena(REG,121)@13 + 1
    u0_m0_wo0_wi0_r0_delayr12_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr12_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr12_enaAnd(LOGICAL,122)@13
    u0_m0_wo0_wi0_r0_delayr12_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr12_sticky_ena_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_delayr12_rdcnt(COUNTER,113)@13 + 1
    -- low=0, high=3, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr12_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr12_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr12_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr12_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr12_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr12_rdcnt_i, 2)));

    -- u0_m0_wo0_wi0_r0_delayr12_rdmux(MUX,114)@13
    u0_m0_wo0_wi0_r0_delayr12_rdmux_s <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_r0_delayr12_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr12_rdmux_s, u0_m0_wo0_wi0_r0_delayr12_wraddr_q, u0_m0_wo0_wi0_r0_delayr12_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr12_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr12_rdmux_q <= u0_m0_wo0_wi0_r0_delayr12_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr12_rdmux_q <= u0_m0_wo0_wi0_r0_delayr12_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr12_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join12(BITJOIN,38)@13
    u0_m0_wo0_wi0_r0_join12_q <= u0_m0_wo0_wi0_r0_split12_d & u0_m0_wo0_wi0_r0_split12_c & u0_m0_wo0_wi0_r0_split12_b & u0_m0_wo0_wi0_r0_memr11_q;

    -- u0_m0_wo0_wi0_r0_delayr12_wraddr(REG,115)@13 + 1
    u0_m0_wo0_wi0_r0_delayr12_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr12_wraddr_q <= "11";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr12_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr12_mem(DUALMEM,112)@13 + 2
    u0_m0_wo0_wi0_r0_delayr12_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join12_q);
    u0_m0_wo0_wi0_r0_delayr12_mem_aa <= u0_m0_wo0_wi0_r0_delayr12_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr12_mem_ab <= u0_m0_wo0_wi0_r0_delayr12_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr12_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr12_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 64,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr12_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr12_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr12_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr12_mem_ia,
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_delayr12_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr12_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr12_mem_q <= u0_m0_wo0_wi0_r0_delayr12_mem_iq(63 downto 0);

    -- u0_m0_wo0_wi0_r0_split12(BITSELECT,39)@13
    u0_m0_wo0_wi0_r0_split12_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_mem_q(15 downto 0));
    u0_m0_wo0_wi0_r0_split12_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_mem_q(31 downto 16));
    u0_m0_wo0_wi0_r0_split12_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_mem_q(47 downto 32));
    u0_m0_wo0_wi0_r0_split12_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_mem_q(63 downto 48));

    -- u0_m0_wo0_wi0_r0_delayr1_notEnable(LOGICAL,90)@13
    u0_m0_wo0_wi0_r0_delayr1_notEnable_q <= STD_LOGIC_VECTOR(not (d_u0_m0_wo0_compute_q_13_q));

    -- u0_m0_wo0_wi0_r0_delayr1_nor(LOGICAL,91)@13
    u0_m0_wo0_wi0_r0_delayr1_nor_q <= not (u0_m0_wo0_wi0_r0_delayr1_notEnable_q or u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr1_cmpReg(REG,89)@13 + 1
    u0_m0_wo0_wi0_r0_delayr1_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr1_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1_sticky_ena(REG,92)@13 + 1
    u0_m0_wo0_wi0_r0_delayr1_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr1_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1_enaAnd(LOGICAL,93)@13
    u0_m0_wo0_wi0_r0_delayr1_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr1_sticky_ena_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_delayr1_rdcnt(COUNTER,86)@13 + 1
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr1_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr1_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr1_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr1_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr1_rdcnt_i, 1)));

    -- u0_m0_wo0_wi0_r0_delayr1_rdmux(MUX,87)@13
    u0_m0_wo0_wi0_r0_delayr1_rdmux_s <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_r0_delayr1_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr1_rdmux_s, u0_m0_wo0_wi0_r0_delayr1_wraddr_q, u0_m0_wo0_wi0_r0_delayr1_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr1_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr1_rdmux_q <= u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr1_rdmux_q <= u0_m0_wo0_wi0_r0_delayr1_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr1_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join1(BITJOIN,30)@13
    u0_m0_wo0_wi0_r0_join1_q <= u0_m0_wo0_wi0_r0_split1_d & u0_m0_wo0_wi0_r0_split1_c & u0_m0_wo0_wi0_r0_split1_b & u0_m0_wo0_wi0_r0_memr0_q;

    -- u0_m0_wo0_wi0_r0_delayr1_wraddr(REG,88)@13 + 1
    u0_m0_wo0_wi0_r0_delayr1_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr1_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr1_mem(DUALMEM,85)@13 + 2
    u0_m0_wo0_wi0_r0_delayr1_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join1_q);
    u0_m0_wo0_wi0_r0_delayr1_mem_aa <= u0_m0_wo0_wi0_r0_delayr1_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr1_mem_ab <= u0_m0_wo0_wi0_r0_delayr1_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr1_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr1_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 64,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr1_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr1_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr1_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr1_mem_ia,
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_delayr1_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr1_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr1_mem_q <= u0_m0_wo0_wi0_r0_delayr1_mem_iq(63 downto 0);

    -- u0_m0_wo0_wi0_r0_split1(BITSELECT,31)@13
    u0_m0_wo0_wi0_r0_split1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(15 downto 0));
    u0_m0_wo0_wi0_r0_split1_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(31 downto 16));
    u0_m0_wo0_wi0_r0_split1_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(47 downto 32));
    u0_m0_wo0_wi0_r0_split1_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr1_mem_q(63 downto 48));

    -- u0_m0_wo0_ca9(COUNTER,44)@13
    -- low=0, high=1, step=1, init=1
    u0_m0_wo0_ca9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca9_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_ca9_i <= u0_m0_wo0_ca9_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca9_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca9_i, 1)));

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,21)@13
    -- low=0, high=5, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 3);
            u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(4, 3)) THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 3;
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 3)));

    -- u0_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,19)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "00";
            WHEN "001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "01";
            WHEN "010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "01";
            WHEN "011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "10";
            WHEN "100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "10";
            WHEN "101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "00";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,20)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13_notEnable(LOGICAL,138)@10
    d_xIn_0_13_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- d_xIn_0_13_nor(LOGICAL,139)@10
    d_xIn_0_13_nor_q <= not (d_xIn_0_13_notEnable_q or d_xIn_0_13_sticky_ena_q);

    -- d_xIn_0_13_cmpReg(REG,137)@10 + 1
    d_xIn_0_13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_13_sticky_ena(REG,140)@10 + 1
    d_xIn_0_13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_13_nor_q = "1") THEN
                d_xIn_0_13_sticky_ena_q <= STD_LOGIC_VECTOR(d_xIn_0_13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13_enaAnd(LOGICAL,141)@10
    d_xIn_0_13_enaAnd_q <= d_xIn_0_13_sticky_ena_q and VCC_q;

    -- d_xIn_0_13_rdcnt(COUNTER,135)@10 + 1
    -- low=0, high=1, step=1, init=0
    d_xIn_0_13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_rdcnt_i <= d_xIn_0_13_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_xIn_0_13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(d_xIn_0_13_rdcnt_i, 1)));

    -- d_xIn_0_13_wraddr(REG,136)@10 + 1
    d_xIn_0_13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_13_wraddr_q <= "1";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_13_wraddr_q <= STD_LOGIC_VECTOR(d_xIn_0_13_rdcnt_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_13_mem(DUALMEM,134)@10 + 2
    d_xIn_0_13_mem_ia <= STD_LOGIC_VECTOR(xIn_0);
    d_xIn_0_13_mem_aa <= d_xIn_0_13_wraddr_q;
    d_xIn_0_13_mem_ab <= d_xIn_0_13_rdcnt_q;
    d_xIn_0_13_mem_reset0 <= areset;
    d_xIn_0_13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => d_xIn_0_13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => d_xIn_0_13_mem_reset0,
        clock1 => clk,
        address_a => d_xIn_0_13_mem_aa,
        data_a => d_xIn_0_13_mem_ia,
        wren_a => VCC_q(0),
        address_b => d_xIn_0_13_mem_ab,
        q_b => d_xIn_0_13_mem_iq
    );
    d_xIn_0_13_mem_q <= d_xIn_0_13_mem_iq(15 downto 0);

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,81)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,26)@13
    -- low=0, high=2, step=1, init=1
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(1, 2);
            u0_m0_wo0_wi0_r0_wa0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_wa0_i = TO_UNSIGNED(1, 2)) THEN
                    u0_m0_wo0_wi0_r0_wa0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_wa0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 2;
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 2)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,28)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_mem_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr16_notEnable(LOGICAL,130)@13
    u0_m0_wo0_wi0_r0_delayr16_notEnable_q <= STD_LOGIC_VECTOR(not (d_u0_m0_wo0_compute_q_13_q));

    -- u0_m0_wo0_wi0_r0_delayr16_nor(LOGICAL,131)@13
    u0_m0_wo0_wi0_r0_delayr16_nor_q <= not (u0_m0_wo0_wi0_r0_delayr16_notEnable_q or u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q);

    -- u0_m0_wo0_wi0_r0_delayr16_mem_last(CONSTANT,127)
    u0_m0_wo0_wi0_r0_delayr16_mem_last_q <= "010";

    -- u0_m0_wo0_wi0_r0_delayr16_cmp(LOGICAL,128)@13
    u0_m0_wo0_wi0_r0_delayr16_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_delayr16_rdmux_q);
    u0_m0_wo0_wi0_r0_delayr16_cmp_q <= "1" WHEN u0_m0_wo0_wi0_r0_delayr16_mem_last_q = u0_m0_wo0_wi0_r0_delayr16_cmp_b ELSE "0";

    -- u0_m0_wo0_wi0_r0_delayr16_cmpReg(REG,129)@13 + 1
    u0_m0_wo0_wi0_r0_delayr16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr16_cmpReg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_cmp_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr16_sticky_ena(REG,132)@13 + 1
    u0_m0_wo0_wi0_r0_delayr16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_delayr16_nor_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr16_enaAnd(LOGICAL,133)@13
    u0_m0_wo0_wi0_r0_delayr16_enaAnd_q <= u0_m0_wo0_wi0_r0_delayr16_sticky_ena_q and d_u0_m0_wo0_compute_q_13_q;

    -- u0_m0_wo0_wi0_r0_delayr16_rdcnt(COUNTER,124)@13 + 1
    -- low=0, high=3, step=1, init=0
    u0_m0_wo0_wi0_r0_delayr16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_delayr16_rdcnt_i <= u0_m0_wo0_wi0_r0_delayr16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_delayr16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_delayr16_rdcnt_i, 2)));

    -- u0_m0_wo0_wi0_r0_delayr16_rdmux(MUX,125)@13
    u0_m0_wo0_wi0_r0_delayr16_rdmux_s <= d_u0_m0_wo0_compute_q_13_q;
    u0_m0_wo0_wi0_r0_delayr16_rdmux_combproc: PROCESS (u0_m0_wo0_wi0_r0_delayr16_rdmux_s, u0_m0_wo0_wi0_r0_delayr16_wraddr_q, u0_m0_wo0_wi0_r0_delayr16_rdcnt_q)
    BEGIN
        CASE (u0_m0_wo0_wi0_r0_delayr16_rdmux_s) IS
            WHEN "0" => u0_m0_wo0_wi0_r0_delayr16_rdmux_q <= u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
            WHEN "1" => u0_m0_wo0_wi0_r0_delayr16_rdmux_q <= u0_m0_wo0_wi0_r0_delayr16_rdcnt_q;
            WHEN OTHERS => u0_m0_wo0_wi0_r0_delayr16_rdmux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_join16(BITJOIN,41)@13
    u0_m0_wo0_wi0_r0_join16_q <= u0_m0_wo0_wi0_r0_split16_d & u0_m0_wo0_wi0_r0_split16_c & u0_m0_wo0_wi0_r0_split16_b & u0_m0_wo0_wi0_r0_split12_e;

    -- u0_m0_wo0_wi0_r0_delayr16_wraddr(REG,126)@13 + 1
    u0_m0_wo0_wi0_r0_delayr16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_wraddr_q <= "11";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_delayr16_wraddr_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_rdmux_q);
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_delayr16_mem(DUALMEM,123)@13 + 2
    u0_m0_wo0_wi0_r0_delayr16_mem_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join16_q);
    u0_m0_wo0_wi0_r0_delayr16_mem_aa <= u0_m0_wo0_wi0_r0_delayr16_wraddr_q;
    u0_m0_wo0_wi0_r0_delayr16_mem_ab <= u0_m0_wo0_wi0_r0_delayr16_rdmux_q;
    u0_m0_wo0_wi0_r0_delayr16_mem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_delayr16_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 64,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => u0_m0_wo0_wi0_r0_delayr16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_r0_delayr16_mem_reset0,
        clock1 => clk,
        address_a => u0_m0_wo0_wi0_r0_delayr16_mem_aa,
        data_a => u0_m0_wo0_wi0_r0_delayr16_mem_ia,
        wren_a => d_u0_m0_wo0_compute_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_delayr16_mem_ab,
        q_b => u0_m0_wo0_wi0_r0_delayr16_mem_iq
    );
    u0_m0_wo0_wi0_r0_delayr16_mem_q <= u0_m0_wo0_wi0_r0_delayr16_mem_iq(63 downto 0);

    -- u0_m0_wo0_wi0_r0_split16(BITSELECT,42)@13
    u0_m0_wo0_wi0_r0_split16_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_mem_q(15 downto 0));
    u0_m0_wo0_wi0_r0_split16_c <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_mem_q(31 downto 16));
    u0_m0_wo0_wi0_r0_split16_d <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_mem_q(47 downto 32));
    u0_m0_wo0_wi0_r0_split16_e <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_mem_q(63 downto 48));

    -- u0_m0_wo0_aseq(SEQUENCE,69)@12 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "0000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "0000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 1;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_14(DELAY,84)@13 + 1
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,83)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cma0(CHAINMULTADD,68)@13 + 2
    u0_m0_wo0_cma0_reset <= areset;
    u0_m0_wo0_cma0_ena0 <= d_u0_m0_wo0_compute_q_13_q(0);
    u0_m0_wo0_cma0_ena1 <= d_u0_m0_wo0_compute_q_14_q(0);
    u0_m0_wo0_cma0_l(0) <= RESIZE(u0_m0_wo0_cma0_a0(0),17) + RESIZE(u0_m0_wo0_cma0_b0(0),17);
    u0_m0_wo0_cma0_l(1) <= RESIZE(u0_m0_wo0_cma0_a0(1),17) + RESIZE(u0_m0_wo0_cma0_b0(1),17);
    u0_m0_wo0_cma0_l(2) <= RESIZE(u0_m0_wo0_cma0_a0(2),17) + RESIZE(u0_m0_wo0_cma0_b0(2),17);
    u0_m0_wo0_cma0_l(3) <= RESIZE(u0_m0_wo0_cma0_a0(3),17) + RESIZE(u0_m0_wo0_cma0_b0(3),17);
    u0_m0_wo0_cma0_l(4) <= RESIZE(u0_m0_wo0_cma0_a0(4),17) + RESIZE(u0_m0_wo0_cma0_b0(4),17);
    u0_m0_wo0_cma0_l(5) <= RESIZE(u0_m0_wo0_cma0_a0(5),17) + RESIZE(u0_m0_wo0_cma0_b0(5),17);
    u0_m0_wo0_cma0_l(6) <= RESIZE(u0_m0_wo0_cma0_a0(6),17) + RESIZE(u0_m0_wo0_cma0_b0(6),17);
    u0_m0_wo0_cma0_l(7) <= RESIZE(u0_m0_wo0_cma0_a0(7),17) + RESIZE(u0_m0_wo0_cma0_b0(7),17);
    u0_m0_wo0_cma0_l(8) <= RESIZE(u0_m0_wo0_cma0_a0(8),17) + RESIZE(u0_m0_wo0_cma0_b0(8),17);
    u0_m0_wo0_cma0_l(9) <= RESIZE(u0_m0_wo0_cma0_a0(9),17) + RESIZE(u0_m0_wo0_cma0_b0(9),17);
    -- altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(144,12),
        1 => TO_SIGNED(108,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(-122,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(-186,12),
        1 => TO_SIGNED(-141,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        0 => TO_SIGNED(167,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k4 <= (
        0 => TO_SIGNED(260,12),
        1 => TO_SIGNED(204,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k5 <= (
        0 => TO_SIGNED(-263,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k6 <= (
        0 => TO_SIGNED(-434,12),
        1 => TO_SIGNED(-368,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k7 <= (
        0 => TO_SIGNED(614,12),
        1 => TO_SIGNED(0,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k8 <= (
        0 => TO_SIGNED(1303,12),
        1 => TO_SIGNED(1842,12),
        others => (others => '0'));
    u0_m0_wo0_cma0_k9 <= (
        0 => TO_SIGNED(0,12),
        1 => TO_SIGNED(2047,12),
        others => (others => '0'));
    -- altera synthesis_on
    u0_m0_wo0_cma0_r(0) <= u0_m0_wo0_cma0_k0(TO_INTEGER(u0_m0_wo0_cma0_c0(0)));
    u0_m0_wo0_cma0_r(1) <= u0_m0_wo0_cma0_k1(TO_INTEGER(u0_m0_wo0_cma0_c0(1)));
    u0_m0_wo0_cma0_r(2) <= u0_m0_wo0_cma0_k2(TO_INTEGER(u0_m0_wo0_cma0_c0(2)));
    u0_m0_wo0_cma0_r(3) <= u0_m0_wo0_cma0_k3(TO_INTEGER(u0_m0_wo0_cma0_c0(3)));
    u0_m0_wo0_cma0_r(4) <= u0_m0_wo0_cma0_k4(TO_INTEGER(u0_m0_wo0_cma0_c0(4)));
    u0_m0_wo0_cma0_r(5) <= u0_m0_wo0_cma0_k5(TO_INTEGER(u0_m0_wo0_cma0_c0(5)));
    u0_m0_wo0_cma0_r(6) <= u0_m0_wo0_cma0_k6(TO_INTEGER(u0_m0_wo0_cma0_c0(6)));
    u0_m0_wo0_cma0_r(7) <= u0_m0_wo0_cma0_k7(TO_INTEGER(u0_m0_wo0_cma0_c0(7)));
    u0_m0_wo0_cma0_r(8) <= u0_m0_wo0_cma0_k8(TO_INTEGER(u0_m0_wo0_cma0_c0(8)));
    u0_m0_wo0_cma0_r(9) <= u0_m0_wo0_cma0_k9(TO_INTEGER(u0_m0_wo0_cma0_c0(9)));
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_l(0) * u0_m0_wo0_cma0_r(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_l(1) * u0_m0_wo0_cma0_r(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_l(2) * u0_m0_wo0_cma0_r(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_l(3) * u0_m0_wo0_cma0_r(3);
    u0_m0_wo0_cma0_p(4) <= u0_m0_wo0_cma0_l(4) * u0_m0_wo0_cma0_r(4);
    u0_m0_wo0_cma0_p(5) <= u0_m0_wo0_cma0_l(5) * u0_m0_wo0_cma0_r(5);
    u0_m0_wo0_cma0_p(6) <= u0_m0_wo0_cma0_l(6) * u0_m0_wo0_cma0_r(6);
    u0_m0_wo0_cma0_p(7) <= u0_m0_wo0_cma0_l(7) * u0_m0_wo0_cma0_r(7);
    u0_m0_wo0_cma0_p(8) <= u0_m0_wo0_cma0_l(8) * u0_m0_wo0_cma0_r(8);
    u0_m0_wo0_cma0_p(9) <= u0_m0_wo0_cma0_l(9) * u0_m0_wo0_cma0_r(9);
    u0_m0_wo0_cma0_u(0) <= RESIZE(u0_m0_wo0_cma0_p(0),44);
    u0_m0_wo0_cma0_u(1) <= RESIZE(u0_m0_wo0_cma0_p(1),44);
    u0_m0_wo0_cma0_u(2) <= RESIZE(u0_m0_wo0_cma0_p(2),44);
    u0_m0_wo0_cma0_u(3) <= RESIZE(u0_m0_wo0_cma0_p(3),44);
    u0_m0_wo0_cma0_u(4) <= RESIZE(u0_m0_wo0_cma0_p(4),44);
    u0_m0_wo0_cma0_u(5) <= RESIZE(u0_m0_wo0_cma0_p(5),44);
    u0_m0_wo0_cma0_u(6) <= RESIZE(u0_m0_wo0_cma0_p(6),44);
    u0_m0_wo0_cma0_u(7) <= RESIZE(u0_m0_wo0_cma0_p(7),44);
    u0_m0_wo0_cma0_u(8) <= RESIZE(u0_m0_wo0_cma0_p(8),44);
    u0_m0_wo0_cma0_u(9) <= RESIZE(u0_m0_wo0_cma0_p(9),44);
    u0_m0_wo0_cma0_w(0) <= u0_m0_wo0_cma0_u(0);
    u0_m0_wo0_cma0_w(1) <= u0_m0_wo0_cma0_u(1);
    u0_m0_wo0_cma0_w(2) <= u0_m0_wo0_cma0_u(2);
    u0_m0_wo0_cma0_w(3) <= u0_m0_wo0_cma0_u(3);
    u0_m0_wo0_cma0_w(4) <= u0_m0_wo0_cma0_u(4);
    u0_m0_wo0_cma0_w(5) <= u0_m0_wo0_cma0_u(5);
    u0_m0_wo0_cma0_w(6) <= u0_m0_wo0_cma0_u(6);
    u0_m0_wo0_cma0_w(7) <= u0_m0_wo0_cma0_u(7);
    u0_m0_wo0_cma0_w(8) <= u0_m0_wo0_cma0_u(8);
    u0_m0_wo0_cma0_w(9) <= u0_m0_wo0_cma0_u(9);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_x(4) <= u0_m0_wo0_cma0_w(4);
    u0_m0_wo0_cma0_x(5) <= u0_m0_wo0_cma0_w(5);
    u0_m0_wo0_cma0_x(6) <= u0_m0_wo0_cma0_w(6);
    u0_m0_wo0_cma0_x(7) <= u0_m0_wo0_cma0_w(7);
    u0_m0_wo0_cma0_x(8) <= u0_m0_wo0_cma0_w(8);
    u0_m0_wo0_cma0_x(9) <= u0_m0_wo0_cma0_w(9);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_s(4) + u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_y(4) <= u0_m0_wo0_cma0_s(5) + u0_m0_wo0_cma0_x(4);
    u0_m0_wo0_cma0_y(5) <= u0_m0_wo0_cma0_s(6) + u0_m0_wo0_cma0_x(5);
    u0_m0_wo0_cma0_y(6) <= u0_m0_wo0_cma0_s(7) + u0_m0_wo0_cma0_x(6);
    u0_m0_wo0_cma0_y(7) <= u0_m0_wo0_cma0_s(8) + u0_m0_wo0_cma0_x(7);
    u0_m0_wo0_cma0_y(8) <= u0_m0_wo0_cma0_s(9) + u0_m0_wo0_cma0_x(8);
    u0_m0_wo0_cma0_y(9) <= u0_m0_wo0_cma0_x(9);
    u0_m0_wo0_cma0_z(0) <= u0_m0_wo0_cma0_s(0) WHEN u0_m0_wo0_cma0_anl(0) = '1' ELSE "00000000000000000000000000000000000000000000";
    u0_m0_wo0_cma0_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_b0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_c0 <= (others => (others => '0'));
            u0_m0_wo0_cma0_anl(0) <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena0 = '1') THEN
                u0_m0_wo0_cma0_a0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_e),16);
                u0_m0_wo0_cma0_a0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_d),16);
                u0_m0_wo0_cma0_a0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_c),16);
                u0_m0_wo0_cma0_a0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split16_b),16);
                u0_m0_wo0_cma0_a0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split12_e),16);
                u0_m0_wo0_cma0_a0(5) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split12_d),16);
                u0_m0_wo0_cma0_a0(6) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split12_c),16);
                u0_m0_wo0_cma0_a0(7) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split12_b),16);
                u0_m0_wo0_cma0_a0(8) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_memr11_q),16);
                u0_m0_wo0_cma0_a0(9) <= SIGNED(RESIZE(UNSIGNED(GND_q),16));
                u0_m0_wo0_cma0_b0(0) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_memr0_q),16);
                u0_m0_wo0_cma0_b0(1) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_b),16);
                u0_m0_wo0_cma0_b0(2) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_c),16);
                u0_m0_wo0_cma0_b0(3) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_d),16);
                u0_m0_wo0_cma0_b0(4) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split1_e),16);
                u0_m0_wo0_cma0_b0(5) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split5_b),16);
                u0_m0_wo0_cma0_b0(6) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split5_c),16);
                u0_m0_wo0_cma0_b0(7) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split5_d),16);
                u0_m0_wo0_cma0_b0(8) <= RESIZE(SIGNED(u0_m0_wo0_wi0_r0_split5_e),16);
                u0_m0_wo0_cma0_b0(9) <= RESIZE(SIGNED(u0_m0_wo0_sym_add9_assign_id4_q),16);
                u0_m0_wo0_cma0_c0(0) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(1) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(2) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(3) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(4) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(5) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(6) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(7) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(8) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_c0(9) <= RESIZE(UNSIGNED(u0_m0_wo0_ca9_q),3);
                u0_m0_wo0_cma0_anl(0) <= not(u0_m0_wo0_aseq_q(0));
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_cma0_ena1 = '1') THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_z(0) + u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
                u0_m0_wo0_cma0_s(4) <= u0_m0_wo0_cma0_y(4);
                u0_m0_wo0_cma0_s(5) <= u0_m0_wo0_cma0_y(5);
                u0_m0_wo0_cma0_s(6) <= u0_m0_wo0_cma0_y(6);
                u0_m0_wo0_cma0_s(7) <= u0_m0_wo0_cma0_y(7);
                u0_m0_wo0_cma0_s(8) <= u0_m0_wo0_cma0_y(8);
                u0_m0_wo0_cma0_s(9) <= u0_m0_wo0_cma0_y(9);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(u0_m0_wo0_cma0_s(0)(33 downto 0)), xout => u0_m0_wo0_cma0_qq, clk => clk, aclr => areset );
    u0_m0_wo0_cma0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_cma0_qq(33 downto 0));

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,71)@13 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "0001";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "0000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 1;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,72)@14
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_14_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,73)@14 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- out0_m0_wo0_lineup_select_delay_0(DELAY,75)@15
    out0_m0_wo0_lineup_select_delay_0_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_reg_q);

    -- out0_m0_wo0_assign_id3(DELAY,77)@15
    out0_m0_wo0_assign_id3_q <= STD_LOGIC_VECTOR(out0_m0_wo0_lineup_select_delay_0_q);

    -- xOut(PORTOUT,78)@15 + 1
    xOut_v <= out0_m0_wo0_assign_id3_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_cma0_q;

END normal;
