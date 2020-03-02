
/**** SPIN model of network-on-chip for formal verification **********/

/******************************Changes in this code************************
*  Date : 23 June 2010                                                                                        *
*  Retained changes for ver.1 and extending to 9 routers in ver.2             *
* Removed parts of code that does not contribute to verification               *
*                  - Input FIFO                                                                                        *
*                  - remove 4-way handshake to one                                               *
*  Change sync channel to bool variables  - additional channels              *
*                                                                                            replaced                   *
*  Problems	:					                 *
*               - packet_received cannot be set properly as the sender is        *
*                    not known                                                                                         *
*               - no problem with arbitration policy just takes long time to run  *
*                    Fix: Used PAYLD1 as source identifier                                       *
*   Number of process = 226                                                                              *
*    Number of channels = 189                                                                           *
* Perform model checking based verification                                                 *
* Corrected 2 - Busy controlled by output controller              *
*******************************************************************************/

mtype = {hi,lo}

#define MAX_ROUTERS 9
#define MAX_BUFF_SIZE 5


#define DEST_X 0
#define DEST_Y 1
#define NOF 2
#define PAYLD1 3
#define PAYLD2 4 
/************************router0 initializations **********************************/

/* 
chan send_write_node0_router0[MAX_ROUTERS] = [0] of {mtype};
hidden byte data_write_node0_router0[MAX_ROUTERS]  = 0;
chan ack_write_node0_router0[MAX_ROUTERS]  = [0] of {mtype};
*/

bool send_read_node0_router0[MAX_ROUTERS]= false;
byte data_read_node0_router0[MAX_ROUTERS]= 0;
bool ack_read_node0_router0[MAX_ROUTERS]= false;

bool send_tx_east_router0[MAX_ROUTERS]= false;
byte data_tx_east_router0[MAX_ROUTERS]= 0;
bool ack_tx_east_router0[MAX_ROUTERS] = false;

bool send_tx_west_router0[MAX_ROUTERS]= false;
byte data_tx_west_router0[MAX_ROUTERS]= 0;
bool ack_tx_west_router0[MAX_ROUTERS] = false;

bool send_tx_north_router0[MAX_ROUTERS]= false;
byte data_tx_north_router0[MAX_ROUTERS]= 0;
bool ack_tx_north_router0[MAX_ROUTERS] = false;

bool send_tx_south_router0[MAX_ROUTERS]= false;
byte data_tx_south_router0[MAX_ROUTERS]= 0;
bool ack_tx_south_router0[MAX_ROUTERS]= false;

bool send_rx_east_router0[MAX_ROUTERS]= false;
byte data_rx_east_router0[MAX_ROUTERS]= 0;
bool ack_rx_east_router0[MAX_ROUTERS]= false;

bool send_rx_west_router0[MAX_ROUTERS]= false;
byte data_rx_west_router0[MAX_ROUTERS]= 0;
bool ack_rx_west_router0[MAX_ROUTERS] = false;

bool send_rx_north_router0[MAX_ROUTERS]= false;
byte data_rx_north_router0[MAX_ROUTERS]= 0;
bool ack_rx_north_router0[MAX_ROUTERS] = false;

bool send_rx_south_router0[MAX_ROUTERS]= false;
byte data_rx_south_router0[MAX_ROUTERS]= 0;
bool ack_rx_south_router0[MAX_ROUTERS]= false;

byte write_buff_node0_dataw[MAX_ROUTERS] = 0;
bool syncnode0dataw [MAX_ROUTERS]= false;

bool read_buff_node0_wen[MAX_ROUTERS]  = false;
byte read_buff_node0_dataw[MAX_ROUTERS]  = 0;

bool req_sche_node0_north_router0[MAX_ROUTERS] = false;
bool ack_sche_node0_north_router0[MAX_ROUTERS] = false;
bool req_sche_node0_south_router0[MAX_ROUTERS] = false;
bool ack_sche_node0_south_router0[MAX_ROUTERS] = false;
bool req_sche_node0_east_router0[MAX_ROUTERS] = false;
bool ack_sche_node0_east_router0[MAX_ROUTERS] = false;
bool req_sche_node0_west_router0[MAX_ROUTERS] = false;
bool ack_sche_node0_west_router0[MAX_ROUTERS] = false;
bool req_sche_node0_node0_router0[MAX_ROUTERS] = false;
bool ack_sche_node0_node0_router0[MAX_ROUTERS] = false;

bool req_sche_east_north_router0[MAX_ROUTERS] = false;
bool ack_sche_east_north_router0[MAX_ROUTERS] = false;
bool req_sche_east_south_router0[MAX_ROUTERS] = false;
bool ack_sche_east_south_router0[MAX_ROUTERS] = false;
bool req_sche_east_east_router0[MAX_ROUTERS] = false;
bool ack_sche_east_east_router0[MAX_ROUTERS] = false;
bool req_sche_east_west_router0[MAX_ROUTERS] = false;
bool ack_sche_east_west_router0[MAX_ROUTERS] = false;
bool req_sche_east_node0_router0[MAX_ROUTERS] = false;
bool ack_sche_east_node0_router0[MAX_ROUTERS] = false;

bool req_sche_west_north_router0[MAX_ROUTERS] = false;
bool ack_sche_west_north_router0[MAX_ROUTERS] = false;
bool req_sche_west_south_router0[MAX_ROUTERS] = false;
bool ack_sche_west_south_router0[MAX_ROUTERS]= false;
bool req_sche_west_east_router0[MAX_ROUTERS] = false;
bool ack_sche_west_east_router0[MAX_ROUTERS] = false;
bool req_sche_west_west_router0[MAX_ROUTERS] = false;
bool ack_sche_west_west_router0[MAX_ROUTERS]= false;
bool req_sche_west_node0_router0[MAX_ROUTERS] = false;
bool ack_sche_west_node0_router0[MAX_ROUTERS] = false;

bool req_sche_north_north_router0[MAX_ROUTERS] = false;
bool ack_sche_north_north_router0[MAX_ROUTERS] = false;
bool req_sche_north_south_router0[MAX_ROUTERS] = false;
bool ack_sche_north_south_router0[MAX_ROUTERS] = false;
bool req_sche_north_east_router0[MAX_ROUTERS] = false;
bool ack_sche_north_east_router0[MAX_ROUTERS] = false;
bool req_sche_north_west_router0[MAX_ROUTERS] = false;
bool ack_sche_north_west_router0[MAX_ROUTERS] = false;
bool req_sche_north_node0_router0[MAX_ROUTERS] = false;
bool ack_sche_north_node0_router0[MAX_ROUTERS] = false;

bool req_sche_south_north_router0[MAX_ROUTERS] = false;
bool ack_sche_south_north_router0[MAX_ROUTERS] = false;
bool req_sche_south_south_router0[MAX_ROUTERS] = false;
bool ack_sche_south_south_router0[MAX_ROUTERS] = false;
bool req_sche_south_east_router0[MAX_ROUTERS] = false;
bool ack_sche_south_east_router0[MAX_ROUTERS] = false;
bool req_sche_south_west_router0[MAX_ROUTERS] = false;
bool ack_sche_south_west_router0[MAX_ROUTERS] = false;
bool req_sche_south_node0_router0[MAX_ROUTERS] = false;
bool ack_sche_south_node0_router0[MAX_ROUTERS] =false;

bool BOF_east_router0[MAX_ROUTERS]= false;
byte tx_data_east_router0[MAX_ROUTERS] = 0;
bool BOF_west_router0[MAX_ROUTERS]= false;
byte tx_data_west_router0[MAX_ROUTERS] = 0;
bool BOF_north_router0[MAX_ROUTERS]= false;
byte tx_data_north_router0[MAX_ROUTERS]= 0;
bool BOF_south_router0[MAX_ROUTERS]= false;
byte tx_data_south_router0[MAX_ROUTERS] = 0;
bool BOF_node0_router0[MAX_ROUTERS]= false;
byte tx_data_node0_router0[MAX_ROUTERS] = 0;

bool BOP_east_router0[MAX_ROUTERS]= false;
bool BOP_west_router0[MAX_ROUTERS]= false;
bool BOP_north_router0[MAX_ROUTERS]= false;
bool BOP_south_router0[MAX_ROUTERS]= false;
bool BOP_node0_router0[MAX_ROUTERS]= false;

bool syncnode0router0flit[MAX_ROUTERS] = false;
bool synceastrouter0flit [MAX_ROUTERS]= false;
bool syncwestrouter0flit [MAX_ROUTERS]= false;
bool syncnorthrouter0flit[MAX_ROUTERS] = false;
bool syncsouthrouter0flit[MAX_ROUTERS] = false;

bool write_buff_node0_full [MAX_ROUTERS] = true;
bool write_buff_node0_empty[MAX_ROUTERS]  = true;

bool packet_send [MAX_ROUTERS] = false;
bool packet_received_at[MAX_ROUTERS]  = false;

bool packet_received_from[MAX_ROUTERS]  = false;
bool packet_track[MAX_ROUTERS]  = false;

#define NODE_0 0
#define NODE_1 1
#define NODE_2 2
#define NODE_3 3
#define NODE_4 4
#define NODE_5 5
#define NODE_6 6
#define NODE_7 7
#define NODE_8 8
#define NODE_INVALID 9

byte node_node0_track[MAX_ROUTERS] = 0;
byte node_north_track[MAX_ROUTERS] = 0;
byte node_south_track[MAX_ROUTERS] = 0;
byte node_east_track[MAX_ROUTERS] = 0;
byte node_west_track[MAX_ROUTERS] = 0;

bool read_buff_node0_full[MAX_ROUTERS] = false;

byte v_write_node0[MAX_ROUTERS]  = 0;
byte v_write_node0_r[MAX_ROUTERS] = 0;
byte v_write_node0_w[MAX_ROUTERS]  = 0;

byte v_read_node0[MAX_ROUTERS] = 0;
byte fifo0readarray0[MAX_BUFF_SIZE] = 0;
byte fifo0readarray1[MAX_BUFF_SIZE] = 0;
byte fifo0readarray2[MAX_BUFF_SIZE] = 0;
byte fifo0readarray3[MAX_BUFF_SIZE] = 0;
byte fifo0readarray4[MAX_BUFF_SIZE] = 0;
byte fifo0readarray5[MAX_BUFF_SIZE] = 0;
byte fifo0readarray6[MAX_BUFF_SIZE] = 0;
byte fifo0readarray7[MAX_BUFF_SIZE] = 0;
byte fifo0readarray8[MAX_BUFF_SIZE] = 0;

byte v_tx_node0_router0_list[MAX_ROUTERS] = 0;
typedef arraylist { 
	byte list0array[MAX_BUFF_SIZE] = 0
};
arraylist inputlist[MAX_ROUTERS];
byte tmplist0count[MAX_ROUTERS] = 0;

byte v_rx_east_router0_list[MAX_ROUTERS] = 0;
byte tmpeastrouter0listcount[MAX_ROUTERS] = 0;
typedef eastarraylist { 
            byte eastrouter0listarray[MAX_BUFF_SIZE] = 0;
};
eastarraylist eastinputlist[MAX_ROUTERS];

byte v_rx_west_router0_list[MAX_ROUTERS] = 0;
byte tmpwestrouter0listcount[MAX_ROUTERS] = 0;
typedef westarraylist { 
	byte westrouter0listarray[MAX_BUFF_SIZE] = 0;
};
westarraylist westinputlist[MAX_ROUTERS];

byte v_rx_north_router0_list[MAX_ROUTERS]= 0;
byte tmpnorthrouter0listcount[MAX_ROUTERS] = 0;
typedef northarraylist { 
              byte northrouter0listarray[MAX_BUFF_SIZE] = 0;
};
northarraylist northinputlist[MAX_ROUTERS];

byte v_rx_south_router0_list[MAX_ROUTERS] = 0;
byte tmpsouthrouter0listcount[MAX_ROUTERS] = 0;
typedef southarraylist { 
                  byte southrouter0listarray[MAX_BUFF_SIZE] = 0;
};
southarraylist southinputlist[MAX_ROUTERS];

byte dest_addr_node0_router0_x[MAX_ROUTERS] = 0; 
byte dest_addr_node0_router0_y[MAX_ROUTERS] = 0; 
byte NOF_node0_router0[MAX_ROUTERS]= 0;
byte payload_node0_router0[MAX_ROUTERS] = 0;

byte dest_addr_east_router0_x[MAX_ROUTERS] = 0; 
byte dest_addr_east_router0_y[MAX_ROUTERS] = 0; 
byte NOF_east_router0[MAX_ROUTERS] = 0;
byte payload_east_router0[MAX_ROUTERS] = 0;

byte dest_addr_west_router0_x[MAX_ROUTERS] = 0; 
byte dest_addr_west_router0_y[MAX_ROUTERS] = 0; 
byte NOF_west_router0[MAX_ROUTERS] = 0;
byte payload_west_router0[MAX_ROUTERS] = 0;

byte dest_addr_north_router0_x[MAX_ROUTERS] = 0; 
byte dest_addr_north_router0_y[MAX_ROUTERS] = 0; 
byte NOF_north_router0[MAX_ROUTERS] = 0;
byte payload_north_router0[MAX_ROUTERS] = 0;

byte dest_addr_south_router0_x[MAX_ROUTERS] = 0; 
byte dest_addr_south_router0_y[MAX_ROUTERS] = 0; 
byte NOF_south_router0[MAX_ROUTERS] = 0;
byte payload_south_router0[MAX_ROUTERS] = 0;

byte tmpnofnode0northrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnode0southrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnode0eastrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnode0westrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnode0node0router0count[MAX_ROUTERS] = 0;

byte tmpnofeastnorthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofeastsouthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofeasteastrouter0count[MAX_ROUTERS] = 0;
byte tmpnofeastwestrouter0count[MAX_ROUTERS] = 0;
byte tmpnofeastnode0router0count[MAX_ROUTERS] = 0;

byte tmpnofwestnorthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofwestsouthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofwesteastrouter0count[MAX_ROUTERS] = 0;
byte tmpnofwestwestrouter0count[MAX_ROUTERS] = 0;
byte tmpnofwestnode0router0count[MAX_ROUTERS] = 0;

byte tmpnofnorthnorthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnorthsouthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnortheastrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnorthwestrouter0count[MAX_ROUTERS] = 0;
byte tmpnofnorthnode0router0count[MAX_ROUTERS] = 0;

byte tmpnofsouthnorthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofsouthsouthrouter0count[MAX_ROUTERS] = 0;
byte tmpnofsoutheastrouter0count[MAX_ROUTERS] = 0;
byte tmpnofsouthwestrouter0count[MAX_ROUTERS] = 0;
byte tmpnofsouthnode0router0count[MAX_ROUTERS] = 0;

byte router0_addr_x[MAX_ROUTERS] = 0; 
byte router0_addr_y[MAX_ROUTERS] = 0; 

byte writeindex[MAX_ROUTERS]  =0;

byte write_buff_node0_store_datar[MAX_ROUTERS] = 0;

bool packetnode0router0ready[MAX_ROUTERS] = false;
bool packeteastrouter0ready[MAX_ROUTERS] = false;
bool packetwestrouter0ready[MAX_ROUTERS] = false;
bool packetnorthrouter0ready[MAX_ROUTERS] = false;
bool packetsouthrouter0ready[MAX_ROUTERS] = false;

bool node0buff_ready[MAX_ROUTERS] = true;
bool eastbuff_ready[MAX_ROUTERS] = true;
bool westbuff_ready[MAX_ROUTERS] = true;
bool northbuff_ready[MAX_ROUTERS] = true;
bool southbuff_ready[MAX_ROUTERS] = true;

bool stall_east[MAX_ROUTERS] = true;
bool stall_west[MAX_ROUTERS] = true;
bool stall_north[MAX_ROUTERS] = true;
bool stall_south[MAX_ROUTERS] = true;

bool busy_east_router0[MAX_ROUTERS] = false;
bool busy_west_router0[MAX_ROUTERS] = false;
bool busy_north_router0[MAX_ROUTERS] = false;
bool busy_south_router0[MAX_ROUTERS] = false;
bool busy_node0_router0[MAX_ROUTERS] = false;

#define EAST_PRI 0
#define WEST_PRI 1
#define NORTH_PRI 2
#define SOUTH_PRI 3
#define NODE0_PRI 4

byte rrtoken_east[MAX_ROUTERS] ;
byte rrtoken_west[MAX_ROUTERS] ;
byte rrtoken_north[MAX_ROUTERS] ;
byte rrtoken_south[MAX_ROUTERS] ;
byte rrtoken_node0[MAX_ROUTERS] ;

/************************router0 specifications **********************************/

