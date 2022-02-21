wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/phong/icc2015/build/SET.fsdb}
wvResizeWindow -win $_nWave1 0 23 1366 705
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/mode_t\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/state\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 14 15 16 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/mode_t\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/state\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 14 15 16 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1366 705
wvResizeWindow -win $_nWave1 0 23 1366 705
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 73593.478643 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetCursor -win $_nWave1 80123.445896 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 80123.445896 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 77945.068737 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 12415.407297 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 9541.546738 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 10000.152455 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 70969.234814 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 66867.261450 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 35975.070744 -snap {("G1" 10)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate\[7:0\]} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/valid} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/mode_t\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/state\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate\[7:0\]} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/valid} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/mode_t\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/state\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate\[7:0\]} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/valid} \
{/testfixture1/err_cnt\[31:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/mode_t\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/state\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/a_r\[3:0\]} \
{/testfixture1/u_set/candiate\[7:0\]} \
{/testfixture1/u_set/r_c\[7:0\]} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/valid} \
{/testfixture1/err_cnt\[31:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/dis_ax\[3:0\]} \
{/testfixture1/u_set/dis_ay\[3:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/a_x\[3:0\]} \
{/testfixture1/u_set/a_y\[3:0\]} \
{/testfixture1/u_set/x\[3:0\]} \
{/testfixture1/u_set/y\[3:0\]} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/mode_t\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/state\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 69555.200517 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 197251.414800 -snap {("G1" 19)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 192563.445242 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 136982.980066 -snap {("G1" 17)}
wvSetCursor -win $_nWave1 4280.320032 -snap {("G1" 19)}
wvSetCursor -win $_nWave1 7388.647674 -snap {("G1" 15)}
wvExit
