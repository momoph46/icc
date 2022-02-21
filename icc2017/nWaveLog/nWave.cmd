wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/phong/icc2017/DT.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_dut/clk} \
{/testfixture/u_dut/counter\[3:0\]} \
{/testfixture/u_dut/minTemp\[7:0\]} \
{/testfixture/u_dut/next_state\[3:0\]} \
{/testfixture/u_dut/res_addr\[13:0\]} \
{/testfixture/u_dut/res_di\[7:0\]} \
{/testfixture/u_dut/res_do\[7:0\]} \
{/testfixture/u_dut/res_rd} \
{/testfixture/u_dut/res_wr} \
{/testfixture/u_dut/state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_dut/clk} \
{/testfixture/u_dut/counter\[3:0\]} \
{/testfixture/u_dut/minTemp\[7:0\]} \
{/testfixture/u_dut/next_state\[3:0\]} \
{/testfixture/u_dut/res_addr\[13:0\]} \
{/testfixture/u_dut/res_di\[7:0\]} \
{/testfixture/u_dut/res_do\[7:0\]} \
{/testfixture/u_dut/res_rd} \
{/testfixture/u_dut/res_wr} \
{/testfixture/u_dut/state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
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
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetCursor -win $_nWave1 23445536.026984 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 23446376.838734 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 23446549.312939 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 23453383.603314 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 23446958.939176 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 23445492.908433 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 23446441.516561 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 23449481.374425 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 23449632.289354 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 5626.970940 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 6424.664139 -snap {("G1" 10)}
wvResizeWindow -win $_nWave1 1366 31 1440 837
wvSetCursor -win $_nWave1 22669.032777 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 21504.306069 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 22647.463764 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 21482.737056 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 22323.928567 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 22776.877843 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5262.839198 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 6621.687024 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 22582.756725 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 21504.306069 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 22453.342646 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 22453.342646 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvExpandBus -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvCollapseBus -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_dut/clk} \
{/testfixture/u_dut/counter\[3:0\]} \
{/testfixture/u_dut/minTemp\[7:0\]} \
{/testfixture/u_dut/next_state\[3:0\]} \
{/testfixture/u_dut/res_addr\[13:0\]} \
{/testfixture/u_dut/res_di\[7:0\]} \
{/testfixture/u_dut/res_do\[7:0\]} \
{/testfixture/u_dut/res_rd} \
{/testfixture/u_dut/res_wr} \
{/testfixture/u_dut/state\[3:0\]} \
{/testfixture/u_dut/sti_addr\[9:0\]} \
{/testfixture/u_dut/sti_di\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_dut/clk} \
{/testfixture/u_dut/counter\[3:0\]} \
{/testfixture/u_dut/minTemp\[7:0\]} \
{/testfixture/u_dut/next_state\[3:0\]} \
{/testfixture/u_dut/res_addr\[13:0\]} \
{/testfixture/u_dut/res_di\[7:0\]} \
{/testfixture/u_dut/res_do\[7:0\]} \
{/testfixture/u_dut/res_rd} \
{/testfixture/u_dut/res_wr} \
{/testfixture/u_dut/state\[3:0\]} \
{/testfixture/u_dut/sti_addr\[9:0\]} \
{/testfixture/u_dut/sti_di\[15:0\]} \
{/testfixture/u_dut/sti_rd} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetRadix -win $_nWave1 -format Bin
wvSetCursor -win $_nWave1 11555512.496866 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 11480969.987569 -snap {("G1" 12)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 11489489.747747 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 28687497.256111 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvExpandBus -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvCollapseBus -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvExpandBus -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvCollapseBus -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetCursor -win $_nWave1 28688381.585648 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 28693083.630506 -snap {("G1" 2)}
wvExit
