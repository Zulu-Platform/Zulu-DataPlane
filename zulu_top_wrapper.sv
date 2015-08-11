//-----------------------------------------------------------------------------
//
// Title       : zulu_top
// Design      : Zulu
// Author      : 
// Company     : 
//
//-----------------------------------------------------------------------------
//
// Description : 
// This is top-level module for Zulu processing system.
//
//-----------------------------------------------------------------------------

module zulu_top_wrapper 
	#(
	parameter MAC_ORDERING = 1,		// defines order of bytes in MAC-bus. 0 - most significant byte is [63:56], 1 - MSB is [7:0]
	parameter CHAN_COUNT = 8,		// number of input interface channels
	)
	(
	input clk,										// main processing clock
	// input clk1,									// additional clocks (if needed)
	// input clk2,									//
	
	input rst,										// main reset signal
	//input rst1,									// additional reset signals (if needed)
	//input rst2,									// 
	
	// Control and statistic interface
	input ctrl_clk,									// control clock, 50 MHz
	input 			ctrl_vlan_table_valid,			// example of control 1-bit signal
	input [11:0] 	ctrl_vlan_table_vid,			// example of control input bus signal
	input [CHAN_COUNT-1:0] ctrl_vlan_table_chan_wr, // example of control input bus signal
	output [CHAN_COUNT-1:0] ctrl_vlan_table_chan_rd,// example of control output (readback) bus signal
	
	input stat_rst,									// statistic reset signal
	output [31:0] 		stat_rx_speed[0:CHAN_COUNT-1], // example of statistic output bus signal
	
	// PCI-E interface
	input pci_clk,									// clock from PCI-block
	
	input [31:0]	pci_rx_aux						// RX auxiliary signals
	input [63:0] 	pci_rx,							// RX AXI bus
	input [7:0] 	pci_rx_keep,					//
	input 			pci_rx_last,					//
	input 			pci_rx_user,					//
	input 			pci_rx_valid,					//
	
	output [31:0]		pci_tx_aux					// ÅX auxiliary signals
	input 			pci_tx_ready,					// TX AXI bus
	output [63:0] 		pci_tx,						//
	output [7:0] 		pci_tx_keep,				//
	output 				pci_tx_last,				//
	output 				pci_tx_valid				//
	
	// Input interface
	input mac_clk[0:CHAN_COUNT-1],					// clock from MAC-block, 156.25 MHz for 10G-mode
	
	input [63:0] 	mac_rx[0:CHAN_COUNT-1],			// RX AXI bus
	input [7:0] 	mac_rx_keep[0:CHAN_COUNT-1],	//
	input 			mac_rx_last[0:CHAN_COUNT-1],	//
	input 			mac_rx_user[0:CHAN_COUNT-1],	//
	input 			mac_rx_valid[0:CHAN_COUNT-1],	//
	
	input 			mac_tx_ready[0:CHAN_COUNT-1],	// TX AXI bus
	output [63:0] 		mac_tx[0:CHAN_COUNT-1],		//
	output [7:0] 		mac_tx_keep[0:CHAN_COUNT-1],//
	output 				mac_tx_last[0:CHAN_COUNT-1],//
	output 				mac_tx_valid[0:CHAN_COUNT-1]//
	);
	
	// ------------------------------------------- //
	// ---------------- USER LOGIC --------------- //
	// ------------------------------------------- //
	
endmodule