proctype node0_write_NI(byte n)
       {
node0_write_NI_state0:
                      do
	         :: packet_send[n] == true->
	                     if
		    :: packet_received_at [n] == true  -> atomic{
                                                       /*packet_send[n] = false;  packet_received_at[n] = false; packet_track[n] = false;*/ 
                                              printf("received at node %u",n);         
                                              goto node0_write_NI_state0;
                                             }
                                     fi;
                         :: packet_send[n] == false -> goto node0_write_NI_state1;
                     od;                                      
 
node0_write_NI_state1:
             if
                    :: (n ==0) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false)  ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] =true; } goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] =true;  } goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] =true;  } goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false)  ->  syncnode0dataw[n] = false;  write_buff_node0_dataw[n]  = 00; writeindex [n]++; syncnode0dataw[n] =true; } goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false;  write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true;  packet_track[n] = true; syncnode0dataw[n] =true; } goto node0_write_NI_state2;
                         fi;  

                   :: (n ==1) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 10; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] =true; } goto node0_write_NI_state2; 
                         fi;  

                      :: (n ==2) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 20; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] =true; } goto node0_write_NI_state2; 
                         fi;   

                      :: (n ==3) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 01; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] = true; } goto node0_write_NI_state2; 
                         fi;   

                      :: (n ==4) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 11; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] = true; } goto node0_write_NI_state2; 
                         fi;   

                      :: (n ==5) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 21; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] = true; } goto node0_write_NI_state2; 
                         fi;   

                      :: (n ==6) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 02; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] = true; } goto node0_write_NI_state2; 
                         fi;   

                      :: (n ==7) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 12; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] = true; } goto node0_write_NI_state2; 
                         fi;   

                      :: (n ==8) -> 
                         if
                           :: d_step{(writeindex[n]  ==0 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true; }goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==1 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 1; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==2 &&  syncnode0dataw[n] ==false) ->  syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 2; writeindex[n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2; 
                           :: d_step{(writeindex[n]  ==3 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 22; writeindex [n]++; syncnode0dataw[n] = true;} goto node0_write_NI_state2;
                           :: d_step{(writeindex[n]  ==4 &&  syncnode0dataw[n] ==false) -> syncnode0dataw[n] = false; write_buff_node0_dataw[n]  = 44; writeindex[n]  = 0; packet_send[n] = true; packet_track[n] = true; syncnode0dataw[n] = true; } goto node0_write_NI_state2; 
                         fi;   
                fi;

node0_write_NI_state2:
      if
        :: atomic {goto node0_write_NI_state0;}
     fi;
       }


/*****************************Node input interface list of router 0**************************/

proctype node0_tx_router0_input_interface_list_write(byte p)
       {
node0_tx_router0_input_interface_list_write_state0:
          if
             :: v_tx_node0_router0_list[p] == MAX_BUFF_SIZE ->  goto node0_tx_router0_input_interface_list_write_state0;
             :: v_tx_node0_router0_list[p] <MAX_BUFF_SIZE -> goto node0_tx_router0_input_interface_list_write_state1;      
       fi;

node0_tx_router0_input_interface_list_write_state1:
                     if
                          :: d_step{syncnode0dataw[p] == true  -> inputlist[p].list0array[v_tx_node0_router0_list[p]] = write_buff_node0_dataw[p]; v_tx_node0_router0_list[p]++; syncnode0dataw[p] =false} goto node0_tx_router0_input_interface_list_write_state0;                                         
                    fi;                                      
 
}


proctype node0_tx_router0_input_interface_list_read(byte q)
       {
node0_tx_router0_input_interface_list_read_state0:
          if
              :: v_tx_node0_router0_list[q] == 0 ->  goto node0_tx_router0_input_interface_list_read_state0;
              :: v_tx_node0_router0_list[q] == MAX_BUFF_SIZE -> goto node0_tx_router0_input_interface_list_read_state1;      
       fi;

node0_tx_router0_input_interface_list_read_state1:
             if
                 ::d_step{packetnode0router0ready[q] == false ->dest_addr_node0_router0_x[q]  = inputlist[q].list0array[0];  dest_addr_node0_router0_y[q]  = inputlist[q].list0array[1];  packetnode0router0ready[q] = true; }   goto node0_tx_router0_input_interface_list_read_state2; 
            fi;

node0_tx_router0_input_interface_list_read_state2:
             if
                 ::d_step{syncnode0router0flit[q] == false -> NOF_node0_router0[q]  = inputlist[q].list0array[2]; syncnode0router0flit[q] = true; } goto node0_tx_router0_input_interface_list_read_state3;
            fi;

node0_tx_router0_input_interface_list_read_state3:
           do
	:: tmplist0count[q]  != NOF_node0_router0 [q] ->
		if
		    :: d_step{syncnode0router0flit[q] == false ->  payload_node0_router0[q]  = inputlist[q].list0array[tmplist0count[q] +3]; syncnode0router0flit[q] = true;  tmplist0count[q] ++; }
                                     fi;
	:: else -> d_step{tmplist0count[q]  = 0; v_tx_node0_router0_list[q]  = 0;} goto node0_tx_router0_input_interface_list_read_state0;
           od;
}

/*****************************Router 0 Node switch**************************/

proctype node0_router0_switch(byte s)
       {
node0_router0_switch_state:
          if
             :: packetnode0router0ready[s] == true-> atomic{
        if
            :: (router0_addr_x[s] == 0 && router0_addr_y[s] == 0) -> node_node0_track[s] = NODE_0; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 1 && router0_addr_y[s] == 0) -> node_node0_track[s] = NODE_1; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 2 && router0_addr_y[s] == 0) -> node_node0_track[s] = NODE_2; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 0 && router0_addr_y[s] == 1) -> node_node0_track[s] = NODE_3; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 1 && router0_addr_y[s] == 1) -> node_node0_track[s] = NODE_4; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 2 && router0_addr_y[s] == 1) -> node_node0_track[s] = NODE_5; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 0 && router0_addr_y[s] == 2) -> node_node0_track[s] = NODE_6; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 1 && router0_addr_y[s] == 2) -> node_node0_track[s] = NODE_7; goto node0_router0_switch_state0;
            :: (router0_addr_x[s] == 2 && router0_addr_y[s] == 2) -> node_node0_track[s] = NODE_8; goto node0_router0_switch_state0;
            :: else -> node_node0_track[s]= NODE_INVALID; goto node0_router0_switch_state0;
       fi;}
       fi;

node0_router0_switch_state0:
                 if
                    ::  dest_addr_node0_router0_x[s] >  router0_addr_x[s] ->   goto node0_router0_switch_state1; /* go to east output */
                    ::  dest_addr_node0_router0_x[s] <  router0_addr_x[s] ->   goto node0_router0_switch_state6; /* go to west output */
                    ::  dest_addr_node0_router0_x[s] ==  router0_addr_x[s] -> 
                        if
                            :: dest_addr_node0_router0_y[s]  < router0_addr_y[s]  -> goto node0_router0_switch_state16;    /*go to south output */
                            :: dest_addr_node0_router0_y[s]  > router0_addr_y[s]  -> goto node0_router0_switch_state21;     /* go to north output*/
                            :: dest_addr_node0_router0_y[s]  ==  router0_addr_y[s]  -> goto node0_router0_switch_state11; /* go to current node */
                        fi;
               fi;

node0_router0_switch_state1:
          if
             :: d_step{ack_sche_node0_east_router0[s] == false -> req_sche_node0_east_router0[s] = true; }goto node0_router0_switch_state1_inter;
       fi;

node0_router0_switch_state1_inter:
          if
             :: d_step{(BOF_east_router0[s] == false && ack_sche_node0_east_router0[s] == true) -> BOP_east_router0[s] = true;  tx_data_east_router0[s] = dest_addr_node0_router0_x[s] ; BOF_east_router0[s] = true;} goto node0_router0_switch_state2;
       fi;

node0_router0_switch_state2:
          if
             :: d_step{(BOF_east_router0[s] == false) -> tx_data_east_router0[s] = dest_addr_node0_router0_y[s] ; packetnode0router0ready[s] = false;  BOF_east_router0[s] = true; } goto node0_router0_switch_state3;
       fi;

node0_router0_switch_state3:
          if
             :: d_step{ (syncnode0router0flit[s] ==true &&  BOF_east_router0[s] == false) -> tx_data_east_router0[s] = NOF_node0_router0[s] ; syncnode0router0flit[s] = false; BOF_east_router0[s] = true; } goto node0_router0_switch_state4;
       fi;

node0_router0_switch_state4:
           do
	:: tmpnofnode0eastrouter0count[s] != NOF_node0_router0[s]  ->
		if
		    :: d_step{( syncnode0router0flit[s]  == true &&  BOF_east_router0[s] == false) ->   tx_data_east_router0[s] = payload_node0_router0[s] ; syncnode0router0flit[s] = false; BOF_east_router0[s]= true; tmpnofnode0eastrouter0count[s]++;}
                                     fi;
	::  else  -> goto node0_router0_switch_state5;
           od;

node0_router0_switch_state5:
              tmpnofnode0eastrouter0count[s]  = 0;  req_sche_node0_east_router0[s] = false; BOP_east_router0[s] = false; goto node0_router0_switch_state;

node0_router0_switch_state6:
          if
             :: d_step{ack_sche_node0_west_router0[s] == false  ->  req_sche_node0_west_router0[s] = true;} goto node0_router0_switch_state6_inter;
       fi;

node0_router0_switch_state6_inter:
          if
             :: d_step{BOF_west_router0[s] == false && ack_sche_node0_west_router0[s] == true-> BOP_west_router0[s] = true; tx_data_west_router0[s]  = dest_addr_node0_router0_x[s] ; BOF_west_router0[s] = true;} goto node0_router0_switch_state7;
       fi;

node0_router0_switch_state7:
          if
             :: d_step{BOF_west_router0[s] == false -> tx_data_west_router0[s]  = dest_addr_node0_router0_y[s] ;  packetnode0router0ready[s] = false; BOF_west_router0[s] = true;} goto node0_router0_switch_state8;
       fi;

node0_router0_switch_state8:
          if
             :: d_step{(syncnode0router0flit[s] == true &&  BOF_west_router0[s] == false) -> tx_data_west_router0[s]  = NOF_node0_router0[s]; syncnode0router0flit[s] = false;  BOF_west_router0[s] = true;}  goto node0_router0_switch_state9;
       fi;

node0_router0_switch_state9:
           do
	:: tmpnofnode0westrouter0count[s]  != NOF_node0_router0[s]  ->
		if
		    :: d_step{(syncnode0router0flit[s] == true &&  BOF_west_router0[s] == false) -> tx_data_west_router0[s]  = payload_node0_router0[s] ; syncnode0router0flit[s] = false;  BOF_west_router0[s] = true;  tmpnofnode0westrouter0count[s] ++;}
                                     fi;
	:: else -> goto node0_router0_switch_state10;
           od;

node0_router0_switch_state10:
              tmpnofnode0westrouter0count[s]  = 0; req_sche_node0_west_router0[s] = false; BOP_west_router0[s] = false ; goto node0_router0_switch_state;

node0_router0_switch_state11:
          if
             :: d_step{ack_sche_node0_node0_router0[s] == false  ->  req_sche_node0_node0_router0[s] = true; } goto node0_router0_switch_state11_inter;
       fi;

node0_router0_switch_state11_inter:
          if
             :: d_step{(BOF_node0_router0[s] == false && ack_sche_node0_node0_router0[s] == true)-> BOP_node0_router0[s] = true ; tx_data_node0_router0[s] = dest_addr_node0_router0_x[s] ; BOF_node0_router0[s]= true; } goto node0_router0_switch_state12;
       fi;

node0_router0_switch_state12:
          if
             :: d_step{(BOF_node0_router0[s] == false)-> tx_data_node0_router0[s] = dest_addr_node0_router0_y[s] ; packetnode0router0ready[s] = false; BOF_node0_router0[s]= true; } goto node0_router0_switch_state13;
       fi;

node0_router0_switch_state13:
          if
             ::  d_step{(syncnode0router0flit[s] == true && BOF_node0_router0[s] == false)-> tx_data_node0_router0[s] = NOF_node0_router0[s] ; syncnode0router0flit[s] = false;  BOF_node0_router0[s] = true; } goto node0_router0_switch_state14;
       fi;

node0_router0_switch_state14:
           do
             :: tmpnofnode0node0router0count[s] != NOF_node0_router0[s] ->
		if
		    :: d_step{(syncnode0router0flit [s] == true && BOF_node0_router0[s] == false) ->  tx_data_node0_router0[s] = payload_node0_router0[s] ; syncnode0router0flit[s] = false;  BOF_node0_router0[s]= true;  tmpnofnode0node0router0count[s]++;}
                                     fi;
             :: else -> goto node0_router0_switch_state15;
           od;

node0_router0_switch_state15:
              tmpnofnode0node0router0count[s] = 0; req_sche_node0_node0_router0[s] = false; BOP_node0_router0[s] = false ; goto node0_router0_switch_state;

node0_router0_switch_state16:
          if
             :: d_step{ack_sche_node0_south_router0[s] == false -> req_sche_node0_south_router0[s] = true; }goto node0_router0_switch_state16_inter;
       fi;

node0_router0_switch_state16_inter:
          if
             :: d_step{(BOF_south_router0[s] == false && ack_sche_node0_south_router0[s] == true) -> BOP_south_router0[s] = true ; tx_data_south_router0[s] = dest_addr_node0_router0_x[s] ; BOF_south_router0[s] = true; } goto node0_router0_switch_state17;
       fi;

node0_router0_switch_state17:
          if
             :: d_step{(BOF_south_router0[s] == false) -> tx_data_south_router0[s] = dest_addr_node0_router0_y[s] ; packetnode0router0ready[s] = false;  BOF_south_router0[s] = true; } goto node0_router0_switch_state18;
       fi;

node0_router0_switch_state18:
          if
             :: d_step{ (syncnode0router0flit[s] ==true &&  BOF_south_router0[s] == false) -> tx_data_south_router0[s] = NOF_node0_router0[s] ; syncnode0router0flit[s] = false; BOF_south_router0[s] = true; } goto node0_router0_switch_state19;
       fi;

node0_router0_switch_state19:
           do
	:: tmpnofnode0southrouter0count[s] != NOF_node0_router0[s]  ->
		if
		    :: d_step{( syncnode0router0flit[s]  == true &&  BOF_south_router0[s] == false) ->   tx_data_south_router0[s] = payload_node0_router0[s] ; syncnode0router0flit[s] = false; BOF_south_router0[s]= true; tmpnofnode0southrouter0count[s]++;}
                                     fi;
	:: else -> goto node0_router0_switch_state20;
           od;

node0_router0_switch_state20:
              tmpnofnode0southrouter0count[s]  = 0;  req_sche_node0_south_router0[s] = false; BOP_south_router0[s] = false; goto node0_router0_switch_state;

node0_router0_switch_state21:
          if
             :: d_step{ack_sche_node0_north_router0[s] == false -> req_sche_node0_north_router0[s] = true; }goto node0_router0_switch_state21_inter;
       fi;

node0_router0_switch_state21_inter:
          if
             :: d_step{(BOF_north_router0[s] == false && ack_sche_node0_north_router0[s] == true) -> BOP_north_router0[s] = true; tx_data_north_router0[s] = dest_addr_node0_router0_x[s] ; BOF_north_router0[s] = true; } goto node0_router0_switch_state22;
       fi;

node0_router0_switch_state22:
          if
             :: d_step{(BOF_north_router0[s] == false) -> tx_data_north_router0[s] = dest_addr_node0_router0_y[s] ; packetnode0router0ready[s] = false;  BOF_north_router0[s] = true; } goto node0_router0_switch_state23;
       fi;

node0_router0_switch_state23:
          if
             :: d_step{ (syncnode0router0flit[s] ==true &&  BOF_north_router0[s] == false) -> tx_data_north_router0[s] = NOF_node0_router0[s] ; syncnode0router0flit[s] = false; BOF_north_router0[s] = true; } goto node0_router0_switch_state24;
       fi;

node0_router0_switch_state24:
           do
	:: tmpnofnode0northrouter0count[s] != NOF_node0_router0[s]  ->
		if
		    :: d_step{( syncnode0router0flit[s]  == true &&  BOF_north_router0[s] == false) ->   tx_data_north_router0[s] = payload_node0_router0[s] ; syncnode0router0flit[s] = false; BOF_north_router0[s]= true; tmpnofnode0northrouter0count[s]++;}
                                     fi;
	:: else -> goto node0_router0_switch_state25;
           od;

node0_router0_switch_state25:
             tmpnofnode0northrouter0count[s]  = 0; req_sche_node0_north_router0[s] = false; BOP_north_router0[s] = false; goto node0_router0_switch_state;

}

/*****************************Router 0 West switch**************************/
proctype west_router0_switch(byte d)
       {

west_router0_switch_state:
      if
             :: packetwestrouter0ready[d] == true -> atomic{
        if
            :: (router0_addr_x[d] == 0 && router0_addr_y[d] == 0) -> node_west_track[d] = NODE_0; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 1 && router0_addr_y[d] == 0) -> node_west_track[d] = NODE_1; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 2 && router0_addr_y[d] == 0) -> node_west_track[d] = NODE_2; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 0 && router0_addr_y[d] == 1) -> node_west_track[d] = NODE_3; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 1 && router0_addr_y[d] == 1) -> node_west_track[d] = NODE_4; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 2 && router0_addr_y[d] == 1) -> node_west_track[d] = NODE_5; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 0 && router0_addr_y[d] == 2) -> node_west_track[d] = NODE_6; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 1 && router0_addr_y[d] == 2) -> node_west_track[d] = NODE_7; goto west_router0_switch_state0;
            :: (router0_addr_x[d] == 2 && router0_addr_y[d] == 2) -> node_west_track[d] = NODE_8; goto west_router0_switch_state0;
            :: else -> node_west_track[d]= NODE_INVALID; goto west_router0_switch_state0;
       fi;}
  fi;

west_router0_switch_state0:
                 if
                    ::  dest_addr_west_router0_x[d] >  router0_addr_x[d] ->   goto west_router0_switch_state21; /* go to east output */
                    ::  dest_addr_west_router0_x[d] <  router0_addr_x[d] ->   goto west_router0_switch_state16; /* go to west output */
                    ::  dest_addr_west_router0_x[d] ==  router0_addr_x[d] -> 
                        if
                            :: dest_addr_west_router0_y[d]  < router0_addr_y[d]  -> goto west_router0_switch_state6;    /*go to south output */
                            :: dest_addr_west_router0_y[d]  > router0_addr_y[d]  -> goto west_router0_switch_state1;     /* go to north output*/
                            :: dest_addr_west_router0_y[d]  ==  router0_addr_y[d]  -> goto west_router0_switch_state11; /* go to current node */
                        fi;
               fi;

west_router0_switch_state1:
          if
             :: d_step{ack_sche_west_north_router0[d] == false  ->  req_sche_west_north_router0[d] = true; } goto west_router0_switch_state1_inter;
       fi;

west_router0_switch_state1_inter:
          if
             :: d_step{(BOF_north_router0[d] == false && ack_sche_west_north_router0[d] == true)-> BOP_north_router0[d] = true; tx_data_north_router0[d] = dest_addr_west_router0_x[d]; BOF_north_router0[d] = true;} goto west_router0_switch_state2;
       fi;

west_router0_switch_state2:
          if
             :: d_step{(BOF_north_router0[d] == false)-> tx_data_north_router0[d] = dest_addr_west_router0_y[d]; packetwestrouter0ready[d] = false;  BOF_north_router0[d] = true;} goto west_router0_switch_state3;
       fi;

west_router0_switch_state3:
          if
             :: d_step{( syncwestrouter0flit[d]== true && BOF_north_router0[d] == false) -> tx_data_north_router0[d] = NOF_west_router0[d]; syncwestrouter0flit[d]= false; BOF_north_router0[d] = true;} goto west_router0_switch_state4;
       fi;

west_router0_switch_state4:
           do
	:: tmpnofwestnorthrouter0count[d] != NOF_west_router0[d] ->
		if
		    :: d_step{( syncwestrouter0flit[d]== true && BOF_north_router0[d] == false) -> tx_data_north_router0[d] = payload_west_router0[d]; syncwestrouter0flit[d]= false;  BOF_north_router0[d] = true; tmpnofwestnorthrouter0count[d]++;}
                                     fi;
	:: else -> goto west_router0_switch_state5;
           od;

west_router0_switch_state5:
              tmpnofwestnorthrouter0count[d]  = 0;  req_sche_west_north_router0[d] = false; BOP_north_router0[d] = false ; goto west_router0_switch_state;

west_router0_switch_state6:
          if
             :: d_step{ack_sche_west_south_router0[d] == false  ->  req_sche_west_south_router0[d] = true; }goto west_router0_switch_state6_inter;
       fi;

west_router0_switch_state6_inter:
          if
             :: d_step{( BOF_south_router0[d] == false && ack_sche_west_south_router0[d] == true) -> BOP_south_router0[d] = true ; tx_data_south_router0[d] = dest_addr_west_router0_x[d]; BOF_south_router0[d]= true;} goto west_router0_switch_state7;
       fi;

west_router0_switch_state7:
          if
             :: d_step{( BOF_south_router0[d] == false) -> tx_data_south_router0[d] = dest_addr_west_router0_y[d]; packetwestrouter0ready[d] = false;  BOF_south_router0[d]= true;} goto west_router0_switch_state8;
       fi;

west_router0_switch_state8:
          if
             :: d_step{( syncwestrouter0flit[d] == true && BOF_south_router0[d] == false) -> tx_data_south_router0[d] = NOF_west_router0[d]; syncwestrouter0flit[d] = false; BOF_south_router0[d]= true; } goto west_router0_switch_state9;
       fi;

west_router0_switch_state9:
           do
	:: tmpnofwestsouthrouter0count[d] != NOF_west_router0[d] ->
		if
		    :: d_step{(syncwestrouter0flit[d] == true && BOF_south_router0[d] == false) -> tx_data_south_router0[d] = payload_west_router0[d]; syncwestrouter0flit[d] = false;  BOF_south_router0[d] = true; tmpnofwestsouthrouter0count[d]++;}
                                     fi;
	:: else -> goto west_router0_switch_state10;
           od;

