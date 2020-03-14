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

-- VHDL created from my_cordic_CORDIC_0
-- VHDL created on Sat Mar  7 09:29:22 2020


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

entity my_cordic_CORDIC_0 is
    port (
        a : in std_logic_vector(26 downto 0);  -- sfix27_en24
        c : out std_logic_vector(9 downto 0);  -- sfix10_en8
        s : out std_logic_vector(9 downto 0);  -- sfix10_en8
        clk : in std_logic;
        areset : in std_logic
    );
end my_cordic_CORDIC_0;

architecture normal of my_cordic_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal signA_uid7_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid8_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_a : STD_LOGIC_VECTOR (28 downto 0);
    signal absAE_uid9_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal absAE_uid9_sincosTest_o : STD_LOGIC_VECTOR (28 downto 0);
    signal absAE_uid9_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal absAR_uid10_sincosTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal absAR_uid10_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal cstPiO2_uid11_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal padBCst_uid12_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal bPostPad_uid13_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal argMPiO2_uid14_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal argMPiO2_uid14_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal argMPiO2_uid14_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal argMPiO2_uid14_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal firstQuadrant_uid15_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal absARE_uid16_sincosTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal absARE_uid16_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal argMPiO2_uid17_sincosTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal argMPiO2_uid17_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal absA_uid18_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid18_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal cstOneOverK_uid19_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal cstArcTan2Mi_0_uid23_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_1_uid29_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1CostZeroPaddingA_uid30_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal yip1E_1NA_uid31_sincosTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal yip1E_1sumAHighB_uid32_sincosTest_a : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1sumAHighB_uid32_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1sumAHighB_uid32_sincosTest_o : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1sumAHighB_uid32_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid32_sincosTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal invSignOfSelectionSignal_uid33_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1CostZeroPaddingA_uid34_sincosTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal aip1E_1NA_uid35_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_1sumAHighB_uid36_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid36_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid36_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid36_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid36_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_1_topRange_uid38_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1_1_topRange_uid38_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1_1_mergedSignalTM_uid39_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal xMSB_uid41_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid45_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid47_sincosTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid47_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid48_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid50_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid53_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal twoToMiSiYip_uid54_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal cstArcTan2Mi_1_uid55_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2_uid57_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_2_uid57_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_2_uid57_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_2_uid57_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid57_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_2_uid58_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_2_uid58_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_2_uid58_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_2_uid58_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid58_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_2_uid60_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid60_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid60_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid60_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_2_uid61_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_2_uid61_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_2_uid62_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_2_uid62_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid63_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid63_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid64_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid66_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid69_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal twoToMiSiYip_uid70_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal cstArcTan2Mi_2_uid71_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_3_uid73_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_3_uid73_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_3_uid73_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_3_uid73_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid73_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_3_uid74_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_3_uid74_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_3_uid74_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_3_uid74_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid74_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_3_uid76_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid76_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid76_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid76_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_3_uid77_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_3_uid77_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_3_uid78_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_3_uid78_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid79_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid79_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid80_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid82_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid85_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal twoToMiSiYip_uid86_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal cstArcTan2Mi_3_uid87_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_4_uid89_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_4_uid89_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_4_uid89_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_4_uid89_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid89_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_4_uid90_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_4_uid90_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_4_uid90_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_4_uid90_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid90_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_4_uid92_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid92_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid92_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid92_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_4_uid93_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_4_uid93_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_4_uid94_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_4_uid94_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid95_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid95_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid96_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid98_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid101_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal twoToMiSiYip_uid102_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal cstArcTan2Mi_4_uid103_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_5_uid105_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid105_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid105_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid105_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid105_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_5_uid106_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_5_uid106_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_5_uid106_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_5_uid106_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid106_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_5_uid108_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_5_uid108_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_5_uid108_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_5_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid108_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_5_uid109_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_5_uid109_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_5_uid110_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_5_uid110_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid111_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid111_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid112_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid114_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid117_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal twoToMiSiYip_uid118_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal cstArcTan2Mi_5_uid119_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_6_uid121_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_6_uid121_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_6_uid121_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_6_uid121_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid121_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_6_uid122_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_6_uid122_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_6_uid122_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_6_uid122_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid122_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_6_uid124_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_6_uid124_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_6_uid124_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_6_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid124_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_6_uid125_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_6_uid125_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_6_uid126_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_6_uid126_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid127_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid127_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid128_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid130_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid133_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal twoToMiSiYip_uid134_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal cstArcTan2Mi_6_uid135_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_7_uid137_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_7_uid137_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_7_uid137_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_7_uid137_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid137_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_7_uid138_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_7_uid138_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_7_uid138_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_7_uid138_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid138_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid140_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid140_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid141_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_7high_uid142_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_7high_uid142_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_7high_uid142_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_7high_uid142_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7high_uid142_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_7_uid143_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_7_uid144_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_7_uid144_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_7_uid145_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_7_uid145_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid146_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid146_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid147_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid149_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal twoToMiSiYip_uid153_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstArcTan2Mi_7_uid154_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_8_uid156_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_8_uid156_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_8_uid156_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_8_uid156_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_8_uid157_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_8_uid157_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_8_uid157_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_8_uid157_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid159_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid159_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid160_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_8high_uid161_sincosTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_8high_uid161_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_8high_uid161_sincosTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_8high_uid161_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8high_uid161_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_8_uid162_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_8_uid163_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_8_uid163_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_8_uid164_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_8_uid164_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid165_sincosTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_uid165_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xMSB_uid166_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid168_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid171_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal twoToMiSiYip_uid172_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal cstArcTan2Mi_8_uid173_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_9_uid175_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_9_uid175_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_9_uid175_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_9_uid175_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid175_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_9_uid176_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_9_uid176_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_9_uid176_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_9_uid176_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid176_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid178_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid178_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid179_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_9high_uid180_sincosTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_9high_uid180_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_9high_uid180_sincosTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_9high_uid180_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9high_uid180_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_9_uid181_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_9_uid182_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_9_uid182_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_9_uid183_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_9_uid183_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid184_sincosTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_uid184_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid185_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid187_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid190_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal twoToMiSiYip_uid191_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_10_uid194_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_10_uid194_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_10_uid194_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_10_uid194_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid194_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_10_uid195_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_10_uid195_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_10_uid195_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_10_uid195_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid195_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal xip1_10_uid201_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_10_uid201_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_10_uid202_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_10_uid202_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal xSumPreRnd_uid204_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal xSumPreRnd_uid204_sincosTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal xSumPostRnd_uid207_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal xSumPostRnd_uid207_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xSumPostRnd_uid207_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal xSumPostRnd_uid207_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPreRnd_uid208_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal ySumPreRnd_uid208_sincosTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ySumPostRnd_uid211_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPostRnd_uid211_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPostRnd_uid211_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPostRnd_uid211_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xPostExc_uid212_sincosTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal xPostExc_uid212_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal yPostExc_uid213_sincosTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal yPostExc_uid213_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal invFirstQuadrant_uid214_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond2_uid215_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond1_uid216_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond0_uid218_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid219_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid219_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroForAddSub_uid221_sincosTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal invSinNegCond_uid222_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid223_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal sinPostNeg_uid223_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal sinPostNeg_uid223_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal sinPostNeg_uid223_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid223_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invCosNegCond_uid224_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCosNegCond_uid224_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid225_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal cosPostNeg_uid225_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cosPostNeg_uid225_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal cosPostNeg_uid225_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid225_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xPostRR_uid226_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid226_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xPostRR_uid227_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid227_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cos_uid228_sincosTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal cos_uid228_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sin_uid229_sincosTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal sin_uid229_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal redist0_yPostExc_uid213_sincosTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist1_xPostExc_uid212_sincosTest_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist2_ySumPreRnd_uid208_sincosTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist3_xSumPreRnd_uid204_sincosTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist4_xMSB_uid185_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_yip1_9_uid183_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist6_xip1_9_uid182_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist7_aip1E_uid165_sincosTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist8_yip1_8_uid164_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist9_xip1_8_uid163_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist10_aip1E_uid146_sincosTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist11_yip1_7_uid145_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist12_xip1_7_uid144_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist13_aip1E_uid127_sincosTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist14_yip1_6_uid126_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist15_xip1_6_uid125_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist16_aip1E_uid111_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist17_yip1_5_uid110_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist18_xip1_5_uid109_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist19_aip1E_uid95_sincosTest_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist20_yip1_4_uid94_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist21_xip1_4_uid93_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist22_aip1E_uid79_sincosTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist23_yip1_3_uid78_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist24_xip1_3_uid77_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist25_aip1E_uid63_sincosTest_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist26_yip1_2_uid62_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist27_xip1_2_uid61_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist28_aip1E_uid47_sincosTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist29_firstQuadrant_uid15_sincosTest_b_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist30_firstQuadrant_uid15_sincosTest_b_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_absAR_uid10_sincosTest_b_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist32_invSignA_uid8_sincosTest_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_signA_uid7_sincosTest_b_12_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstPiO2_uid11_sincosTest(CONSTANT,10)
    cstPiO2_uid11_sincosTest_q <= "1100100100010";

    -- padBCst_uid12_sincosTest(CONSTANT,11)
    padBCst_uid12_sincosTest_q <= "000000000000";

    -- bPostPad_uid13_sincosTest(BITJOIN,12)@1
    bPostPad_uid13_sincosTest_q <= cstPiO2_uid11_sincosTest_q & padBCst_uid12_sincosTest_q;

    -- signA_uid7_sincosTest(BITSELECT,6)@0
    signA_uid7_sincosTest_b <= STD_LOGIC_VECTOR(a(26 downto 26));

    -- invSignA_uid8_sincosTest(LOGICAL,7)@0
    invSignA_uid8_sincosTest_q <= not (signA_uid7_sincosTest_b);

    -- constantZero_uid6_sincosTest(CONSTANT,5)
    constantZero_uid6_sincosTest_q <= "000000000000000000000000000";

    -- absAE_uid9_sincosTest(ADDSUB,8)@0
    absAE_uid9_sincosTest_s <= invSignA_uid8_sincosTest_q;
    absAE_uid9_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => constantZero_uid6_sincosTest_q(26)) & constantZero_uid6_sincosTest_q));
    absAE_uid9_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => a(26)) & a));
    absAE_uid9_sincosTest_combproc: PROCESS (absAE_uid9_sincosTest_a, absAE_uid9_sincosTest_b, absAE_uid9_sincosTest_s)
    BEGIN
        IF (absAE_uid9_sincosTest_s = "1") THEN
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) + SIGNED(absAE_uid9_sincosTest_b));
        ELSE
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) - SIGNED(absAE_uid9_sincosTest_b));
        END IF;
    END PROCESS;
    absAE_uid9_sincosTest_q <= absAE_uid9_sincosTest_o(27 downto 0);

    -- absAR_uid10_sincosTest(BITSELECT,9)@0
    absAR_uid10_sincosTest_in <= absAE_uid9_sincosTest_q(25 downto 0);
    absAR_uid10_sincosTest_b <= absAR_uid10_sincosTest_in(25 downto 0);

    -- redist31_absAR_uid10_sincosTest_b_1(DELAY,260)
    redist31_absAR_uid10_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => absAR_uid10_sincosTest_b, xout => redist31_absAR_uid10_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- argMPiO2_uid14_sincosTest(SUB,13)@1
    argMPiO2_uid14_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist31_absAR_uid10_sincosTest_b_1_q);
    argMPiO2_uid14_sincosTest_b <= STD_LOGIC_VECTOR("00" & bPostPad_uid13_sincosTest_q);
    argMPiO2_uid14_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(argMPiO2_uid14_sincosTest_a) - UNSIGNED(argMPiO2_uid14_sincosTest_b));
    argMPiO2_uid14_sincosTest_q <= argMPiO2_uid14_sincosTest_o(26 downto 0);

    -- firstQuadrant_uid15_sincosTest(BITSELECT,14)@1
    firstQuadrant_uid15_sincosTest_b <= STD_LOGIC_VECTOR(argMPiO2_uid14_sincosTest_q(26 downto 26));

    -- redist29_firstQuadrant_uid15_sincosTest_b_11(DELAY,258)
    redist29_firstQuadrant_uid15_sincosTest_b_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstQuadrant_uid15_sincosTest_b, xout => redist29_firstQuadrant_uid15_sincosTest_b_11_q, clk => clk, aclr => areset );

    -- invFirstQuadrant_uid214_sincosTest(LOGICAL,213)@12
    invFirstQuadrant_uid214_sincosTest_q <= not (redist29_firstQuadrant_uid15_sincosTest_b_11_q);

    -- redist33_signA_uid7_sincosTest_b_12(DELAY,262)
    redist33_signA_uid7_sincosTest_b_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_sincosTest_b, xout => redist33_signA_uid7_sincosTest_b_12_q, clk => clk, aclr => areset );

    -- sinNegCond2_uid215_sincosTest(LOGICAL,214)@12
    sinNegCond2_uid215_sincosTest_q <= redist33_signA_uid7_sincosTest_b_12_q and invFirstQuadrant_uid214_sincosTest_q;

    -- sinNegCond1_uid216_sincosTest(LOGICAL,215)@12
    sinNegCond1_uid216_sincosTest_q <= redist33_signA_uid7_sincosTest_b_12_q and redist29_firstQuadrant_uid15_sincosTest_b_11_q;

    -- redist32_invSignA_uid8_sincosTest_q_12(DELAY,261)
    redist32_invSignA_uid8_sincosTest_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignA_uid8_sincosTest_q, xout => redist32_invSignA_uid8_sincosTest_q_12_q, clk => clk, aclr => areset );

    -- sinNegCond0_uid218_sincosTest(LOGICAL,217)@12
    sinNegCond0_uid218_sincosTest_q <= redist32_invSignA_uid8_sincosTest_q_12_q and invFirstQuadrant_uid214_sincosTest_q;

    -- sinNegCond_uid219_sincosTest(LOGICAL,218)@12 + 1
    sinNegCond_uid219_sincosTest_qi <= sinNegCond0_uid218_sincosTest_q or sinNegCond1_uid216_sincosTest_q or sinNegCond2_uid215_sincosTest_q;
    sinNegCond_uid219_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid219_sincosTest_qi, xout => sinNegCond_uid219_sincosTest_q, clk => clk, aclr => areset );

    -- invSinNegCond_uid222_sincosTest(LOGICAL,221)@13
    invSinNegCond_uid222_sincosTest_q <= not (sinNegCond_uid219_sincosTest_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xMSB_uid112_sincosTest(BITSELECT,111)@7
    xMSB_uid112_sincosTest_b <= STD_LOGIC_VECTOR(redist16_aip1E_uid111_sincosTest_b_1_q(15 downto 15));

    -- cstArcTan2Mi_5_uid119_sincosTest(CONSTANT,118)
    cstArcTan2Mi_5_uid119_sincosTest_q <= "01111111111101";

    -- xMSB_uid96_sincosTest(BITSELECT,95)@6
    xMSB_uid96_sincosTest_b <= STD_LOGIC_VECTOR(redist19_aip1E_uid95_sincosTest_b_1_q(16 downto 16));

    -- cstArcTan2Mi_4_uid103_sincosTest(CONSTANT,102)
    cstArcTan2Mi_4_uid103_sincosTest_q <= "011111111101011";

    -- xMSB_uid80_sincosTest(BITSELECT,79)@5
    xMSB_uid80_sincosTest_b <= STD_LOGIC_VECTOR(redist22_aip1E_uid79_sincosTest_b_1_q(17 downto 17));

    -- cstArcTan2Mi_3_uid87_sincosTest(CONSTANT,86)
    cstArcTan2Mi_3_uid87_sincosTest_q <= "0111111101010111";

    -- xMSB_uid64_sincosTest(BITSELECT,63)@4
    xMSB_uid64_sincosTest_b <= STD_LOGIC_VECTOR(redist25_aip1E_uid63_sincosTest_b_1_q(18 downto 18));

    -- cstArcTan2Mi_2_uid71_sincosTest(CONSTANT,70)
    cstArcTan2Mi_2_uid71_sincosTest_q <= "01111101011011100";

    -- xMSB_uid48_sincosTest(BITSELECT,47)@3
    xMSB_uid48_sincosTest_b <= STD_LOGIC_VECTOR(redist28_aip1E_uid47_sincosTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_1_uid55_sincosTest(CONSTANT,54)
    cstArcTan2Mi_1_uid55_sincosTest_q <= "011101101011000110";

    -- invSignOfSelectionSignal_uid33_sincosTest(LOGICAL,32)@2
    invSignOfSelectionSignal_uid33_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid23_sincosTest(CONSTANT,22)
    cstArcTan2Mi_0_uid23_sincosTest_q <= "0110010010000111111";

    -- absARE_uid16_sincosTest(BITSELECT,15)@1
    absARE_uid16_sincosTest_in <= redist31_absAR_uid10_sincosTest_b_1_q(24 downto 0);
    absARE_uid16_sincosTest_b <= absARE_uid16_sincosTest_in(24 downto 12);

    -- argMPiO2_uid17_sincosTest(BITSELECT,16)@1
    argMPiO2_uid17_sincosTest_in <= argMPiO2_uid14_sincosTest_q(24 downto 0);
    argMPiO2_uid17_sincosTest_b <= argMPiO2_uid17_sincosTest_in(24 downto 12);

    -- absA_uid18_sincosTest(MUX,17)@1 + 1
    absA_uid18_sincosTest_s <= firstQuadrant_uid15_sincosTest_b;
    absA_uid18_sincosTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absA_uid18_sincosTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absA_uid18_sincosTest_s) IS
                WHEN "0" => absA_uid18_sincosTest_q <= argMPiO2_uid17_sincosTest_b;
                WHEN "1" => absA_uid18_sincosTest_q <= absARE_uid16_sincosTest_b;
                WHEN OTHERS => absA_uid18_sincosTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- aip1E_1CostZeroPaddingA_uid34_sincosTest(CONSTANT,33)
    aip1E_1CostZeroPaddingA_uid34_sincosTest_q <= "000000";

    -- aip1E_1NA_uid35_sincosTest(BITJOIN,34)@2
    aip1E_1NA_uid35_sincosTest_q <= absA_uid18_sincosTest_q & aip1E_1CostZeroPaddingA_uid34_sincosTest_q;

    -- aip1E_1sumAHighB_uid36_sincosTest(ADDSUB,35)@2
    aip1E_1sumAHighB_uid36_sincosTest_s <= invSignOfSelectionSignal_uid33_sincosTest_q;
    aip1E_1sumAHighB_uid36_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid35_sincosTest_q));
    aip1E_1sumAHighB_uid36_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => cstArcTan2Mi_0_uid23_sincosTest_q(18)) & cstArcTan2Mi_0_uid23_sincosTest_q));
    aip1E_1sumAHighB_uid36_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid36_sincosTest_a, aip1E_1sumAHighB_uid36_sincosTest_b, aip1E_1sumAHighB_uid36_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid36_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid36_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid36_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid36_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid36_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid36_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid36_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid36_sincosTest_q <= aip1E_1sumAHighB_uid36_sincosTest_o(20 downto 0);

    -- aip1E_uid47_sincosTest(BITSELECT,46)@2
    aip1E_uid47_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid36_sincosTest_q(19 downto 0));
    aip1E_uid47_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid47_sincosTest_in(19 downto 0));

    -- redist28_aip1E_uid47_sincosTest_b_1(DELAY,257)
    redist28_aip1E_uid47_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid47_sincosTest_b, xout => redist28_aip1E_uid47_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_2_uid60_sincosTest(ADDSUB,59)@3
    aip1E_2_uid60_sincosTest_s <= xMSB_uid48_sincosTest_b;
    aip1E_2_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist28_aip1E_uid47_sincosTest_b_1_q(19)) & redist28_aip1E_uid47_sincosTest_b_1_q));
    aip1E_2_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => cstArcTan2Mi_1_uid55_sincosTest_q(17)) & cstArcTan2Mi_1_uid55_sincosTest_q));
    aip1E_2_uid60_sincosTest_combproc: PROCESS (aip1E_2_uid60_sincosTest_a, aip1E_2_uid60_sincosTest_b, aip1E_2_uid60_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid60_sincosTest_s = "1") THEN
            aip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid60_sincosTest_a) + SIGNED(aip1E_2_uid60_sincosTest_b));
        ELSE
            aip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid60_sincosTest_a) - SIGNED(aip1E_2_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid60_sincosTest_q <= aip1E_2_uid60_sincosTest_o(20 downto 0);

    -- aip1E_uid63_sincosTest(BITSELECT,62)@3
    aip1E_uid63_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid60_sincosTest_q(18 downto 0));
    aip1E_uid63_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid63_sincosTest_in(18 downto 0));

    -- redist25_aip1E_uid63_sincosTest_b_1(DELAY,254)
    redist25_aip1E_uid63_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid63_sincosTest_b, xout => redist25_aip1E_uid63_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_3_uid76_sincosTest(ADDSUB,75)@4
    aip1E_3_uid76_sincosTest_s <= xMSB_uid64_sincosTest_b;
    aip1E_3_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => redist25_aip1E_uid63_sincosTest_b_1_q(18)) & redist25_aip1E_uid63_sincosTest_b_1_q));
    aip1E_3_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => cstArcTan2Mi_2_uid71_sincosTest_q(16)) & cstArcTan2Mi_2_uid71_sincosTest_q));
    aip1E_3_uid76_sincosTest_combproc: PROCESS (aip1E_3_uid76_sincosTest_a, aip1E_3_uid76_sincosTest_b, aip1E_3_uid76_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid76_sincosTest_s = "1") THEN
            aip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid76_sincosTest_a) + SIGNED(aip1E_3_uid76_sincosTest_b));
        ELSE
            aip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid76_sincosTest_a) - SIGNED(aip1E_3_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid76_sincosTest_q <= aip1E_3_uid76_sincosTest_o(19 downto 0);

    -- aip1E_uid79_sincosTest(BITSELECT,78)@4
    aip1E_uid79_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid76_sincosTest_q(17 downto 0));
    aip1E_uid79_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid79_sincosTest_in(17 downto 0));

    -- redist22_aip1E_uid79_sincosTest_b_1(DELAY,251)
    redist22_aip1E_uid79_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid79_sincosTest_b, xout => redist22_aip1E_uid79_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid92_sincosTest(ADDSUB,91)@5
    aip1E_4_uid92_sincosTest_s <= xMSB_uid80_sincosTest_b;
    aip1E_4_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => redist22_aip1E_uid79_sincosTest_b_1_q(17)) & redist22_aip1E_uid79_sincosTest_b_1_q));
    aip1E_4_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => cstArcTan2Mi_3_uid87_sincosTest_q(15)) & cstArcTan2Mi_3_uid87_sincosTest_q));
    aip1E_4_uid92_sincosTest_combproc: PROCESS (aip1E_4_uid92_sincosTest_a, aip1E_4_uid92_sincosTest_b, aip1E_4_uid92_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid92_sincosTest_s = "1") THEN
            aip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid92_sincosTest_a) + SIGNED(aip1E_4_uid92_sincosTest_b));
        ELSE
            aip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid92_sincosTest_a) - SIGNED(aip1E_4_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid92_sincosTest_q <= aip1E_4_uid92_sincosTest_o(18 downto 0);

    -- aip1E_uid95_sincosTest(BITSELECT,94)@5
    aip1E_uid95_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid92_sincosTest_q(16 downto 0));
    aip1E_uid95_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid95_sincosTest_in(16 downto 0));

    -- redist19_aip1E_uid95_sincosTest_b_1(DELAY,248)
    redist19_aip1E_uid95_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid95_sincosTest_b, xout => redist19_aip1E_uid95_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_5_uid108_sincosTest(ADDSUB,107)@6
    aip1E_5_uid108_sincosTest_s <= xMSB_uid96_sincosTest_b;
    aip1E_5_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => redist19_aip1E_uid95_sincosTest_b_1_q(16)) & redist19_aip1E_uid95_sincosTest_b_1_q));
    aip1E_5_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 15 => cstArcTan2Mi_4_uid103_sincosTest_q(14)) & cstArcTan2Mi_4_uid103_sincosTest_q));
    aip1E_5_uid108_sincosTest_combproc: PROCESS (aip1E_5_uid108_sincosTest_a, aip1E_5_uid108_sincosTest_b, aip1E_5_uid108_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid108_sincosTest_s = "1") THEN
            aip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid108_sincosTest_a) + SIGNED(aip1E_5_uid108_sincosTest_b));
        ELSE
            aip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid108_sincosTest_a) - SIGNED(aip1E_5_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid108_sincosTest_q <= aip1E_5_uid108_sincosTest_o(17 downto 0);

    -- aip1E_uid111_sincosTest(BITSELECT,110)@6
    aip1E_uid111_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid108_sincosTest_q(15 downto 0));
    aip1E_uid111_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid111_sincosTest_in(15 downto 0));

    -- redist16_aip1E_uid111_sincosTest_b_1(DELAY,245)
    redist16_aip1E_uid111_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid111_sincosTest_b, xout => redist16_aip1E_uid111_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_6_uid124_sincosTest(ADDSUB,123)@7
    aip1E_6_uid124_sincosTest_s <= xMSB_uid112_sincosTest_b;
    aip1E_6_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => redist16_aip1E_uid111_sincosTest_b_1_q(15)) & redist16_aip1E_uid111_sincosTest_b_1_q));
    aip1E_6_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => cstArcTan2Mi_5_uid119_sincosTest_q(13)) & cstArcTan2Mi_5_uid119_sincosTest_q));
    aip1E_6_uid124_sincosTest_combproc: PROCESS (aip1E_6_uid124_sincosTest_a, aip1E_6_uid124_sincosTest_b, aip1E_6_uid124_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid124_sincosTest_s = "1") THEN
            aip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid124_sincosTest_a) + SIGNED(aip1E_6_uid124_sincosTest_b));
        ELSE
            aip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid124_sincosTest_a) - SIGNED(aip1E_6_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid124_sincosTest_q <= aip1E_6_uid124_sincosTest_o(16 downto 0);

    -- aip1E_uid127_sincosTest(BITSELECT,126)@7
    aip1E_uid127_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid124_sincosTest_q(14 downto 0));
    aip1E_uid127_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid127_sincosTest_in(14 downto 0));

    -- redist13_aip1E_uid127_sincosTest_b_1(DELAY,242)
    redist13_aip1E_uid127_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid127_sincosTest_b, xout => redist13_aip1E_uid127_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid128_sincosTest(BITSELECT,127)@8
    xMSB_uid128_sincosTest_b <= STD_LOGIC_VECTOR(redist13_aip1E_uid127_sincosTest_b_1_q(14 downto 14));

    -- cstArcTan2Mi_6_uid135_sincosTest(CONSTANT,134)
    cstArcTan2Mi_6_uid135_sincosTest_q <= "0100000000000";

    -- highABits_uid141_sincosTest(BITSELECT,140)@8
    highABits_uid141_sincosTest_b <= STD_LOGIC_VECTOR(redist13_aip1E_uid127_sincosTest_b_1_q(14 downto 1));

    -- aip1E_7high_uid142_sincosTest(ADDSUB,141)@8
    aip1E_7high_uid142_sincosTest_s <= xMSB_uid128_sincosTest_b;
    aip1E_7high_uid142_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid141_sincosTest_b(13)) & highABits_uid141_sincosTest_b));
    aip1E_7high_uid142_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => cstArcTan2Mi_6_uid135_sincosTest_q(12)) & cstArcTan2Mi_6_uid135_sincosTest_q));
    aip1E_7high_uid142_sincosTest_combproc: PROCESS (aip1E_7high_uid142_sincosTest_a, aip1E_7high_uid142_sincosTest_b, aip1E_7high_uid142_sincosTest_s)
    BEGIN
        IF (aip1E_7high_uid142_sincosTest_s = "1") THEN
            aip1E_7high_uid142_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid142_sincosTest_a) + SIGNED(aip1E_7high_uid142_sincosTest_b));
        ELSE
            aip1E_7high_uid142_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid142_sincosTest_a) - SIGNED(aip1E_7high_uid142_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7high_uid142_sincosTest_q <= aip1E_7high_uid142_sincosTest_o(14 downto 0);

    -- lowRangeA_uid140_sincosTest(BITSELECT,139)@8
    lowRangeA_uid140_sincosTest_in <= redist13_aip1E_uid127_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid140_sincosTest_b <= lowRangeA_uid140_sincosTest_in(0 downto 0);

    -- aip1E_7_uid143_sincosTest(BITJOIN,142)@8
    aip1E_7_uid143_sincosTest_q <= aip1E_7high_uid142_sincosTest_q & lowRangeA_uid140_sincosTest_b;

    -- aip1E_uid146_sincosTest(BITSELECT,145)@8
    aip1E_uid146_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid143_sincosTest_q(13 downto 0));
    aip1E_uid146_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_in(13 downto 0));

    -- redist10_aip1E_uid146_sincosTest_b_1(DELAY,239)
    redist10_aip1E_uid146_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid146_sincosTest_b, xout => redist10_aip1E_uid146_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid147_sincosTest(BITSELECT,146)@9
    xMSB_uid147_sincosTest_b <= STD_LOGIC_VECTOR(redist10_aip1E_uid146_sincosTest_b_1_q(13 downto 13));

    -- cstArcTan2Mi_7_uid154_sincosTest(CONSTANT,153)
    cstArcTan2Mi_7_uid154_sincosTest_q <= "010000000000";

    -- highABits_uid160_sincosTest(BITSELECT,159)@9
    highABits_uid160_sincosTest_b <= STD_LOGIC_VECTOR(redist10_aip1E_uid146_sincosTest_b_1_q(13 downto 1));

    -- aip1E_8high_uid161_sincosTest(ADDSUB,160)@9
    aip1E_8high_uid161_sincosTest_s <= xMSB_uid147_sincosTest_b;
    aip1E_8high_uid161_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid160_sincosTest_b(12)) & highABits_uid160_sincosTest_b));
    aip1E_8high_uid161_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => cstArcTan2Mi_7_uid154_sincosTest_q(11)) & cstArcTan2Mi_7_uid154_sincosTest_q));
    aip1E_8high_uid161_sincosTest_combproc: PROCESS (aip1E_8high_uid161_sincosTest_a, aip1E_8high_uid161_sincosTest_b, aip1E_8high_uid161_sincosTest_s)
    BEGIN
        IF (aip1E_8high_uid161_sincosTest_s = "1") THEN
            aip1E_8high_uid161_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid161_sincosTest_a) + SIGNED(aip1E_8high_uid161_sincosTest_b));
        ELSE
            aip1E_8high_uid161_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid161_sincosTest_a) - SIGNED(aip1E_8high_uid161_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8high_uid161_sincosTest_q <= aip1E_8high_uid161_sincosTest_o(13 downto 0);

    -- lowRangeA_uid159_sincosTest(BITSELECT,158)@9
    lowRangeA_uid159_sincosTest_in <= redist10_aip1E_uid146_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid159_sincosTest_b <= lowRangeA_uid159_sincosTest_in(0 downto 0);

    -- aip1E_8_uid162_sincosTest(BITJOIN,161)@9
    aip1E_8_uid162_sincosTest_q <= aip1E_8high_uid161_sincosTest_q & lowRangeA_uid159_sincosTest_b;

    -- aip1E_uid165_sincosTest(BITSELECT,164)@9
    aip1E_uid165_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid162_sincosTest_q(12 downto 0));
    aip1E_uid165_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid165_sincosTest_in(12 downto 0));

    -- redist7_aip1E_uid165_sincosTest_b_1(DELAY,236)
    redist7_aip1E_uid165_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid165_sincosTest_b, xout => redist7_aip1E_uid165_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid166_sincosTest(BITSELECT,165)@10
    xMSB_uid166_sincosTest_b <= STD_LOGIC_VECTOR(redist7_aip1E_uid165_sincosTest_b_1_q(12 downto 12));

    -- cstArcTan2Mi_8_uid173_sincosTest(CONSTANT,172)
    cstArcTan2Mi_8_uid173_sincosTest_q <= "01000000000";

    -- highABits_uid179_sincosTest(BITSELECT,178)@10
    highABits_uid179_sincosTest_b <= STD_LOGIC_VECTOR(redist7_aip1E_uid165_sincosTest_b_1_q(12 downto 1));

    -- aip1E_9high_uid180_sincosTest(ADDSUB,179)@10
    aip1E_9high_uid180_sincosTest_s <= xMSB_uid166_sincosTest_b;
    aip1E_9high_uid180_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => highABits_uid179_sincosTest_b(11)) & highABits_uid179_sincosTest_b));
    aip1E_9high_uid180_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 11 => cstArcTan2Mi_8_uid173_sincosTest_q(10)) & cstArcTan2Mi_8_uid173_sincosTest_q));
    aip1E_9high_uid180_sincosTest_combproc: PROCESS (aip1E_9high_uid180_sincosTest_a, aip1E_9high_uid180_sincosTest_b, aip1E_9high_uid180_sincosTest_s)
    BEGIN
        IF (aip1E_9high_uid180_sincosTest_s = "1") THEN
            aip1E_9high_uid180_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid180_sincosTest_a) + SIGNED(aip1E_9high_uid180_sincosTest_b));
        ELSE
            aip1E_9high_uid180_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid180_sincosTest_a) - SIGNED(aip1E_9high_uid180_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_9high_uid180_sincosTest_q <= aip1E_9high_uid180_sincosTest_o(12 downto 0);

    -- lowRangeA_uid178_sincosTest(BITSELECT,177)@10
    lowRangeA_uid178_sincosTest_in <= redist7_aip1E_uid165_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid178_sincosTest_b <= lowRangeA_uid178_sincosTest_in(0 downto 0);

    -- aip1E_9_uid181_sincosTest(BITJOIN,180)@10
    aip1E_9_uid181_sincosTest_q <= aip1E_9high_uid180_sincosTest_q & lowRangeA_uid178_sincosTest_b;

    -- aip1E_uid184_sincosTest(BITSELECT,183)@10
    aip1E_uid184_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid181_sincosTest_q(11 downto 0));
    aip1E_uid184_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid184_sincosTest_in(11 downto 0));

    -- xMSB_uid185_sincosTest(BITSELECT,184)@10
    xMSB_uid185_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid184_sincosTest_b(11 downto 11));

    -- redist4_xMSB_uid185_sincosTest_b_1(DELAY,233)
    redist4_xMSB_uid185_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid185_sincosTest_b, xout => redist4_xMSB_uid185_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid187_sincosTest(LOGICAL,186)@11
    signOfSelectionSignal_uid187_sincosTest_q <= not (redist4_xMSB_uid185_sincosTest_b_1_q);

    -- signOfSelectionSignal_uid149_sincosTest(LOGICAL,148)@9
    signOfSelectionSignal_uid149_sincosTest_q <= not (xMSB_uid147_sincosTest_b);

    -- signOfSelectionSignal_uid114_sincosTest(LOGICAL,113)@7
    signOfSelectionSignal_uid114_sincosTest_q <= not (xMSB_uid112_sincosTest_b);

    -- signOfSelectionSignal_uid82_sincosTest(LOGICAL,81)@5
    signOfSelectionSignal_uid82_sincosTest_q <= not (xMSB_uid80_sincosTest_b);

    -- signOfSelectionSignal_uid50_sincosTest(LOGICAL,49)@3
    signOfSelectionSignal_uid50_sincosTest_q <= not (xMSB_uid48_sincosTest_b);

    -- cstOneOverK_uid19_sincosTest(CONSTANT,18)
    cstOneOverK_uid19_sincosTest_q <= "100110110111010011101101101010000100";

    -- xip1E_1_uid29_sincosTest(BITJOIN,28)@3
    xip1E_1_uid29_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid19_sincosTest_q;

    -- xip1_1_topRange_uid38_sincosTest(BITSELECT,37)@3
    xip1_1_topRange_uid38_sincosTest_in <= xip1E_1_uid29_sincosTest_q(37 downto 0);
    xip1_1_topRange_uid38_sincosTest_b <= xip1_1_topRange_uid38_sincosTest_in(37 downto 0);

    -- xip1_1_mergedSignalTM_uid39_sincosTest(BITJOIN,38)@3
    xip1_1_mergedSignalTM_uid39_sincosTest_q <= GND_q & xip1_1_topRange_uid38_sincosTest_b;

    -- twoToMiSiXip_uid53_sincosTest(BITSELECT,52)@3
    twoToMiSiXip_uid53_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid39_sincosTest_q(38 downto 1));

    -- xMSB_uid41_sincosTest(BITSELECT,40)@3
    xMSB_uid41_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid32_sincosTest_q(37 downto 37));

    -- yip1E_1CostZeroPaddingA_uid30_sincosTest(CONSTANT,29)
    yip1E_1CostZeroPaddingA_uid30_sincosTest_q <= "000000000000000000000000000000000000";

    -- yip1E_1NA_uid31_sincosTest(BITJOIN,30)@2
    yip1E_1NA_uid31_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid30_sincosTest_q;

    -- yip1E_1sumAHighB_uid32_sincosTest(ADDSUB,31)@2 + 1
    yip1E_1sumAHighB_uid32_sincosTest_s <= VCC_q;
    yip1E_1sumAHighB_uid32_sincosTest_a <= STD_LOGIC_VECTOR("00" & yip1E_1NA_uid31_sincosTest_q);
    yip1E_1sumAHighB_uid32_sincosTest_b <= STD_LOGIC_VECTOR("000" & cstOneOverK_uid19_sincosTest_q);
    yip1E_1sumAHighB_uid32_sincosTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1sumAHighB_uid32_sincosTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yip1E_1sumAHighB_uid32_sincosTest_s = "1") THEN
                yip1E_1sumAHighB_uid32_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid32_sincosTest_a) + UNSIGNED(yip1E_1sumAHighB_uid32_sincosTest_b));
            ELSE
                yip1E_1sumAHighB_uid32_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid32_sincosTest_a) - UNSIGNED(yip1E_1sumAHighB_uid32_sincosTest_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1sumAHighB_uid32_sincosTest_q <= yip1E_1sumAHighB_uid32_sincosTest_o(37 downto 0);

    -- yip1_1_mergedSignalTM_uid45_sincosTest(BITJOIN,44)@3
    yip1_1_mergedSignalTM_uid45_sincosTest_q <= xMSB_uid41_sincosTest_b & yip1E_1sumAHighB_uid32_sincosTest_q;

    -- yip1E_2_uid58_sincosTest(ADDSUB,57)@3
    yip1E_2_uid58_sincosTest_s <= signOfSelectionSignal_uid50_sincosTest_q;
    yip1E_2_uid58_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_1_mergedSignalTM_uid45_sincosTest_q(38)) & yip1_1_mergedSignalTM_uid45_sincosTest_q));
    yip1E_2_uid58_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 38 => twoToMiSiXip_uid53_sincosTest_b(37)) & twoToMiSiXip_uid53_sincosTest_b));
    yip1E_2_uid58_sincosTest_combproc: PROCESS (yip1E_2_uid58_sincosTest_a, yip1E_2_uid58_sincosTest_b, yip1E_2_uid58_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid58_sincosTest_s = "1") THEN
            yip1E_2_uid58_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid58_sincosTest_a) + SIGNED(yip1E_2_uid58_sincosTest_b));
        ELSE
            yip1E_2_uid58_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid58_sincosTest_a) - SIGNED(yip1E_2_uid58_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid58_sincosTest_q <= yip1E_2_uid58_sincosTest_o(39 downto 0);

    -- yip1_2_uid62_sincosTest(BITSELECT,61)@3
    yip1_2_uid62_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid58_sincosTest_q(38 downto 0));
    yip1_2_uid62_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid62_sincosTest_in(38 downto 0));

    -- redist26_yip1_2_uid62_sincosTest_b_1(DELAY,255)
    redist26_yip1_2_uid62_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid62_sincosTest_b, xout => redist26_yip1_2_uid62_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid70_sincosTest(BITSELECT,69)@4
    twoToMiSiYip_uid70_sincosTest_b <= STD_LOGIC_VECTOR(redist26_yip1_2_uid62_sincosTest_b_1_q(38 downto 2));

    -- twoToMiSiYip_uid54_sincosTest(BITSELECT,53)@3
    twoToMiSiYip_uid54_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid45_sincosTest_q(38 downto 1));

    -- xip1E_2_uid57_sincosTest(ADDSUB,56)@3
    xip1E_2_uid57_sincosTest_s <= xMSB_uid48_sincosTest_b;
    xip1E_2_uid57_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_1_mergedSignalTM_uid39_sincosTest_q(38)) & xip1_1_mergedSignalTM_uid39_sincosTest_q));
    xip1E_2_uid57_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 38 => twoToMiSiYip_uid54_sincosTest_b(37)) & twoToMiSiYip_uid54_sincosTest_b));
    xip1E_2_uid57_sincosTest_combproc: PROCESS (xip1E_2_uid57_sincosTest_a, xip1E_2_uid57_sincosTest_b, xip1E_2_uid57_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid57_sincosTest_s = "1") THEN
            xip1E_2_uid57_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid57_sincosTest_a) + SIGNED(xip1E_2_uid57_sincosTest_b));
        ELSE
            xip1E_2_uid57_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid57_sincosTest_a) - SIGNED(xip1E_2_uid57_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid57_sincosTest_q <= xip1E_2_uid57_sincosTest_o(39 downto 0);

    -- xip1_2_uid61_sincosTest(BITSELECT,60)@3
    xip1_2_uid61_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid57_sincosTest_q(38 downto 0));
    xip1_2_uid61_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid61_sincosTest_in(38 downto 0));

    -- redist27_xip1_2_uid61_sincosTest_b_1(DELAY,256)
    redist27_xip1_2_uid61_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid61_sincosTest_b, xout => redist27_xip1_2_uid61_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_3_uid73_sincosTest(ADDSUB,72)@4
    xip1E_3_uid73_sincosTest_s <= xMSB_uid64_sincosTest_b;
    xip1E_3_uid73_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist27_xip1_2_uid61_sincosTest_b_1_q(38)) & redist27_xip1_2_uid61_sincosTest_b_1_q));
    xip1E_3_uid73_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 37 => twoToMiSiYip_uid70_sincosTest_b(36)) & twoToMiSiYip_uid70_sincosTest_b));
    xip1E_3_uid73_sincosTest_combproc: PROCESS (xip1E_3_uid73_sincosTest_a, xip1E_3_uid73_sincosTest_b, xip1E_3_uid73_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid73_sincosTest_s = "1") THEN
            xip1E_3_uid73_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid73_sincosTest_a) + SIGNED(xip1E_3_uid73_sincosTest_b));
        ELSE
            xip1E_3_uid73_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid73_sincosTest_a) - SIGNED(xip1E_3_uid73_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid73_sincosTest_q <= xip1E_3_uid73_sincosTest_o(39 downto 0);

    -- xip1_3_uid77_sincosTest(BITSELECT,76)@4
    xip1_3_uid77_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid73_sincosTest_q(38 downto 0));
    xip1_3_uid77_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid77_sincosTest_in(38 downto 0));

    -- redist24_xip1_3_uid77_sincosTest_b_1(DELAY,253)
    redist24_xip1_3_uid77_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid77_sincosTest_b, xout => redist24_xip1_3_uid77_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid85_sincosTest(BITSELECT,84)@5
    twoToMiSiXip_uid85_sincosTest_b <= STD_LOGIC_VECTOR(redist24_xip1_3_uid77_sincosTest_b_1_q(38 downto 3));

    -- signOfSelectionSignal_uid66_sincosTest(LOGICAL,65)@4
    signOfSelectionSignal_uid66_sincosTest_q <= not (xMSB_uid64_sincosTest_b);

    -- twoToMiSiXip_uid69_sincosTest(BITSELECT,68)@4
    twoToMiSiXip_uid69_sincosTest_b <= STD_LOGIC_VECTOR(redist27_xip1_2_uid61_sincosTest_b_1_q(38 downto 2));

    -- yip1E_3_uid74_sincosTest(ADDSUB,73)@4
    yip1E_3_uid74_sincosTest_s <= signOfSelectionSignal_uid66_sincosTest_q;
    yip1E_3_uid74_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist26_yip1_2_uid62_sincosTest_b_1_q(38)) & redist26_yip1_2_uid62_sincosTest_b_1_q));
    yip1E_3_uid74_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 37 => twoToMiSiXip_uid69_sincosTest_b(36)) & twoToMiSiXip_uid69_sincosTest_b));
    yip1E_3_uid74_sincosTest_combproc: PROCESS (yip1E_3_uid74_sincosTest_a, yip1E_3_uid74_sincosTest_b, yip1E_3_uid74_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid74_sincosTest_s = "1") THEN
            yip1E_3_uid74_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid74_sincosTest_a) + SIGNED(yip1E_3_uid74_sincosTest_b));
        ELSE
            yip1E_3_uid74_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid74_sincosTest_a) - SIGNED(yip1E_3_uid74_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid74_sincosTest_q <= yip1E_3_uid74_sincosTest_o(39 downto 0);

    -- yip1_3_uid78_sincosTest(BITSELECT,77)@4
    yip1_3_uid78_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid74_sincosTest_q(38 downto 0));
    yip1_3_uid78_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid78_sincosTest_in(38 downto 0));

    -- redist23_yip1_3_uid78_sincosTest_b_1(DELAY,252)
    redist23_yip1_3_uid78_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid78_sincosTest_b, xout => redist23_yip1_3_uid78_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_4_uid90_sincosTest(ADDSUB,89)@5
    yip1E_4_uid90_sincosTest_s <= signOfSelectionSignal_uid82_sincosTest_q;
    yip1E_4_uid90_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist23_yip1_3_uid78_sincosTest_b_1_q(38)) & redist23_yip1_3_uid78_sincosTest_b_1_q));
    yip1E_4_uid90_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 36 => twoToMiSiXip_uid85_sincosTest_b(35)) & twoToMiSiXip_uid85_sincosTest_b));
    yip1E_4_uid90_sincosTest_combproc: PROCESS (yip1E_4_uid90_sincosTest_a, yip1E_4_uid90_sincosTest_b, yip1E_4_uid90_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid90_sincosTest_s = "1") THEN
            yip1E_4_uid90_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid90_sincosTest_a) + SIGNED(yip1E_4_uid90_sincosTest_b));
        ELSE
            yip1E_4_uid90_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid90_sincosTest_a) - SIGNED(yip1E_4_uid90_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid90_sincosTest_q <= yip1E_4_uid90_sincosTest_o(39 downto 0);

    -- yip1_4_uid94_sincosTest(BITSELECT,93)@5
    yip1_4_uid94_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid90_sincosTest_q(38 downto 0));
    yip1_4_uid94_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid94_sincosTest_in(38 downto 0));

    -- redist20_yip1_4_uid94_sincosTest_b_1(DELAY,249)
    redist20_yip1_4_uid94_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid94_sincosTest_b, xout => redist20_yip1_4_uid94_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid102_sincosTest(BITSELECT,101)@6
    twoToMiSiYip_uid102_sincosTest_b <= STD_LOGIC_VECTOR(redist20_yip1_4_uid94_sincosTest_b_1_q(38 downto 4));

    -- twoToMiSiYip_uid86_sincosTest(BITSELECT,85)@5
    twoToMiSiYip_uid86_sincosTest_b <= STD_LOGIC_VECTOR(redist23_yip1_3_uid78_sincosTest_b_1_q(38 downto 3));

    -- xip1E_4_uid89_sincosTest(ADDSUB,88)@5
    xip1E_4_uid89_sincosTest_s <= xMSB_uid80_sincosTest_b;
    xip1E_4_uid89_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist24_xip1_3_uid77_sincosTest_b_1_q(38)) & redist24_xip1_3_uid77_sincosTest_b_1_q));
    xip1E_4_uid89_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 36 => twoToMiSiYip_uid86_sincosTest_b(35)) & twoToMiSiYip_uid86_sincosTest_b));
    xip1E_4_uid89_sincosTest_combproc: PROCESS (xip1E_4_uid89_sincosTest_a, xip1E_4_uid89_sincosTest_b, xip1E_4_uid89_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid89_sincosTest_s = "1") THEN
            xip1E_4_uid89_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid89_sincosTest_a) + SIGNED(xip1E_4_uid89_sincosTest_b));
        ELSE
            xip1E_4_uid89_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid89_sincosTest_a) - SIGNED(xip1E_4_uid89_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid89_sincosTest_q <= xip1E_4_uid89_sincosTest_o(39 downto 0);

    -- xip1_4_uid93_sincosTest(BITSELECT,92)@5
    xip1_4_uid93_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid89_sincosTest_q(38 downto 0));
    xip1_4_uid93_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid93_sincosTest_in(38 downto 0));

    -- redist21_xip1_4_uid93_sincosTest_b_1(DELAY,250)
    redist21_xip1_4_uid93_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid93_sincosTest_b, xout => redist21_xip1_4_uid93_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_5_uid105_sincosTest(ADDSUB,104)@6
    xip1E_5_uid105_sincosTest_s <= xMSB_uid96_sincosTest_b;
    xip1E_5_uid105_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist21_xip1_4_uid93_sincosTest_b_1_q(38)) & redist21_xip1_4_uid93_sincosTest_b_1_q));
    xip1E_5_uid105_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 35 => twoToMiSiYip_uid102_sincosTest_b(34)) & twoToMiSiYip_uid102_sincosTest_b));
    xip1E_5_uid105_sincosTest_combproc: PROCESS (xip1E_5_uid105_sincosTest_a, xip1E_5_uid105_sincosTest_b, xip1E_5_uid105_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid105_sincosTest_s = "1") THEN
            xip1E_5_uid105_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid105_sincosTest_a) + SIGNED(xip1E_5_uid105_sincosTest_b));
        ELSE
            xip1E_5_uid105_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid105_sincosTest_a) - SIGNED(xip1E_5_uid105_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid105_sincosTest_q <= xip1E_5_uid105_sincosTest_o(39 downto 0);

    -- xip1_5_uid109_sincosTest(BITSELECT,108)@6
    xip1_5_uid109_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid105_sincosTest_q(38 downto 0));
    xip1_5_uid109_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid109_sincosTest_in(38 downto 0));

    -- redist18_xip1_5_uid109_sincosTest_b_1(DELAY,247)
    redist18_xip1_5_uid109_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid109_sincosTest_b, xout => redist18_xip1_5_uid109_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid117_sincosTest(BITSELECT,116)@7
    twoToMiSiXip_uid117_sincosTest_b <= STD_LOGIC_VECTOR(redist18_xip1_5_uid109_sincosTest_b_1_q(38 downto 5));

    -- signOfSelectionSignal_uid98_sincosTest(LOGICAL,97)@6
    signOfSelectionSignal_uid98_sincosTest_q <= not (xMSB_uid96_sincosTest_b);

    -- twoToMiSiXip_uid101_sincosTest(BITSELECT,100)@6
    twoToMiSiXip_uid101_sincosTest_b <= STD_LOGIC_VECTOR(redist21_xip1_4_uid93_sincosTest_b_1_q(38 downto 4));

    -- yip1E_5_uid106_sincosTest(ADDSUB,105)@6
    yip1E_5_uid106_sincosTest_s <= signOfSelectionSignal_uid98_sincosTest_q;
    yip1E_5_uid106_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist20_yip1_4_uid94_sincosTest_b_1_q(38)) & redist20_yip1_4_uid94_sincosTest_b_1_q));
    yip1E_5_uid106_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 35 => twoToMiSiXip_uid101_sincosTest_b(34)) & twoToMiSiXip_uid101_sincosTest_b));
    yip1E_5_uid106_sincosTest_combproc: PROCESS (yip1E_5_uid106_sincosTest_a, yip1E_5_uid106_sincosTest_b, yip1E_5_uid106_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid106_sincosTest_s = "1") THEN
            yip1E_5_uid106_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid106_sincosTest_a) + SIGNED(yip1E_5_uid106_sincosTest_b));
        ELSE
            yip1E_5_uid106_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid106_sincosTest_a) - SIGNED(yip1E_5_uid106_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid106_sincosTest_q <= yip1E_5_uid106_sincosTest_o(39 downto 0);

    -- yip1_5_uid110_sincosTest(BITSELECT,109)@6
    yip1_5_uid110_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid106_sincosTest_q(38 downto 0));
    yip1_5_uid110_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid110_sincosTest_in(38 downto 0));

    -- redist17_yip1_5_uid110_sincosTest_b_1(DELAY,246)
    redist17_yip1_5_uid110_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid110_sincosTest_b, xout => redist17_yip1_5_uid110_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_6_uid122_sincosTest(ADDSUB,121)@7
    yip1E_6_uid122_sincosTest_s <= signOfSelectionSignal_uid114_sincosTest_q;
    yip1E_6_uid122_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist17_yip1_5_uid110_sincosTest_b_1_q(38)) & redist17_yip1_5_uid110_sincosTest_b_1_q));
    yip1E_6_uid122_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 34 => twoToMiSiXip_uid117_sincosTest_b(33)) & twoToMiSiXip_uid117_sincosTest_b));
    yip1E_6_uid122_sincosTest_combproc: PROCESS (yip1E_6_uid122_sincosTest_a, yip1E_6_uid122_sincosTest_b, yip1E_6_uid122_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid122_sincosTest_s = "1") THEN
            yip1E_6_uid122_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid122_sincosTest_a) + SIGNED(yip1E_6_uid122_sincosTest_b));
        ELSE
            yip1E_6_uid122_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid122_sincosTest_a) - SIGNED(yip1E_6_uid122_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid122_sincosTest_q <= yip1E_6_uid122_sincosTest_o(39 downto 0);

    -- yip1_6_uid126_sincosTest(BITSELECT,125)@7
    yip1_6_uid126_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid122_sincosTest_q(38 downto 0));
    yip1_6_uid126_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid126_sincosTest_in(38 downto 0));

    -- redist14_yip1_6_uid126_sincosTest_b_1(DELAY,243)
    redist14_yip1_6_uid126_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid126_sincosTest_b, xout => redist14_yip1_6_uid126_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid134_sincosTest(BITSELECT,133)@8
    twoToMiSiYip_uid134_sincosTest_b <= STD_LOGIC_VECTOR(redist14_yip1_6_uid126_sincosTest_b_1_q(38 downto 6));

    -- twoToMiSiYip_uid118_sincosTest(BITSELECT,117)@7
    twoToMiSiYip_uid118_sincosTest_b <= STD_LOGIC_VECTOR(redist17_yip1_5_uid110_sincosTest_b_1_q(38 downto 5));

    -- xip1E_6_uid121_sincosTest(ADDSUB,120)@7
    xip1E_6_uid121_sincosTest_s <= xMSB_uid112_sincosTest_b;
    xip1E_6_uid121_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist18_xip1_5_uid109_sincosTest_b_1_q(38)) & redist18_xip1_5_uid109_sincosTest_b_1_q));
    xip1E_6_uid121_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 34 => twoToMiSiYip_uid118_sincosTest_b(33)) & twoToMiSiYip_uid118_sincosTest_b));
    xip1E_6_uid121_sincosTest_combproc: PROCESS (xip1E_6_uid121_sincosTest_a, xip1E_6_uid121_sincosTest_b, xip1E_6_uid121_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid121_sincosTest_s = "1") THEN
            xip1E_6_uid121_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid121_sincosTest_a) + SIGNED(xip1E_6_uid121_sincosTest_b));
        ELSE
            xip1E_6_uid121_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid121_sincosTest_a) - SIGNED(xip1E_6_uid121_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid121_sincosTest_q <= xip1E_6_uid121_sincosTest_o(39 downto 0);

    -- xip1_6_uid125_sincosTest(BITSELECT,124)@7
    xip1_6_uid125_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid121_sincosTest_q(38 downto 0));
    xip1_6_uid125_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid125_sincosTest_in(38 downto 0));

    -- redist15_xip1_6_uid125_sincosTest_b_1(DELAY,244)
    redist15_xip1_6_uid125_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid125_sincosTest_b, xout => redist15_xip1_6_uid125_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_7_uid137_sincosTest(ADDSUB,136)@8
    xip1E_7_uid137_sincosTest_s <= xMSB_uid128_sincosTest_b;
    xip1E_7_uid137_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist15_xip1_6_uid125_sincosTest_b_1_q(38)) & redist15_xip1_6_uid125_sincosTest_b_1_q));
    xip1E_7_uid137_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => twoToMiSiYip_uid134_sincosTest_b(32)) & twoToMiSiYip_uid134_sincosTest_b));
    xip1E_7_uid137_sincosTest_combproc: PROCESS (xip1E_7_uid137_sincosTest_a, xip1E_7_uid137_sincosTest_b, xip1E_7_uid137_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid137_sincosTest_s = "1") THEN
            xip1E_7_uid137_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid137_sincosTest_a) + SIGNED(xip1E_7_uid137_sincosTest_b));
        ELSE
            xip1E_7_uid137_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid137_sincosTest_a) - SIGNED(xip1E_7_uid137_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid137_sincosTest_q <= xip1E_7_uid137_sincosTest_o(39 downto 0);

    -- xip1_7_uid144_sincosTest(BITSELECT,143)@8
    xip1_7_uid144_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid137_sincosTest_q(38 downto 0));
    xip1_7_uid144_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_in(38 downto 0));

    -- redist12_xip1_7_uid144_sincosTest_b_1(DELAY,241)
    redist12_xip1_7_uid144_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid144_sincosTest_b, xout => redist12_xip1_7_uid144_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid152_sincosTest(BITSELECT,151)@9
    twoToMiSiXip_uid152_sincosTest_b <= STD_LOGIC_VECTOR(redist12_xip1_7_uid144_sincosTest_b_1_q(38 downto 7));

    -- signOfSelectionSignal_uid130_sincosTest(LOGICAL,129)@8
    signOfSelectionSignal_uid130_sincosTest_q <= not (xMSB_uid128_sincosTest_b);

    -- twoToMiSiXip_uid133_sincosTest(BITSELECT,132)@8
    twoToMiSiXip_uid133_sincosTest_b <= STD_LOGIC_VECTOR(redist15_xip1_6_uid125_sincosTest_b_1_q(38 downto 6));

    -- yip1E_7_uid138_sincosTest(ADDSUB,137)@8
    yip1E_7_uid138_sincosTest_s <= signOfSelectionSignal_uid130_sincosTest_q;
    yip1E_7_uid138_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist14_yip1_6_uid126_sincosTest_b_1_q(38)) & redist14_yip1_6_uid126_sincosTest_b_1_q));
    yip1E_7_uid138_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => twoToMiSiXip_uid133_sincosTest_b(32)) & twoToMiSiXip_uid133_sincosTest_b));
    yip1E_7_uid138_sincosTest_combproc: PROCESS (yip1E_7_uid138_sincosTest_a, yip1E_7_uid138_sincosTest_b, yip1E_7_uid138_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid138_sincosTest_s = "1") THEN
            yip1E_7_uid138_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid138_sincosTest_a) + SIGNED(yip1E_7_uid138_sincosTest_b));
        ELSE
            yip1E_7_uid138_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid138_sincosTest_a) - SIGNED(yip1E_7_uid138_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid138_sincosTest_q <= yip1E_7_uid138_sincosTest_o(39 downto 0);

    -- yip1_7_uid145_sincosTest(BITSELECT,144)@8
    yip1_7_uid145_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid138_sincosTest_q(38 downto 0));
    yip1_7_uid145_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_in(38 downto 0));

    -- redist11_yip1_7_uid145_sincosTest_b_1(DELAY,240)
    redist11_yip1_7_uid145_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid145_sincosTest_b, xout => redist11_yip1_7_uid145_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_8_uid157_sincosTest(ADDSUB,156)@9
    yip1E_8_uid157_sincosTest_s <= signOfSelectionSignal_uid149_sincosTest_q;
    yip1E_8_uid157_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist11_yip1_7_uid145_sincosTest_b_1_q(38)) & redist11_yip1_7_uid145_sincosTest_b_1_q));
    yip1E_8_uid157_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 32 => twoToMiSiXip_uid152_sincosTest_b(31)) & twoToMiSiXip_uid152_sincosTest_b));
    yip1E_8_uid157_sincosTest_combproc: PROCESS (yip1E_8_uid157_sincosTest_a, yip1E_8_uid157_sincosTest_b, yip1E_8_uid157_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid157_sincosTest_s = "1") THEN
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) + SIGNED(yip1E_8_uid157_sincosTest_b));
        ELSE
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) - SIGNED(yip1E_8_uid157_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_sincosTest_q <= yip1E_8_uid157_sincosTest_o(39 downto 0);

    -- yip1_8_uid164_sincosTest(BITSELECT,163)@9
    yip1_8_uid164_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_sincosTest_q(38 downto 0));
    yip1_8_uid164_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid164_sincosTest_in(38 downto 0));

    -- redist8_yip1_8_uid164_sincosTest_b_1(DELAY,237)
    redist8_yip1_8_uid164_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid164_sincosTest_b, xout => redist8_yip1_8_uid164_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid172_sincosTest(BITSELECT,171)@10
    twoToMiSiYip_uid172_sincosTest_b <= STD_LOGIC_VECTOR(redist8_yip1_8_uid164_sincosTest_b_1_q(38 downto 8));

    -- twoToMiSiYip_uid153_sincosTest(BITSELECT,152)@9
    twoToMiSiYip_uid153_sincosTest_b <= STD_LOGIC_VECTOR(redist11_yip1_7_uid145_sincosTest_b_1_q(38 downto 7));

    -- xip1E_8_uid156_sincosTest(ADDSUB,155)@9
    xip1E_8_uid156_sincosTest_s <= xMSB_uid147_sincosTest_b;
    xip1E_8_uid156_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist12_xip1_7_uid144_sincosTest_b_1_q(38)) & redist12_xip1_7_uid144_sincosTest_b_1_q));
    xip1E_8_uid156_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 32 => twoToMiSiYip_uid153_sincosTest_b(31)) & twoToMiSiYip_uid153_sincosTest_b));
    xip1E_8_uid156_sincosTest_combproc: PROCESS (xip1E_8_uid156_sincosTest_a, xip1E_8_uid156_sincosTest_b, xip1E_8_uid156_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid156_sincosTest_s = "1") THEN
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) + SIGNED(xip1E_8_uid156_sincosTest_b));
        ELSE
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) - SIGNED(xip1E_8_uid156_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_sincosTest_q <= xip1E_8_uid156_sincosTest_o(39 downto 0);

    -- xip1_8_uid163_sincosTest(BITSELECT,162)@9
    xip1_8_uid163_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid156_sincosTest_q(38 downto 0));
    xip1_8_uid163_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid163_sincosTest_in(38 downto 0));

    -- redist9_xip1_8_uid163_sincosTest_b_1(DELAY,238)
    redist9_xip1_8_uid163_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid163_sincosTest_b, xout => redist9_xip1_8_uid163_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_9_uid175_sincosTest(ADDSUB,174)@10
    xip1E_9_uid175_sincosTest_s <= xMSB_uid166_sincosTest_b;
    xip1E_9_uid175_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist9_xip1_8_uid163_sincosTest_b_1_q(38)) & redist9_xip1_8_uid163_sincosTest_b_1_q));
    xip1E_9_uid175_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 31 => twoToMiSiYip_uid172_sincosTest_b(30)) & twoToMiSiYip_uid172_sincosTest_b));
    xip1E_9_uid175_sincosTest_combproc: PROCESS (xip1E_9_uid175_sincosTest_a, xip1E_9_uid175_sincosTest_b, xip1E_9_uid175_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid175_sincosTest_s = "1") THEN
            xip1E_9_uid175_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid175_sincosTest_a) + SIGNED(xip1E_9_uid175_sincosTest_b));
        ELSE
            xip1E_9_uid175_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid175_sincosTest_a) - SIGNED(xip1E_9_uid175_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid175_sincosTest_q <= xip1E_9_uid175_sincosTest_o(39 downto 0);

    -- xip1_9_uid182_sincosTest(BITSELECT,181)@10
    xip1_9_uid182_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid175_sincosTest_q(38 downto 0));
    xip1_9_uid182_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid182_sincosTest_in(38 downto 0));

    -- redist6_xip1_9_uid182_sincosTest_b_1(DELAY,235)
    redist6_xip1_9_uid182_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid182_sincosTest_b, xout => redist6_xip1_9_uid182_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid190_sincosTest(BITSELECT,189)@11
    twoToMiSiXip_uid190_sincosTest_b <= STD_LOGIC_VECTOR(redist6_xip1_9_uid182_sincosTest_b_1_q(38 downto 9));

    -- signOfSelectionSignal_uid168_sincosTest(LOGICAL,167)@10
    signOfSelectionSignal_uid168_sincosTest_q <= not (xMSB_uid166_sincosTest_b);

    -- twoToMiSiXip_uid171_sincosTest(BITSELECT,170)@10
    twoToMiSiXip_uid171_sincosTest_b <= STD_LOGIC_VECTOR(redist9_xip1_8_uid163_sincosTest_b_1_q(38 downto 8));

    -- yip1E_9_uid176_sincosTest(ADDSUB,175)@10
    yip1E_9_uid176_sincosTest_s <= signOfSelectionSignal_uid168_sincosTest_q;
    yip1E_9_uid176_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist8_yip1_8_uid164_sincosTest_b_1_q(38)) & redist8_yip1_8_uid164_sincosTest_b_1_q));
    yip1E_9_uid176_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 31 => twoToMiSiXip_uid171_sincosTest_b(30)) & twoToMiSiXip_uid171_sincosTest_b));
    yip1E_9_uid176_sincosTest_combproc: PROCESS (yip1E_9_uid176_sincosTest_a, yip1E_9_uid176_sincosTest_b, yip1E_9_uid176_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid176_sincosTest_s = "1") THEN
            yip1E_9_uid176_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid176_sincosTest_a) + SIGNED(yip1E_9_uid176_sincosTest_b));
        ELSE
            yip1E_9_uid176_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid176_sincosTest_a) - SIGNED(yip1E_9_uid176_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid176_sincosTest_q <= yip1E_9_uid176_sincosTest_o(39 downto 0);

    -- yip1_9_uid183_sincosTest(BITSELECT,182)@10
    yip1_9_uid183_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid176_sincosTest_q(38 downto 0));
    yip1_9_uid183_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid183_sincosTest_in(38 downto 0));

    -- redist5_yip1_9_uid183_sincosTest_b_1(DELAY,234)
    redist5_yip1_9_uid183_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid183_sincosTest_b, xout => redist5_yip1_9_uid183_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_10_uid195_sincosTest(ADDSUB,194)@11
    yip1E_10_uid195_sincosTest_s <= signOfSelectionSignal_uid187_sincosTest_q;
    yip1E_10_uid195_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist5_yip1_9_uid183_sincosTest_b_1_q(38)) & redist5_yip1_9_uid183_sincosTest_b_1_q));
    yip1E_10_uid195_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 30 => twoToMiSiXip_uid190_sincosTest_b(29)) & twoToMiSiXip_uid190_sincosTest_b));
    yip1E_10_uid195_sincosTest_combproc: PROCESS (yip1E_10_uid195_sincosTest_a, yip1E_10_uid195_sincosTest_b, yip1E_10_uid195_sincosTest_s)
    BEGIN
        IF (yip1E_10_uid195_sincosTest_s = "1") THEN
            yip1E_10_uid195_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid195_sincosTest_a) + SIGNED(yip1E_10_uid195_sincosTest_b));
        ELSE
            yip1E_10_uid195_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid195_sincosTest_a) - SIGNED(yip1E_10_uid195_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid195_sincosTest_q <= yip1E_10_uid195_sincosTest_o(39 downto 0);

    -- yip1_10_uid202_sincosTest(BITSELECT,201)@11
    yip1_10_uid202_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid195_sincosTest_q(38 downto 0));
    yip1_10_uid202_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid202_sincosTest_in(38 downto 0));

    -- ySumPreRnd_uid208_sincosTest(BITSELECT,207)@11
    ySumPreRnd_uid208_sincosTest_in <= yip1_10_uid202_sincosTest_b(37 downto 0);
    ySumPreRnd_uid208_sincosTest_b <= ySumPreRnd_uid208_sincosTest_in(37 downto 27);

    -- redist2_ySumPreRnd_uid208_sincosTest_b_1(DELAY,231)
    redist2_ySumPreRnd_uid208_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ySumPreRnd_uid208_sincosTest_b, xout => redist2_ySumPreRnd_uid208_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- ySumPostRnd_uid211_sincosTest(ADD,210)@12
    ySumPostRnd_uid211_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist2_ySumPreRnd_uid208_sincosTest_b_1_q);
    ySumPostRnd_uid211_sincosTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
    ySumPostRnd_uid211_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid211_sincosTest_a) + UNSIGNED(ySumPostRnd_uid211_sincosTest_b));
    ySumPostRnd_uid211_sincosTest_q <= ySumPostRnd_uid211_sincosTest_o(11 downto 0);

    -- yPostExc_uid213_sincosTest(BITSELECT,212)@12
    yPostExc_uid213_sincosTest_in <= STD_LOGIC_VECTOR(ySumPostRnd_uid211_sincosTest_q(10 downto 0));
    yPostExc_uid213_sincosTest_b <= STD_LOGIC_VECTOR(yPostExc_uid213_sincosTest_in(10 downto 1));

    -- redist0_yPostExc_uid213_sincosTest_b_1(DELAY,229)
    redist0_yPostExc_uid213_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPostExc_uid213_sincosTest_b, xout => redist0_yPostExc_uid213_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- cstZeroForAddSub_uid221_sincosTest(CONSTANT,220)
    cstZeroForAddSub_uid221_sincosTest_q <= "0000000000";

    -- sinPostNeg_uid223_sincosTest(ADDSUB,222)@13
    sinPostNeg_uid223_sincosTest_s <= invSinNegCond_uid222_sincosTest_q;
    sinPostNeg_uid223_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => cstZeroForAddSub_uid221_sincosTest_q(9)) & cstZeroForAddSub_uid221_sincosTest_q));
    sinPostNeg_uid223_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist0_yPostExc_uid213_sincosTest_b_1_q(9)) & redist0_yPostExc_uid213_sincosTest_b_1_q));
    sinPostNeg_uid223_sincosTest_combproc: PROCESS (sinPostNeg_uid223_sincosTest_a, sinPostNeg_uid223_sincosTest_b, sinPostNeg_uid223_sincosTest_s)
    BEGIN
        IF (sinPostNeg_uid223_sincosTest_s = "1") THEN
            sinPostNeg_uid223_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid223_sincosTest_a) + SIGNED(sinPostNeg_uid223_sincosTest_b));
        ELSE
            sinPostNeg_uid223_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid223_sincosTest_a) - SIGNED(sinPostNeg_uid223_sincosTest_b));
        END IF;
    END PROCESS;
    sinPostNeg_uid223_sincosTest_q <= sinPostNeg_uid223_sincosTest_o(10 downto 0);

    -- invCosNegCond_uid224_sincosTest(LOGICAL,223)@12 + 1
    invCosNegCond_uid224_sincosTest_qi <= not (sinNegCond2_uid215_sincosTest_q);
    invCosNegCond_uid224_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid224_sincosTest_qi, xout => invCosNegCond_uid224_sincosTest_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid191_sincosTest(BITSELECT,190)@11
    twoToMiSiYip_uid191_sincosTest_b <= STD_LOGIC_VECTOR(redist5_yip1_9_uid183_sincosTest_b_1_q(38 downto 9));

    -- xip1E_10_uid194_sincosTest(ADDSUB,193)@11
    xip1E_10_uid194_sincosTest_s <= redist4_xMSB_uid185_sincosTest_b_1_q;
    xip1E_10_uid194_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist6_xip1_9_uid182_sincosTest_b_1_q(38)) & redist6_xip1_9_uid182_sincosTest_b_1_q));
    xip1E_10_uid194_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 30 => twoToMiSiYip_uid191_sincosTest_b(29)) & twoToMiSiYip_uid191_sincosTest_b));
    xip1E_10_uid194_sincosTest_combproc: PROCESS (xip1E_10_uid194_sincosTest_a, xip1E_10_uid194_sincosTest_b, xip1E_10_uid194_sincosTest_s)
    BEGIN
        IF (xip1E_10_uid194_sincosTest_s = "1") THEN
            xip1E_10_uid194_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid194_sincosTest_a) + SIGNED(xip1E_10_uid194_sincosTest_b));
        ELSE
            xip1E_10_uid194_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid194_sincosTest_a) - SIGNED(xip1E_10_uid194_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid194_sincosTest_q <= xip1E_10_uid194_sincosTest_o(39 downto 0);

    -- xip1_10_uid201_sincosTest(BITSELECT,200)@11
    xip1_10_uid201_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid194_sincosTest_q(38 downto 0));
    xip1_10_uid201_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid201_sincosTest_in(38 downto 0));

    -- xSumPreRnd_uid204_sincosTest(BITSELECT,203)@11
    xSumPreRnd_uid204_sincosTest_in <= xip1_10_uid201_sincosTest_b(37 downto 0);
    xSumPreRnd_uid204_sincosTest_b <= xSumPreRnd_uid204_sincosTest_in(37 downto 27);

    -- redist3_xSumPreRnd_uid204_sincosTest_b_1(DELAY,232)
    redist3_xSumPreRnd_uid204_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xSumPreRnd_uid204_sincosTest_b, xout => redist3_xSumPreRnd_uid204_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xSumPostRnd_uid207_sincosTest(ADD,206)@12
    xSumPostRnd_uid207_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist3_xSumPreRnd_uid204_sincosTest_b_1_q);
    xSumPostRnd_uid207_sincosTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
    xSumPostRnd_uid207_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid207_sincosTest_a) + UNSIGNED(xSumPostRnd_uid207_sincosTest_b));
    xSumPostRnd_uid207_sincosTest_q <= xSumPostRnd_uid207_sincosTest_o(11 downto 0);

    -- xPostExc_uid212_sincosTest(BITSELECT,211)@12
    xPostExc_uid212_sincosTest_in <= STD_LOGIC_VECTOR(xSumPostRnd_uid207_sincosTest_q(10 downto 0));
    xPostExc_uid212_sincosTest_b <= STD_LOGIC_VECTOR(xPostExc_uid212_sincosTest_in(10 downto 1));

    -- redist1_xPostExc_uid212_sincosTest_b_1(DELAY,230)
    redist1_xPostExc_uid212_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xPostExc_uid212_sincosTest_b, xout => redist1_xPostExc_uid212_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- cosPostNeg_uid225_sincosTest(ADDSUB,224)@13
    cosPostNeg_uid225_sincosTest_s <= invCosNegCond_uid224_sincosTest_q;
    cosPostNeg_uid225_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => cstZeroForAddSub_uid221_sincosTest_q(9)) & cstZeroForAddSub_uid221_sincosTest_q));
    cosPostNeg_uid225_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => redist1_xPostExc_uid212_sincosTest_b_1_q(9)) & redist1_xPostExc_uid212_sincosTest_b_1_q));
    cosPostNeg_uid225_sincosTest_combproc: PROCESS (cosPostNeg_uid225_sincosTest_a, cosPostNeg_uid225_sincosTest_b, cosPostNeg_uid225_sincosTest_s)
    BEGIN
        IF (cosPostNeg_uid225_sincosTest_s = "1") THEN
            cosPostNeg_uid225_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid225_sincosTest_a) + SIGNED(cosPostNeg_uid225_sincosTest_b));
        ELSE
            cosPostNeg_uid225_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid225_sincosTest_a) - SIGNED(cosPostNeg_uid225_sincosTest_b));
        END IF;
    END PROCESS;
    cosPostNeg_uid225_sincosTest_q <= cosPostNeg_uid225_sincosTest_o(10 downto 0);

    -- redist30_firstQuadrant_uid15_sincosTest_b_12(DELAY,259)
    redist30_firstQuadrant_uid15_sincosTest_b_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist29_firstQuadrant_uid15_sincosTest_b_11_q, xout => redist30_firstQuadrant_uid15_sincosTest_b_12_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xPostRR_uid227_sincosTest(MUX,226)@13
    xPostRR_uid227_sincosTest_s <= redist30_firstQuadrant_uid15_sincosTest_b_12_q;
    xPostRR_uid227_sincosTest_combproc: PROCESS (xPostRR_uid227_sincosTest_s, cosPostNeg_uid225_sincosTest_q, sinPostNeg_uid223_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid227_sincosTest_s) IS
            WHEN "0" => xPostRR_uid227_sincosTest_q <= cosPostNeg_uid225_sincosTest_q;
            WHEN "1" => xPostRR_uid227_sincosTest_q <= sinPostNeg_uid223_sincosTest_q;
            WHEN OTHERS => xPostRR_uid227_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sin_uid229_sincosTest(BITSELECT,228)@13
    sin_uid229_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid227_sincosTest_q(9 downto 0));
    sin_uid229_sincosTest_b <= STD_LOGIC_VECTOR(sin_uid229_sincosTest_in(9 downto 0));

    -- xPostRR_uid226_sincosTest(MUX,225)@13
    xPostRR_uid226_sincosTest_s <= redist30_firstQuadrant_uid15_sincosTest_b_12_q;
    xPostRR_uid226_sincosTest_combproc: PROCESS (xPostRR_uid226_sincosTest_s, sinPostNeg_uid223_sincosTest_q, cosPostNeg_uid225_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid226_sincosTest_s) IS
            WHEN "0" => xPostRR_uid226_sincosTest_q <= sinPostNeg_uid223_sincosTest_q;
            WHEN "1" => xPostRR_uid226_sincosTest_q <= cosPostNeg_uid225_sincosTest_q;
            WHEN OTHERS => xPostRR_uid226_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cos_uid228_sincosTest(BITSELECT,227)@13
    cos_uid228_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid226_sincosTest_q(9 downto 0));
    cos_uid228_sincosTest_b <= STD_LOGIC_VECTOR(cos_uid228_sincosTest_in(9 downto 0));

    -- xOut(GPOUT,4)@13
    c <= cos_uid228_sincosTest_b;
    s <= sin_uid229_sincosTest_b;

END normal;