west_router0_switch_state10:
            tmpnofwestsouthrouter0count [d] = 0; req_sche_west_south_router0[d] = false; BOP_south_router0[d] = false; goto west_router0_switch_state;

west_router0_switch_state11:
          if
             :: d_step{ack_sche_west_node0_router0[d] == false  -> req_sche_west_node0_router0[d] = true;} goto west_router0_switch_state11_inter;
       fi;

west_router0_switch_state11_inter:
          if
             :: d_step{(BOF_node0_router0[d] == false && ack_sche_west_node0_router0[d] == true )-> BOP_node0_router0[d] = true;  tx_data_node0_router0[d] = dest_addr_west_router0_x[d]; BOF_node0_router0[d]= true; } goto west_router0_switch_state12;
       fi;

west_router0_switch_state12:
          if
             :: d_step{(BOF_node0_router0[d] == false)->  tx_data_node0_router0[d] = dest_addr_west_router0_y[d]; packetwestrouter0ready[d] = false; BOF_node0_router0[d]= true; } goto west_router0_switch_state13;
       fi;

west_router0_switch_state13:
          if
             ::  d_step{(syncwestrouter0flit[d]== true && BOF_node0_router0[d] == false) ->  tx_data_node0_router0[d] = NOF_west_router0[d]; syncwestrouter0flit[d]= false; BOF_node0_router0[d] = true; } goto west_router0_switch_state14;
       fi;

west_router0_switch_state14:
           do
	:: tmpnofwestnode0router0count [d]!= NOF_west_router0[d] ->
		if
		    :: d_step{(syncwestrouter0flit[d] == true && BOF_node0_router0[d] == false)-> tx_data_node0_router0[d] = payload_west_router0[d]; syncwestrouter0flit[d] = false; BOF_node0_router0[d]= true; tmpnofwestnode0router0count[d]++;}
                                     fi;
	:: else -> goto west_router0_switch_state15;
           od;

west_router0_switch_state15:
              tmpnofwestnode0router0count[d]  = 0; req_sche_west_node0_router0[d] = false; BOP_node0_router0[d] = false; goto west_router0_switch_state;

west_router0_switch_state16:
          if
             :: d_step{ack_sche_west_west_router0[d] == false  ->  req_sche_west_west_router0[d] = true; } goto west_router0_switch_state16_inter;
       fi;

west_router0_switch_state16_inter:
          if
             :: d_step{(BOF_west_router0[d] == false && ack_sche_west_west_router0[d] == true)-> BOP_west_router0[d] = true ; tx_data_west_router0[d] = dest_addr_west_router0_x[d]; BOF_west_router0[d] = true;} goto west_router0_switch_state17;
       fi;

west_router0_switch_state17:
          if
             :: d_step{(BOF_west_router0[d] == false)-> tx_data_west_router0[d] = dest_addr_west_router0_y[d]; packetwestrouter0ready[d] = false;  BOF_west_router0[d] = true;} goto west_router0_switch_state18;
       fi;

west_router0_switch_state18:
          if
             :: d_step{( syncwestrouter0flit[d]== true && BOF_west_router0[d] == false) -> tx_data_west_router0[d] = NOF_west_router0[d]; syncwestrouter0flit[d]= false; BOF_west_router0[d] = true;} goto west_router0_switch_state19;
       fi;

west_router0_switch_state19:
           do
	:: tmpnofwestwestrouter0count[d] != NOF_west_router0[d] ->
		if
		    :: d_step{( syncwestrouter0flit[d]== true && BOF_west_router0[d] == false) -> tx_data_west_router0[d] = payload_west_router0[d]; syncwestrouter0flit[d]= false;  BOF_west_router0[d] = true; tmpnofwestwestrouter0count[d]++;}
                                     fi;
	:: else -> goto west_router0_switch_state20;
           od;

west_router0_switch_state20:
             tmpnofwestwestrouter0count[d]  = 0;  req_sche_west_west_router0[d] = false; BOP_west_router0[d] = false ; goto west_router0_switch_state;

west_router0_switch_state21:
          if
             :: d_step{ack_sche_west_east_router0[d] == false  ->  req_sche_west_east_router0[d] = true; } goto west_router0_switch_state21_inter;
       fi;

west_router0_switch_state21_inter:
          if
             :: d_step{(BOF_east_router0[d] == false && ack_sche_west_east_router0[d] == true)-> BOP_east_router0[d] = true; tx_data_east_router0[d] = dest_addr_west_router0_x[d]; BOF_east_router0[d] = true;} goto west_router0_switch_state22;
       fi;

west_router0_switch_state22:
          if
             :: d_step{(BOF_east_router0[d] == false)-> tx_data_east_router0[d] = dest_addr_west_router0_y[d]; packetwestrouter0ready[d] = false;  BOF_east_router0[d] = true;} goto west_router0_switch_state23;
       fi;

west_router0_switch_state23:
          if
             :: d_step{( syncwestrouter0flit[d]== true && BOF_east_router0[d] == false) -> tx_data_east_router0[d] = NOF_west_router0[d]; syncwestrouter0flit[d]= false; BOF_east_router0[d] = true;} goto west_router0_switch_state24;
       fi;

west_router0_switch_state24:
           do
	:: tmpnofwesteastrouter0count[d] != NOF_west_router0[d] ->
		if
		    :: d_step{( syncwestrouter0flit[d]== true && BOF_east_router0[d] == false) -> tx_data_east_router0[d] = payload_west_router0[d]; syncwestrouter0flit[d]= false;  BOF_east_router0[d] = true; tmpnofwesteastrouter0count[d]++;}
                                     fi;
	:: else -> goto west_router0_switch_state25;
           od;

west_router0_switch_state25:
            tmpnofwesteastrouter0count[d]  = 0; req_sche_west_east_router0[d] = false; BOP_east_router0[d] = false; goto west_router0_switch_state;

}

/*****************************Router 0 East switch**************************/
proctype east_router0_switch(byte e)
       {
east_router0_switch_state:
          if
             :: packeteastrouter0ready[e] == true -> atomic{
        if
            :: (router0_addr_x[e] == 0 && router0_addr_y[e] == 0) -> node_east_track[e] = NODE_0; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 1 && router0_addr_y[e] == 0) -> node_east_track[e] = NODE_1; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 2 && router0_addr_y[e] == 0) -> node_east_track[e] = NODE_2; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 0 && router0_addr_y[e] == 1) -> node_east_track[e] = NODE_3; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 1 && router0_addr_y[e] == 1) -> node_east_track[e] = NODE_4; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 2 && router0_addr_y[e] == 1) -> node_east_track[e] = NODE_5; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 0 && router0_addr_y[e] == 2) -> node_east_track[e] = NODE_6; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 1 && router0_addr_y[e] == 2) -> node_east_track[e] = NODE_7; goto east_router0_switch_state0;
            :: (router0_addr_x[e] == 2 && router0_addr_y[e] == 2) -> node_east_track[e] = NODE_8; goto east_router0_switch_state0;
            :: else -> node_east_track[e]= NODE_INVALID; goto east_router0_switch_state0;
       fi;}
      fi;

east_router0_switch_state0:
                 if
                    ::  dest_addr_east_router0_x[e] >  router0_addr_x[e] ->   goto east_router0_switch_state21; /* go to east output */
                    ::  dest_addr_east_router0_x[e] <  router0_addr_x[e] ->   goto east_router0_switch_state16; /* go to west output */
                    ::  dest_addr_east_router0_x[e] ==  router0_addr_x[e] -> 
                        if
                            :: dest_addr_east_router0_y[e]  < router0_addr_y[e]  -> goto east_router0_switch_state6;    /*go to south output */
                            :: dest_addr_east_router0_y[e]  > router0_addr_y[e]  -> goto east_router0_switch_state1;     /* go to north output*/
                            :: dest_addr_east_router0_y[e]  ==  router0_addr_y[e]  -> goto east_router0_switch_state11; /* go to current node */
                        fi;
               fi;

east_router0_switch_state1:
          if
             :: d_step{ack_sche_east_north_router0[e] == false  -> req_sche_east_north_router0[e]  = true;} goto east_router0_switch_state1_inter;
       fi;

east_router0_switch_state1_inter:
          if
             :: d_step{(BOF_north_router0[e] == false && ack_sche_east_north_router0[e] == true) -> BOP_north_router0[e] = true; tx_data_north_router0[e] = dest_addr_east_router0_x[e]; BOF_north_router0[e] = true;} goto east_router0_switch_state2;
       fi;

east_router0_switch_state2:
          if
             :: d_step{(BOF_north_router0[e] == false) -> tx_data_north_router0[e] = dest_addr_east_router0_y[e];  packeteastrouter0ready[e] = false; BOF_north_router0[e] = true;} goto east_router0_switch_state3;
       fi;

east_router0_switch_state3:
          if
             :: d_step{(synceastrouter0flit[e] == true && BOF_north_router0[e] == false) -> tx_data_north_router0[e] = NOF_east_router0[e]; synceastrouter0flit[e] = false; BOF_north_router0[e] = true;} goto east_router0_switch_state4;
       fi;

east_router0_switch_state4:
           do
	:: tmpnofeastnorthrouter0count[e] != NOF_east_router0[e] ->
		if
		    :: d_step{(synceastrouter0flit[e] == true && BOF_north_router0[e] == false) -> tx_data_north_router0[e] = payload_east_router0[e]; synceastrouter0flit[e] = false; BOF_north_router0[e] = true; tmpnofeastnorthrouter0count[e]++;}
                                     fi;
	:: else ->goto east_router0_switch_state5;
           od;

east_router0_switch_state5:
             tmpnofeastnorthrouter0count[e]  = 0;  req_sche_east_north_router0[e] = false; BOP_north_router0[e] = false ; goto east_router0_switch_state;

east_router0_switch_state6:
          if
             :: d_step{ack_sche_east_south_router0[e] == false ->  req_sche_east_south_router0[e] = true; } goto east_router0_switch_state6_inter;
       fi;

east_router0_switch_state6_inter:
          if
             :: d_step{(BOF_south_router0[e] == false && ack_sche_east_south_router0[e] == true) -> BOP_south_router0[e] = true;  tx_data_south_router0[e] = dest_addr_east_router0_x[e]; BOF_south_router0[e] = true; } goto east_router0_switch_state7;
       fi;

east_router0_switch_state7:
          if
             :: d_step{(BOF_south_router0[e] == false) -> tx_data_south_router0[e] = dest_addr_east_router0_y[e]; packeteastrouter0ready[e] = false; BOF_south_router0[e] = true; } goto east_router0_switch_state8;
       fi;

east_router0_switch_state8:
          if
             :: d_step{( synceastrouter0flit[e] == true && BOF_south_router0[e] == false) -> tx_data_south_router0[e] = NOF_east_router0[e];synceastrouter0flit[e] = false; BOF_south_router0[e] = true;} goto east_router0_switch_state9;
       fi;

east_router0_switch_state9:
           do
	:: tmpnofeastsouthrouter0count[e] != NOF_east_router0[e] ->
		if
		    :: d_step{(synceastrouter0flit [e]== true && BOF_south_router0[e] == false) -> tx_data_south_router0[e] = payload_east_router0[e]; synceastrouter0flit[e] = false; BOF_south_router0[e] = true; tmpnofeastsouthrouter0count[e]++;}
                                     fi;
	:: else -> goto east_router0_switch_state10;
           od;

east_router0_switch_state10:
              tmpnofeastsouthrouter0count[e]  = 0; req_sche_east_south_router0[e] = false; BOP_south_router0[e] = false; goto east_router0_switch_state;

east_router0_switch_state11:
          if
             :: d_step{ack_sche_east_node0_router0[e] == false  -> req_sche_east_node0_router0[e]= true; } goto east_router0_switch_state11_inter;
       fi;

east_router0_switch_state11_inter:
          if
             :: d_step{(BOF_node0_router0[e] == false && ack_sche_east_node0_router0[e] == true) -> BOP_node0_router0[e] = true; tx_data_node0_router0[e] = dest_addr_east_router0_x[e]; BOF_node0_router0[e] = true;} goto east_router0_switch_state12;
       fi;

east_router0_switch_state12:
          if
             :: d_step{(BOF_node0_router0[e] == false) -> tx_data_node0_router0[e] = dest_addr_east_router0_y[e]; packeteastrouter0ready[e] = false; BOF_node0_router0[e] = true;} goto east_router0_switch_state13;
       fi;

east_router0_switch_state13:
          if
             :: d_step{ (synceastrouter0flit[e] == true && BOF_node0_router0[e] == false) ->  tx_data_node0_router0[e] = NOF_east_router0[e]; synceastrouter0flit[e] = false; BOF_node0_router0[e] = true;} goto east_router0_switch_state14;
       fi;

east_router0_switch_state14:
           do
	:: tmpnofeastnode0router0count [e]!= NOF_east_router0[e] ->
		if
		    :: d_step{(synceastrouter0flit [e] == true && BOF_node0_router0[e] == false) -> tx_data_node0_router0[e] = payload_east_router0[e]; synceastrouter0flit[e] = false; BOF_node0_router0[e] = true; tmpnofeastnode0router0count[e]++;}
                                     fi;
	:: else -> goto east_router0_switch_state15;
           od;

east_router0_switch_state15:
              tmpnofeastnode0router0count[e] = 0; req_sche_east_node0_router0[e] = false; BOP_node0_router0[e] = false; goto east_router0_switch_state;

east_router0_switch_state16:
          if
             :: d_step{ack_sche_east_west_router0[e] == false  -> req_sche_east_west_router0[e]  = true;} goto east_router0_switch_state16_inter;
       fi;

east_router0_switch_state16_inter:
          if
             :: d_step{(BOF_west_router0[e] == false && ack_sche_east_west_router0[e] == true) -> BOP_west_router0[e] = true; tx_data_west_router0[e] = dest_addr_east_router0_x[e]; BOF_west_router0[e] = true;} goto east_router0_switch_state17;
       fi;

east_router0_switch_state17:
          if
             :: d_step{(BOF_west_router0[e] == false) -> tx_data_west_router0[e] = dest_addr_east_router0_y[e];  packeteastrouter0ready[e] = false; BOF_west_router0[e] = true;} goto east_router0_switch_state18;
       fi;

east_router0_switch_state18:
          if
             :: d_step{(synceastrouter0flit[e] == true && BOF_west_router0[e] == false) -> tx_data_west_router0[e] = NOF_east_router0[e]; synceastrouter0flit[e] = false; BOF_west_router0[e] = true;} goto east_router0_switch_state19;
       fi;

east_router0_switch_state19:
           do
	:: tmpnofeastwestrouter0count[e] != NOF_east_router0[e] ->
		if
		    :: d_step{(synceastrouter0flit[e] == true && BOF_west_router0[e] == false) -> tx_data_west_router0[e] = payload_east_router0[e]; synceastrouter0flit[e] = false; BOF_west_router0[e] = true; tmpnofeastwestrouter0count[e]++;}
                                     fi;
	:: else ->goto east_router0_switch_state20;
           od;

east_router0_switch_state20:
             tmpnofeastwestrouter0count[e]  = 0;  req_sche_east_west_router0[e] = false; BOP_west_router0[e] = false ; goto east_router0_switch_state;

east_router0_switch_state21:
          if
             :: d_step{ack_sche_east_east_router0[e] == false  -> req_sche_east_east_router0[e]  = true;} goto east_router0_switch_state21_inter;
       fi;

east_router0_switch_state21_inter:
          if
             :: d_step{(BOF_east_router0[e] == false && ack_sche_east_east_router0[e] == true) -> BOP_east_router0[e] = true; tx_data_east_router0[e] = dest_addr_east_router0_x[e]; BOF_east_router0[e] = true;} goto east_router0_switch_state22;
       fi;

east_router0_switch_state22:
          if
             :: d_step{(BOF_east_router0[e] == false) -> tx_data_east_router0[e] = dest_addr_east_router0_y[e];  packeteastrouter0ready[e] = false; BOF_east_router0[e] = true;} goto east_router0_switch_state23;
       fi;

east_router0_switch_state23:
          if
             :: d_step{(synceastrouter0flit[e] == true && BOF_east_router0[e] == false) -> tx_data_east_router0[e] = NOF_east_router0[e]; synceastrouter0flit[e] = false; BOF_east_router0[e] = true;} goto east_router0_switch_state24;
       fi;

east_router0_switch_state24:
           do
	:: tmpnofeasteastrouter0count[e] != NOF_east_router0[e] ->
		if
		    :: d_step{(synceastrouter0flit[e] == true && BOF_east_router0[e] == false) -> tx_data_east_router0[e] = payload_east_router0[e]; synceastrouter0flit[e] = false; BOF_east_router0[e] = true; tmpnofeasteastrouter0count[e]++;}
                                     fi;
	:: else -> goto east_router0_switch_state25;
           od;

east_router0_switch_state25:
            tmpnofeasteastrouter0count[e]  = 0; req_sche_east_east_router0[e] = false; BOP_east_router0[e] = false ; goto east_router0_switch_state;

}

/*****************************Router 0 North switch**************************/
proctype north_router0_switch(byte f)
       {
north_router0_switch_state:
          if
             :: packetnorthrouter0ready[f] == true -> atomic{
        if
            :: (router0_addr_x[f] == 0 && router0_addr_y[f] == 0) -> node_north_track[f] = NODE_0; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 1 && router0_addr_y[f] == 0) -> node_north_track[f] = NODE_1; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 2 && router0_addr_y[f] == 0) -> node_north_track[f] = NODE_2; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 0 && router0_addr_y[f] == 1) -> node_north_track[f] = NODE_3; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 1 && router0_addr_y[f] == 1) -> node_north_track[f] = NODE_4; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 2 && router0_addr_y[f] == 1) -> node_north_track[f] = NODE_5; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 0 && router0_addr_y[f] == 2) -> node_north_track[f] = NODE_6; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 1 && router0_addr_y[f] == 2) -> node_north_track[f] = NODE_7; goto north_router0_switch_state0;
            :: (router0_addr_x[f] == 2 && router0_addr_y[f] == 2) -> node_north_track[f] = NODE_8; goto north_router0_switch_state0;
            :: else -> node_north_track[f]= NODE_INVALID; goto north_router0_switch_state0;
       fi;}
      fi;

north_router0_switch_state0:
                 if
                    ::  dest_addr_north_router0_x[f] >  router0_addr_x[f] ->   goto north_router0_switch_state1; /* go to east output */
                    ::  dest_addr_north_router0_x[f] <  router0_addr_x[f] ->   goto north_router0_switch_state6; /* go to west output */
                    ::  dest_addr_north_router0_x[f] ==  router0_addr_x[f] -> 
                        if
                            :: dest_addr_north_router0_y[f]  < router0_addr_y[f]  -> goto north_router0_switch_state16;    /*go to south output */
                            :: dest_addr_north_router0_y[f]  > router0_addr_y[f]  -> goto north_router0_switch_state21;     /* go to north output*/
                            :: dest_addr_north_router0_y[f]  ==  router0_addr_y[f]  -> goto north_router0_switch_state11; /* go to current node */
                        fi;
               fi;

north_router0_switch_state1:
          if
             :: d_step{ack_sche_north_east_router0[f] == false ->  req_sche_north_east_router0[f] = true; } goto north_router0_switch_state1_inter;
       fi;

north_router0_switch_state1_inter:
          if
             :: d_step{(BOF_east_router0[f] == false && ack_sche_north_east_router0[f] == true)-> BOP_east_router0[f] = true;  tx_data_east_router0[f] = dest_addr_north_router0_x[f]; BOF_east_router0[f] = true; } goto north_router0_switch_state2;
       fi;

north_router0_switch_state2:
          if
             :: d_step{(BOF_east_router0[f] == false)-> tx_data_east_router0[f] = dest_addr_north_router0_y[f]; packetnorthrouter0ready[f] = false;  BOF_east_router0[f] = true; } goto north_router0_switch_state3;
       fi;

north_router0_switch_state3:
          if
             :: d_step{(syncnorthrouter0flit[f] == true && BOF_east_router0[f] == false) -> tx_data_east_router0[f] = NOF_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_east_router0[f] = true;} goto north_router0_switch_state4;
       fi;

north_router0_switch_state4:
           do
	:: tmpnofnortheastrouter0count[f] != NOF_north_router0[f] ->
		if
		    :: d_step{(syncnorthrouter0flit[f] == true && BOF_east_router0[f] == false) -> tx_data_east_router0[f] = payload_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_east_router0[f] = true; tmpnofnortheastrouter0count[f]++;}
                                     fi;
	:: else -> goto north_router0_switch_state5;
           od;

north_router0_switch_state5:
             tmpnofnortheastrouter0count [f] = 0; req_sche_north_east_router0[f] = false; BOP_east_router0[f] = false; goto north_router0_switch_state;

north_router0_switch_state6:
          if
             :: d_step{ack_sche_north_west_router0[f] == false  ->  req_sche_north_west_router0[f] = true;} goto north_router0_switch_state6_inter;
       fi;

north_router0_switch_state6_inter:
          if
             :: d_step{(BOF_west_router0[f] == false && ack_sche_north_west_router0[f] == true) -> BOP_west_router0[f] = true; tx_data_west_router0[f] = dest_addr_north_router0_x[f]; BOF_west_router0[f] = true; } goto north_router0_switch_state7;
       fi;

north_router0_switch_state7:
          if
             :: d_step{(BOF_west_router0[f] == false) -> tx_data_west_router0[f] = dest_addr_north_router0_y[f]; packetnorthrouter0ready[f] = false; BOF_west_router0[f] = true; } goto north_router0_switch_state8;
       fi;

north_router0_switch_state8:
          if
             :: d_step{(syncnorthrouter0flit [f] == true && BOF_west_router0[f] == false) -> tx_data_west_router0[f] = NOF_north_router0[f]; syncnorthrouter0flit [f] = false; BOF_west_router0[f] = true; } goto north_router0_switch_state9;
       fi;

north_router0_switch_state9:
           do
	:: tmpnofnorthwestrouter0count[f] != NOF_north_router0[f] ->
		if
		    :: d_step{ (syncnorthrouter0flit[f] == true && BOF_west_router0[f] == false) ->  tx_data_west_router0[f] = payload_north_router0[f]; syncnorthrouter0flit [f] = false;  BOF_west_router0[f] = true; tmpnofnorthwestrouter0count[f]++;}
                                     fi;
	:: else -> goto north_router0_switch_state10;
           od;

north_router0_switch_state10:
              tmpnofnorthwestrouter0count[f]  = 0; req_sche_north_west_router0[f] = false; BOP_west_router0[f] = false ; goto north_router0_switch_state;

north_router0_switch_state11:
          if
             :: d_step{ack_sche_north_node0_router0[f] == false  -> req_sche_north_node0_router0[f] = true; } goto north_router0_switch_state11_inter;
       fi;

north_router0_switch_state11_inter:
          if
             :: d_step{(BOF_node0_router0[f] == false && ack_sche_north_node0_router0[f] == true) -> BOP_node0_router0[f] = true; tx_data_node0_router0[f] = dest_addr_north_router0_x[f]; BOF_node0_router0[f] = true;} goto north_router0_switch_state12;
       fi;

north_router0_switch_state12:
          if
             :: d_step{(BOF_node0_router0[f] == false) -> tx_data_node0_router0[f] = dest_addr_north_router0_y[f]; packetnorthrouter0ready[f] = false;  BOF_node0_router0[f] = true;} goto north_router0_switch_state13;
       fi;

north_router0_switch_state13:
          if
             :: d_step{( syncnorthrouter0flit[f] == true && BOF_node0_router0[f] == false) -> tx_data_node0_router0[f] = NOF_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_node0_router0[f] = true; } goto north_router0_switch_state14;
       fi;

north_router0_switch_state14:
           do
	:: tmpnofnorthnode0router0count[f] != NOF_north_router0[f] ->
		if
		    :: d_step{(syncnorthrouter0flit [f] == true && BOF_node0_router0[f] == false) -> tx_data_node0_router0[f] = payload_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_node0_router0[f] = true; tmpnofnorthnode0router0count[f]++;}
                                     fi;
	:: else ->goto north_router0_switch_state15;
           od;

north_router0_switch_state15:
             tmpnofnorthnode0router0count[f]  = 0; req_sche_north_node0_router0[f] = false; BOP_node0_router0[f] = false; goto north_router0_switch_state;

north_router0_switch_state16:
          if
             :: d_step{ack_sche_north_south_router0[f] == false ->  req_sche_north_south_router0[f] = true; } goto north_router0_switch_state16_inter;
       fi;

north_router0_switch_state16_inter:
          if
             :: d_step{(BOF_south_router0[f] == false && ack_sche_north_south_router0[f] == true)-> BOP_south_router0[f] = true; tx_data_south_router0[f] = dest_addr_north_router0_x[f]; BOF_south_router0[f] = true; } goto north_router0_switch_state17;
       fi;

north_router0_switch_state17:
          if
             :: d_step{(BOF_south_router0[f] == false)-> tx_data_south_router0[f] = dest_addr_north_router0_y[f]; packetnorthrouter0ready[f] = false;  BOF_south_router0[f] = true; } goto north_router0_switch_state18;
       fi;

north_router0_switch_state18:
          if
             :: d_step{(syncnorthrouter0flit[f] == true && BOF_south_router0[f] == false) -> tx_data_south_router0[f] = NOF_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_south_router0[f] = true;} goto north_router0_switch_state19;
       fi;

north_router0_switch_state19:
           do
	:: tmpnofnorthsouthrouter0count[f] != NOF_north_router0[f] ->
		if
		    :: d_step{(syncnorthrouter0flit[f] == true && BOF_south_router0[f] == false) -> tx_data_south_router0[f] = payload_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_south_router0[f] = true; tmpnofnorthsouthrouter0count[f]++;}
                                     fi;
	:: else -> goto north_router0_switch_state20;
           od;

north_router0_switch_state20:
             tmpnofnorthsouthrouter0count [f] = 0;  req_sche_north_south_router0[f] = false; BOP_south_router0[f] = false; goto north_router0_switch_state;

north_router0_switch_state21:
          if
             :: d_step{ack_sche_north_north_router0[f] == false ->  req_sche_north_north_router0[f] = true; } goto north_router0_switch_state21_inter;
       fi;

north_router0_switch_state21_inter:
          if
             :: d_step{(BOF_north_router0[f] == false && ack_sche_north_north_router0[f] == true)-> BOP_north_router0[f] = true; tx_data_north_router0[f] = dest_addr_north_router0_x[f]; BOF_north_router0[f] = true; } goto north_router0_switch_state21_inter;
       fi;

north_router0_switch_state22:
          if
             :: d_step{(BOF_north_router0[f] == false)-> tx_data_north_router0[f] = dest_addr_north_router0_y[f]; packetnorthrouter0ready[f] = false;  BOF_north_router0[f] = true; } goto north_router0_switch_state23;
       fi;

north_router0_switch_state23:
          if
             :: d_step{(syncnorthrouter0flit[f] == true && BOF_north_router0[f] == false) -> tx_data_north_router0[f] = NOF_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_north_router0[f] = true;} goto north_router0_switch_state24;
       fi;

north_router0_switch_state24:
           do
	:: tmpnofnorthnorthrouter0count[f] != NOF_north_router0[f] ->
		if
		    :: d_step{(syncnorthrouter0flit[f] == true && BOF_north_router0[f] == false) -> tx_data_north_router0[f] = payload_north_router0[f]; syncnorthrouter0flit[f] = false; BOF_east_router0[f] = true; tmpnofnorthnorthrouter0count[f]++;}
                                     fi;
	:: else -> goto north_router0_switch_state25;
           od;

north_router0_switch_state25:
              tmpnofnorthnorthrouter0count[f] = 0;  req_sche_north_north_router0[f] = false; BOP_north_router0[f] = false; goto north_router0_switch_state;

}


/*****************************Router 0 South switch**************************/
proctype south_router0_switch(byte g)
       {
south_router0_switch_state:
          if
             :: packetsouthrouter0ready[g] == true-> atomic{
        if
            :: (router0_addr_x[g] == 0 && router0_addr_y[g] == 0) -> node_south_track[g] = NODE_0; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 1 && router0_addr_y[g] == 0) -> node_south_track[g] = NODE_1; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 2 && router0_addr_y[g] == 0) -> node_south_track[g] = NODE_2; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 0 && router0_addr_y[g] == 1) -> node_south_track[g] = NODE_3; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 1 && router0_addr_y[g] == 1) -> node_south_track[g] = NODE_4; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 2 && router0_addr_y[g] == 1) -> node_south_track[g] = NODE_5; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 0 && router0_addr_y[g] == 2) -> node_south_track[g] = NODE_6; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 1 && router0_addr_y[g] == 2) -> node_south_track[g] = NODE_7; goto south_router0_switch_state0;
            :: (router0_addr_x[g] == 2 && router0_addr_y[g] == 2) -> node_south_track[g] = NODE_8; goto south_router0_switch_state0;
            :: else -> node_south_track[g]= NODE_INVALID; goto south_router0_switch_state0;
       fi;}
      fi;

south_router0_switch_state0:
                 if
                    ::  dest_addr_south_router0_x[g] >  router0_addr_x[g] ->   goto south_router0_switch_state1; /* go to east output */
                    ::  dest_addr_south_router0_x[g] <  router0_addr_x[g] ->   goto south_router0_switch_state6; /* go to west output */
                    ::  dest_addr_south_router0_x[g] ==  router0_addr_x[g] -> 
                        if
                            :: dest_addr_south_router0_y[g]  < router0_addr_y[g]  -> goto south_router0_switch_state16;    /*go to south output */
                            :: dest_addr_south_router0_y[g]  > router0_addr_y[g]  -> goto south_router0_switch_state21;     /* go to north output*/
                            :: dest_addr_south_router0_y[g]  ==  router0_addr_y[g]  -> goto south_router0_switch_state11; /* go to current node */
                        fi;
               fi;


south_router0_switch_state1:
          if
             :: d_step{ack_sche_south_east_router0[g] == false  ->  req_sche_south_east_router0[g] = true; } goto south_router0_switch_state1_inter;
       fi;

south_router0_switch_state1_inter:
          if
             :: d_step{(BOF_east_router0[g] == false && ack_sche_south_east_router0[g]== true) -> BOP_east_router0[g] = true; tx_data_east_router0[g] = dest_addr_south_router0_x[g]; BOF_east_router0[g] = true; } goto south_router0_switch_state2;
       fi;

south_router0_switch_state2:
          if
             :: d_step{(BOF_east_router0[g] == false) -> tx_data_east_router0[g] = dest_addr_south_router0_y[g]; packetsouthrouter0ready[g] = false; BOF_east_router0[g] = true; } goto south_router0_switch_state3;
       fi;

south_router0_switch_state3:
          if
             :: d_step{( syncsouthrouter0flit[g] == true && BOF_east_router0[g] == false) -> tx_data_east_router0[g] = NOF_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_east_router0[g] = true; } goto south_router0_switch_state4;
       fi;

south_router0_switch_state4:
           do
	:: tmpnofsoutheastrouter0count[g] != NOF_south_router0[g] ->
		if
		    :: d_step{ (syncsouthrouter0flit[g] == true && BOF_east_router0[g] == false) -> tx_data_east_router0[g] = payload_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_east_router0[g] = true;  tmpnofsoutheastrouter0count[g]++;}
                                     fi;
	:: else -> goto south_router0_switch_state5;
           od;

south_router0_switch_state5:
             tmpnofsoutheastrouter0count[g] = 0;  req_sche_south_east_router0[g] = false; BOP_east_router0[g] = false; goto south_router0_switch_state;

south_router0_switch_state6:
          if
             :: d_step{ack_sche_south_west_router0[g] == false  -> req_sche_south_west_router0[g] = true;} goto south_router0_switch_state6_inter;
       fi;

south_router0_switch_state6_inter:
          if
             :: d_step{ (BOF_west_router0[g] == false && ack_sche_south_west_router0[g] == true)-> BOP_west_router0[g] = true; tx_data_west_router0[g] = dest_addr_south_router0_x[g]; BOF_west_router0[g] = true; } goto south_router0_switch_state7;
       fi;

south_router0_switch_state7:
          if
             :: d_step{ (BOF_west_router0[g] == false)-> tx_data_west_router0[g] = dest_addr_south_router0_y[g]; packetsouthrouter0ready[g] = false;   BOF_west_router0[g] = true; } goto south_router0_switch_state8;
       fi;

south_router0_switch_state8:
          if
             :: d_step{(syncsouthrouter0flit[g] == true && BOF_west_router0[g] == false) -> tx_data_west_router0[g] = NOF_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_west_router0[g] = true; } goto south_router0_switch_state9;
       fi;

south_router0_switch_state9:
           do
	:: tmpnofsouthwestrouter0count[g] != NOF_south_router0[g] ->
		if
		    :: d_step{ ( syncsouthrouter0flit[g] == true && BOF_west_router0[g] == false) -> tx_data_west_router0[g] = payload_south_router0[g]; syncsouthrouter0flit[g] = false;  BOF_west_router0[g] = true;  tmpnofsouthwestrouter0count[g]++;}
                                     fi;
	:: else -> goto south_router0_switch_state10;
           od;

south_router0_switch_state10:
              tmpnofsouthwestrouter0count[g]= 0; req_sche_south_west_router0[g] = false; BOP_west_router0[g] = false; goto south_router0_switch_state;

south_router0_switch_state11:
          if
             :: d_step{ack_sche_south_node0_router0[g] == false  -> req_sche_south_node0_router0[g] = true; } goto south_router0_switch_state11_inter;
       fi;

south_router0_switch_state11_inter:
          if
             :: d_step{(BOF_node0_router0[g] == false && ack_sche_south_node0_router0[g] == true)-> BOP_node0_router0[g] = true; tx_data_node0_router0[g] = dest_addr_south_router0_x[g];  BOF_node0_router0[g] = true; } goto south_router0_switch_state12;
       fi;

south_router0_switch_state12:
          if
             :: d_step{(BOF_node0_router0[g] == false)-> tx_data_node0_router0[g] = dest_addr_south_router0_y[g]; packetsouthrouter0ready[g] = false;  BOF_node0_router0[g] = true; } goto south_router0_switch_state13;
       fi;

south_router0_switch_state13:
          if
             :: d_step{(syncsouthrouter0flit[g] == true && BOF_node0_router0[g] == false) ->  tx_data_node0_router0[g] = NOF_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_node0_router0[g] = true; } goto south_router0_switch_state14;
       fi;

south_router0_switch_state14:
           do
	:: tmpnofsouthnode0router0count[g] != NOF_south_router0[g] ->
		if
		    :: d_step{(syncsouthrouter0flit[g] == true && BOF_node0_router0[g] == false) -> tx_data_node0_router0[g] = payload_south_router0[g]; syncsouthrouter0flit[g] = false;  BOF_node0_router0[g]= true; tmpnofsouthnode0router0count[g]++;}
                                     fi;
	:: else -> goto south_router0_switch_state15;
           od;

south_router0_switch_state15:
              tmpnofsouthnode0router0count[g]= 0; req_sche_south_node0_router0[g] = false; BOP_node0_router0[g] = false; goto south_router0_switch_state;

south_router0_switch_state16:
          if
             :: d_step{ack_sche_south_south_router0[g] == false  -> req_sche_south_south_router0[g] = true;} goto south_router0_switch_state16_inter;
       fi;

south_router0_switch_state16_inter:
          if
             :: d_step{ (BOF_south_router0[g] == false && ack_sche_south_south_router0[g] == true)-> BOP_south_router0[g] = true ;tx_data_south_router0[g] = dest_addr_south_router0_x[g]; BOF_south_router0[g] = true; } goto south_router0_switch_state17;
       fi;

south_router0_switch_state17:
          if
             :: d_step{ (BOF_south_router0[g] == false)-> tx_data_south_router0[g] = dest_addr_south_router0_y[g]; packetsouthrouter0ready[g] = false;   BOF_south_router0[g] = true; } goto south_router0_switch_state18;
       fi;

south_router0_switch_state18:
          if
             :: d_step{(syncsouthrouter0flit[g] == true && BOF_south_router0[g] == false) -> tx_data_south_router0[g] = NOF_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_south_router0[g] = true; } goto south_router0_switch_state19;
       fi;

south_router0_switch_state19:
           do
	:: tmpnofsouthsouthrouter0count[g] != NOF_south_router0[g] ->
		if
		    :: d_step{ ( syncsouthrouter0flit[g] == true && BOF_south_router0[g] == false) -> tx_data_south_router0[g] = payload_south_router0[g]; syncsouthrouter0flit[g] = false;  BOF_south_router0[g] = true;  tmpnofsouthsouthrouter0count[g]++;}
                                     fi;
	:: else -> goto south_router0_switch_state20;
           od;

south_router0_switch_state20:
             tmpnofsouthsouthrouter0count[g]= 0; req_sche_south_south_router0[g] = false; BOP_south_router0[g] = false; goto south_router0_switch_state;

south_router0_switch_state21:
          if
             :: d_step{ack_sche_south_north_router0[g]== false  ->  req_sche_south_north_router0[g] = true; } goto south_router0_switch_state21_inter;
       fi;

south_router0_switch_state21_inter:
          if
             :: d_step{(BOF_north_router0[g] == false && ack_sche_south_north_router0[g]== true) -> BOP_north_router0[g] = true; tx_data_north_router0[g] = dest_addr_south_router0_x[g]; BOF_north_router0[g] = true; } goto south_router0_switch_state22;
       fi;

south_router0_switch_state22:
          if
             :: d_step{(BOF_north_router0[g] == false) -> tx_data_north_router0[g] = dest_addr_south_router0_y[g]; packetsouthrouter0ready[g] = false; BOF_north_router0[g] = true; } goto south_router0_switch_state23;
       fi;

south_router0_switch_state23:
          if
             :: d_step{( syncsouthrouter0flit[g] == true && BOF_north_router0[g] == false) -> tx_data_north_router0[g] = NOF_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_north_router0[g] = true; } goto south_router0_switch_state24;
       fi;

south_router0_switch_state24:
           do
	:: tmpnofsouthnorthrouter0count[g] != NOF_south_router0[g] ->
		if
		    :: d_step{ (syncsouthrouter0flit[g] == true && BOF_north_router0[g] == false) -> tx_data_north_router0[g] = payload_south_router0[g]; syncsouthrouter0flit[g] = false; BOF_north_router0[g] = true;  tmpnofsouthnorthrouter0count[g]++;}
                                     fi;
	:: else -> goto south_router0_switch_state25;
           od;

south_router0_switch_state25:
             tmpnofsouthnorthrouter0count[g] = 0;  req_sche_south_north_router0[g] = false; BOP_north_router0[g] = false ; goto south_router0_switch_state;

}


/*****************************node0 output interface of router 0 for loopback**************************/

/*When begining of packet (BOP) is received the interface is set to busy until all the flits are transmitted. In the end busy is deasserted */

proctype node0_router0_output(byte t)
       {
node0_router0_output_state0:
          if
             ::d_step{BOP_node0_router0[t] == true-> busy_node0_router0[t] = true; }goto node0_router0_output_state1; 
       fi;

node0_router0_output_state1:
             if
                 ::d_step{BOF_node0_router0[t] == true->  data_read_node0_router0[t] = tx_data_node0_router0[t]; } send_read_node0_router0[t] = true; goto node0_router0_output_state2;
                 ::d_step{BOP_node0_router0[t] == false -> busy_node0_router0[t] = false; }goto node0_router0_output_state0; 
            fi;

node0_router0_output_state2:
          if
            ::ack_read_node0_router0[t] == true -> d_step{BOF_node0_router0[t] = false; ack_read_node0_router0[t] = false;} goto node0_router0_output_state1;
         fi;

}

proctype node0_router0_output_scheduling(byte nodesch)
       {
node0_router0_output_scheduling_state0:
          if
             :: rrtoken_node0[nodesch] == EAST_PRI && req_sche_east_node0_router0[nodesch] == true ->
                   if
                      :: busy_east_router0[nodesch] == false && stall_east[nodesch] == false ->  ack_sche_east_node0_router0[nodesch]= true; 
                             goto node0_router0_output_scheduling_state1;
                   fi;
             :: else -> rrtoken_node0[nodesch] = WEST_PRI; 
                             goto node0_router0_output_scheduling_state2;
           fi;

node0_router0_output_scheduling_state1:
         if
             :: d_step{rrtoken_node0[nodesch] == EAST_PRI && req_sche_east_node0_router0[nodesch] == false -> ack_sche_east_node0_router0[nodesch]= false; rrtoken_node0[nodesch] = WEST_PRI;}  goto node0_router0_output_scheduling_state2;
        fi;

node0_router0_output_scheduling_state2:
         if
             :: rrtoken_node0[nodesch] == WEST_PRI && req_sche_west_node0_router0[nodesch] == true -> 
                    if
                       :: busy_west_router0[nodesch] == false && stall_west[nodesch] == false ->  ack_sche_west_node0_router0[nodesch]= true; 
                             goto node0_router0_output_scheduling_state3;
                     fi;
             :: else -> rrtoken_node0[nodesch] = NORTH_PRI;
                             goto node0_router0_output_scheduling_state4;
      fi;

node0_router0_output_scheduling_state3:
       if
             :: d_step{rrtoken_node0[nodesch] == WEST_PRI && req_sche_west_node0_router0[nodesch] == false -> ack_sche_west_node0_router0[nodesch]= false; rrtoken_node0[nodesch] = NORTH_PRI;} goto node0_router0_output_scheduling_state4;
       fi;

node0_router0_output_scheduling_state4:
       if
             :: rrtoken_node0[nodesch] == NORTH_PRI && req_sche_north_node0_router0[nodesch] == true -> 
                   if
                      :: busy_north_router0[nodesch] == false && stall_north[nodesch] == false ->  ack_sche_north_node0_router0[nodesch]= true; 
                             goto node0_router0_output_scheduling_state5;
                    fi;
            :: else -> rrtoken_node0[nodesch] = SOUTH_PRI;
                             goto node0_router0_output_scheduling_state6;
        fi;

node0_router0_output_scheduling_state5:
       if
             :: d_step{rrtoken_node0[nodesch] == NORTH_PRI && req_sche_north_node0_router0[nodesch] == false -> ack_sche_north_node0_router0[nodesch]= false; rrtoken_node0[nodesch] = SOUTH_PRI;} goto node0_router0_output_scheduling_state6;
       fi;

node0_router0_output_scheduling_state6:
        if
             :: rrtoken_node0[nodesch] == SOUTH_PRI && req_sche_south_node0_router0[nodesch] == true ->
                    if
                       :: busy_south_router0[nodesch] == false && stall_south[nodesch] == false ->  ack_sche_south_node0_router0[nodesch]= true; 
                             goto node0_router0_output_scheduling_state7;
                    fi;
            :: else -> rrtoken_node0[nodesch] = NODE0_PRI;
                             goto node0_router0_output_scheduling_state8;
       fi;

node0_router0_output_scheduling_state7:
      if
             :: d_step{rrtoken_node0[nodesch] == SOUTH_PRI && req_sche_south_node0_router0[nodesch] == false -> ack_sche_south_node0_router0[nodesch]= false; rrtoken_node0[nodesch] = NODE0_PRI;}  goto node0_router0_output_scheduling_state8;
       fi;

node0_router0_output_scheduling_state8:
        if
             :: rrtoken_node0[nodesch] == NODE0_PRI && req_sche_node0_node0_router0[nodesch] == true ->
                   if
                      :: busy_node0_router0[nodesch] == false && node0buff_ready[nodesch] == true ->  ack_sche_node0_node0_router0[nodesch]= true; 
                             goto node0_router0_output_scheduling_state9;
                   fi;
            :: else -> rrtoken_node0[nodesch] = EAST_PRI;
                             goto node0_router0_output_scheduling_state0;
        fi;
node0_router0_output_scheduling_state9:
        if
             :: d_step{rrtoken_node0[nodesch] == NODE0_PRI && req_sche_node0_node0_router0[nodesch] == false -> ack_sche_node0_node0_router0[nodesch]= false; rrtoken_node0[nodesch] = EAST_PRI;} goto node0_router0_output_scheduling_state0;
       fi;
}



proctype node0_readfifo_NI(byte l)
       {
node0_readfifo_NI_state0:
          if
           :: (read_buff_node0_wen[l] == true && v_read_node0 [l] < 5)  -> read_buff_node0_full[l] = false; 
                            if 
                               :: (l ==0) -> fifo0readarray0[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;  goto node0_readfifo_NI_state0; 
                               :: (l ==1) -> fifo0readarray1[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false;   goto node0_readfifo_NI_state0; 
                               :: (l ==2) ->  fifo0readarray2[v_read_node0[l]] = read_buff_node0_dataw[l] ; v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                               :: (l ==3) ->  fifo0readarray3[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                               :: (l ==4) ->  fifo0readarray4[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                               :: (l ==5) ->  fifo0readarray5[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                               :: (l ==6) ->  fifo0readarray6[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                               :: (l ==7) ->  fifo0readarray7[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                               :: (l ==8) ->  fifo0readarray8[v_read_node0[l]] = read_buff_node0_dataw[l] ;  v_read_node0[l]++; read_buff_node0_wen[l] = false ;   goto node0_readfifo_NI_state0; 
                             fi;
                  
          ::v_read_node0[l] == 5 ->  read_buff_node0_full[l] = true; goto node0_readfifo_NI_state1; 

           fi;

node0_readfifo_NI_state1:
                   if
                      :: (l==0) -> packet_received_at[0] = true;
                                 if 
                                    :: d_step{(fifo0readarray0[3]  == 00) -> packet_received_from[0] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0;   read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 10) -> packet_received_from[1] = true;  v_read_node0[l] = 0; fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;   read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false; }goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] =0 ; fifo0readarray0[1] = 0;  fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray0[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray0[0] = 0 ; fifo0readarray0[1] = 0 ; fifo0readarray0[2] = 0 ; fifo0readarray0[3] = 0 ;  fifo0readarray0[4] = 0 ;  read_buff_node0_full[l] = false;} goto node0_readfifo_NI_state0;
                                 fi;

                      :: (l==1) -> packet_received_at[1] = true;
                                 if
                                    :: d_step{(fifo0readarray1[3]  == 00) ->   packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray1[0] = 0   ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray1[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray1[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray1[0] = 0 ; fifo0readarray1[1] = 0 ; fifo0readarray1[2] = 0 ; fifo0readarray1[3] = 0 ; fifo0readarray1[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==2) -> packet_received_at[2] = true;
                                 if
                                    :: d_step{(fifo0readarray2[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray2[0] = 0  ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray2[3]  == 10) ->  packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray2[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray2[0] = 0 ; fifo0readarray2[1] = 0 ; fifo0readarray2[2] = 0 ; fifo0readarray2[3] = 0 ; fifo0readarray2[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==3) -> packet_received_at[3] = true;
                                 if
                                    :: d_step{(fifo0readarray3[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray3[0] = 0  ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;   read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray3[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray3[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray3[0] = 0 ; fifo0readarray3[1] = 0 ; fifo0readarray3[2] = 0 ; fifo0readarray3[3] = 0 ; fifo0readarray3[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==4) -> packet_received_at[4] = true;
                                 if
                                    :: d_step{(fifo0readarray4[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;   read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray4[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray4[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray4[0] = 0 ; fifo0readarray4[1] = 0 ; fifo0readarray4[2] = 0 ; fifo0readarray4[3] = 0 ; fifo0readarray4[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==5) -> packet_received_at[5] = true;
                                 if
                                    :: d_step{(fifo0readarray5[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;   read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray5[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] =0  ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray5[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray5[0] = 0 ; fifo0readarray5[1] = 0 ; fifo0readarray5[2] = 0 ; fifo0readarray5[3] = 0 ; fifo0readarray5[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==6) -> packet_received_at[6] = true;
                                 if
                                    :: d_step{(fifo0readarray6[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;   read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray6[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray6[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray6[0] = 0 ; fifo0readarray6[1] = 0 ; fifo0readarray6[2] = 0 ; fifo0readarray6[3] = 0 ; fifo0readarray6[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==7) -> packet_received_at[7] = true;
                                 if
                                    :: d_step{(fifo0readarray7[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray7[0] = 0  ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;   read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray7[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray7[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray7[0] = 0 ; fifo0readarray7[1] = 0 ; fifo0readarray7[2] = 0 ; fifo0readarray7[3] = 0 ; fifo0readarray7[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;

                      :: (l==8) -> packet_received_at[8] = true;
                                 if
                                    :: d_step{(fifo0readarray8[3]  == 00) ->  packet_received_from[0] = true; v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;   read_buff_node0_full[l] = false; }  goto node0_readfifo_NI_state0;
                                    :: d_step{(fifo0readarray8[3]  == 10) ->   packet_received_from[1] = true; v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false;  } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 20) -> packet_received_from[2] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 01) -> packet_received_from[3] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 11) -> packet_received_from[4] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 21) -> packet_received_from[5] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 02) -> packet_received_from[6] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 12) -> packet_received_from[7] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                   :: d_step{(fifo0readarray8[3]  == 22) -> packet_received_from[8] = true;  v_read_node0[l] = 0;  fifo0readarray8[0] = 0 ; fifo0readarray8[1] = 0 ; fifo0readarray8[2] = 0 ; fifo0readarray8[3] = 0 ; fifo0readarray8[4] = 0 ;  read_buff_node0_full[l] = false; } goto node0_readfifo_NI_state0;
                                fi;
                 fi;
}

proctype node0_rx_router0_output_interface(byte m)
       {
node0_rx_router0_output_interface_state0:
          if
            :: read_buff_node0_full[m]== false -> node0buff_ready[m]= true; goto node0_rx_router0_output_interface_state1;
            :: read_buff_node0_full[m] == true -> node0buff_ready[m] = false; goto node0_rx_router0_output_interface_state0;
         fi;

node0_rx_router0_output_interface_state1:
                 if
                    :: d_step{ send_read_node0_router0[m] == true && read_buff_node0_full[m]== false -> read_buff_node0_dataw[m] = data_read_node0_router0[m]; read_buff_node0_wen[m] = true; } goto node0_rx_router0_output_interface_state2; 
         fi;

node0_rx_router0_output_interface_state2:
                 if
                    :: d_step{ read_buff_node0_wen[m] == false ->  ack_read_node0_router0[m] = true ; send_read_node0_router0[m] = false; } goto node0_rx_router0_output_interface_state0; 

                fi;
       }

/*****************************east output interface of router 0**************************/
proctype east_router0_output(byte a)
       {
east_router0_output_state0:
          if
             :: d_step{BOP_east_router0[a] == true->  busy_east_router0[a] = true; } goto east_router0_output_state1; 
       fi;

east_router0_output_state1:
           if
                :: d_step{BOF_east_router0[a] == true  ->  data_tx_east_router0[a] = tx_data_east_router0[a];}  send_tx_east_router0[a] = true ; goto east_router0_output_state2;
                :: d_step{BOP_east_router0[a] == false->  busy_east_router0[a] = false; } goto east_router0_output_state0; 
            fi;

east_router0_output_state2:
          if
            :: ack_tx_east_router0[a] == true  ->  d_step{BOF_east_router0[a] = false; ack_tx_east_router0[a] = false; } goto east_router0_output_state1;
         fi;

}

proctype east_router0_output_scheduling( byte eastsch)
       {
east_router0_output_scheduling_state0:
          if
             :: rrtoken_east[eastsch] == EAST_PRI && req_sche_east_east_router0[eastsch] == true ->
                  if
                      :: busy_east_router0[eastsch] == false && stall_east[eastsch] == false ->  ack_sche_east_east_router0[eastsch]= true; 
                           goto east_router0_output_scheduling_state1; 
                   fi;
             :: else -> rrtoken_east[eastsch] = WEST_PRI;
                           goto east_router0_output_scheduling_state2; 
          fi;

east_router0_output_scheduling_state1:
         if
             :: d_step{rrtoken_east[eastsch] == EAST_PRI && req_sche_east_east_router0[eastsch] == false -> ack_sche_east_east_router0[eastsch]= false; rrtoken_east[eastsch] = WEST_PRI;} goto east_router0_output_scheduling_state2; 
         fi;

east_router0_output_scheduling_state2:
         if
             :: rrtoken_east[eastsch] == WEST_PRI && req_sche_west_east_router0[eastsch] == true ->
                    if
                       :: busy_west_router0[eastsch] == false && stall_west[eastsch] == false ->  ack_sche_west_east_router0[eastsch]= true; 
                           goto east_router0_output_scheduling_state3; 
                   fi;
             :: else -> rrtoken_east[eastsch] = NORTH_PRI;
                           goto east_router0_output_scheduling_state4; 
          fi;

east_router0_output_scheduling_state3:
         if
             :: d_step{rrtoken_east[eastsch] == WEST_PRI && req_sche_west_east_router0[eastsch] == false -> ack_sche_west_east_router0[eastsch]= false; rrtoken_east[eastsch] = NORTH_PRI;}  goto east_router0_output_scheduling_state4;
           fi;
            
east_router0_output_scheduling_state4:
           if
             :: rrtoken_east[eastsch] == NORTH_PRI && req_sche_north_east_router0[eastsch] == true ->
                  if
                    :: busy_north_router0[eastsch] == false && stall_north[eastsch] == false ->  ack_sche_north_east_router0[eastsch]= true; 
                           goto east_router0_output_scheduling_state5; 
                  fi;
              :: else -> rrtoken_east[eastsch] = SOUTH_PRI;
                           goto east_router0_output_scheduling_state6; 
            fi;

east_router0_output_scheduling_state5:
           if
             :: d_step{rrtoken_east[eastsch] == NORTH_PRI && req_sche_north_east_router0[eastsch] == false -> ack_sche_north_east_router0[eastsch]= false; rrtoken_east[eastsch] = SOUTH_PRI; }  goto east_router0_output_scheduling_state6;
           fi;

east_router0_output_scheduling_state6:
          if
             :: rrtoken_east[eastsch] == SOUTH_PRI && req_sche_south_east_router0[eastsch] == true ->
                  if
                    :: busy_south_router0[eastsch] == false && stall_south[eastsch] == false ->  ack_sche_south_east_router0[eastsch]= true; 
                           goto east_router0_output_scheduling_state7; 
                 fi;
              :: else -> rrtoken_east[eastsch] = NODE0_PRI;
                           goto east_router0_output_scheduling_state8; 
           fi;
east_router0_output_scheduling_state7:
          if
             :: d_step{rrtoken_east[eastsch] == SOUTH_PRI && req_sche_south_east_router0[eastsch] == false -> ack_sche_south_east_router0[eastsch]= false; rrtoken_east[eastsch] = NODE0_PRI; }  goto east_router0_output_scheduling_state8;
          fi;

east_router0_output_scheduling_state8:
          if
             :: rrtoken_east[eastsch] == NODE0_PRI && req_sche_node0_east_router0[eastsch] == true ->
                  if
                    :: busy_node0_router0[eastsch] == false && node0buff_ready[eastsch] == true ->  ack_sche_node0_east_router0[eastsch]= true; 
                           goto east_router0_output_scheduling_state9; 
                 fi;
             :: else -> rrtoken_east[eastsch] = EAST_PRI;
                           goto east_router0_output_scheduling_state0; 
          fi;

east_router0_output_scheduling_state9:
        if
             :: d_step{rrtoken_east[eastsch] == NODE0_PRI && req_sche_node0_east_router0[eastsch] == false -> ack_sche_node0_east_router0[eastsch]= false; rrtoken_east[eastsch] = EAST_PRI; }  goto east_router0_output_scheduling_state0;
       fi;
}

/*****************************west output interface of router 0**************************/
proctype west_router0_output(byte h)
       {
west_router0_output_state0:
          if
                ::d_step{ BOP_west_router0[h] == true->  busy_west_router0[h] = true; } goto west_router0_output_state1; 
       fi;

west_router0_output_state1:
             if
                ::d_step{BOF_west_router0[h] == true  ->  data_tx_west_router0[h] = tx_data_west_router0[h]; } send_tx_west_router0[h] = true; goto west_router0_output_state2;
                ::d_step{ BOP_west_router0[h] == false ->  busy_west_router0[h] = false; } goto west_router0_output_state0; 
            fi;

west_router0_output_state2:
          if
            ::ack_tx_west_router0[h] == true  ->   d_step{BOF_west_router0[h] = false; ack_tx_west_router0[h] = false; } goto west_router0_output_state1;
         fi;

}

proctype west_router0_output_scheduling(byte westsch)
       {
west_router0_output_scheduling_state0:
          if
             :: rrtoken_west[westsch] == EAST_PRI && req_sche_east_west_router0[westsch] == true -> 
                  if
                     :: busy_east_router0[westsch] == false && stall_east[westsch] == false ->  ack_sche_east_west_router0[westsch]= true; 
                              goto west_router0_output_scheduling_state1;
                   fi;
             :: else -> rrtoken_west[westsch] = WEST_PRI;
                              goto west_router0_output_scheduling_state2;
          fi;

west_router0_output_scheduling_state1:
         if
             :: d_step{rrtoken_west[westsch] == EAST_PRI && req_sche_east_west_router0[westsch] == false ->  ack_sche_east_west_router0[westsch]= false;  rrtoken_west[westsch] = WEST_PRI; } goto west_router0_output_scheduling_state2;
         fi;

west_router0_output_scheduling_state2:
        if
             :: rrtoken_west[westsch] == WEST_PRI && req_sche_west_west_router0[westsch] == true -> 
                  if
                    :: busy_west_router0[westsch] == false && stall_west[westsch] == false ->  ack_sche_west_west_router0[westsch]= true; 
                              goto west_router0_output_scheduling_state3;
                  fi; 
             :: else -> rrtoken_west[westsch] = NORTH_PRI; 
                              goto west_router0_output_scheduling_state4;
        fi;

west_router0_output_scheduling_state3:
       if
             :: d_step{rrtoken_west[westsch] == WEST_PRI && req_sche_west_west_router0[westsch] == false ->  ack_sche_west_west_router0[westsch]= false;  rrtoken_west[westsch] = NORTH_PRI; }  goto west_router0_output_scheduling_state4;
       fi;

west_router0_output_scheduling_state4:
       if
             :: rrtoken_west[westsch] == NORTH_PRI && req_sche_north_west_router0[westsch] == true -> 
                 if
                  :: busy_north_router0[westsch] == false && stall_north[westsch] == false ->  ack_sche_north_west_router0[westsch]= true; 
                              goto west_router0_output_scheduling_state5;
                 fi;
             :: else-> rrtoken_west[westsch] = SOUTH_PRI; 
                              goto west_router0_output_scheduling_state6;
       fi;

west_router0_output_scheduling_state5:
       if
             :: d_step{rrtoken_west[westsch] == NORTH_PRI && req_sche_north_west_router0[westsch] == false -> ack_sche_north_west_router0[westsch]= false; rrtoken_west[westsch] = SOUTH_PRI; } goto west_router0_output_scheduling_state6;
       fi;

west_router0_output_scheduling_state6:
       if
             :: rrtoken_west[westsch] == SOUTH_PRI && req_sche_south_west_router0[westsch] == true -> 
                 if
                    :: busy_south_router0[westsch] == false && stall_south[westsch] == false ->  ack_sche_south_west_router0[westsch]= true; 
                              goto west_router0_output_scheduling_state7;
                 fi;
             :: else -> rrtoken_west[westsch] = NODE0_PRI;
                              goto west_router0_output_scheduling_state8;
       fi;

west_router0_output_scheduling_state7:
       if 
             :: d_step{rrtoken_west[westsch] == SOUTH_PRI && req_sche_south_west_router0[westsch] == false -> ack_sche_south_west_router0[westsch]= false; rrtoken_west[westsch] = NODE0_PRI; } goto west_router0_output_scheduling_state8;
       fi;

west_router0_output_scheduling_state8:
       if
             :: rrtoken_west[westsch] == NODE0_PRI && req_sche_node0_west_router0[westsch] == true -> 
                   if
                      :: busy_node0_router0[westsch] == false && node0buff_ready[westsch] == true ->  ack_sche_node0_west_router0[westsch]= true; 
                              goto west_router0_output_scheduling_state9;
                  fi;
             :: else -> rrtoken_west[westsch] = EAST_PRI;
                              goto west_router0_output_scheduling_state0;
       fi;

west_router0_output_scheduling_state9:
      if
             :: d_step{rrtoken_west[westsch] == NODE0_PRI && req_sche_node0_west_router0[westsch] == false -> ack_sche_node0_west_router0[westsch]= false; rrtoken_west[westsch] = EAST_PRI; }
                              goto west_router0_output_scheduling_state0;
       fi;
}

/*****************************North output interface of router 0**************************/
proctype north_router0_output(byte i)
       {
north_router0_output_state0:
          if
                :: d_step{BOP_north_router0[i] == true ->  busy_north_router0[i] = true;} goto north_router0_output_state1; 
       fi;

north_router0_output_state1:
             if
                 :: d_step{BOF_north_router0[i] == true ->  data_tx_north_router0[i] = tx_data_north_router0[i]; } send_tx_north_router0[i] = true; goto north_router0_output_state2;
                 :: d_step{BOP_north_router0[i] == false ->  busy_north_router0[i] = false;} goto north_router0_output_state0; 
            fi;

north_router0_output_state2:
          if
            ::ack_tx_north_router0[i] == true ->  d_step{BOF_north_router0[i] = false ; ack_tx_north_router0[i] = false; } goto north_router0_output_state1;
         fi;

}

proctype north_router0_output_scheduling(byte northsch)
       {
north_router0_output_scheduling_state0:
          if
             :: rrtoken_north[northsch] == EAST_PRI && req_sche_east_north_router0[northsch] == true -> 
                   if
                       :: busy_east_router0[northsch] == false && stall_east[northsch] == false ->  ack_sche_east_north_router0[northsch]= true;
                             goto north_router0_output_scheduling_state1; 
                   fi;
             :: else -> rrtoken_north[northsch] = WEST_PRI; 
                             goto north_router0_output_scheduling_state2; 
          fi;

north_router0_output_scheduling_state1:
         if
             :: d_step{rrtoken_north[northsch] == EAST_PRI && req_sche_east_north_router0[northsch] == false ->  ack_sche_east_north_router0[northsch]= false; rrtoken_north[northsch] = WEST_PRI; } goto north_router0_output_scheduling_state2; 
         fi;

north_router0_output_scheduling_state2:
         if
             :: rrtoken_north[northsch] == WEST_PRI && req_sche_west_north_router0[northsch] == true -> 
                   if 
                      :: busy_west_router0[northsch] == false && stall_west[northsch] == false ->  ack_sche_west_north_router0[northsch]= true; 
                             goto north_router0_output_scheduling_state3; 
                   fi; 
             :: else -> rrtoken_north[northsch] = NORTH_PRI; 
                             goto north_router0_output_scheduling_state4; 
         fi;

north_router0_output_scheduling_state3:
        if
             :: d_step{rrtoken_north[northsch] == WEST_PRI && req_sche_west_north_router0[northsch] == false ->  ack_sche_west_north_router0[northsch]= false; rrtoken_north[northsch] = NORTH_PRI; }  goto north_router0_output_scheduling_state4; 
        fi;

north_router0_output_scheduling_state4:
        if
             :: rrtoken_north[northsch] == NORTH_PRI && req_sche_north_north_router0[northsch] == true -> 
                   if
                     :: busy_north_router0[northsch] == false && stall_north[northsch] == false ->  ack_sche_north_north_router0[northsch]= true; 
                             goto north_router0_output_scheduling_state5; 
                   fi; 
             ::else -> rrtoken_north[northsch] = SOUTH_PRI; 
                             goto north_router0_output_scheduling_state6; 
        fi;

north_router0_output_scheduling_state5:
        if
             :: d_step{rrtoken_north[northsch] == NORTH_PRI && req_sche_north_north_router0[northsch] == false ->  ack_sche_north_north_router0[northsch]= false; rrtoken_north[northsch] = SOUTH_PRI; }  goto north_router0_output_scheduling_state6; 
        fi;

north_router0_output_scheduling_state6:
        if
             :: rrtoken_north[northsch] == SOUTH_PRI && req_sche_south_north_router0[northsch] == true -> 
                 if
                   :: busy_south_router0[northsch] == false && stall_south[northsch] == false ->  ack_sche_south_north_router0[northsch]= true; 
                             goto north_router0_output_scheduling_state7; 
                 fi;
             :: else -> rrtoken_north[northsch] = NODE0_PRI; 
                             goto north_router0_output_scheduling_state8; 
       fi;

north_router0_output_scheduling_state7:
       if
             :: d_step{rrtoken_north[northsch] == SOUTH_PRI && req_sche_south_north_router0[northsch] == false ->  ack_sche_south_north_router0[northsch]= false; rrtoken_north[northsch] = NODE0_PRI; } goto north_router0_output_scheduling_state8; 
      fi;

north_router0_output_scheduling_state8:
      if
             :: rrtoken_north[northsch] == NODE0_PRI && req_sche_node0_north_router0[northsch] == true -> 
                   if
                      :: busy_node0_router0[northsch] == false && node0buff_ready[northsch] == true ->  ack_sche_node0_north_router0[northsch]= true; 
                             goto north_router0_output_scheduling_state9; 
                   fi;
             :: else -> rrtoken_north[northsch] = EAST_PRI; 
                             goto north_router0_output_scheduling_state0; 
      fi;

north_router0_output_scheduling_state9:
      if
           :: d_step{rrtoken_north[northsch] == NODE0_PRI && req_sche_node0_north_router0[northsch] == false ->  ack_sche_node0_north_router0[northsch]= false;  rrtoken_north[northsch] = EAST_PRI; }  goto north_router0_output_scheduling_state0; 
       fi;
}

/*****************************South output interface of router 0**************************/
proctype south_router0_output(byte j)
       {
south_router0_output_state0:
          if
                :: d_step{BOP_south_router0[j] == true ->  busy_south_router0[j] = true; } goto south_router0_output_state1; 
       fi;

south_router0_output_state1:
             if
                :: d_step{ BOF_south_router0[j] == true ->   data_tx_south_router0[j] = tx_data_south_router0[j]; } send_tx_south_router0[j] = true; goto south_router0_output_state2;
                :: d_step{BOP_south_router0[j] == false ->  busy_south_router0[j] = false; } goto south_router0_output_state0; 
            fi;

south_router0_output_state2:
          if
            ::ack_tx_south_router0[j] == true ->  d_step{BOF_south_router0[j] = false; ack_tx_south_router0[j] = false; } goto south_router0_output_state1;
         fi;

}

proctype south_router0_output_scheduling(byte southsch)
       {
south_router0_output_scheduling_state0:
          if
             :: rrtoken_south[southsch] == EAST_PRI && req_sche_east_south_router0[southsch] == true ->
                  if
                     :: busy_east_router0[southsch] == false && stall_east[southsch] == false ->  ack_sche_east_south_router0[southsch]= true; 
                           goto south_router0_output_scheduling_state1;
                  fi;
             :: else -> rrtoken_south[southsch] = WEST_PRI;
                           goto south_router0_output_scheduling_state2;
         fi;

south_router0_output_scheduling_state1:
         if
             :: d_step{rrtoken_south[southsch] == EAST_PRI && req_sche_east_south_router0[southsch] == false -> ack_sche_east_south_router0[southsch]= false;  rrtoken_south[southsch] = WEST_PRI; } goto south_router0_output_scheduling_state2;
         fi;

south_router0_output_scheduling_state2:
        if
             :: rrtoken_south[southsch] == WEST_PRI && req_sche_west_south_router0[southsch] == true -> 
                   if
                      :: busy_west_router0[southsch] == false && stall_west[southsch] == false ->  ack_sche_west_south_router0[southsch]= true; 
                           goto south_router0_output_scheduling_state3;
                   fi;
             :: else-> rrtoken_south[southsch] = NORTH_PRI;
                           goto south_router0_output_scheduling_state4;
       fi;

south_router0_output_scheduling_state3:
       if
             :: d_step{rrtoken_south[southsch] == WEST_PRI && req_sche_west_south_router0[southsch] == false -> ack_sche_west_south_router0[southsch]= false; rrtoken_south[southsch] = NORTH_PRI; } goto south_router0_output_scheduling_state4;
       fi;

south_router0_output_scheduling_state4:
       if
             :: rrtoken_south[southsch] == NORTH_PRI && req_sche_north_south_router0[southsch] == true -> 
                   if
                      :: busy_north_router0[southsch] == false && stall_north[southsch] == false ->  ack_sche_north_south_router0[southsch]= true;
                           goto south_router0_output_scheduling_state5;
                   fi;
             :: else ->  rrtoken_south[southsch] = SOUTH_PRI;
                           goto south_router0_output_scheduling_state6;
      fi;

south_router0_output_scheduling_state5:
     if
             :: d_step{rrtoken_south[southsch] == NORTH_PRI && req_sche_north_south_router0[southsch] == false -> ack_sche_north_south_router0[southsch]= false; rrtoken_south[southsch] = SOUTH_PRI;} goto south_router0_output_scheduling_state6;
     fi;

south_router0_output_scheduling_state6:
     if
             :: rrtoken_south[southsch] == SOUTH_PRI && req_sche_south_south_router0[southsch] == true -> 
                   if
                      :: busy_south_router0[southsch] == false && stall_south[southsch] == false ->  ack_sche_south_south_router0[southsch]= true;
                           goto south_router0_output_scheduling_state7;
                   fi;
             :: else ->  rrtoken_south[southsch] = NODE0_PRI;
                           goto south_router0_output_scheduling_state8;
      fi;

south_router0_output_scheduling_state7:
      if
             :: d_step{rrtoken_south[southsch] == SOUTH_PRI && req_sche_south_south_router0[southsch] == false -> ack_sche_south_south_router0[southsch]= false; rrtoken_south[southsch] = NODE0_PRI; }  goto south_router0_output_scheduling_state8;
      fi;

south_router0_output_scheduling_state8:
      if
             :: rrtoken_south[southsch] == NODE0_PRI && req_sche_node0_south_router0[southsch] == true -> 
                   if
                     :: busy_node0_router0[southsch] == false && node0buff_ready[southsch] == true ->  ack_sche_node0_south_router0[southsch]= true;
                           goto south_router0_output_scheduling_state9;
                   fi;
             :: else ->  rrtoken_south[southsch] = EAST_PRI;
                           goto south_router0_output_scheduling_state0;
      fi;

south_router0_output_scheduling_state9:
      if
             :: d_step{rrtoken_south[southsch] == NODE0_PRI && req_sche_node0_south_router0[southsch] == false -> ack_sche_node0_south_router0[southsch]= false; rrtoken_south[southsch] = EAST_PRI; } goto south_router0_output_scheduling_state0;
               fi;
}

/*****************************West input interface list of router 0**************************/
proctype west_rx_router0_input_interface_list_write(byte b)
       {
west_rx_router0_input_interface_list_write_state0:
          if
             :: v_rx_west_router0_list[b]== MAX_BUFF_SIZE -> westbuff_ready[b] = false; goto west_rx_router0_input_interface_list_write_state0;
             :: v_rx_west_router0_list[b] <MAX_BUFF_SIZE ->  goto west_rx_router0_input_interface_list_write_state1; 
       fi;

west_rx_router0_input_interface_list_write_state1:
             if
                 ::send_rx_west_router0[b] == true ->  d_step{westinputlist[b].westrouter0listarray[v_rx_west_router0_list[b]] = data_rx_west_router0[b]; v_rx_west_router0_list[b]++; ack_rx_west_router0[b] = true; send_rx_west_router0[b] = false;} goto west_rx_router0_input_interface_list_write_state0;
            fi;

}

proctype west_rx_router0_input_interface_list_read(byte c)
       {
west_rx_router0_input_interface_list_read_state0:
          if
             :: v_rx_west_router0_list[c] ==0 ->  westbuff_ready[c] = true; goto west_rx_router0_input_interface_list_read_state0;
             :: v_rx_west_router0_list[c] ==MAX_BUFF_SIZE -> goto west_rx_router0_input_interface_list_read_state1;      
       fi;

west_rx_router0_input_interface_list_read_state1:
             if
                 ::d_step{packetwestrouter0ready[c] == false-> dest_addr_west_router0_x[c]  = westinputlist[c].westrouter0listarray[0]; dest_addr_west_router0_y[c]  = westinputlist[c].westrouter0listarray[1]; packetwestrouter0ready[c] = true; }goto west_rx_router0_input_interface_list_read_state2;
            fi;

west_rx_router0_input_interface_list_read_state2:
            if      
                :: d_step{syncwestrouter0flit[c] == false -> NOF_west_router0[c]  = westinputlist[c].westrouter0listarray[2]; syncwestrouter0flit[c] = true; } goto west_rx_router0_input_interface_list_read_state3;
            fi;

west_rx_router0_input_interface_list_read_state3:
           do
	:: tmpwestrouter0listcount[c]  != NOF_west_router0[c]  ->
		if
		    :: d_step{syncwestrouter0flit[c] == false -> payload_west_router0[c]  = westinputlist[c].westrouter0listarray[tmpwestrouter0listcount[c]+3]; syncwestrouter0flit[c] = true; tmpwestrouter0listcount[c] ++;}
                                     fi;
	:: else  -> d_step{tmpwestrouter0listcount [c] = 0; v_rx_west_router0_list[c] = 0 ; } goto west_rx_router0_input_interface_list_read_state0;
           od;
}

/*****************************East input interface list of router 0**************************/
proctype east_rx_router0_input_interface_list_write(byte u)
       {
east_rx_router0_input_interface_list_write_state0:
          if
             :: v_rx_east_router0_list[u]== MAX_BUFF_SIZE -> eastbuff_ready[u] = false;  goto east_rx_router0_input_interface_list_write_state0;
             :: v_rx_east_router0_list [u]<MAX_BUFF_SIZE ->  goto east_rx_router0_input_interface_list_write_state1; 
       fi;

east_rx_router0_input_interface_list_write_state1:
             if
                 ::send_rx_east_router0[u] == true ->  d_step{eastinputlist[u].eastrouter0listarray[v_rx_east_router0_list[u]] = data_rx_east_router0[u]; v_rx_east_router0_list[u]++; ack_rx_east_router0[u] = true; send_rx_east_router0[u] = false;} goto east_rx_router0_input_interface_list_write_state0;
            fi;

}

proctype east_rx_router0_input_interface_list_read(byte v)
       {
east_rx_router0_input_interface_list_read_state0:
          if
             :: v_rx_east_router0_list[v] ==0 ->  eastbuff_ready[v] = true; goto east_rx_router0_input_interface_list_read_state0;
             :: v_rx_east_router0_list[v] == MAX_BUFF_SIZE -> goto east_rx_router0_input_interface_list_read_state1;      
       fi;

east_rx_router0_input_interface_list_read_state1:
             if
                 ::d_step{packeteastrouter0ready[v] == false -> dest_addr_east_router0_x[v] = eastinputlist[v].eastrouter0listarray[0]; dest_addr_east_router0_y[v] = eastinputlist[v].eastrouter0listarray[1];  packeteastrouter0ready[v] =true; } goto east_rx_router0_input_interface_list_read_state2;
            fi;

east_rx_router0_input_interface_list_read_state2:
           if
                  :: d_step{synceastrouter0flit[v] == false -> NOF_east_router0[v] = eastinputlist[v].eastrouter0listarray[2]; synceastrouter0flit[v] = true;  } goto east_rx_router0_input_interface_list_read_state3;
          fi;

east_rx_router0_input_interface_list_read_state3:
           do
	:: tmpeastrouter0listcount[v] != NOF_east_router0[v] ->
		if
		    :: d_step{synceastrouter0flit [v] == false-> payload_east_router0[v] = eastinputlist[v].eastrouter0listarray[tmpeastrouter0listcount[v]+3]; synceastrouter0flit[v] = true; tmpeastrouter0listcount[v]++;}
                                     fi;
	:: else -> d_step{tmpeastrouter0listcount [v] = 0; v_rx_east_router0_list[v] =0; }goto east_rx_router0_input_interface_list_read_state0;
           od;
}

/*****************************North input interface list of router 0**************************/
 proctype north_rx_router0_input_interface_list_write(byte w)
       {
north_rx_router0_input_interface_list_write_state0:
          if
             :: v_rx_north_router0_list[w]== MAX_BUFF_SIZE ->  northbuff_ready[w] = false; goto north_rx_router0_input_interface_list_write_state0;
             :: v_rx_north_router0_list [w]< MAX_BUFF_SIZE ->  goto north_rx_router0_input_interface_list_write_state1; 
       fi;

north_rx_router0_input_interface_list_write_state1:
             if
                 ::send_rx_north_router0[w] == true -> d_step{northinputlist[w].northrouter0listarray[v_rx_north_router0_list[w]] = data_rx_north_router0[w]; v_rx_north_router0_list[w]++; ack_rx_north_router0[w] = true; send_rx_north_router0[w] = false;} goto north_rx_router0_input_interface_list_write_state0;
            fi;

}

proctype north_rx_router0_input_interface_list_read(byte x)
       {
north_rx_router0_input_interface_list_read_state0:
          if
             :: v_rx_north_router0_list[x] == 0 ->  northbuff_ready[x] = true; goto north_rx_router0_input_interface_list_read_state0;
             :: v_rx_north_router0_list[x] == MAX_BUFF_SIZE -> goto north_rx_router0_input_interface_list_read_state1;      
       fi;

north_rx_router0_input_interface_list_read_state1:
             if
                 ::d_step{packetnorthrouter0ready[x] == false -> dest_addr_north_router0_x[x] = northinputlist[x].northrouter0listarray[0]; dest_addr_north_router0_y[x] = northinputlist[x].northrouter0listarray[1]; packetnorthrouter0ready[x] = true; } goto north_rx_router0_input_interface_list_read_state2;
            fi;

north_rx_router0_input_interface_list_read_state2:
            if
                 ::d_step{syncnorthrouter0flit[x] == false -> NOF_north_router0[x] = northinputlist[x].northrouter0listarray[2]; syncnorthrouter0flit[x] = true; }goto north_rx_router0_input_interface_list_read_state3;
           fi;

north_rx_router0_input_interface_list_read_state3:
           do
	:: tmpnorthrouter0listcount[x] != NOF_north_router0[x] ->
		if
		    :: d_step{syncnorthrouter0flit[x] == false -> payload_north_router0[x] = northinputlist[x].northrouter0listarray[tmpnorthrouter0listcount[x]+3]; syncnorthrouter0flit[x] = true; tmpnorthrouter0listcount[x]++;}
                                     fi;
	:: else -> d_step{tmpnorthrouter0listcount[x] = 0; v_rx_north_router0_list[x] = 0; } goto north_rx_router0_input_interface_list_read_state0;
           od;
}

/*****************************South input interface list of router 0**************************/
proctype south_rx_router0_input_interface_list_write(byte y)
       {
south_rx_router0_input_interface_list_write_state0:
          if
             :: v_rx_south_router0_list[y]== MAX_BUFF_SIZE -> southbuff_ready[y] = false; goto south_rx_router0_input_interface_list_write_state0;
             :: v_rx_south_router0_list[y] < MAX_BUFF_SIZE -> goto south_rx_router0_input_interface_list_write_state1;      
       fi;

south_rx_router0_input_interface_list_write_state1:
             if
                 ::send_rx_south_router0[y] == true ->  d_step{southinputlist[y].southrouter0listarray[v_rx_south_router0_list[y]] = data_rx_south_router0[y]; v_rx_south_router0_list[y]++; ack_rx_south_router0[y] = true; send_rx_south_router0[y] = false;} goto south_rx_router0_input_interface_list_write_state0; 
            fi;

}

proctype south_rx_router0_input_interface_list_read(byte z)
       {
south_rx_router0_input_interface_list_read_state0:
          if
             :: v_rx_south_router0_list[z] == 0 -> southbuff_ready[z] = true;  goto south_rx_router0_input_interface_list_read_state0;
             :: v_rx_south_router0_list[z] == MAX_BUFF_SIZE -> goto south_rx_router0_input_interface_list_read_state1;      
       fi;

south_rx_router0_input_interface_list_read_state1:
             if
                 ::d_step{packetsouthrouter0ready[z] == false -> dest_addr_south_router0_x[z] = southinputlist[z].southrouter0listarray[0]; dest_addr_south_router0_y[z] = southinputlist[z].southrouter0listarray[1]; packetsouthrouter0ready[z] = true; } goto south_rx_router0_input_interface_list_read_state2;
            fi;

south_rx_router0_input_interface_list_read_state2:
          if
		  :: d_step{ syncsouthrouter0flit[z] == false -> NOF_south_router0[z]= southinputlist[z].southrouter0listarray[2]; syncsouthrouter0flit[z] = true;  } goto south_rx_router0_input_interface_list_read_state3;
          fi;

south_rx_router0_input_interface_list_read_state3:
           do
	:: tmpsouthrouter0listcount[z] != NOF_south_router0[z] ->
		if
		    :: d_step{syncsouthrouter0flit[z] == false -> payload_south_router0[z] = southinputlist[z].southrouter0listarray[tmpsouthrouter0listcount[z]+3]; syncsouthrouter0flit[z] = true; tmpsouthrouter0listcount[z]++;}
                                     fi;
	:: else -> d_step{tmpsouthrouter0listcount[z]  = 0; v_rx_south_router0_list[z] = 0; } goto south_rx_router0_input_interface_list_read_state0;
           od;
}

/*****************************NoC topology mapping**************************/
proctype topology_mapping01()
{
topology_mapping01_state0:
             if
                 :: westbuff_ready[1] == true -> stall_east[0] = false ; goto topology_mapping01_state1;
                 :: westbuff_ready[1] == false -> stall_east[0] = true ; goto topology_mapping01_state0;
            fi;

topology_mapping01_state1:
             if
                 :: send_tx_east_router0[0] == true -> atomic{ data_rx_west_router0[1] = data_tx_east_router0[0]; send_rx_west_router0[1] = true ; send_tx_east_router0[0] = false; goto topology_mapping01_state2;}
            fi;

topology_mapping01_state2:
             if
                 :: ack_rx_west_router0[1] == true ->  atomic{ack_tx_east_router0[0] = true ; ack_rx_west_router0[1] = false; goto topology_mapping01_state0;}
            fi;

}

proctype topology_mapping03()
{
topology_mapping03_state0:
             if
                 :: southbuff_ready[3] == true -> stall_north[0] = false ; goto topology_mapping03_state1;
                 :: southbuff_ready[3] == false -> stall_north[0] = true ; goto topology_mapping03_state0;
            fi;

topology_mapping03_state1:
             if
                 :: send_tx_north_router0[0] == true -> atomic{ data_rx_south_router0[3] = data_tx_north_router0[0]; send_rx_south_router0[3] = true ; send_tx_north_router0[0] = false; goto topology_mapping03_state2;}
            fi;

topology_mapping03_state2:
             if
                 :: ack_rx_south_router0[3] == true ->  atomic{ack_tx_north_router0[0] = true ; ack_rx_south_router0[3] = false; goto topology_mapping03_state0;}
            fi;
}

proctype topology_mapping10()
{
topology_mapping10_state0:
             if
                 :: eastbuff_ready[0] == true -> stall_west[1] = false ; goto topology_mapping10_state1;
                 :: eastbuff_ready[0] == false -> stall_west[1] = true ; goto topology_mapping10_state0;
            fi;

topology_mapping10_state1:
             if
                 :: send_tx_west_router0[1] == true -> atomic{ data_rx_east_router0[0] = data_tx_west_router0[1]; send_rx_east_router0[0] = true ; send_tx_west_router0[1] = false; goto topology_mapping10_state2;}
            fi;

topology_mapping10_state2:
             if
                 :: ack_rx_east_router0[0] == true ->  atomic{ack_tx_west_router0[1] = true ; ack_rx_east_router0[0] = false; goto topology_mapping10_state0;}
            fi;
}

proctype topology_mapping12()
{
topology_mapping12_state0:
             if
                 :: westbuff_ready[2] == true  -> stall_east[1] = false ; goto topology_mapping12_state1;
                 :: westbuff_ready[2] == false  -> stall_east[1] = true ; goto topology_mapping12_state0;
            fi;

topology_mapping12_state1:
             if
                 :: send_tx_east_router0[1] == true -> atomic{ data_rx_west_router0[2] = data_tx_east_router0[1]; send_rx_west_router0[2] = true ; send_tx_east_router0[1] = false; goto topology_mapping12_state2;}
            fi;

topology_mapping12_state2:
             if
                 :: ack_rx_west_router0[2] == true ->  atomic{ack_tx_east_router0[1] = true ; ack_rx_west_router0[2] = false; goto topology_mapping12_state0;}
            fi;

}

proctype topology_mapping14()
{
topology_mapping14_state0:
             if
                 :: southbuff_ready[4] == true -> stall_north[1] = false ; goto topology_mapping14_state1;
                 :: southbuff_ready[4] == false -> stall_north[1] = true ; goto topology_mapping14_state0;
            fi;

topology_mapping14_state1:
             if
                 :: send_tx_north_router0[1] == true -> atomic{ data_rx_south_router0[4] = data_tx_north_router0[1]; send_rx_south_router0[4] = true ; send_tx_north_router0[1] = false; goto topology_mapping14_state2;}
            fi;

topology_mapping14_state2:
             if
                 :: ack_rx_south_router0[4] == true ->  atomic{ack_tx_north_router0[1] = true ; ack_rx_south_router0[4] = false; goto topology_mapping14_state0;}
            fi;
}

proctype topology_mapping21()
{
topology_mapping21_state0:
             if
                 :: eastbuff_ready[1] == true  -> stall_west[2] = false ; goto topology_mapping21_state1;
                 :: eastbuff_ready[1] == false  -> stall_west[2] = true ; goto topology_mapping21_state0;
            fi;

topology_mapping21_state1:
             if
                 :: send_tx_west_router0[2] == true -> atomic{ data_rx_east_router0[1] = data_tx_west_router0[2]; send_rx_east_router0[1] = true ; send_tx_west_router0[2] = false; goto topology_mapping21_state2;}
            fi;

topology_mapping21_state2:
             if
                 :: ack_rx_east_router0[1] ==true ->  atomic{ack_tx_west_router0[2] = true ; ack_rx_east_router0[1] = false; goto topology_mapping21_state0;}
            fi;
}

proctype topology_mapping25()
{
topology_mapping25_state0:
             if
                 :: southbuff_ready[5] == true -> stall_north[2]= false ; goto topology_mapping25_state1;
                 :: southbuff_ready[5] == false -> stall_north[2]= true ; goto topology_mapping25_state0;
            fi;

topology_mapping25_state1:
             if
                 :: send_tx_north_router0[2] == true -> atomic{ data_rx_south_router0[5] = data_tx_north_router0[2]; send_rx_south_router0[5] = true ; send_tx_north_router0[2] = false; goto topology_mapping25_state2;}
            fi;

topology_mapping25_state2:
             if
                 :: ack_rx_south_router0[5] == true ->  atomic{ack_tx_north_router0[2] = true ; ack_rx_south_router0[5] = false; goto topology_mapping25_state0;}
            fi;

}

proctype topology_mapping30()
{
topology_mapping30_state0:
             if
                 :: northbuff_ready[0] == true -> stall_south[3] = false ; goto topology_mapping30_state1;
                 :: northbuff_ready[0] == false -> stall_south[3] = true ; goto topology_mapping30_state0;
            fi;

topology_mapping30_state1:
             if
                 :: send_tx_south_router0[3] == true -> atomic{ data_rx_north_router0[0] = data_tx_south_router0[3]; send_rx_north_router0[0] = true ; send_tx_south_router0[3] = false; goto topology_mapping30_state2;}
            fi;

topology_mapping30_state2:
             if
                 :: ack_rx_north_router0[0] == true ->  atomic{ack_tx_south_router0[3] = true ; ack_rx_north_router0[0] = false; goto topology_mapping30_state0;}
            fi;

}

proctype topology_mapping36()
{
topology_mapping36_state0:
             if
                 :: southbuff_ready[6] == true -> stall_north[3] = false ; goto topology_mapping36_state1;
                 :: southbuff_ready[6] == false -> stall_north[3] = true ; goto topology_mapping36_state0;
            fi;

topology_mapping36_state1:
             if
                 :: send_tx_north_router0[3] == true -> atomic{ data_rx_south_router0[6] = data_tx_north_router0[3]; send_rx_south_router0[6] = true ; send_tx_north_router0[3] = false; goto topology_mapping36_state2;}
            fi;

topology_mapping36_state2:
             if
                 :: ack_rx_south_router0[6] == true ->  atomic{ack_tx_north_router0[3] = true ; ack_rx_south_router0[6] = false; goto topology_mapping36_state0;}
            fi;

}

proctype topology_mapping34()
{
topology_mapping34_state0:
             if
                 :: westbuff_ready[4] == true -> stall_east[3] = false ; goto topology_mapping34_state1;
                 :: westbuff_ready[4] == false -> stall_east[3] = true ; goto topology_mapping34_state0;
            fi;

topology_mapping34_state1:
             if
                 :: send_tx_east_router0[3] == true -> atomic{ data_rx_west_router0[4] = data_tx_east_router0[3]; send_rx_west_router0[4] = true ; send_tx_east_router0[3] = false; goto topology_mapping34_state2;}
            fi;

topology_mapping34_state2:
             if
                 :: ack_rx_west_router0[4] == true ->  atomic{ack_tx_east_router0[3] = true ; ack_rx_west_router0[4] = false; goto topology_mapping34_state0;}
            fi;

}

proctype topology_mapping43()
{
topology_mapping43_state0:
             if
                 :: eastbuff_ready[3] == true -> stall_west[4] = false ; goto topology_mapping43_state1;
                 :: eastbuff_ready[3] == false -> stall_west[4] = true ; goto topology_mapping43_state0;
            fi;

topology_mapping43_state1:
             if
                 :: send_tx_west_router0[4] == true -> atomic{ data_rx_east_router0[3] = data_tx_west_router0[4]; send_rx_east_router0[3] = true ; send_tx_west_router0[4] = false; goto topology_mapping43_state2;}
            fi;

topology_mapping43_state2:
             if
                 :: ack_rx_east_router0[3] == true ->  atomic{ack_tx_west_router0[4] = true ; ack_rx_east_router0[3] = false; goto topology_mapping43_state0;}
            fi;

}

proctype topology_mapping41()
{
topology_mapping41_state0:
             if
                 :: northbuff_ready[1] == true  -> stall_south[4] = false ; goto topology_mapping41_state1;
                 :: northbuff_ready[1] == false  -> stall_south[4] = true ; goto topology_mapping41_state0;
            fi;

topology_mapping41_state1:
             if
                 :: send_tx_south_router0[4] == true -> atomic{ data_rx_north_router0[1] = data_tx_south_router0[4]; send_rx_north_router0[1] = true ; send_tx_south_router0[4] = false; goto topology_mapping41_state2;}
            fi;

topology_mapping41_state2:
             if
                 :: ack_rx_north_router0[1] == true ->  atomic{ack_tx_south_router0[4] = true ; ack_rx_north_router0[1] = false; goto topology_mapping41_state0;}
            fi;

}

proctype topology_mapping45()
{
topology_mapping45_state0:
             if
                 :: westbuff_ready[5] == true -> stall_east[4] = false ; goto topology_mapping45_state1;
                 :: westbuff_ready[5] == false -> stall_east[4] = true ; goto topology_mapping45_state0;
            fi;

topology_mapping45_state1:
             if
                 :: send_tx_east_router0[4] == true -> atomic{ data_rx_west_router0[5] = data_tx_east_router0[4]; send_rx_west_router0[5] = true ; send_tx_east_router0[4] = false; goto topology_mapping45_state2;}
            fi;

topology_mapping45_state2:
             if
                 :: ack_rx_west_router0[5] == true  ->  atomic{ack_tx_east_router0[4] = true ; ack_rx_west_router0[5] = false; goto topology_mapping45_state0;}
            fi;

}

proctype topology_mapping47()
{
topology_mapping47_state0:
             if
                 :: southbuff_ready[7] == true -> stall_north[4] = false ; goto topology_mapping47_state1;
                 :: southbuff_ready[7] == false -> stall_north[4] = true ; goto topology_mapping47_state0;
            fi;

topology_mapping47_state1:
             if
                 :: send_tx_north_router0[4] == true -> atomic{ data_rx_south_router0[7] = data_tx_north_router0[4]; send_rx_south_router0[7] = true ; send_tx_north_router0[4] = false; goto topology_mapping47_state2;}
            fi;

topology_mapping47_state2:
             if
                 :: ack_rx_south_router0[7] == true ->  atomic{ack_tx_north_router0[4] = true ; ack_rx_south_router0[7] = false; goto topology_mapping47_state0;}
            fi;

}

proctype topology_mapping54()
{
topology_mapping54_state0:
             if
                 :: eastbuff_ready[4] == true -> stall_west[5] = false ; goto topology_mapping54_state1;
                 :: eastbuff_ready[4] == false -> stall_west[5] = true ; goto topology_mapping54_state0;
            fi;

topology_mapping54_state1:
             if
                 :: send_tx_west_router0[5] == true -> atomic{ data_rx_east_router0[4] = data_tx_west_router0[5]; send_rx_east_router0[4] = true ; send_tx_west_router0[5] = false; goto topology_mapping54_state2;}
            fi;

topology_mapping54_state2:
             if
                 :: ack_rx_east_router0[4] == true ->  atomic{ack_tx_west_router0[5] = true ; ack_rx_east_router0[4] = false; goto topology_mapping54_state0;}
            fi;

}

proctype topology_mapping52()
{
topology_mapping52_state0:
             if
                 :: northbuff_ready[2] == true -> stall_south[5] = false ; goto topology_mapping52_state1;
                 :: northbuff_ready[2] == false -> stall_south[5] = true ; goto topology_mapping52_state0;
            fi;

topology_mapping52_state1:
             if
                 :: send_tx_south_router0[5] == true -> atomic{ data_rx_north_router0[2] = data_tx_south_router0[5]; send_rx_north_router0[2] = true ; send_tx_south_router0[5] = false; goto topology_mapping52_state2;}
            fi;

topology_mapping52_state2:
             if
                 :: ack_rx_north_router0[2] == true ->  atomic{ack_tx_south_router0[5] = true ; ack_rx_north_router0[2] = false; goto topology_mapping52_state0;}
            fi;

}

proctype topology_mapping58()
{
topology_mapping58_state0:
             if
                 :: southbuff_ready[8] == true  -> stall_north[5] = false ; goto topology_mapping58_state1;
                 :: southbuff_ready[8] == false  -> stall_north[5] = true; goto topology_mapping58_state0;
            fi;

topology_mapping58_state1:
             if
                 :: send_tx_north_router0[5] == true -> atomic{ data_rx_south_router0[8] = data_tx_north_router0[5]; send_rx_south_router0[8] = true ; send_tx_north_router0[5] = false; goto topology_mapping58_state2;}
            fi;

topology_mapping58_state2:
             if
                 :: ack_rx_south_router0[8] == true ->  atomic{ack_tx_north_router0[5] = true ; ack_rx_south_router0[8] = false; goto topology_mapping58_state0;}
            fi;

}

proctype topology_mapping63()
{
topology_mapping63_state0:
             if
                 :: northbuff_ready[3] == true  -> stall_south[6] = false ; goto topology_mapping63_state1;
                 :: northbuff_ready[3] == false  -> stall_south[6] = true ; goto topology_mapping63_state0;
            fi;

topology_mapping63_state1:
             if
                 :: send_tx_south_router0[6] == true -> atomic{ data_rx_north_router0[3] = data_tx_south_router0[6]; send_rx_north_router0[3] = true ; send_tx_south_router0[6] = false; goto topology_mapping63_state2;}
            fi;

topology_mapping63_state2:
             if
                 :: ack_rx_north_router0[3] == true ->  atomic{ack_tx_south_router0[6] = true ; ack_rx_north_router0[3] = false; goto topology_mapping63_state0;}
            fi;
}

proctype topology_mapping67()
{
topology_mapping67_state0:
             if
                 :: westbuff_ready[7] == true -> stall_east[6] = false ; goto topology_mapping67_state1;
                 :: westbuff_ready[7] == false -> stall_east[6] = true ; goto topology_mapping67_state0;
            fi;

topology_mapping67_state1:
             if
                 :: send_tx_east_router0[6] == true -> atomic{ data_rx_west_router0[7] = data_tx_east_router0[6]; send_rx_west_router0[7] = true ; send_tx_east_router0[6] = false; goto topology_mapping67_state2;}
            fi;

topology_mapping67_state2:
             if
                 :: ack_rx_west_router0[7] == true ->  atomic{ack_tx_east_router0[6] = true ; ack_rx_west_router0[7] = false; goto topology_mapping67_state0;}
            fi;

}

proctype topology_mapping76()
{
topology_mapping76_state0:
             if
                 :: eastbuff_ready[6] == true -> stall_west[7] = false ; goto topology_mapping76_state1;
                 :: eastbuff_ready[6] == false -> stall_west[7] = true ; goto topology_mapping76_state0;
            fi;

topology_mapping76_state1:
             if
                 :: send_tx_west_router0[7] == true -> atomic{ data_rx_east_router0[6] = data_tx_west_router0[7]; send_rx_east_router0[6] = true ; send_tx_west_router0[7] = false; goto topology_mapping76_state2;}
            fi;

topology_mapping76_state2:
             if
                 :: ack_rx_east_router0[6] == true ->  atomic{ack_tx_west_router0[7] = true ; ack_rx_east_router0[6] = false; goto topology_mapping76_state0;}
            fi;
}

proctype topology_mapping74()
{
topology_mapping74_state0:
             if
                 :: northbuff_ready[4] == true  -> stall_south[7] = false ; goto topology_mapping74_state1;
                 :: northbuff_ready[4] == false  -> stall_south[7] = true ; goto topology_mapping74_state0;
            fi;

topology_mapping74_state1:
             if
                 :: send_tx_south_router0[7] == true -> atomic{ data_rx_north_router0[4] = data_tx_south_router0[7]; send_rx_north_router0[4] = true ; send_tx_south_router0[7] = false; goto topology_mapping74_state2;}
            fi;

topology_mapping74_state2:
             if
                 :: ack_rx_north_router0[4] == true ->  atomic{ack_tx_south_router0[7] = true ; ack_rx_north_router0[4] = false; goto topology_mapping74_state0;}
            fi;

}

proctype topology_mapping78()
{
topology_mapping78_state0:
             if
                 :: westbuff_ready[8] == true  -> stall_east[7] = false ; goto topology_mapping78_state1;
                 :: westbuff_ready[8] == false  -> stall_east[7] = true ; goto topology_mapping78_state0;
            fi;

topology_mapping78_state1:
             if
                 :: send_tx_east_router0[7] == true -> atomic{ data_rx_west_router0[8] = data_tx_east_router0[7]; send_rx_west_router0[8] = true ; send_tx_east_router0[7] = false; goto topology_mapping78_state2;}
            fi;

topology_mapping78_state2:
             if
                 :: ack_rx_west_router0[8] == true ->  atomic{ack_tx_east_router0[7] = true ; ack_rx_west_router0[8] = false; goto topology_mapping78_state0;}
            fi;
}

proctype topology_mapping87()
{
topology_mapping87_state0:
             if
                 :: eastbuff_ready[7] == true  -> stall_west[8] = false ; goto topology_mapping87_state1;
                 :: eastbuff_ready[7] == false  -> stall_west[8] = true ; goto topology_mapping87_state0;
            fi;

topology_mapping87_state1:
             if
                 :: send_tx_west_router0[8] == true -> atomic{ data_rx_east_router0[7] = data_tx_west_router0[8]; send_rx_east_router0[7] = true ; send_tx_west_router0[8] = false; goto topology_mapping87_state2;}
            fi;

topology_mapping87_state2:
             if
                 :: ack_rx_east_router0[7] == true ->  atomic{ack_tx_west_router0[8] = true ; ack_rx_east_router0[7] = false; goto topology_mapping87_state0;}
            fi;

}

proctype topology_mapping85()
{
topology_mapping85_state0:
             if
                 :: northbuff_ready[5] == true  -> stall_south[8] = false ; goto topology_mapping85_state1;
                 :: northbuff_ready[5] == false  -> stall_south[8] = true; goto topology_mapping85_state0;
            fi;

topology_mapping85_state1:
             if
                 :: send_tx_south_router0[8] == true -> atomic{ data_rx_north_router0[5] = data_tx_south_router0[8]; send_rx_north_router0[5] = true ; send_tx_south_router0[8] = false; goto topology_mapping85_state2;}
            fi;

topology_mapping85_state2:
             if
                 :: ack_rx_north_router0[5] == true ->  atomic{ack_tx_south_router0[8] = true ; ack_rx_north_router0[5] = false; goto topology_mapping85_state0;}
            fi;

}


/*****************************Track node**************************/

proctype tracking_node(byte tn)
{
topology_mapping_state0:
             if
                 ::  packet_track[tn] == true -> 
                       do
                         :: node_node0_track[tn] == NODE_INVALID -> timeout;	
                         :: node_east_track[tn] == NODE_INVALID -> timeout;	
                         :: node_west_track[tn] == NODE_INVALID -> timeout;	
                         :: node_north_track[tn] == NODE_INVALID -> timeout;	
                         :: node_south_track[tn] == NODE_INVALID -> timeout;	
                       od;
             fi;

}

/*****************************NoC initialization**************************/
init
{	
       router0_addr_x[0]= 0; 
       router0_addr_y[0]= 0; 

       router0_addr_x[1]= 1; 
       router0_addr_y[1]= 0; 

       router0_addr_x[2]= 2; 
       router0_addr_y[2]= 0; 

       router0_addr_x[3]= 0; 
       router0_addr_y[3]= 1; 

       router0_addr_x[4]= 1; 
       router0_addr_y[4]= 1; 

       router0_addr_x[5]= 2; 
       router0_addr_y[5]= 1; 

       router0_addr_x[6]= 0; 
       router0_addr_y[6]= 2; 

       router0_addr_x[7]= 1; 
       router0_addr_y[7]= 2; 
       
       router0_addr_x[8]= 2; 
       router0_addr_y[8]= 2; 
       
       rrtoken_east[0] = EAST_PRI;
       rrtoken_west[0] = EAST_PRI;
       rrtoken_north[0] = EAST_PRI;
       rrtoken_south[0] = EAST_PRI;
       rrtoken_node0[0] = EAST_PRI;

       rrtoken_east[1] = EAST_PRI;
       rrtoken_west[1] = EAST_PRI;
       rrtoken_north[1] = EAST_PRI;
       rrtoken_south[1] = EAST_PRI;
       rrtoken_node0[1] = EAST_PRI;
       
       rrtoken_east[2] = EAST_PRI;
       rrtoken_west[2] = EAST_PRI;
       rrtoken_north[2] = EAST_PRI;
       rrtoken_south[2] = EAST_PRI;
       rrtoken_node0[2] = EAST_PRI;
       
       rrtoken_east[3] = EAST_PRI;
       rrtoken_west[3] = EAST_PRI;
       rrtoken_north[3] = EAST_PRI;
       rrtoken_south[3] = EAST_PRI;
       rrtoken_node0[3] = EAST_PRI;
       
       rrtoken_east[4] = EAST_PRI;
       rrtoken_west[4] = EAST_PRI;
       rrtoken_north[4] = EAST_PRI;
       rrtoken_south[4] = EAST_PRI;
       rrtoken_node0[4] = EAST_PRI;
       
       rrtoken_east[5] = EAST_PRI;
       rrtoken_west[5] = EAST_PRI;
       rrtoken_north[5] = EAST_PRI;
       rrtoken_south[5] = EAST_PRI;
       rrtoken_node0[5] = EAST_PRI;
       
       rrtoken_east[6] = EAST_PRI;
       rrtoken_west[6] = EAST_PRI;
       rrtoken_north[6] = EAST_PRI;
       rrtoken_south[6] = EAST_PRI;
       rrtoken_node0[6] = EAST_PRI;
       
       rrtoken_east[7] = EAST_PRI;
       rrtoken_west[7] = EAST_PRI;
       rrtoken_north[7] = EAST_PRI;
       rrtoken_south[7] = EAST_PRI;
       rrtoken_node0[7] = EAST_PRI;
       
       rrtoken_east[8] = EAST_PRI;
       rrtoken_west[8] = EAST_PRI;
       rrtoken_north[8] = EAST_PRI;
       rrtoken_south[8] = EAST_PRI;
       rrtoken_node0[8] = EAST_PRI;
       
        byte r0 = 0;
        byte r1 = 1;
        byte r2 = 2;  
        byte r3 = 3;
        byte r4 = 4;
        byte r5 = 5;
        byte r6 = 6;  
        byte r7 = 7;
        byte r8 = 8;

/********** Router0 initializations ********************/
   
          run node0_write_NI(r0);
          run node0_tx_router0_input_interface_list_write(r0);
          run node0_tx_router0_input_interface_list_read(r0);
          run node0_router0_switch(r0);
         run node0_router0_output(r0);
          run node0_router0_output_scheduling(r0);
          run node0_readfifo_NI(r0);
          run node0_rx_router0_output_interface(r0);
          run  east_router0_output(r0);   
          run east_router0_output_scheduling(r0);

         run north_rx_router0_input_interface_list_write(r0);
         run north_rx_router0_input_interface_list_read(r0);       
         run north_router0_switch(r0);    

        run east_rx_router0_input_interface_list_write(r0);
         run east_rx_router0_input_interface_list_read(r0);       
         run east_router0_switch(r0);    
         run  north_router0_output(r0);   
          run north_router0_output_scheduling(r0);

         run tracking_node(r0);

         
/********** Router1 initializations ********************/
 
 
           run node0_write_NI(r1);
          run node0_tx_router0_input_interface_list_write(r1);
          run node0_tx_router0_input_interface_list_read(r1);
          run node0_router0_switch(r1);
          run node0_router0_output(r1);
          run node0_router0_output_scheduling(r1);
         run node0_readfifo_NI(r1);
         run node0_rx_router0_output_interface(r1);
          run  east_router0_output(r1);   
         run east_router0_output_scheduling(r1);
         run  west_router0_output(r1);   
          run west_router0_output_scheduling(r1);

        run west_rx_router0_input_interface_list_write(r1);
         run west_rx_router0_input_interface_list_read(r1);       
         run west_router0_switch(r1);    
         run  north_router0_output(r1);   
          run north_router0_output_scheduling(r1);

         run north_rx_router0_input_interface_list_write(r1);
         run north_rx_router0_input_interface_list_read(r1);       
         run north_router0_switch(r1);    

        run east_rx_router0_input_interface_list_write(r1);
         run east_rx_router0_input_interface_list_read(r1);       
         run east_router0_switch(r1);    

         run tracking_node(r1);

/********** Router2 initializations ********************/
 
          run node0_write_NI(r2);
          run node0_tx_router0_input_interface_list_write(r2);
          run node0_tx_router0_input_interface_list_read(r2);
          run node0_router0_switch(r2);
          run node0_router0_output(r2);
          run node0_router0_output_scheduling(r2);
         run node0_readfifo_NI(r2);
         run node0_rx_router0_output_interface(r2);
          run  west_router0_output(r2);   
          run west_router0_output_scheduling(r2);

        run west_rx_router0_input_interface_list_write(r2);
         run west_rx_router0_input_interface_list_read(r2);       
         run west_router0_switch(r2);    
         run  north_router0_output(r2);   
          run north_router0_output_scheduling(r2);

         run north_rx_router0_input_interface_list_write(r2);
         run north_rx_router0_input_interface_list_read(r2);       
         run north_router0_switch(r2);    

         run tracking_node(r2);

/********** Router3 initializations ********************/
 
          run node0_write_NI(r3);
          run node0_tx_router0_input_interface_list_write(r3);
          run node0_tx_router0_input_interface_list_read(r3);
          run node0_router0_switch(r3);
          run node0_router0_output(r3);
          run node0_router0_output_scheduling(r3);
         run node0_readfifo_NI(r3);
         run node0_rx_router0_output_interface(r3);
          run  east_router0_output(r3);   
          run east_router0_output_scheduling(r3);

        run east_rx_router0_input_interface_list_write(r3);
         run east_rx_router0_input_interface_list_read(r3);       
         run east_router0_switch(r3);    
         run  north_router0_output(r3);   
          run north_router0_output_scheduling(r3);
         run  south_router0_output(r3);   
          run south_router0_output_scheduling(r3);

         run north_rx_router0_input_interface_list_write(r3);
         run north_rx_router0_input_interface_list_read(r3);       
         run north_router0_switch(r3);    

         run south_rx_router0_input_interface_list_write(r3);
         run south_rx_router0_input_interface_list_read(r3);       
         run south_router0_switch(r3);    

         run tracking_node(r3);

/********** Router4 initializations ********************/
 
          run node0_write_NI(r4);
          run node0_tx_router0_input_interface_list_write(r4);
          run node0_tx_router0_input_interface_list_read(r4);
          run node0_router0_switch(r4);
          run node0_router0_output(r4);
          run node0_router0_output_scheduling(r4);
         run node0_readfifo_NI(r4);
         run node0_rx_router0_output_interface(r4);
          run  east_router0_output(r4);   
          run east_router0_output_scheduling(r4);
          run  west_router0_output(r4);   
          run west_router0_output_scheduling(r4);

        run east_rx_router0_input_interface_list_write(r4);
         run east_rx_router0_input_interface_list_read(r4);       
         run east_router0_switch(r4);    
         run  north_router0_output(r4);   
          run north_router0_output_scheduling(r4);
         run  south_router0_output(r4);   
          run south_router0_output_scheduling(r4);

         run north_rx_router0_input_interface_list_write(r4);
         run north_rx_router0_input_interface_list_read(r4);       
         run north_router0_switch(r4);    

         run south_rx_router0_input_interface_list_write(r4);
         run south_rx_router0_input_interface_list_read(r4);       
         run south_router0_switch(r4);    

        run west_rx_router0_input_interface_list_write(r4);
         run west_rx_router0_input_interface_list_read(r4);       
         run west_router0_switch(r4);    

         run tracking_node(r4);

/********** Router5 initializations ********************/
 
          run node0_write_NI(r5);
          run node0_tx_router0_input_interface_list_write(r5);
          run node0_tx_router0_input_interface_list_read(r5);
          run node0_router0_switch(r5);
          run node0_router0_output(r5);
          run node0_router0_output_scheduling(r5);
         run node0_readfifo_NI(r5);
         run node0_rx_router0_output_interface(r5);
          run  west_router0_output(r5);   
          run west_router0_output_scheduling(r5);

         run west_rx_router0_input_interface_list_write(r5);
         run west_rx_router0_input_interface_list_read(r5);       
         run west_router0_switch(r5);    
         run  north_router0_output(r5);   
          run north_router0_output_scheduling(r5);
         run  south_router0_output(r5);   
          run south_router0_output_scheduling(r5);

         run north_rx_router0_input_interface_list_write(r5);
         run north_rx_router0_input_interface_list_read(r5);       
         run north_router0_switch(r5);    

         run south_rx_router0_input_interface_list_write(r5);
         run south_rx_router0_input_interface_list_read(r5);       
         run south_router0_switch(r5);    

         run tracking_node(r5);

/********** Router6 initializations ********************/
 
          run node0_write_NI(r6);
          run node0_tx_router0_input_interface_list_write(r6);
          run node0_tx_router0_input_interface_list_read(r6);
          run node0_router0_switch(r6);
          run node0_router0_output(r6);
          run node0_router0_output_scheduling(r6);
         run node0_readfifo_NI(r6);
         run node0_rx_router0_output_interface(r6);
          run  east_router0_output(r6);   
          run east_router0_output_scheduling(r6);

         run south_rx_router0_input_interface_list_write(r6);
         run south_rx_router0_input_interface_list_read(r6);       
         run south_router0_switch(r6);    

        run east_rx_router0_input_interface_list_write(r6);
         run east_rx_router0_input_interface_list_read(r6);       
         run east_router0_switch(r6);    
         run  north_router0_output(r6);   
          run north_router0_output_scheduling(r6);
         run  south_router0_output(r6);   
          run south_router0_output_scheduling(r6);

         run tracking_node(r6);

/********** Router7 initializations ********************/
 
          run node0_write_NI(r7);
          run node0_tx_router0_input_interface_list_write(r7);
          run node0_tx_router0_input_interface_list_read(r7);
          run node0_router0_switch(r7);
          run node0_router0_output(r7);
          run node0_router0_output_scheduling(r7);
         run node0_readfifo_NI(r7);
         run node0_rx_router0_output_interface(r7);
          run  east_router0_output(r7);   
          run east_router0_output_scheduling(r7);
          run  west_router0_output(r7);   
          run west_router0_output_scheduling(r7);

        run west_rx_router0_input_interface_list_write(r7);
         run west_rx_router0_input_interface_list_read(r7);       
         run west_router0_switch(r7);    
         run  south_router0_output(r7);   
          run south_router0_output_scheduling(r7);

         run south_rx_router0_input_interface_list_write(r7);
         run south_rx_router0_input_interface_list_read(r7);       
         run south_router0_switch(r7);    

        run east_rx_router0_input_interface_list_write(r7);
         run east_rx_router0_input_interface_list_read(r7);       
         run east_router0_switch(r7);    
 
         run tracking_node(r7);

/********** Router8 initializations ********************/
 
          run node0_write_NI(r8);
          run node0_tx_router0_input_interface_list_write(r8);
          run node0_tx_router0_input_interface_list_read(r8);
          run node0_router0_switch(r8);
          run node0_router0_output(r8);
          run node0_router0_output_scheduling(r8);
         run node0_readfifo_NI(r8);
         run node0_rx_router0_output_interface(r8);
          run  west_router0_output(r8);   
          run west_router0_output_scheduling(r8);

        run west_rx_router0_input_interface_list_write(r8);
         run west_rx_router0_input_interface_list_read(r8);       
         run west_router0_switch(r8);    
         run  south_router0_output(r8);   
          run south_router0_output_scheduling(r8);

         run south_rx_router0_input_interface_list_write(r8);
         run south_rx_router0_input_interface_list_read(r8);       
         run south_router0_switch(r8);    

         run tracking_node(r8);





/********** Topology Mapping ********************/

 run topology_mapping01();
 run topology_mapping03();
 run topology_mapping10();
 run topology_mapping14();
 run topology_mapping12();
 run topology_mapping21();
 run topology_mapping25();
 run topology_mapping30();
 run topology_mapping34();
 run topology_mapping36();
 run topology_mapping43();
 run topology_mapping41();
 run topology_mapping47();
 run topology_mapping45();
 run topology_mapping54();
 run topology_mapping52();
 run topology_mapping58();
 run topology_mapping63();
 run topology_mapping67();
 run topology_mapping76();
 run topology_mapping74();
 run topology_mapping78();
 run topology_mapping87();
 run topology_mapping85();
 }
